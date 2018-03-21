<?php
header("Content-Type:text/html;charset=utf-8");
//文件夹子文件队列操作函数
//数据库操作
function dbConnect(){
    $GLOBALS['dbObj'] = mysql_connect("localhost","root","root");
    if (!$GLOBALS['dbObj'])
    {
        die('Could not connect: ' . mysql_error());
    }
    mysql_query("SET NAMES UTF8");
    mysql_select_db("chromeplugin", $GLOBALS['dbObj'] );
}
 function uuid()  
  {  
    $chars = md5(uniqid(mt_rand(), true));  
    $uuid  = substr($chars,0,8) . '-';  
    $uuid .= substr($chars,8,4) . '-';  
    $uuid .= substr($chars,12,4) . '-';  
    $uuid .= substr($chars,16,4) . '-';  
    $uuid .= substr($chars,20,12);  
    return  $uuid;  
  }  
function setUid() {
    $uid = uuid();
        if (!isset($_COOKIE["uid"]))setcookie("uid",$uid, time()+315360000);
    echo $uid;
}

function dbSelect($table,$par = '*',$condition = '1=1'){
    // echo "[{tets:'SELECT $par FROM $table WHERE $condition'}]";
    $result = mysql_query("SELECT $par FROM $table WHERE $condition");
    $items = array();
    if($result)
        while($row = mysql_fetch_array($result,MYSQL_ASSOC))
        {
            array_push($items, $row);
        }
    return $items;
}
function dbSelectOne($table,$condition = '1=1'){
    $result = mysql_query("SELECT * FROM $table WHERE $condition LIMIT 1");
    $items = array();
    if($result)
        while($row = mysql_fetch_array($result,MYSQL_ASSOC))
        {
            array_push($items, $row);
        }
    return $items;
}

function dbAdd($table,$valueStr){
    $sql = "INSERT INTO  $table VALUE ($valueStr)";
    echo $sql;
    $result = mysql_query($sql);
}

function dbdel($table,$checkName,$value){


    $sql = "DELETE FROM $table WHERE `$checkName` = '$value' ";
    $result = mysql_query($sql);
    return $result;
}

function dbChange($table,$checkName,$value,$changeName,$newValue){

    $sql = "UPDATE $table SET $changeName = \"$newValue\" WHERE $checkName = \"$value\"";
    $result = mysql_query($sql);
    return $sql;
}

function operationRecord($uid , $time , $type , $value,$pid,$other=""){
   switch($type){
        case 7:
        case 4: 
        dbAdd("operation_record","\"$uid\",\"$time\",$type,'$value',\"$pid\",\"$other\"");
        break;  
        default:
         dbAdd("operation_record","\"$uid\",\"$time\",$type,\"$value\",\"$pid\",\"$other\"");
        break;
   }


}

function jumpRecord($uid,$time , $type,$rid,$hostUrl,$objUrl){
      dbAdd("operation_record","\"$uid\",\"$time\",$type,\"$rid\",\"$rid\",\"\"");
      dbAdd("url_jump","\"$rid\",\"$hostUrl\",\"$objUrl\"");
      getJumpDataOne($rid);
}
function addheatmapData($uid ,$url ,$width,$height,$clickData,$scrollData,$title,$pid, $isSearch,$foucsRecord ){
        dbAdd("heatmap","\"$url\",$width,$height,\"$uid\",\"$clickData\",\"$scrollData\",\"$title\",\"$pid\",\"$foucsRecord\",$isSearch,0");
}

 function getUser(){
    echo json_encode(dbSelect("user"));
 }



  function getUserData($uid,$limit){
    $str = "uid='".$uid."' LIMIT ".str_replace("'","",$limit);
     echo json_encode(dbSelect("operation_record","*",$str));
  }
  function getPageData($pid){
    $str = "pid='".$pid."'";
    echo json_encode(dbSelect("operation_record","*",$str));
  }
  function getJumpData($limit){
$str = "1=1 LIMIT ".str_replace("”","'",$limit);
echo json_encode(dbSelect("url_jump","*",$str));
  }
  function getJumpDataOne($rid){
$str = "rid='$rid'";
echo json_encode(dbSelectOne("url_jump",$str));
  }

  function getHeatmapList(){
    echo json_encode(dbSelect("heatmap"));
  }
  function getOneHeatmapList($uid,$limit){
    $str = "uid='".str_replace("”","'",$uid)."' LIMIT ".str_replace("”","'",$limit);
    echo json_encode(dbSelect("heatmap","*",$str));
  }
  function getSearchData($limit){
    $str = "isSearch=1 LIMIT ".str_replace("”","'",$limit);
    echo json_encode(dbSelect("heatmap","*",$str));
  }