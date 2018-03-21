<?php
header("Content-Type:text/html;charset=utf-8");
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Headers: *');
header('Access-Control-Expose-Headers: *');
header('Access-Control-Allow-Credentials: true');
$do = $_GET['do'];
include_once "function.php";
dbConnect();

$do = $do?$do:"default";
session_start();



switch($do){

    case"operationRecord":
        $uid = $_COOKIE["uid"];
        $time = $_COOKIE['time'];
        $type = $_COOKIE['type'];
        $value =$_COOKIE['value'];
        $pid = $_COOKIE["pid"];
        $other = $_COOKIE["other"];
        operationRecord($uid , $time , $type , $value, $pid , $other) ;
        break;

    case"pageChange":
        $uid = $_COOKIE["uid"];
        $time = $_COOKIE['time'];
        $type = $_COOKIE['type'];
        $value =$_COOKIE['value'];
        $rid = $_COOKIE['value'];
        $objUrl =    $_COOKIE['objurl'];
        $hostUrl =   $_COOKIE['hosturl'];
        echo $objUrl.$hostUrl;
        jumpRecord($uid,$time , $type ,$rid,$hostUrl,$objUrl);
        break;

    case"getUser":
        getUser();
        break;
    case "heatMapData":
        $uid = $_COOKIE["uid"];
        $url = $_COOKIE["url"];
        $width = $_COOKIE["width"];
        $height = $_COOKIE["height"];
        $clickData = $_COOKIE["clickData"];
        $scrollData = $_COOKIE["scrollData"];
        $title = $_COOKIE["title"];
        $pid = $_COOKIE["pid"];
        $isSearch = $_COOKIE["isSearch"];
        $foucsRecord = $_COOKIE["foucsRecord"];
        addheatmapData($uid ,$url ,$width,$height,$clickData,$scrollData,$title,$pid, $isSearch,$foucsRecord );
        break;
    case "getUserData":
        $uid = $_GET["uid"];
        $limit = $_GET['limit'];
        getUserData($uid,$limit);
         break;
    case "getHeatmapList":
        getHeatmapList();
         break;
    case "getPageData":
        $pid = $_GET["pid"];
        getPageData($pid);
        break;
    case "getJumpData":
        $limit = $_GET['limit'];
        getJumpData($limit);
         break;
    case"getJumpDataOne":
        $rid = $_GET['rid'];
        getJumpDataOne($rid);
        break;
    case "getUid":
        setUid();
        break;  
    case "getSearchData":
        $limit = $_GET['limit'];
        getSearchData($limit );
        break;
    case "default":
        echo "string";
        break;
}
?>