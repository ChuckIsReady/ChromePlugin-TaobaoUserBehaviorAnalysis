var isSearch = 0;
    debug = 0;
var pageRid;
var pageWidth = 0;
var pageHeight = 0;
var pageReady =0;
var getRID = function() {
    return 'xxxxxxx'.replace(/[xy]/g, function(c) {
      var r = Math.random()*16|0, v = c == 'x' ? r : (r&0x3|0x8);
      return v.toString(16);
    });
};

pageRid = getRID();
    var modeHtml = '<div class="mode" style="position:fixed;left:0;top:0;height:30px;line-height:30px;background-color:#ddd;z-index:999999999;display:inline-block;box-sizing:content-box;opacity:1;padding:0 20px;overflow:visible;border:none;border-radius:20px;color:#000;text-overflow:clip;background:#ddd;box-shadow:0 1px 0 0 #777,0 2px 0 0 #777,0 3px 0 0 #777,0 0 5px 0 rgba(0,0,0,.0980392),0 1px 3px 0 rgba(0,0,0,.298039),0 3px 5px 0 rgba(0,0,0,.2),0 5px 10px 0 rgba(0,0,0,.247059),0 10px 10px 0 rgba(0,0,0,.2),0 20px 20px 0 rgba(0,0,0,.14902);text-shadow:0 1px 0 #FFF;transition:none;transform:none;transform-origin:50% 50% 0;opacity:.9"><span>正在记录操作</span><div class="mode-state" style="display:inline-block;width:20px;height:20px;margin-bottom:-3px;margin-left:5px;margin-right:-13px;border-radius:10px;background-color:#3F0;box-shadow:2px 2px 4px 1px rgba(0,0,0,.4)"></div></div>';
   
    var cb = function(s){
        if(debug)console.log(s);
    };
    var c = function(s){
        if(debug)console.log(s);
    };
    var ct = function(s,f){
        if(debug)console.table(s,f);
    };
    var cc = function(s){
        if(debug)console.log("%c"+s,"background:#777;color:#fff");
    };
    var screenHalfHeight = $(window).height()/2;
     var GetRequest= function() {
        if(location.host=="detail.tmall.com")return;
        var url;
        try{
            url= window.decodeURIComponent(location.search); //获取url中"?"符后的字串
        }
        catch (error){
            cb("网址异常，不解码");
            url = location.search;
        }      
        var theRequest = {};
        if (url.indexOf("?") != -1) {
            var str = url.substr(1);
            if (str.indexOf("&") != -1) {
                strs = str.split("&");
                for (var i = 0; i < strs.length; i++) {
                    theRequest[strs[i].split("=")[0]] = unescape(strs[i].split("=")[1]);
                }
            } else {
                theRequest[str.split("=")[0]] = unescape(str.split("=")[1]);
            }
        }
        return theRequest;
    }

    var showObjDifferent = function (a, b) {
        var aProps = Object.getOwnPropertyNames(a);
        var bProps = Object.getOwnPropertyNames(b);
        var diffOBj = {};
        var equalLength =  aProps.length>bProps.length? bProps.length:aProps.length;  
        for (var i = 0; i < equalLength; i++) {
            var propName = aProps[i];
            if (a[propName] !== b[propName]) {
                diffOBj[propName]=[a[propName],b[propName]];
            }

        }

        if(aProps.length>bProps.length){

            for (var i = equalLength; i < aProps.length; i++) {
                var propName = aProps[i];
                if (a[propName] !== b[propName]) {
                    diffOBj[propName]=[a[propName],""];
                }
            }

        }
        else{
            for (var i = equalLength; i < bProps.length; i++) {
                var propName = bProps[i];
                if (a[propName] !== b[propName]) {
                    diffOBj[propName]=["",b[propName]];
                }
            } 


        }    
        return diffOBj;
    }
        Date.prototype.Format = function (fmt) { //author: meizz 
        var o = {
            "M+": this.getMonth() + 1, //月份 
            "d+": this.getDate(), //日 
            "h+": this.getHours(), //小时 
            "H+" : this.getHours(), 
            "m+": this.getMinutes(), //分 
            "s+": this.getSeconds(), //秒 
            "q+": Math.floor((this.getMonth() + 3) / 3), //季度 
            "S": this.getMilliseconds() //毫秒 
        };
        if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
        for (var k in o)
        if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
        return fmt;
    }
    var  sendMessage = function(type,value){
                     chrome.extension.sendMessage("", {"time": new Date().Format("yyyy-MM-dd HH:mm:ss"),"type":type,"value":value}, function(response) {
                         return response;
                     });

         };
    var messageFilter = function(type,value){
        value.pid = pageRid;
        switch(type){
            case"pageChange": 
                cc("网页跳转到 "+value);
                sendMessage(1,value); 
                break;
            case"newPage": 
                cc("进入网页 "+value);                
                sendMessage(2,value); 
                break;
            case"searchMessage":
                cc("用户搜索  "+value);
                sendMessage(3,value); 
                break;          
            case"urlChange": 
                cc("地址改变");
                ct(value); 
                sendMessage(4,{value:window.encodeURIComponent(JSON.stringify(value))});               
                break;
            case"urlClick": 
                cc('点击了  '+value);
                if(value.value!="")
                    sendMessage(5,value); 
                break;
            case"amountChange": 
                cc("购买数量修改为"+value);                    
                sendMessage(6,value); 
                break;
            case"propChange": 
                cc("选择"+value.title+"下的"+value.value);
                sendMessage(7,value);      
                break;

            case"radioChange": 
                cc("选择 "+value);
                sendMessage(8,value); 
                break;
            case"addClickdata": 
                cc("点击了 "+value.X+" "+value.Y);
                sendMessage(9,value); 
                break;
            case"addScrollData": 
                cc("滚动到 "+value.Y);
                sendMessage(10,value); 
                break;
            case"submitHeatmap":
                cc("提交热力图数据");
                sendMessage(11,value); 
                break;
   
        }

    };
    if(location.host!=="mpp.taobao.com"||location.host!=="pages.tmall.com"){
        messageFilter("newPage",{url:window.encodeURIComponent(location.href),title:document.title});

    }

    //定时检测网址变化
    oldurl = location.href+"";
    oldUrlOBj = GetRequest();
    setInterval(function(){       
        if(location.host!=="detail.tmall.com"&&location.href!==oldurl&&location.hash===""){
            messageFilter("urlChange",showObjDifferent(oldUrlOBj,GetRequest()));
            oldurl = location.href+"";
            oldUrlOBj = GetRequest();
        }
    },500);

    function scrollHeatMap (){
        if(!scrollRecordSwitch)return;
        var scrollCenter = Math.floor($(document).scrollTop()+screenHalfHeight);
        var m = {url:location.href,width:pageWidth,height:pageHeight,Y:scrollCenter,isSearch:isSearch,title:document.title};
        messageFilter("addScrollData",m);
        setInterval(scrollHeatMap, 20000);
    }
   var clickRecordSwitch = true;
   var scrollRecordSwitch = true;
   window.onload = function() { 
//页面加载完成后
        
        if(location.host=="s.taobao.com"){
            isSearch =1;
            messageFilter("searchMessage",{value:GetRequest().q});
        }
        if(location.host=="list.tmall.com"){
                    isSearch =1;
                    messageFilter("searchMessage",{value:$("#mq").value});
                }

        //启动滚动条和点击监视
            scrollHeatMap();
            $("body").click(function(e){
             if(!clickRecordSwitch)return;
             var m = {url:location.href,X:e.pageX,Y:e.pageY,isSearch:isSearch,title:document.title};
             messageFilter("addClickdata",m);
        });



    };//onload结束
        var foucsSwitch = true;
        var foucsSum = 0;
        var $box;
        var getbox = ()=>{
             switch(location.href.substring(8,20)){
            case "s.taobao.com" :
            $box = $("#mainsrp-itemlist");
            break;
            case "list.tmall.c":
             $box =   $("J_ItemList");
            break;
            case "item.taobao.":
             $box =   $("#J_MainWrap");
            break;
            case "detail.tmall":
             $box =   $("#mainwrap");
            break;
            default:
            $box =$(body);
            break;
        }   
        };
        getbox();
           
        var foucsTimer = ()=>{
            if(!foucsSwitch)return;
            if(typeof($box.offset())=="undefined"){setTimeout(getbox, 2000);setTimeout(foucsTimer, 3000); return;}
            if( $box.offset().top +  $box.height() > $(document).scrollTop() && $box.offset().top < $(document).scrollTop() +$(window).height())foucsSum++;
            console.log(foucsSum,"s");
            setTimeout(foucsTimer, 1000);
        };
        foucsTimer();


        var heatmapTimeLen = 1200000;
         //20分钟停留在页面上未操作鼠标，提交滚动和点击数据，停止记录
        var heatmapTimer=setInterval(function(){
            $('.mode span').text("超时，停止记录");
            $('.mode-state').css("background-color","rgb(255,0,0)");
            messageFilter("submitHeatmap",{width:$(document).width(),height:$(document).height(),foucsRecord:foucsSum});
            clearInterval(heatmapTimer);
            $(body).unbind("mouseover");
            $(body).unbind("mouseout");

        },heatmapTimeLen);

        $("body").mouseover(function(){
            clearInterval(heatmapTimer);
            foucsSwitch = true;
            clickRecordSwitch = true;
            scrollRecordSwitch = true;
        }).mouseout(function(){
            foucsSwitch = false;
            clickRecordSwitch = false;
            scrollRecordSwitch = false;
            heatmapTimer=setInterval(function(){
                $('.mode span').text("超时，停止记录");
                $('.mode-state').css("background-color","rgb(255,0,0)");
                messageFilter("submitHeatmap",{width:$(document).width(),height:$(document).height(),foucsRecord:foucsSum});
                clearInterval(heatmapTimer);
                $(body).unbind("mouseover");
                $(body).unbind("mouseout");
            },heatmapTimeLen);
        });
    $(window).bind('beforeunload',function(){messageFilter("submitHeatmap",{width:$(document).width(),height:$(document).height(),foucsRecord:foucsSum});});

    $("body").on("click","a",function(e){     
        var clickDate={};
        clickDate.str = $(this).text().replace(/(\n|\r)/g,"").replace(/(^\s*)|(\s*$)/g, "") ;
        try{
            clickDate.url = window.decodeURIComponent($(this)['0'].href);
        }
        catch (error){
            cb("网址异常，不解码");
            clickDate.url = $(this)['0'].href;
        }
        messageFilter("urlClick",{value:$.trim(clickDate.str)});

        var a = document.createElement('a');  
        a.href = clickDate.url;
        // clickDate.urlHost = a.hostname;
            if(clickDate.url.indexOf("javascript")>-1||clickDate.url.indexOf("#")>-1) return;
            if(a.hash==="")messageFilter("pageChange",{hosturl:window.encodeURIComponent(location.href),objurl:window.encodeURIComponent(clickDate.url)});
            // location.href = clickDate.url;

    });




    $("body").on("click","div#J_LinkBuy,.tb-btn-basket,#J_TabBar li",function(e){
        e.preventDefault(); 
    });

    $("body").on("click","input[type=radio]",function(e){   
        if(location.host=="item.taobao.com")messageFilter("radioChange",$(this).parent("label").text().replace(/(\n|\r)/g,"").replace(/(\s*)/g, ""));
        else
            messageFilter("radioChange",{value:$(this).next("label").text()});
    });

    $('body').append(modeHtml);


    if(location.host =="detail.tmall.com")
    $(".tb-sku").on("click","li",function(e){
        messageFilter("propChange",{value:$(this).attr("title")||$(this).children("a").children("span").text(),title:$(this).parent().parent().parent("dl").children("dt").text()});
    });

    $(".tb-amount-widget").on("change","input[type=text]",function(e){       
        messageFilter("amountChange",{value:$(this).val()});
    });
    $(".tb-amount-widget").on("click",".mui-amount-btn",function(e){      
        var i =0;
        var t = setInterval(function(){
            if(i++)
            {
                messageFilter("amountChange",{value:$(".tb-amount-widget input[type=text]").val()});
                clearInterval(t);
            }

        },100);

    });
     if(location.host =="iteam.taobao.com")
    {
        $(".tb-skin li").click(function(e){
        messageFilter("propChange",{value:$(this).children("a").children("span").text(),title:$(this).parent().parent().parent("dl").children("dt").text()});
    });
        $(".tb-skin").on("click","li",function(e){
        messageFilter("propChange",{value:$(this).children("a").children("span").text(),title:$(this).parent().parent().parent("dl").children("dt").text()});
    });


    }    
    $(".tb-skin li").click(function(e){
        messageFilter("propChange",{value:$(this).children("a").children("span").text(),title:$(this).parent().parent().parent("dl").children("dt").text()});
    });
    $("#J_Stock").on("change","input[type=text]",function(e){       
        messageFilter("amountChange",{value:$(this).val()});
    });
    
    $("#J_Stock").on("click","a",function(e){      

        var i =0;
        var t = setInterval(function(){
            if(i++)
            {
                messageFilter("amountChange",{value:$("#J_IptAmount").val()});
                clearInterval(t);
            }

        },100);

    });


