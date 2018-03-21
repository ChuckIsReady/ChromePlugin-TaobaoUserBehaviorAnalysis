    var c = function(s){
        console.log(s);
    };
var AjaxStr=function(doname,getStr){
        url = "server.php?do=";
        url += doname + getStr; 
        return url;
    };  
var heatmapArr = [];
var taobaoHeatmapArr = [];
var tmallHeatmapArr = [];
 var getRID = function() {
    return 'xxxxxxx'.replace(/[xy]/g, function(c) {
      var r = Math.random()*16|0, v = c == 'x' ? r : (r&0x3|0x8);
      return v.toString(16);
    });
};

var fillJumpDataOne = (jumpData)=>{
	var str = "<a href='"+jumpData.hosturl+"'><span class='tableJumpurl'>"+jumpData.hosturl+"</span></a>\
			跳转至 <a href='"+jumpData.objurl+"'><span class='tableJumpurl'>"+jumpData.objurl+"</span></a>";
   $('#JUMP'+jumpData.rid).replaceWith(str);
};
var getJumpDataOne=function(rid,teampid){
var url = AjaxStr("getJumpDataOne","&rid="+rid);
AjAxget(url,function(jumpData,teampid){
	fillJumpDataOne(jumpData[0]);
});
}
var fillMoreInfo =(list)=>{
	if(list.length==0)return;
	var id = list[0].pid;
	var $table = $("#infoTable"+id);
	$tableContent = $("#infoTable"+id+" table tbody");
	var typeStr = ["","网页跳转","进入网页","用户搜索","搜索选项","点击","购买数量","购买选项","选择查看"];
	var typeArr = [0,0,0,0,0,0,0,0,0];
	$tableContent.html("");
	for (i=0; i <list.length ; i++) 
		{
			var type = list[i].type;
			typeArr[type]++;
			switch(type){
				case "1":
				break;
				case "2":
				var str = "<tr><td>"+typeStr[type]+"</td><td><a href='"+list[i].value+"'><span class='pageTitle'>"+list[i].other+"</span></a></td></tr>";
				break;
				case "7":
				var str = "<tr><td>"+typeStr[type]+"</td><td>选择 "+JSON.parse(list[i].value).title+" 下的 "+JSON.parse(list[i].value).value+"</td></tr>";
				break;

				default:
				var str = "<tr><td>"+typeStr[type]+"</td><td>"+list[i].value+"</td></tr>";
				break;

			}			
		$tableContent.append(str);
		}
	var typeSum=0;
	for (var i = typeArr.length - 1; i >= 0; i--) {
			typeSum+=typeArr[i];
		}	
	var typeStr = "<td>点击比例</td>";
	for (var i = typeArr.length - 1; i > 0; i--) {
			typeStr+="<td>"+((typeArr[i]/typeSum)*100).toFixed(2)+"%</td>";
		}
	console.log(typeStr,typeArr,typeSum,"#inforPropTable"+id);
	$("#inforPropTable"+id).removeClass('hidden');	
	$("#inforPropTable"+id+" table .data").html(typeStr);	

	 $("#infoTable"+id+" table").tablesorter({

      theme: 'blackice',

      onRenderHeader: function (index) {
          $(this).find('div.tablesorter-header-inner').addClass('roundedCorners');
      },

  	});
}

var fillTable = function(list){
	var uid = list[0].uid;

	var $table = $("#"+uid+"Table");
	$table.html("<table  class='tablesorter am-u-sm-center'><thead> <th style='width: 170px;'>时间</th><th style='width: 78px;' >类型</th><th>操作</th></thead> <tbody> </tbody></table>");
	$tableContent = $("#"+uid+"Table table tbody");
	var type = ["","网页跳转","进入网页","用户搜索","搜索选项","点击","购买数量","购买选项","选择查看"];


	for (i=0; i <list.length ; i++) 
		{

			switch(type){
				case "1":
				var str = "<tr><td>"+list[i].time+"</td><td>"+type[list[i].type]+"</td><td><span id=\"JUMP"+list[i].value+"\">跳转数据载入中</span></td></tr>";
				getJumpDataOne(list[i].value);
				break;
				case "2":
				var str = "<tr><td>"+list[i].time+"</td><td>"+type[list[i].type]+"</td><td><a href='"+list[i].value+"'><span class='pageTitle'>"+list[i].other+"</span></a></td></tr>";
				break;
				case "7":
				var str = "<tr><td>"+list[i].time+"</td><td>"+type[list[i].type]+"</td><td>选择 "+JSON.parse(list[i].value).title+" 下的 "+JSON.parse(list[i].value).value+"</td></tr>";
				break;

				default:
				var str = "<tr><td>"+list[i].time+"</td><td>"+type[list[i].type]+"</td><td>"+list[i].value+"</td></tr>";
				break;

			}			
		$tableContent.append(str);
		}

	 $("#"+uid+"Table table").tablesorter({

      theme: 'blackice',

      onRenderHeader: function (index) {
          $(this).find('div.tablesorter-header-inner').addClass('roundedCorners');
      },

  	});

}


var fillJumpTable = (jumpData) =>{

$("#jumpDataTable").html("<table  class='tablesorter am-u-sm-center'><thead> <th>源地址</th><th>目标地址</th></thead> <tbody> </tbody></table>");
var $tableContent = $("#jumpDataTable table tbody");
	var html = ""
	var list = jumpData;
	var propArr = [0,0,0,0,0,0,0];
	// 0:淘宝搜索 到 淘宝搜索, 1:天猫搜索 到 天猫搜索, 2:淘宝搜索 到 淘宝商品, 3:淘宝搜索 到 天猫商品, 4:天猫搜索 到 天猫商品, 5:淘宝商品 到 天猫商品, 6:淘宝商品 到 淘宝商品
	for (i=0; i <list.length ; i++) 
		{
	var host = list[i].hosturl.substring(8,20);
	var obj = list[i].objurl.substring(8,20);
	switch(host){
		case "s.taobao.com" :
			if(obj=="s.taobao.com") propArr[0]++;
			if(obj=="item.taobao.") propArr[2]++;
			if(obj=="detail.tmall") propArr[3]++;
			break;
		case "list.tmall.c":
			if(obj=="list.tmall.c") propArr[1]++;
			if(obj=="detail.tmall") propArr[4]++;
			break;
		case "item.taobao.":
			if(obj=="item.taobao.") propArr[6]++;
			if(obj=="detail.tmall") propArr[5]++;
			break;
	}
	var str = "<tr><td><a href='"+list[i].hosturl+"'><span class='jumpurl'>"+list[i].hosturl+"</span></a></td><td><a href='"+list[i].objurl+"'><span class='jumpurl'>"+list[i].objurl+"</span></a></td></tr>";
	$tableContent.append(str);

		}
	var propSum=0;
	for (var i = propArr.length - 1; i >= 0; i--) {
			propSum+=propArr[i];
		}	
	for (var i = propArr.length - 1; i >= 0; i--) {
			$("#prop"+i+" span").html(((propArr[i]/propSum)*100).toFixed(2));
		}	
	 $("#jumpDataTable table").tablesorter({

      theme: 'blackice',

      onRenderHeader: function (index) {
          $(this).find('div.tablesorter-header-inner').addClass('roundedCorners');
      },

  	});

};

var checkJumpData = function(){
	$(".checkUserData").addClass("hidden");
	$(".checkJumpData").removeClass("hidden");
	$(".checkitemHeatmap").addClass("hidden");
$(".checkSearchHeatmap").addClass("hidden");
	$(".about").addClass("hidden");

	var url = AjaxStr("getJumpData","&limit=0,1000");
	
	var jumpData = AjAxget(url,fillJumpTable);

}


var about = function(){
	$(".checkUserData").addClass("hidden");
	$(".checkJumpData").addClass("hidden");
	$(".checkitemHeatmap").addClass("hidden");
	$(".checkSearchHeatmap").addClass("hidden");
	$(".about").removeClass("hidden");
}
var dealUserList = (user) =>{
	var html = ""
	for (var i =  0; i < user.length; i++) {
		html+='<dl class="am-accordion-item" id="'+user[i].uid+'">\
	       <dt class="am-accordion-title">用户 '+user[i].uid+'</dt>\
	        <dd class="am-accordion-bd am-collapse">\
	       <div class="am-accordion-content"><div class="am-g">\
	   <div class="am-u-sm-12 am-u-md-12 am-u-lg-12" id="'+user[i].uid+'Table">\
	  </div></div>\
	       </div>\
	      </dd>\
	    </dl>';
	}
	$("#userDateAccordion").html(html);
	$.AMUI.accordion.init();
}

var checkUserData = function(){
	$(".checkUserData").removeClass("hidden");
	$(".checkJumpData").addClass("hidden");
	$(".checkitemHeatmap").addClass("hidden");
	$(".checkSearchHeatmap").addClass("hidden");
	$(".about").addClass("hidden");
	var url = AjaxStr("getUser","");
	 AjAxget(url,dealUserList);
}
var arrCat=(s1,s2)=>{
	if(s2.length<3)return s1;
	if(s1.length<3)return s2;
	s1 = s1.substring(0,s1.length-1);
	s2 = s2.substring(1,s2.length);
	return s1 +","+s2;
}

var heatmapCat = (heatmapArr,element) =>{
			if(heatmapArr.length==0){
			  heatmapArr[0]= element;
			  return;
			}
			var flag = 0;
			for (var j = heatmapArr.length - 1; j >= 0; j--) {
				if(heatmapArr[j].width == element.width){
					heatmapArr[j].height = heatmapArr[j].height> element.height ? heatmapArr[j].height:element.height;
					heatmapArr[j].clickData = arrCat(heatmapArr[j].clickData,element.clickData);
					heatmapArr[j].scrollData = arrCat(heatmapArr[j].scrollData,element.scrollData);	
					flag = 1;
					break;				
				
				}
			};
			
			if(flag==0){
					var add = heatmapArr.length;
					heatmapArr[add] = {};
					heatmapArr[add].width = element.width;
					heatmapArr[add].height = element.height;
					heatmapArr[add].clickData = element.clickData;
					heatmapArr[add].scrollData = element.scrollData;
			       };
};

var dealSearchData = (searchHeatmapList) =>{
	var html = "";
	// console.log(searchHeatmapList);
	taobaoHeatmapArr = [];
	tmallHeatmapArr = [];
	for (var i =  0; i < searchHeatmapList.length; i++) {
		var s = searchHeatmapList[i].url.substring(8,20);
		if(s=="s.taobao.com"){
				heatmapCat(taobaoHeatmapArr,searchHeatmapList[i]); 
		}
		else if (s ="list.tmall.c"){
			heatmapCat(tmallHeatmapArr,searchHeatmapList[i]); 
		}
	}
	for (var i =  0; i < taobaoHeatmapArr.length; i++){
		html+=      '<dl class="am-accordion-item" id="search'+i+'">\
	        <dt class="am-accordion-title heatmaptitle searchtitle" btnid="'+i+'">页面宽度为'+	taobaoHeatmapArr[i].width+'像素的页面集合 </dt>\
	       <dd class="am-accordion-bd am-collapse" onscroll="toolFixed(this)">\
	          <div class="am-accordion-content am-padding-0"><div class="am-g">\
			     <div class="am-u-sm-12 am-u-md-12 am-u-lg-12 heatmapbox" id="search'+i+'heatmap">\
			     <iframe id="searchFrame'+i+'"></iframe>\
			     <div class="heatmapFloat">\
			     <div class="am-panel-group toolsbox"  id="searchTool'+i+'">\
					  <div class="am-panel am-panel-default">\
					    <div id="searchToolColl'+i+'" class="am-panel-collapse am-collapse am-in" >\
					      <div class="am-panel-bd am-padding-0">\
					      <div class="am-btn-group infoBtnBox am-btn-group-justify">\
					          <button type="button" btnid="'+i+'" class="am-btn am-btn-secondary clickHeatmapBtn am-active" onClick="clickSearchClickHeatmapBtn(this)">点击热力图</button>\
					          <button type="button" btnid="'+i+'" class="am-btn am-btn-secondary scrollHeatmapBtn" onClick="clickSearchScrollHeatmapBtn(this)">滚动条热力图</button>\
					          <button type="button" btnid="'+i+'" class="am-btn am-btn-secondary showMoreBtn" onClick="clickSearchShowMoreBtn(this)">显示更多信息</button>\
					          <button type="button" class="am-btn am-btn-secondary fullScreenBtn" onClick="fullScreen(this)">全屏显示</button>\
					      </div>\
					      </div>\
					      <div class="moreinformationAccordion hidden">\
					            <div>\
					            <div class="infoIteam">淘宝搜索页综合热力图</span></div> \
					            <div class="infoIteam">点击热力图点数量:<span>'+JSON.parse(taobaoHeatmapArr[i].clickData).length+'</span></div>  <div class="infoIteam">滚动热力图点数量:<span>'+JSON.parse(taobaoHeatmapArr[i].scrollData).length+'</span> </div>\
					            <div class="infoIteam">用户网页宽度:<span>'+taobaoHeatmapArr[i].width+'像素</span></div><div class="infoIteam">用户网页高度:<span>'+taobaoHeatmapArr[i].height+'像素</span></div>\
					            </div>\
					            <div class="moreinforBox hidden">\
					              <div class="title" btnid="'+i+'" onclick="">\
					              用户操作 <span> > </span>\
					              </div>\
					              <div class="moreinforContent hidden">\
					                <div class="am-accordion-content">\
					                </div>\
					              </div>\
					            </div>\
					        </div>\
					    </div>\
					  </div>\
					</div>\
			     <div class="clickMap" id="searchClickMap'+i+'"></div>\
				 <div class="scrollMap hidden" id="searchScrollMap'+i+'"></div>\
				 </div>\
			     </div>\
	     		</div>\
	          </div>\
	        </dd>\
	      </dl>';
	}
	$("#taobaoSearchAccordion").html(html);
	html=""
	for (var i =  0; i < tmallHeatmapArr.length; i++) {
		for (var i =  0; i < tmallHeatmapArr.length; i++){
		html+=      '<dl class="am-accordion-item" id="Tsearch'+i+'">\
	        <dt class="am-accordion-title heatmaptitle" btnid="'+i+'">页面宽度为'+	tmallHeatmapArr[i].width+'像素的页面集合 </dt>\
	       <dd class="am-accordion-bd am-collapse" onscroll="toolFixed(this)">\
	          <div class="am-accordion-content am-padding-0"><div class="am-g">\
			     <div class="am-u-sm-12 am-u-md-12 am-u-lg-12 heatmapbox" id="search'+i+'heatmap">\
			     <iframe id="TsearchFrame'+i+'"></iframe>\
			     <div class="heatmapFloat">\
			     <div class="am-panel-group toolsbox"  id="TsearchTool'+i+'">\
					  <div class="am-panel am-panel-default">\
					    <div id="TsearchToolColl'+i+'" class="am-panel-collapse am-collapse am-in" >\
					      <div class="am-panel-bd am-padding-0">\
					      <div class="am-btn-group infoBtnBox am-btn-group-justify">\
					          <button type="button" btnid="'+i+'" class="am-btn am-btn-secondary clickHeatmapBtn am-active" onClick="clickTSearchClickHeatmapBtn(this)">点击热力图</button>\
					          <button type="button" btnid="'+i+'" class="am-btn am-btn-secondary scrollHeatmapBtn" onClick="clickTSearchScrollHeatmapBtn(this)">滚动条热力图</button>\
					          <button type="button" btnid="'+i+'" class="am-btn am-btn-secondary showMoreBtn" onClick="clickTSearchShowMoreBtn(this)">显示更多信息</button>\
					          <button type="button" class="am-btn am-btn-secondary fullScreenBtn" onClick="fullScreen(this)">全屏显示</button>\
					      </div>\
					      </div>\
					      <div class="moreinformationAccordion hidden">\
					            <div>\
					            <div class="infoIteam">天猫搜索页综合热力图</span></div> \
					            <div class="infoIteam">点击热力图点数量:<span>'+JSON.parse(tmallHeatmapArr[i].clickData).length+'</span></div>  <div class="infoIteam">滚动热力图点数量:<span>'+JSON.parse(tmallHeatmapArr[i].scrollData).length+'</span> </div>\
					            <div class="infoIteam">用户网页宽度:<span>'+tmallHeatmapArr[i].width+'像素</span></div><div class="infoIteam">用户网页高度:<span>'+tmallHeatmapArr[i].height+'像素</span></div>\
					            </div>\
					            <div class="moreinforBox hidden">\
					              <div class="title" btnid="'+i+'" >\
					              <span> > </span>\
					              </div>\
					              <div class="moreinforContent hidden">\
					                <div class="am-accordion-content">\
					                </div>\
					              </div>\
					            </div>\
					        </div>\
					    </div>\
					  </div>\
					</div>\
			     <div class="clickMap" id="TsearchClickMap'+i+'"></div>\
				 <div class="scrollMap hidden" id="TsearchScrollMap'+i+'"></div>\
				 </div>\
			     </div>\
	     		</div>\
	          </div>\
	        </dd>\
	      </dl>';
	}
	$("#tmallSearchAccordion").html(html);
	}
	$.AMUI.accordion.init();
}

var dealItemHeatmap = (itemHeatmapList)=>{
	heatmapArr = itemHeatmapList;
	var html = "";
	for (var i =  0; i < itemHeatmapList.length; i++) {
		html+=      '<dl class="am-accordion-item" id="iteam'+itemHeatmapList[i].id+'">\
	        <dt class="am-accordion-title heatmaptitle" btnid="'+itemHeatmapList[i].id+'" alt="'+	itemHeatmapList[i].url+'">'+	itemHeatmapList[i].title+' <div>网址：'+	itemHeatmapList[i].url+'</div>\</dt>\
	       <dd class="am-accordion-bd am-collapse" onscroll="toolFixed(this)">\
	          <div class="am-accordion-content am-padding-0"><div class="am-g">\
			     <div class="am-u-sm-12 am-u-md-12 am-u-lg-12 heatmapbox" id="iteam'+itemHeatmapList[i].id+'heatmap">\
			     <iframe id="frame'+itemHeatmapList[i].id+'"></iframe>\
			     <div class="heatmapFloat">\
			     <div class="am-panel-group toolsbox"  id="tool'+itemHeatmapList[i].id+'">\
					  <div class="am-panel am-panel-default">\
					    <div id="toolColl'+itemHeatmapList[i].id+'" class="am-panel-collapse am-collapse am-in" >\
					      <div class="am-panel-bd am-padding-0">\
					      <div class="am-btn-group infoBtnBox am-btn-group-justify">\
					          <button type="button" btnid="'+itemHeatmapList[i].id+'" class="am-btn am-btn-secondary clickHeatmapBtn am-active" onClick="clickClickHeatmapBtn(this)">点击热力图</button>\
					          <button type="button" btnid="'+itemHeatmapList[i].id+'" class="am-btn am-btn-secondary scrollHeatmapBtn" onClick="clickScrollHeatmapBtn(this)">滚动条热力图</button>\
					          <button type="button" btnid="'+itemHeatmapList[i].id+'" class="am-btn am-btn-secondary showMoreBtn" onClick="clickshowMoreBtn(this)">显示更多信息</button>\
					          <button type="button" class="am-btn am-btn-secondary fullScreenBtn" onClick="fullScreen(this)">全屏显示</button>\
					      </div>\
					      </div>\
					      <div class="moreinformationAccordion hidden">\
					            <div>\
					            <div class="infoIteam">用户:<span>'+itemHeatmapList[i].uid+'</span></div> <div class="infoIteam">网页标题:<span>'+itemHeatmapList[i].title+'</span></div> \
					            <div class="infoIteam">点击热力图点数量:<span>'+JSON.parse(itemHeatmapList[i].clickData).length+'</span></div>  <div class="infoIteam">滚动热力图点数量:<span>'+JSON.parse(itemHeatmapList[i].scrollData).length+'</span> </div>\
					            <div class="infoIteam">用户网页宽度:<span>'+itemHeatmapList[i].width+'像素</span></div><div class="infoIteam">用户网页高度:<span>'+itemHeatmapList[i].height+'像素</span></div>\
					            <div class="infoIteam">商品详情/搜索列表查看时间:<span>'+itemHeatmapList[i].foucsRecord+'秒</span></div>\
					            <div class="infoTable hidden" id="inforPropTable'+itemHeatmapList[i].pid+'">\
								<table border="1"><tr>\
								    <th>元素类型</th>\
								    <th>网页跳转</th>\
								    <th>进入网页</th>\
								    <th>用户搜索</th>\
								    <th>搜索选项</th>\
								    <th>点击</th>\
								    <th>购买数量</th>\
								    <th>购买选项</th>\
								    <th>选择查看</th>\
								  </tr>\
								   <tr class="data"></tr>\
								</table>\
					            </div>\
					            </div>\
					            <div class="moreinforBox">\
					              <div class="title" btnid="'+itemHeatmapList[i].id+'" pid="'+itemHeatmapList[i].pid+'" onclick="clickmoreinforBox(this)">\
					              用户操作 <span> > </span>\
					              </div>\
					              <div class="moreinforContent hidden">\
					                <div class="am-accordion-content" id="infoTable'+itemHeatmapList[i].pid+'">\
					                  <table  class="tablesorter am-u-sm-center"><thead><th style="width: 78px;">类型</th><th>操作</th></thead> <tbody> </tbody></table>\
					                </div>\
					              </div>\
					            </div>\
					        </div>\
					    </div>\
					  </div>\
					</div>\
			     <div class="clickMap" id="clickMap'+itemHeatmapList[i].id+'"></div>\
				 <div class="scrollMap hidden" id="scrollMap'+itemHeatmapList[i].id+'"></div>\
				 </div>\
			     </div>\
	     		</div>\
	          </div>\
	        </dd>\
	      </dl>';
	}

	$("#itemHeatmapAccordion").html(html);
	$.AMUI.accordion.init();

}
var checkitemHeatmap =  ()=>{
	$(".checkitemHeatmap").removeClass("hidden");
	$(".checkUserData").addClass("hidden");
	$(".checkJumpData").addClass("hidden");
	$(".checkSearchHeatmap").addClass("hidden");
	$(".about").addClass("hidden");
	var url = AjaxStr("getHeatmapList","");
	 AjAxget(url,dealItemHeatmap);	
}

var checkSearchHeatmap = ()=>{
	$(".checkSearchHeatmap").removeClass("hidden");
	$(".checkJumpData").addClass("hidden");
	$(".checkitemHeatmap").addClass("hidden");
	$(".checkUserData").addClass("hidden");
	$(".about").addClass("hidden");
	var url = AjaxStr("getSearchData","&limit=0,1000");
	 AjAxget(url,dealSearchData);	
}

var AjAxget =function(url,fun){
	    var result = "";
	    var data = {};
    $.ajax({
        url: url,
        async: true,
        type: "GET",
        data: data,
        timeout:10000,
        success: function (res) {
            result = JSON.parse(res);
            fun(result);
        }
    });
}

var fillUserData = function(){
var uid = $(this).parent().attr("id");
var str = "&uid="+uid+"&limit='0,1000'";
var url = AjaxStr("getUserData",str);
AjAxget(url,fillTable);
};
var fillHeatmapData = function(){
	var $id = $(this).parent();
	var id = $(this).attr("btnid");
  if(!$id.hasClass('am-active')){
 			$("#clickMap"+id).html("");
			$("#scrollMap"+id).html("");
  }
  else{	
	for (var i = heatmapArr.length - 1; i >= 0; i--) {
		if(heatmapArr[i].id==id){
			$frame = $("#frame"+id);
			var width = heatmapArr[i].width;
			var height = heatmapArr[i].height;
			$frame.attr({"width":width+"px","height":height+"px","src":heatmapArr[i].url});
			 $("#clickMap"+id).css({"width":width+"px","height":height+"px"});
			 $("#scrollMap"+id).css({"width":width+"px","height":height+"px"});
			 console.log(heatmapArr[i].clickData,heatmapArr[i].scrollData,height);
			 showheatmap(id,JSON.parse(heatmapArr[i].clickData),JSON.parse(heatmapArr[i].scrollData),width,height);
			return;
		}
		
	}
  }
}

var fillSearchHeatmapData = function(){
	var $id = $(this);
	var id = $(this).attr("btnid");
	var i =id;
  if($id.hasClass('open')){
  			$id.removeClass('open');
 			$("#searchClickMap"+id).html("");
			$("#searchScrollMap"+id).html("");
  }
  else{	
  			$id.addClass('open');
			$frame = $("#searchFrame"+id);
			var width = taobaoHeatmapArr[i].width;
			var height = taobaoHeatmapArr[i].height;
			$frame.attr({"width":width+"px","height":height+"px","src":"https://s.taobao.com/search?q=测试物品"});
			 $("#searchClickMap"+id).css({"width":width+"px","height":height+"px"});
			 $("#searchScrollMap"+id).css({"width":width+"px","height":height+"px"});
			 showSearchHeatmap(id,JSON.parse(taobaoHeatmapArr[i].clickData),JSON.parse(taobaoHeatmapArr[i].scrollData),width,height);		

  }
}

var fillTSearchHeatmapData = function(){
	var $id = $(this);
	var id = $(this).attr("btnid");
	var i =id;
  if($id.hasClass('open')){
 			$("#TsearchClickMap"+id).html("");
			$("#TsearchScrollMap"+id).html("");
  }
  else{	
	for (var i = tmallHeatmapArr.length - 1; i >= 0; i--) {
			$frame = $("#TsearchFrame"+id);
			var width = tmallHeatmapArr[i].width;
			var height = tmallHeatmapArr[i].height;
			$frame.attr({"width":width+"px","height":height+"px","src":"https://list.tmall.com/search_product.htm?q=%E6%B5%8B%E8%AF%95%E5%95%86%E5%93%81"});
			 $("#TsearchClickMap"+id).css({"width":width+"px","height":height+"px"});
			 $("#TsearchScrollMap"+id).css({"width":width+"px","height":height+"px"});
			 showTSearchHeatmap(id,JSON.parse(tmallHeatmapArr[i].clickData),JSON.parse(tmallHeatmapArr[i].scrollData),width,height);		
	}
  }
}


var scrollConfig = {
  container: document.getElementById('heatmapContainer'),
  radius: 500,
  maxOpacity: 1,
  minOpacity: 1,
  blur: 0.8,
   gradient: {
    '0': '#0037ff',
    '.55': '#2bff00',
    '.90': '#f7ff00',
    '.93': '#ff7700',
    '1': '#ff0000'
  }
};

var clickConfig = {
  container: document.getElementById('heatmapContainer'),
  radius: 30,
  maxOpacity: 1,
  minOpacity: 1,
  blur: 0.9,
   gradient: {
    '0': '#0037ff',
    '.35': '#2bff00',
    '.60': '#f7ff00',
    '.75': '#ff7700',
    '1': '#ff0000'
  }
};
var fullScreen =(e)=>{
	var $heatbox = $(e).parent().parent().parent().parent().parent().parent().parent();
	var $toolsbox = $(e).parent().parent().parent().parent().parent();
	if($(e).hasClass('am-active')){
		 $toolsbox.removeClass('centerBox'); 
		$heatbox.css({"left":"auto","margin-left":"0"});
		$heatbox.parent().parent().parent().removeClass('fullScreen');
		$(e).removeClass('am-active')
	}
	else{	
	$toolsbox.addClass('centerBox'); 
	$heatbox.css({"left":"50%","margin-left":"-"+$heatbox.children('iframe').width()/2+'px'});
	$heatbox.parent().parent().parent().addClass('fullScreen');
	$(e).addClass('am-active');
	}
}
var toolFixed = function(e){
	$(e).find('.toolsbox').css('top',$(e).scrollTop()+'px');
}
var clickTSearchScrollHeatmapBtn = (e)=>{
	var id = $(e).attr('btnid');
	if($(e).hasClass('am-active')) return;
	$(e).prev().removeClass('am-active');
	$(e).addClass('am-active');
	$("#TsearchClickMap"+id).addClass('hidden');
	$("#TsearchScrollMap"+id).removeClass('hidden');
}

var clickTSearchClickHeatmapBtn = (e)=>{
	var id = $(e).attr('btnid');
	if($(e).hasClass('am-active')) return;
	$(e).next().removeClass('am-active');
	$(e).addClass('am-active');
	$("#TsearchScrollMap"+id).addClass('hidden');
	$("#TsearchClickMap"+id).removeClass('hidden');
	
}
var clickSearchScrollHeatmapBtn = (e)=>{
	var id = $(e).attr('btnid');
	if($(e).hasClass('am-active')) return;
	$(e).prev().removeClass('am-active');
	$(e).addClass('am-active');
	$("#searchClickMap"+id).addClass('hidden');
	$("#searchScrollMap"+id).removeClass('hidden');
}

var clickSearchClickHeatmapBtn = (e)=>{
	var id = $(e).attr('btnid');
	if($(e).hasClass('am-active')) return;
	$(e).next().removeClass('am-active');
	$(e).addClass('am-active');
	$("#searchScrollMap"+id).addClass('hidden');
	$("#searchClickMap"+id).removeClass('hidden');
	
}

var clickScrollHeatmapBtn = (e)=>{
	var id = $(e).attr('btnid');
	if($(e).hasClass('am-active')) return;
	$(e).prev().removeClass('am-active');
	$(e).addClass('am-active');
	$("#clickMap"+id).addClass('hidden');
	$("#scrollMap"+id).removeClass('hidden');
}

var clickClickHeatmapBtn = (e)=>{
	var id = $(e).attr('btnid');
	if($(e).hasClass('am-active')) return;
	$(e).next().removeClass('am-active');
	$(e).addClass('am-active');
	$("#scrollMap"+id).addClass('hidden');
	$("#clickMap"+id).removeClass('hidden');
	
}
var showheatmap = (id,clickData,scrollData,width,height)=>{
	 $("#scrollMap"+id).css({"width":50+"px","height":height+"px"});
	clickConfig.container = document.getElementById("clickMap"+id);
	 var clickmap = h337.create(clickConfig);
	scrollConfig.container = document.getElementById("scrollMap"+id);
	 var scrollmap = h337.create(scrollConfig);

	var clickDatas=[],scrollDatas=[];
	for (var i = clickData.length - 1; i >= 0; i--) {
		clickDatas.push({x:clickData[i][0],y:clickData[i][1],value:100}); 
	}
	for (var i = scrollData.length - 1; i >= 0; i--) {
		scrollDatas.push({x:25,y:scrollData[i][0],value:100}); 
	}
	clickmap.addData(clickDatas);
	scrollmap.addData(scrollDatas);
	console.log(clickDatas,id);
	console.log(scrollDatas,id);
	$("#scrollMap"+id).css({"width":width+"px","height":height+"px"});
	$("#scrollMap"+id+" canvas").css({"width":width+"px","height":height+"px"});
}

var showSearchHeatmap = (id,clickData,scrollData,width,height)=>{
	 $("#searchScrollMap"+id).css({"width":50+"px","height":height+"px"});
	clickConfig.container = document.getElementById("searchClickMap"+id);
	 var clickmap = h337.create(clickConfig);
	scrollConfig.container = document.getElementById("searchScrollMap"+id);
	 var scrollmap = h337.create(scrollConfig);

	var clickDatas=[],scrollDatas=[];
	for (var i = clickData.length - 1; i >= 0; i--) {
		clickDatas.push({x:clickData[i][0],y:clickData[i][1],value:100}); 
	}
	for (var i = scrollData.length - 1; i >= 0; i--) {
		scrollDatas.push({x:25,y:scrollData[i][0],value:100}); 
	}
	clickmap.addData(clickDatas);
	scrollmap.addData(scrollDatas);
	$("#searchScrollMap"+id).css({"width":width+"px","height":height+"px"});
	$("#searchScrollMap"+id+" canvas").css({"width":width+"px","height":height+"px"});
}
var showTSearchHeatmap = (id,clickData,scrollData,width,height)=>{
	 $("#TsearchScrollMap"+id).css({"width":50+"px","height":height+"px"});
	clickConfig.container = document.getElementById("TsearchClickMap"+id);
	 var clickmap = h337.create(clickConfig);
	scrollConfig.container = document.getElementById("TsearchScrollMap"+id);
	 var scrollmap = h337.create(scrollConfig);

	var clickDatas=[],scrollDatas=[];
	for (var i = clickData.length - 1; i >= 0; i--) {
		clickDatas.push({x:clickData[i][0],y:clickData[i][1],value:100}); 
	}
	for (var i = scrollData.length - 1; i >= 0; i--) {
		scrollDatas.push({x:25,y:scrollData[i][0],value:100}); 
	}
	clickmap.addData(clickDatas);
	scrollmap.addData(scrollDatas);
	$("#TsearchScrollMap"+id).css({"width":width+"px","height":height+"px"});
	$("#TsearchScrollMap"+id+" canvas").css({"width":width+"px","height":height+"px"});
}
var clickTSearchShowMoreBtn=(e)=>{
	var id = $(e).attr('btnid');
	if($(e).hasClass('am-active')) {
		$(e).removeClass('am-active');

		$("#TsearchToolColl"+id+"  .moreinformationAccordion").addClass('hidden');
		return;
	};
	$(e).addClass('am-active');
	$("#TsearchToolColl"+id+" .moreinformationAccordion").removeClass('hidden');
};
var clickSearchShowMoreBtn=(e)=>{
	var id = $(e).attr('btnid');
	if($(e).hasClass('am-active')) {
		$(e).removeClass('am-active');

		$("#searchToolColl"+id+"  .moreinformationAccordion").addClass('hidden');
		return;
	};
	$(e).addClass('am-active');
	$("#searchToolColl"+id+" .moreinformationAccordion").removeClass('hidden');
};

var clickshowMoreBtn=(e)=>{
	var id = $(e).attr('btnid');
	if($(e).hasClass('am-active')) {
		$(e).removeClass('am-active');

		$("#toolColl"+id+"  .moreinformationAccordion").addClass('hidden');
		return;
	};
	$(e).addClass('am-active');
	$("#toolColl"+id+" .moreinformationAccordion").removeClass('hidden');
};

var clickmoreinforBox = (e)=>{
	var id = $(e).attr('btnid');
	var pid =  $(e).attr('pid');
	var $e = $(e).parent();
	if($e.hasClass('active')) {
		//关闭的时候
		$e.removeClass('active');
		$("#toolColl"+id+" .moreinforContent").addClass('hidden');
		$("#toolColl"+id+" .moreinformationAccordion").css({"width":"400px"});
		$(e).children().text(" > "); 
		return;

	};
	$e.addClass('active');
	$(e).children().text(" : "); 
	$("#toolColl"+id+" .moreinforContent").removeClass('hidden');
	$("#toolColl"+id+" .moreinformationAccordion").css({"width":"800px"});
		var url = AjaxStr("getPageData","&pid="+pid);
	 AjAxget(url,function(list){fillMoreInfo(list);});
	
};
//主页面

$("#exit>button").click(function(){window.close();});
$("#checkJumpDataBtn").click(checkJumpData);
$("#checkUserDataBtn").click(checkUserData);
$("#checkSearchHeatmapBtn").click(checkSearchHeatmap);
$("#checkitemHeatmapBtn").click(checkitemHeatmap);
$("#aboutBtn").click(about);
$(".checkUserData").on("click",".am-accordion-title",fillUserData);
$("#itemHeatmapAccordion").on("click",".heatmaptitle",fillHeatmapData);
$("#taobaoSearchAccordion").on("click",".searchtitle",fillSearchHeatmapData);
$("#tmallSearchAccordion").on("click",".heatmaptitle",fillTSearchHeatmapData);
$("#itemHeatmapAccordion").on("scroll",".am-collapse",toolFixed);
