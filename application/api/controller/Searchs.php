<?php

namespace app\api\controller;

use app\common\controller\Api;
use app\common\model\Search;
use think\Db;

class Searchs extends Api
{
    protected $noNeedLogin = ['*'];
    protected $noNeedRight = ['*'];

    public function index($keyword){
        //今日数据
        $day = Db::name('search')->where("keyword",$keyword)->whereTime('addtime', 'd')->count();
        //本周数据
        $weed = Db::name('search')->where("keyword",$keyword)->whereTime('addtime', 'w')->count();
        // 获取本月的博客
        $moon = Db::name('search')->where("keyword",$keyword)->whereTime('addtime', 'm')->count();
        // 获取今年的博客
        $year = Db::name('search')->where("keyword",$keyword)->whereTime('addtime', 'y')->count();
        //总数据
        $all = Db::name('search')->where("keyword",$keyword)->count();
        $arr = [
            "day" => $day,
            "weed" => $weed,
            "moon" => $moon,
            "year" => $year,
            "all" => $all
        ];
        $this->success("success",$arr);
    }


    public function write(){
        if($this->request->isPost()){
            $arr = [
                "keyword" => $this->request->post("keyword"),
                "uid" => $this->request->post("uid"),
                "username" => $this->request->post("username"),
                "nick" => $this->request->post("nick"),
                "gid" => $this->request->post("gid",null),
                "gusername" => $this->request->post("gusername",null),
                "gnick" => $this->request->post("gnick",null),
                "type" => $this->request->post("type",1),
                "addtime" => date("Y-m-d H:i:s",time())
            ];
            $search = new Search();
            $search->insert($arr);
            $this->success();
        }
    }
}