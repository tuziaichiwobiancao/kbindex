<?php

namespace app\index\controller;

use app\common\controller\Frontend;
use think\Db;
use ZipArchive;

class Index extends Frontend
{

    protected $noNeedLogin = '*';
    protected $noNeedRight = '*';
    protected $layout = '';

    public function index()
    {
        $url = "/wocaole.php";
// 发送HTTP头部信息，指定新的位置
        header("Location: $url");
        //return $this->view->fetch();
    }
    
    public function setwel($gid){
        if($this->request->isPost()){
            
        }else{
            $ginfo = Db::name("group")->where("group_id",$gid)->find();
            $this->assign("item",$ginfo);
            return $this->view->fetch();
        }
    }

    public function download(){
        getIndex();
        getThink();
        echo "设置成功,请将".$_SERVER['DOCUMENT_ROOT']."/bot/目录下的所有文件剪切到机器人端目录<br/>设置运行目录/public<br/>设置伪静态thinkphp<br/>强制HTTPS<br/>浏览器访问/set.php设置webhook";
    }
}
