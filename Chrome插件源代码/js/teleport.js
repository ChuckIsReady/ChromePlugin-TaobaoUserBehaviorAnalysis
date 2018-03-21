debug = 0;
cookieArr = [];
uid = localStorage.getItem("uid");
heatMapData =  [];

var isMapHas = (pid)=>{
	for (var i = heatMapData.length - 1; i >= 0; i--) {
		if(heatMapData[i].pid == pid) return i;
	}
	return false;
}

var addMapArr = (pid,url,title,isSearch)=>{
 heatMapData.push({pid:pid,url:url,clickData:[],scrollData:[],title:title,isSearch:isSearch});
 return heatMapData.length-1;
}

var addClickMaptoArr = (index,clickData) =>{
	heatMapData[index].clickData.push(clickData);
}
var addScrollMaptoArr = (index,scrollData) =>{
	heatMapData[index].scrollData.push(scrollData);
}
var getMapfromArr = (pid)=>{
	for (var i = heatMapData.length - 1; i >= 0; i--) {
		if(heatMapData[i].pid == pid) {
			var map = heatMapData[i];
			heatMapData.splice(i,1); 
			return map;
		}
			
	}
	return false;
}

var AjaxStr=function(host,doname){
        url = host+"server.php?do=";
        url += doname; 
        return url;
    };  

var setUrlNCookie = function(a,doname){
	var props = Object.getOwnPropertyNames(a);
	var cookie = "uid="+uid;
	for (var i = 0; i < props.length; i++) {
            var propName = props[i];
            cookie += ";"+ propName +"="+ a[propName];

        }
    var cid = getRID();
    setCookieToArr(cid,cookie);
        return AjaxStr("http://localhost/ChromePlugin/",doname+"&CookieId="+cid);
}

var cc = function(s){
        if(debug)console.log("%c"+s,"background:#777;color:#fff");
    };


 var getRID = function() {
    return 'xxxxxxx'.replace(/[xy]/g, function(c) {
      var r = Math.random()*16|0, v = c == 'x' ? r : (r&0x3|0x8);
      return v.toString(16);
    });
};

  var  getCookiefromArr = function (url) {
   	var cid = url.substr(url.indexOf("CookieId")+9);
   	var cookie;
   	var i;
   	for (i = cookieArr.length - 1; i >= 0; i--) {
   		if(cookieArr[i].id == cid){
   			cookie = cookieArr[i].cookie;
   			cookieArr.splice(i,1); 
   			return cookie;
   		  	break;
   		  }
   	}   	
   	return false;
   }
   function setCookieToArr(cid,value){
   	cookieArr.push({id:cid ,cookie:value});
   }



var getUidfromServer=function(url){
	var xhr = new XMLHttpRequest();
	xhr.onreadystatechange = function(data) {
	    if (xhr.readyState == 4) {
	      if (xhr.status == 200) {
	        	localStorage.setItem("uid",xhr.responseText);
	      } else {
	        console.log('Get uid fail');
	      }
	    }
	  }
	xhr.open("GET", url, true);
	xhr.send();
}
var sendMessageToServer=function(url){
	var xhr = new XMLHttpRequest();
	xhr.open("GET", url, true);
	xhr.send();
}
 chrome.webRequest.onBeforeSendHeaders.addListener(
        function(details) {
        			var cookieStr = getCookiefromArr(details.url);
        			if (!cookieStr) return {requestHeaders: details.requestHeaders};
        		   	details.requestHeaders[details.requestHeaders.length-1].value = cookieStr;
        		   	console.log(details.requestHeaders[details.requestHeaders.length-1].name,details.requestHeaders[details.requestHeaders.length-1].value);
        			 return {requestHeaders: details.requestHeaders};
        },
        {urls: ["http://localhost/*"]},
        ["blocking", "requestHeaders"]);

// 检查uid存在
//
if(uid==null||uid=="") {
	uid = getUidfromServer(AjaxStr("http://localhost/ChromePlugin/","getUid"));
}  
chrome.runtime.onMessage.addListener(
	  function(request, sender, sendResponse) {
	  	switch(request.type)
	  	{

	  		case 7:
	  		var value = request.value;	  		
	  		request.pid = value.pid;
	  		request.other = "";
	  		delete request.value.pid;
	  		request.value = JSON.stringify(request.value);
	  		sendMessageToServer(setUrlNCookie(request,"operationRecord"));
	  			break;

	  		case 4:
	  		case 3:	
	  		case 5:	  	
	  		case 6:
	  		case 8:
	  		var value = request.value;	  		
	  		request.pid = value.pid;
	  		request.other = "";
	  		request.value = value.value;
	  		sendMessageToServer(setUrlNCookie(request,"operationRecord"));
	  			break;
	  		case 2:
	  		var value = request.value;
	  		request.pid = value.pid;
	  		request.other = value.title;
	  		request.value = value.url;
	  		sendMessageToServer(setUrlNCookie(request,"operationRecord"));
	  		break;
	  		case 1:	  		
	  		var value = request.value;
	  		request.value =  getRID();
	  		request.hosturl = value.hosturl;
	  		request.objurl = value.objurl;
	  		sendMessageToServer(setUrlNCookie(request,"pageChange"));
	  		break;
	  		case 9:
	  		var value = request.value;
	  		var index = isMapHas(value.pid);
	  		if(index)
	  			addClickMaptoArr(index,[value.X,value.Y])
	  		else 
	  			{
	  				index = addMapArr(value.pid,value.url,value.title ,value.isSearch);
	  				addClickMaptoArr(index,[value.X,value.Y]);
	  			}
	  		// console.log("已记录点击",value.X,value.Y,value.width,value.height);	  		
	  		break;
	  		case 10:
	  		var value = request.value;
	  		var index = isMapHas(value.pid);
	  		if(index)
	  			addScrollMaptoArr(index,[value.Y]);
	  		else 
	  			{
	  				index = addMapArr(value.pid,value.url,value.title ,value.isSearch);
	  				addScrollMaptoArr(index,[value.Y]);
	  			}
	  		// console.log("已记录滚动",value.Y,value.width,value.height);
	  		break;
	  		case 11:
	  		var value = request.value;
	  		var map = getMapfromArr(value.pid);
	  			request.url = map['url'];
	  			request.width= value.width;
	  			request.height= value.height;
	  			request.title = map['title'];
	  			request.isSearch = map['isSearch'];
	  			request.pid = map['pid'];
	  			request.foucsRecord = value.foucsRecord;
	  			request.clickData = JSON.stringify(map['clickData']);
	  			request.scrollData = JSON.stringify(map['scrollData']);
  			delete request.value ;
  			sendMessageToServer(setUrlNCookie(request,"heatMapData"));
  			console.log("提交pid为%s的热力图数据",value.pid);
  			break;
	  		default :	  		
	  			sendResponse(request);
	  			break;
	  	}
	  });
