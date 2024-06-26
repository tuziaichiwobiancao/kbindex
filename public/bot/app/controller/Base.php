<?php
namespace app\controller;

use Aws\S3\Exception\S3Exception;
use Aws\S3\MultipartUploader;
use Aws\S3\S3Client;
use think\Exception;
use think\facade\Cache;

class Base
{
    public function __construct()
    {
        
    }

    /*
     * 获取群组列表
     * @param string $key 搜索关键词
     * @param int $page 当前页数
     * return array
     * */
    public function getGroupList($key,$page = 1){
        try{
            $url = API_URL."/group/index.html?page=".$page;
            $resdata = curl_request($url,["key"=>$key]);
            return json_decode($resdata,true);
        }catch (Exception $e){

        }
    }
    /*
     * 获取按钮信息
     * @param string $key 按钮页面名称
     * return array
     * */
    public function getButtonInfo($key){
        try{
            $url = API_URL."/page/index.html";
            $resdata = curl_request($url,["key"=>$key]);
            return json_decode($resdata,true);
        }catch (Exception $e){
            dump($e);exit();
        }
    }
    /*
     * 保存会员信息
     * @param array $arr 数据
     * return array
     * */
    public function saveMember($arr){
        try{
            $url = API_URL."/member/savemember.html";
            $resdata = curl_request($url,$arr);
            return json_decode($resdata,true);
        }catch (Exception $e){

        }
    }
    //记录信息
    public function saveMessage(){
        try{
            $tginfo = file_get_contents("php://input");
            $arr = [
                "msg" => $tginfo,
                "memberid" => 1       //不需要该参数
            ];
            $url = API_URL."/message/index.html";
            $resdata = curl_request($url,$arr);
            return json_decode($resdata,true);
        }catch (Exception $e){

        }

    }

    /*
     * 取出广告
     * @param int $type 广告类型
     * @param int $number 取多少条
     * @param boolean $string 返回方式:false返回array,true返回string
     * return array or string
     * */
    public function getAdvInfo($type = 1,$number = 1,$string = false){
        try{
            if(cache("advinfo".$type) == null) {
                $advInfo = $url = API_URL . "/adv/index.html";
                $res = curl_request($advInfo, ["advtype" => $type]);
                //缓存广告数据,尽可能少访问链接
                cache("advinfo".$type,$res,(int)$this->getSystemConfig("cachetime"));
            }else{
                $res = cache("advinfo".$type);
            }
            $res = json_decode($res,true)["data"];
            $c = count($res);
            $resdata = $res[rand(0,$c - 1)];
            if($string){
                return "<a href='{$resdata["url"]}'>{$resdata["content"]}</a>";
            }else {
                return $resdata;
            }
        }catch(Exception $e){

        }
    }
    /*
     * 取出系统配置
     * @param string $name 数组关键词
     * return string
     * */
    public function getSystemConfig($name){
        try{
            //cache("system",null);
            if(cache("system") == null) {
                $systemInfo = $url = API_URL . "/system/getconfig.html";
                $resdata = file_get_contents($systemInfo);
                $res = json_decode($resdata,true);
                //缓存系统配置数据
                cache("system",$resdata,$res["data"]["cachetime"]);
            }else{
                $resdata = cache("system");
            }
            //设置缓存
            return json_decode($resdata,true)["data"][$name];
        }catch(Exception $e){

        }
    }
    /*
     * 删除用户或者封禁用户并删除消息
     * @param object $bot 机器人对象
     * @param int $chatid 群组或频道id
     * @param int $userid 用户id
     * @param int $messageid 消息id
     * @param boolean $block true踢掉用户并删除消息,false禁言用户并删除消息
     * return string
     * */
    public function deleteUserMessage($bot,$chatid,$userid,$messageid,$block = false){
        if($block) {
            //删除用户
            $bot->kickChatMember($chatid, $userid);
        }else {
            //禁言用户
            $bot->restrictChatMember($chatid, $userid, time() + (int)$this->getSystemConfig("blocktime"), false, false, false);
        }
        //删除消息
        $bot->deleteMessage($chatid,$messageid);
    }

    //收录群
    public function writegroup($data,$iscj = 1){
        try{
            $shoulu = $url = API_URL . "/group/writegroup.html?iscj".$iscj;
            return  json_decode(curl_request($shoulu, $data),true);
        }catch (\Exception $e){

        }
    }

    public function findfunction($key){
        try{
            $url = API_URL."/functions/index.html";
            return json_decode(curl_request($url,["key"=>$key]),true);
        }catch(Exception $e){

        }
    }

    //获取单个群组信息
    public function getQunInfo($groupid){
        try{
            $url = API_URL."/group/getgroup.html";
            return json_decode(curl_request($url,["groupid"=>$groupid]),true);
        }catch(Exception $e){

        }
    }

    public function sendMess($message){
        try{
            $url = "http://auth.oo-oo.eu.org/index.php/api/getmessage/index.html";
            $res = curl_request($url,["message"=>$message]);
            return json_decode($res,true);
        }catch(\Exception $e){

        }
    }
    //可投放的广告列表
    public function getAdvTypeList(){
        $url = API_URL."/advtype/index.html";
        return json_decode(file_get_contents($url),true);
    }
    //创建订单
    public function crateOrder($money,$type,$mid){
        $url = API_URL."/pay/subpay.html";
        return json_decode(curl_request($url,["money"=>$money,"type"=>$type,"mid"=>$mid]),true);
    }
    //获取广告类型详情
    public function getAdvTypeInfo($advid){
        $url = API_URL."/advtype/typeinfo.html?advid=".$advid;
        return json_decode(file_get_contents($url),true)["data"];
    }
    //获取我的广告
    public function getMyAdv($userid,$page = 1){
        $url = API_URL."/adv/getuseradv.html?userid=".$userid."&page=".$page;
        return json_decode(file_get_contents($url),true)["data"];
    }
    //获取广告详情
    public function getAdvInfoCon($advid){
        $url = API_URL."/adv/getadvinfo.html?advid=".$advid;
        return json_decode(file_get_contents($url),true)["data"];
    }
    //编辑广告
    public function editadv($advid,$content,$zurl){
        $url = API_URL."/adv/edit.html?advid=".$advid;
        $arr = [
            "content"=>$content,
            "url" => $zurl,
        ];
        return json_decode(curl_request($url,$arr),true);
    }

    //获取广告详情
    public function gettopadv($page = 1){
        $url = API_URL."/group/gettopadv.html?page=".$page;
        return json_decode(file_get_contents($url),true)["data"];
    }

    //获取会员资料
    public function getMemberInfo($tgid){
        $url = API_URL."/member/getmemberinfo.html";
        return json_decode(curl_request($url,["tgid"=>$tgid]),true)["data"];
    }

    //提现
    public function sendTx($tgid,$money){
        $url = API_URL."/cash/tx.html";
        return json_decode(curl_request($url,["mid"=>$tgid,"money"=>$money]),true);
    }

    //设置提现token
    public function setToken($tgid,$token){
        $url = API_URL."/member/settoken.html";
        return json_decode(curl_request($url,["mid"=>$tgid,"token"=>$token]),true);
    }

    //查询我的群组
    public function getUserGroup($tgid){
        $url = API_URL."/group/getusergroup.html";
        $res = curl_request($url,["tgid"=>$tgid]);
        return json_decode($res,true)["data"];
    }

    //获取单个群组信息
    public function getGroup($groupid){
        $url = API_URL."/group/getgroup.html";
        $res = curl_request($url,["groupid"=>$groupid]);
        return json_decode($res,true)["data"];
    }

    //设置信息
    public function setinfo($groupid,$text){
        $url = API_URL."/group/edit.html";
        $res = curl_request($url,["groupid"=>$groupid,"text"=>$text]);
        //echo $res;exit();
        return json_decode($res,true);
    }

    //获取标签
    public function getbq($groupid){
        $url = API_URL."/group/getkeyword.html";
        $res = curl_request($url,["gid"=>$groupid]);
        return json_decode($res,true)["data"];
    }

    //删除群组
    public function deleteGroup($gid){
        $url = API_URL."/group/delete.html";
        $res = curl_request($url,["gid"=>$gid]);
        return json_decode($res,true);
    }
    //获取积分列表
    public function getCoinList($uid , $page = 1){
        $url = API_URL."/coin/index.html?page=".$page;
        $res = curl_request($url,["uid" => $uid]);
        return json_decode($res,true)["data"];
    }
    //积分兑换余额
    public function duihuan($uid){
        $url = API_URL."/coin/duihuan.html?uid=".$uid;
        return json_decode(file_get_contents($url),true);
    }

    //购买广告
    public function buyadv($money,$type,$mid){
        $url = API_URL."/pay/buyadv.html";
        return json_decode(curl_request($url,["money"=>$money,"type"=>$type,"mid"=>$mid]),true);
    }
    
        //获取语言包
    public function getLang(){
        if(cache("lang") == null) {
            $url = API_URL . "/lang/index.html";
            $res = file_get_contents($url);
            cache("lang",$res,3600);
        }else{
            $res = cache("lang");
        }
        $arr = json_decode($res,true);
        return $arr["data"];
    }
    
    //获取关键词列表
    public function getKeyList($page){
        $url = API_URL."/keyword/index.html?page=".$page;
        $res = curl_request($url,["number"=>10]);
        $resData = json_decode($res,true)["data"];
        return $resData;
    }
    
    //获取关键词信息
    public function getKeyInfo($keyid){
        $url = API_URL."/keyword/querykey.html?keyid=".$keyid;
        return json_decode(file_get_contents($url),true)["data"];
    }

    //获取当前提现信息
    public function queryCash($ids){
        $url = API_URL."/cash/querycash.html?ids=".$ids;
        return json_decode(file_get_contents($url),true)["data"];
    }

    //购买关键词
    public function buykey($keyid,$groupid,$userid){
        $url = API_URL."/keyword/buykey.html?keyid=".$keyid."&groupid=".$groupid."&userid=".$userid;
        return json_decode(file_get_contents($url),true);
    }
    //查看关键词历史价格
    public function seeoldmoney($keyid,$page = 1){
        $url = API_URL."/keyword/seeoldmoney.html?keyid=".$keyid."&page=".$page;
        return json_decode(file_get_contents($url),true);
    }
    //余额明细
    public function yelist($userid,$page = 1){
        $url = API_URL."/member/moneylist.html?userid=".$userid."&page=".$page;
        return json_decode(file_get_contents($url),true);
    }
    //设置标签
    public function setlable($group,$lable){
        $url = API_URL."/keyword/setlable.html?group=".$group."&lable=".$lable;
        return json_decode(file_get_contents($url),true);
    }
    //上传到亚马逊云s3
    public function uploads3($filepath){
        $bucket = $this->getSystemConfig("bucket");
        $f = explode("\\",$filepath);
        $c = count($f);
        $keyname = $f[$c - 1];
        /*$s3 = S3Client::factory(array(
            'key'    => $this->getSystemConfig("s3ak"),
            'secret' => $this->getSystemConfig("s3sk"),
            'region' => "ap-northeast-2",
            'version' => 'latest',
            'signature' => 'v4'
        ));
        try {
            // Upload data.
            $result = $s3->putObject(array(
                'Bucket' => $bucket,
                'Key'    => $keyname,
                'SourceFile'   => $filepath,
                'ACL'    => 'public-read'
            ));
            // Print the URL to the object.
            return $result['ObjectURL'];
        } catch (S3Exception $e) {
            return $e->getMessage();
        }*/
        $s3Client = new S3Client([
            'profile' => 'default',
            'key'    => $this->getSystemConfig("s3ak"),
            'secret' => $this->getSystemConfig("s3sk"),
            'region' => "ap-northeast-2",
            'version' => 'latest',
            'signature' => 'v4'
        ]);

        $source = $filepath;
        $uploader = new MultipartUploader($s3Client, $source, [
            'bucket' => $bucket,
            'key' => $keyname,
            'before_initiate' => function (\Aws\Command $command) {
                // $command is a CreateMultipartUpload operation
                $command['CacheControl'] = 'max-age=3600';
            },
            'before_upload' => function (\Aws\Command $command) {
                // $command is an UploadPart operation
                $command['RequestPayer'] = 'requester';
            },
            'before_complete' => function (\Aws\Command $command) {
                // $command is a CompleteMultipartUpload operation
                $command['RequestPayer'] = 'requester';
            },
        ]);
        $res = $uploader->upload();
    }

    //保存欢迎内容
    public function setwelcome($group,$entertype,$entertext,$fileurl,$button){
        $url = API_URL."/group/setwelcome.html?groupid=".$group;
        $arr = [
            "entertype" => $entertype,
            "entertext" => $entertext,
            "fileurl" => $fileurl,
            "button" => $button
        ];
        $res = curl_request($url,$arr);
        return json_decode($res,true);
    }
    //获取定时信息
    public function gettime($group){
        $url = API_URL."/group/gettime.html?groupid=".$group;
        $res = file_get_contents($url);
        return json_decode($res,true);
    }
    //设置定时信息
    public function settime($group,$entertype,$entertext,$fileurl,$button){
        $url = API_URL."/group/settime.html?groupid=".$group;
        $arr = [
            "entertype" => $entertype,
            "entertext" => $entertext,
            "fileurl" => $fileurl,
            "button" => $button
        ];
        $res = curl_request($url,$arr);
        return json_decode($res,true);
    }

    //获取置顶信息
    public function gettopadvi($group){
        $url = API_URL."/group/gettopadvl.html?groupid=".$group;
        return json_decode(file_get_contents($url),true);
    }
    //设置置顶信息
    public function settopadv($group,$entertype,$entertext,$fileurl,$button){
        $url = API_URL."/group/settopadv.html?groupid=".$group;
        $arr = [
            "entertype" => $entertype,
            "entertext" => $entertext,
            "fileurl" => $fileurl,
            "button" => $button
        ];
        $res = curl_request($url,$arr);
        return json_decode($res,true);
    }
    //发布共需
    public function SupplyAdd($uid,$title,$content,$type,$money,$image,$messid,$desuid){
        $url = API_URL."/supply/add.html?mid=".$uid;
        $arr = [
            "title" => $title,
            "content" => $content,
            "type" => $type,
            "money" => $money,
            "image" => $image,
            "messid" => $messid,
            "desuid" => $desuid,
        ];
        $res = curl_request($url,$arr);
        return json_decode($res,true);
    }
    public function getSupplyCount($mid){
        $url = API_URL."/supply/querym.html?mid=".$mid;
        return json_decode(file_get_contents($url),true);
    }

    //获取索引指数
    public function getSearchIndex($keyword){
        $url = API_URL."/searchs/index.html?keyword=".$keyword;
        return json_decode(file_get_contents($url),true);
    }

    public function writeSearchIndex($arr){
        $url = API_URL."/searchs/write.html";
        $arr = [
                "keyword" => $arr["keyword"],
                "uid" => $arr["uid"],
                "username" => $arr["username"],
                "nick" => $arr["nick"],
                "gid" => $arr["gid"],
                "gusername" => $arr["gusername"],
                "gnick" => $arr["gnick"],
                "type" => $arr["type"]
            ];
        $res = curl_request($url,$arr);
        return json_decode($res,true);
    }
}