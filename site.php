<?php
class Release_newsModuleSite extends WeModuleSite
{
	function findThePhoneNumbers($oldStr = ""){

        // 检测字符串是否为空
        $oldStr=trim($oldStr);
        $numbers = array();
        if(empty($oldStr)){
            return $numbers;
        }

        // 删除86-180640741122，0997-8611222之类的号码中间的减号（-）
        $strArr = explode("-", $oldStr);
        $newStr = $strArr[0];
        for ($i=1; $i < count($strArr); $i++) {
            if (preg_match("/\d{2}$/", $newStr) && preg_match("/^\d{11}/", $strArr[$i])){
                $newStr .= $strArr[$i];
            } elseif (preg_match("/\d{3,4}$/", $newStr) && preg_match("/^\d{7,8}/", $strArr[$i])) {
                $newStr .= $strArr[$i];
            } else {
                $newStr .= "-".$strArr[$i];
            }
        }

        // 手机号的获取
        $reg='/\D(?:86)?(\d{11})\D/is';//匹配数字的正则表达式
        preg_match_all($reg,$newStr,$result);
        $nums = array();
        // * 中国移动：China Mobile
        // * 134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
        $cm = "/^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\d)\d{7}$/";
        // * 中国联通：China Unicom
        // * 130,131,132,152,155,156,185,186
        $cu = "/^1(3[0-2]|5[256]|8[56])\d{8}$/";
        // * 中国电信：China Telecom
        // * 133,1349,153,180,189
        $ct = "/^1((33|53|8[09])[0-9]|349)\d{7}$/";
        //
        foreach ($result[1] as $key => $value) {
            if(preg_match($cm,$value)){
                $nums[] = array("number" => $value, "type" => "中国移动");
            }elseif(preg_match($cu,$value)){
                $nums[] = array("number" => $value, "type" => "中国联通");
            }elseif(preg_match($ct,$value)){
                $nums[] = array("number" => $value, "type" => "中国电信");
            }else{
                // 非法号码
            }
        }
        $numbers["mobile"] = $nums;


        // 固定电话或小灵通的获取
        $reg='/\D(0\d{10,12})\D/is';//匹配数字的正则表达式
        preg_match_all($reg,$newStr,$result);
        $nums = array();
        // * 大陆地区固定电话或小灵通
        // * 区号：010,020,021,022,023,024,025,027,028,029
        // * 号码：七位或八位
        $phs = "/^0(10|2[0-5789]|\d{3})\d{7,8}$/";
        foreach ($result[1] as $key => $value) {
            if(preg_match($phs, $value)){
                $nums[] = array("number" => $value, "type" => "固定电话或小灵通");
            } else {
                // 非法
            }
        }
        $numbers["landline"] = $nums;


        // 有可能是没有区号的固定电话的获取
        $reg='/\D(\d{7,8})\D/is';//匹配数字的正则表达式
        preg_match_all($reg,$newStr,$result);
        $nums = array();
        foreach ($result[1] as $key => $value) {
            $nums[] = array("number" => $value, "type" => "没有区号的固定电话");
        }
        $numbers["possible"] = $nums;

        // 返回最终数组
        return $numbers;
    }

    public function doWebUsers(){
		session_start();
        global $_W,$_GPC;

		if(!empty($_GPC['pagesize'])){
			$_SESSION['pagesize']=$_GPC['pagesize'];
		}

        $pindex = max(1, intval($_GPC['page']));
        $psize = empty($_SESSION['pagesize'])?10:$_SESSION['pagesize'];
        $params=array(':uniacid'=>$_W['uniacid']);
        $codition='';
        if(!empty($_GPC['keyword'])){
            $codition.=" and (name like '%{$_GPC['keyword']}%' or mobile like '%{$_GPC['keyword']}%' )";
        }

        if(!empty($_GPC['areas'])){
            $city=pdo_getall('release_news_area',array('uniacid'=>$_W['uniacid'],'level'=>2,'aid'=>$_GPC['areas'],'status'=>1));
            if(empty($_GPC['city'])){
                $temp_area=pdo_get('release_news_area',array('id'=>$_GPC['areas']));
                $citys="'".$temp_area['name']."'".(empty($city)?'':',');
                foreach($city as $k=>$v){
                    $citys.="'".$v['name']."'".(count($city)!=($k+1)?',':'');
                }

                $codition.=" and address2 in (".$citys.") ";
            }else{
                $temp_city=pdo_get('release_news_area',array('id'=>$_GPC['city']));
                $codition.=" and address2='".$temp_city['name']."' ";
            }
        }

        if(!empty($_GPC['time'])){
            $codition.=" and createtime >= ".strtotime($_GPC['time']['start'])." and createtime < ".strtotime('+1 day',strtotime($_GPC['time']['end']));
        }

        $list=pdo_fetchall("select * from ".tablename('release_news_users')." where uniacid=:uniacid {$codition} ORDER BY createtime DESC LIMIT " . ($pindex - 1) * $psize . ',' . $psize,$params);
        $total=pdo_fetchcolumn("select COUNT(*) from ".tablename('release_news_users')." where uniacid=:uniacid {$codition} ",$params);

        $_GET['keyword']=$_GPC['keyword'];
        $_GET['areas']=$_GPC['areas'];
        $_GET['city']=$_GPC['city'];
        $_GET['time']=$_GPC['time'];

        $pager = pagination($total, $pindex, $psize);

        $areas=pdo_getall('release_news_area',array('uniacid'=>$_W['uniacid'],'level'=>1,'status'=>1));

        include $this->template('users');
    }
	
		public function getAccount()
	{
		global $_W;
		load()->model('account');

		if (!(empty($_W['acid']))) {
			return WeAccount::create($_W['acid']);
		}

		$acid = pdo_fetchcolumn('SELECT acid FROM ' . tablename('account_wechats') . ' WHERE `uniacid`=:uniacid LIMIT 1', array(':uniacid' => $_W['uniacid']));
		return WeAccount::create($acid);
	}
	
    public function doWebNews(){
		session_start();
        global $_W,$_GPC;

        if(!empty($_GPC['delete1'])){
            pdo_delete('release_news_news',array('id'=>$_GPC['id']));
            header("location:".$this->createWebUrl('news'));die;
        }

		if(!empty($_GPC['pagesize'])){
			$_SESSION['pagesize']=$_GPC['pagesize'];
		}

        $pindex = max(1, intval($_GPC['page']));
        $psize = empty($_SESSION['pagesize'])?10:$_SESSION['pagesize'];
        $params=array(':uniacid'=>$_W['uniacid']);
        $codition='';
        if(!empty($_GPC['keyword'])){
            $codition.=" and (a.content like '%{$_GPC['keyword']}%' or b.name like '%{$_GPC['keyword']}%' or b.mobile like '%{$_GPC['keyword']}%')";
        }

        if(!empty($_GPC['uid'])){
            $codition.=" and uid=".$_GPC['uid'];
        }

		if(!empty($_GPC['areas'])){
			$city=pdo_getall('release_news_area',array('uniacid'=>$_W['uniacid'],'level'=>2,'aid'=>$_GPC['areas'],'status'=>1));
			if(empty($_GPC['city'])){
				$temp_area=pdo_get('release_news_area',array('id'=>$_GPC['areas']));
				$citys="'".$temp_area['name']."'".(empty($city)?'':',');
				foreach($city as $k=>$v){
					$citys.="'".$v['name']."'".(count($city)!=($k+1)?',':'');
				}

				$codition.=" and a.address in (".$citys.") ";
			}else{
				$temp_city=pdo_get('release_news_area',array('id'=>$_GPC['city']));
				$codition.=" and a.address='".$temp_city['name']."' ";
			}
		}

		if(!empty($_GPC['time'])){
			$codition.=" and a.createtime >= ".strtotime($_GPC['time']['start'])." and a.createtime < ".strtotime('+1 day',strtotime($_GPC['time']['end']));
		}

        $list=pdo_fetchall("select a.*,b.name,b.mobile from ".tablename('release_news_news')." a left join ".tablename('release_news_users')." b on a.uid=b.id where a.uniacid=:uniacid {$codition} ORDER BY createtime DESC LIMIT " . ($pindex - 1) * $psize . ',' . $psize,$params);
        $total=count(pdo_fetchall("select a.* from ".tablename('release_news_news')." a left join ".tablename('release_news_users')." b on a.uid=b.id where a.uniacid=:uniacid {$codition} ORDER BY createtime DESC",$params));

		$_GET['keyword']=$_GPC['keyword'];
		$_GET['areas']=$_GPC['areas'];
		$_GET['city']=$_GPC['city'];
		$_GET['time']=$_GPC['time'];

        $pager = pagination($total, $pindex, $psize);

		$areas=pdo_getall('release_news_area',array('uniacid'=>$_W['uniacid'],'level'=>1,'status'=>1));

        include $this->template('news');
    }

    public function doWebCompany(){
		session_start();
        global $_W,$_GPC;

        if(!empty($_GPC['delete1'])){
            pdo_delete('release_news_company',array('id'=>$_GPC['id']));
            header("location:".$this->createWebUrl('company'));die;
        }

		if(!empty($_GPC['pagesize'])){
			$_SESSION['pagesize']=$_GPC['pagesize'];
		}

        $pindex = max(1, intval($_GPC['page']));
        $psize = empty($_SESSION['pagesize'])?10:$_SESSION['pagesize'];
        $params=array(':uniacid'=>$_W['uniacid']);
        $codition='';
        if(!empty($_GPC['keyword'])){
            $codition.=" and (a.name like '%{$_GPC['keyword']}%' or a.tel like '%{$_GPC['keyword']}%' or b.name like '%{$_GPC['keyword']}%' or b.mobile like '%{$_GPC['keyword']}%') ";
        }

        if(!empty($_GPC['areas'])){
            $city=pdo_getall('release_news_area',array('uniacid'=>$_W['uniacid'],'level'=>2,'aid'=>$_GPC['areas'],'status'=>1));
            if(empty($_GPC['city'])){
                $temp_area=pdo_get('release_news_area',array('id'=>$_GPC['areas']));
                $citys="'".$temp_area['name']."'".(empty($city)?'':',');
                foreach($city as $k=>$v){
                    $citys.="'".$v['name']."'".(count($city)!=($k+1)?',':'');
                }

                $codition.=" and a.address in (".$citys.") ";
            }else{
                $temp_city=pdo_get('release_news_area',array('id'=>$_GPC['city']));
                $codition.=" and a.address='".$temp_city['name']."' ";
            }
        }

        if(!empty($_GPC['time'])){
            $codition.=" and a.createtime >= ".strtotime($_GPC['time']['start'])." and a.createtime < ".strtotime('+1 day',strtotime($_GPC['time']['end']));
        }

        $list=pdo_fetchall("select a.*,b.name as username,b.mobile from ".tablename('release_news_company')." a left join ".tablename('release_news_users')." b on a.uid=b.id where a.uniacid=:uniacid {$codition} ORDER BY createtime DESC LIMIT " . ($pindex - 1) * $psize . ',' . $psize,$params);
        $total=count(pdo_fetchall("select a.* from ".tablename('release_news_company')." a left join ".tablename('release_news_users')." b on a.uid=b.id where a.uniacid=:uniacid {$codition} ORDER BY createtime DESC ",$params));

        $_GET['keyword']=$_GPC['keyword'];
        $_GET['areas']=$_GPC['areas'];
        $_GET['city']=$_GPC['city'];
        $_GET['time']=$_GPC['time'];

        $pager = pagination($total, $pindex, $psize);

        $areas=pdo_getall('release_news_area',array('uniacid'=>$_W['uniacid'],'level'=>1,'status'=>1));

        include $this->template('company');
    }

    public function doWebIdea(){
		session_start();
        global $_W,$_GPC;

        if(!empty($_GPC['delete1'])){
            pdo_delete('release_news_idea',array('id'=>$_GPC['id']));
            header("location:".$this->createWebUrl('idea'));die;
        }

		if(!empty($_GPC['pagesize'])){
			$_SESSION['pagesize']=$_GPC['pagesize'];
		}

        $pindex = max(1, intval($_GPC['page']));
        $psize = empty($_SESSION['pagesize'])?10:$_SESSION['pagesize'];
        $params=array(':uniacid'=>$_W['uniacid']);
        $codition='';
        $codition2='';
        if(!empty($_GPC['keyword'])){
            $codition.=" and a.content like '%{$_GPC['keyword']}%' ";
            $codition2.=" and content like '%{$_GPC['keyword']}%' ";
        }

        $list=pdo_fetchall("select a.*,b.name,b.mobile from ".tablename('release_news_idea')." a left join ".tablename('release_news_users')." b on a.uid=b.id where a.uniacid=:uniacid {$codition} ORDER BY createtime DESC LIMIT " . ($pindex - 1) * $psize . ',' . $psize,$params);
        $total=pdo_fetchcolumn("select COUNT(*) from ".tablename('release_news_idea')." where uniacid=:uniacid {$codition2} ",$params);

        $pager = pagination($total, $pindex, $psize);

        include $this->template('idea');
    }

    public function doWebSet(){
        global $_W,$_GPC;
        $uniacid=$_W['uniacid'];
        $set=pdo_get('release_news_set',array('uniacid'=>$uniacid));

        if($_W['ispost']){
            $data=array(
                'uniacid'=>$uniacid,
                'freedays'=>$_GPC['freedays'],
                'rechargedays'=>$_GPC['rechargedays'],
                'rechargeprice'=>$_GPC['rechargeprice']
            );
            if(empty($set)){
                pdo_insert('release_news_set',$data);
            }else{
                pdo_update('release_news_set',$data,array('uniacid'=>$uniacid));
            }
            message("修改成功",$this->createWebUrl('set'));
        }


        include $this->template('set');
    }

    public function doWebAddress(){
        global $_W,$_GPC;
        $uniacid=$_W['uniacid'];

        if(!empty($_GPC['delete1'])){
            pdo_delete('release_news_area',array('id'=>$_GPC['id']));
            header("location:".$this->createWebUrl('address'));die;
        }

        if($_W['ispost']){
            $data=array(
                'uniacid'=>$uniacid,
                'level'=>1,
                'name'=>$_GPC['name'],
				'status'=>$_GPC['status']
            );
            if(empty($_GPC['id'])){
                pdo_insert('release_news_area',$data);
            }else{
                pdo_update('release_news_area',$data,array('id'=>$_GPC['id']));
            }
            header("location:".$this->createWebUrl('address'));die;
        }

        $list=pdo_getall('release_news_area',array('uniacid'=>$uniacid,'level'=>1));

        include $this->template('address');
    }

    public function doWebCity(){
        global $_W,$_GPC;
        $uniacid=$_W['uniacid'];

        if(!empty($_GPC['delete1'])){
            pdo_delete('release_news_area',array('id'=>$_GPC['id']));
            header("location:".$this->createWebUrl('city',array('aid'=>$_GPC['aid'])));die;
        }

        if($_W['ispost']){
            $data=array(
                'uniacid'=>$uniacid,
                'level'=>2,
                'name'=>$_GPC['name'],
                'aid'=>$_GPC['aid'],
				'status'=>$_GPC['status']
            );
            if(empty($_GPC['id'])){
                pdo_insert('release_news_area',$data);
            }else{
                pdo_update('release_news_area',$data,array('id'=>$_GPC['id']));
            }
            header("location:".$this->createWebUrl('city',array('aid'=>$_GPC['aid'])));die;
        }

        $address=pdo_get('release_news_area',array('uniacid'=>$uniacid,'id'=>$_GPC['aid']));
        $list=pdo_getall('release_news_area',array('uniacid'=>$uniacid,'level'=>2,'aid'=>$_GPC['aid']));

        include $this->template('city');
    }

	public function doWebGetcitysajax(){
		global $_W,$_GPC;
		$uniacid=$_W['uniacid'];
		$id=$_GPC['id'];
		$html='<option value="">全部</option>';
		if(!empty($id)){
			$citys=pdo_getall('release_news_area',array('uniacid'=>$uniacid,'level'=>2,'aid'=>$id,'status'=>1));
			foreach($citys as $v){
				$html.='<option value="'.$v['id'].'">'.$v['name'].'</option>';
			}
		}
		echo $html;
	}

    public function release_check()
    {
        global $_W;
        $this->user=pdo_get('release_news_users',array('openid'=>$_W['openid']));
//        $this->user=pdo_get('release_news_users',array('openid'=>'okAOK0-iz8wzd_DBQvkn9wJ242gA'));


        if(empty($this->user)){
            message("未注册账号",$this->createMobileUrl('reg'));
        }elseif($this->user['stoptime']<time()){
            message("账号到期请续费",$this->createMobileUrl('myserve'));
        }
    }

    public function doMobileReg(){
        global $_W,$_GPC;
        if(empty($_W['openid'])){
            message("请在微信端打开");
        }

        if(empty($_W['fans']['nickname'])){
            mc_oauth_userinfo();
        }

        $uniacid=$_W['uniacid'];

        $this->user=pdo_get('release_news_users',array('openid'=>$_W['openid']));
        if(!empty($this->user)){
            message("已注册账号",$this->createMobileUrl('home'));
        }

        if($_W['ispost']){
            if(empty($_GPC['name'])){
                message("未填写名称");
            }

            $preg_phone='/^1[34578]\d{9}$/ims';
            if(!preg_match($preg_phone,$_GPC['mobile'])){
                message("手机号不正确");
            }
            $time=time();

            $checkuser=pdo_get('release_news_users',array('uniacid'=>$uniacid,'mobile'=>$_GPC['mobile']));
            if(!empty($checkuser)){
                message("手机号已被注册");
            }

            $set=pdo_get('release_news_set',array('uniacid'=>$uniacid));
            $data=array(
                'uniacid'=>$uniacid,
                'openid'=>$_W['openid'],
                'name'=>$_GPC['name'],
                'avatar'=>str_replace('/132132','/132',$_W['fans']['avatar']),
                'mobile'=>$_GPC['mobile'],
                'address2'=>$_GPC['address'],
                'type'=>$_GPC['type'],
                'createtime'=>$time,
                'stoptime'=>$time+($set['freedays']?$set['freedays']*24*60*60:90*24*60*60),
                'updatetime'=>$time
            );
            pdo_insert('release_news_users',$data);
            message("注册成功。",$this->createMobileUrl('home'));
        }

        $area=$this->getarea();

        include $this->template('reg');
    }

    public function doMobileNews(){
        $this->release_check();
        global $_W,$_GPC;
        $uniacid=$_W['uniacid'];
        $time=time();
        $pindex = max(1, intval($_GPC['page']));
        $psize = 15;
        $params=array(':uniacid'=>$uniacid);
        $codition='';
        $address=$this->user['address']?$this->user['address']:'全国';
        $followarr=explode(',',$this->user['follow']);

        if(!empty($address)&&$address!='全国'){

            $area=pdo_get('release_news_area',array('uniacid'=>$uniacid,'name'=>$address,'level'=>1));
            if(!empty($area)){
                $codition.=" and (a.address='{$address}' ";
                $citys=pdo_getall('release_news_area',array('aid'=>$area['id']));
                foreach($citys as $v){
                    $codition.=" or a.address='{$v['name']}' ";
                }
                $codition.=" ) ";
            }else{
                $codition.=" and a.address='{$address}' ";
            }
        }
        $list=pdo_fetchall("select a.*,b.name,b.avatar from ".tablename('release_news_news')." a left join ".tablename('release_news_users')." b on a.uid=b.id where a.uniacid=:uniacid {$codition} ORDER BY createtime DESC LIMIT " . ($pindex - 1) * $psize . ',' . $psize,$params);
        $total=pdo_fetchcolumn("select COUNT(*) from ".tablename('release_news_news')." a left join ".tablename('release_news_users')." b on a.uid=b.id where a.uniacid=:uniacid {$codition} ",$params);

        foreach($list as &$v){
            $gap=$time-$v['createtime'];
            $day_10=10*24*60*60;
            $day_1=24*60*60;
            $hour_1=60*60;
            $minute_1=60;
            if($gap>$day_10){
                $v['timestr']=date('m月d日',$v['createtime']);
            }elseif($gap>$day_1){
                $v['timestr']=intval($gap/$day_1)."天前";
            }elseif($gap>$hour_1){
                $v['timestr']=intval($gap/$hour_1)."小时前";
            }elseif($gap>$minute_1){
                $v['timestr']=intval($gap/$minute_1)."分钟前";
            }else{
                $v['timestr']=intval($gap)."秒前";
            }

        }
        unset($v);

        $area=$this->getarea();

        include $this->template('news');
    }

    public function doMobileAddnews(){
        $this->release_check();
        global $_W,$_GPC;
        $uniacid=$_W['uniacid'];
        $time=time();

        if($_W['ispost']){

            if(empty($_GPC['address'])){
                message('请选择区域');
            }
            if(empty($_GPC['content'])){
                message('请输入内容');
            }

            $_GPC['content']=str_replace("\n","<br>",$_GPC['content']);
            $data=array(
                'uniacid'=>$uniacid,
                'uid'=>$this->user['id'],
                'address'=>$_GPC['address'],
                'type'=>$_GPC['type'],
                'content'=>$_GPC['content'],
                'createtime'=>$time
            );
            pdo_insert('release_news_news',$data);
            message("新增成功",$this->createMobileUrl('news'));
        }

        $area=$this->getarea();

        include $this->template('addnews');
    }

    //聊天室
    public function doMobileChat(){
        $this->release_check();
        global $_W,$_GPC;
        $uniacid=$_W['uniacid'];
        $touid=$_GPC['touid'];
        $touser=pdo_get('release_news_users',array('id'=>$touid));
        $fromuid=$this->user['id'];

        if($touid==$fromuid){
            message('不能和自己对话');
        }

        if($_W['ispost']){
			$time=time();
			$lastlog=pdo_fetch("select * from ".tablename('release_news_chatlog')." where touid=:touid and fromuid=:fromuid order by createtime desc ",array(':touid'=>$touid,':fromuid'=>$fromuid));
            $data=array(
                'uniacid'=>$uniacid,
                'touid'=>$touid,
                'fromuid'=>$fromuid,
                'content'=>$_GPC['content'],
                'createtime'=>time()
            );
            pdo_insert('release_news_chatlog',$data);
			
			if(empty($lastlog)||($time-$lastlog['createtime'])>1*60*60){
			$account = $this->getAccount();
			$content = '"'.$this->user['name'].'"发来新消息：\n'.$_GPC['content'].'\n';
		
			$content .= '<a href=\''.$this->createMobileUrl('chat',array('touid'=>$fromuid)).'\'>点击查看详情</a>';
		
			$account->sendCustomNotice(array( 'touser' => $touser['openid'], 'msgtype' => 'text', 'text' => array('content' => urlencode($content)) ));
			}

            echo json_encode(1);die;
        }

        $log=pdo_fetchall("select * from ".tablename('release_news_chatlog')." where uniacid={$uniacid} and (touid={$touid} or touid={$fromuid}) and (fromuid={$touid} or fromuid={$fromuid}) order by createtime asc limit 0,50 ");

        include $this->template('chat');
    }

    public function doMobileCompany(){
        $this->release_check();
        global $_W,$_GPC;
        $uniacid=$_W['uniacid'];
        $time=time();
        $pindex = max(1, intval($_GPC['page']));
        $psize = 15;
        $params=array(':uniacid'=>$uniacid);
        $codition='';
        $address=$_GPC['address'];

        if(!empty($address)&&$address!='全国'){

            $area=pdo_get('release_news_area',array('uniacid'=>$uniacid,'name'=>$address,'level'=>1));
            if(!empty($area)){
                $codition.=" and (a.address='{$address}' ";
                $citys=pdo_getall('release_news_area',array('aid'=>$area['id']));
                foreach($citys as $v){
                    $codition.=" or a.address='{$v['name']}' ";
                }
                $codition.=" ) ";
            }else{
                $codition.=" and a.address='{$address}' ";
            }
        }

        $list=pdo_fetchall("select a.*,b.mobile from ".tablename('release_news_company')." a left join ".tablename('release_news_users')." b on a.uid=b.id where a.uniacid=:uniacid {$codition} ORDER BY createtime DESC LIMIT " . ($pindex - 1) * $psize . ',' . $psize,$params);
        $total=pdo_fetchcolumn("select COUNT(*) from ".tablename('release_news_company')." a left join ".tablename('release_news_users')." b on a.uid=b.id where a.uniacid=:uniacid {$codition} ",$params);

        foreach($list as &$v){
            $gap=$time-$v['createtime'];
            $day_10=10*24*60*60;
            $day_1=24*60*60;
            $hour_1=60*60;
            $minute_1=60;
            if($gap>$day_10){
                $v['timestr']=date('m月d日',$v['createtime']);
            }elseif($gap>$day_1){
                $v['timestr']=intval($gap/$day_1)."天前";
            }elseif($gap>$hour_1){
                $v['timestr']=intval($gap/$hour_1)."小时前";
            }elseif($gap>$minute_1){
                $v['timestr']=intval($gap/$minute_1)."分钟前";
            }else{
                $v['timestr']=intval($gap)."秒前";
            }

        }
        unset($v);

        $area=$this->getarea();

        include $this->template('company');
    }

    public function doMobileAddcompany(){
        $this->release_check();
        global $_W,$_GPC;
        $uniacid=$_W['uniacid'];
        $time=time();

        if($_W['ispost']){

            if(empty($_GPC['name'])||empty($_GPC['address_ex'])||empty($_GPC['contactname'])||empty($_GPC['contactmobile'])||empty($_GPC['tel'])){
                message('信息不完整');
            }

            $preg_phone='/^1[34578]\d{9}$/ims';
            if(!preg_match($preg_phone,$_GPC['contactmobile'])){
                message("手机号不正确");
            }

			$preg_tel="/^([0-9]{3,4}-)?[0-9]{7,8}$/";
			if(!preg_match($preg_tel,$_GPC['tel'])&&!preg_match($preg_phone,$_GPC['tel'])){
				message("电话号码不正确");
			}

            if(empty($_GPC['address'])){
                message('请选择区域');
            }
            if(empty($_GPC['content'])){
                message('请输入内容');
            }

            $_GPC['content']=str_replace("\n","<br>",$_GPC['content']);


            if(!empty($_FILES["thumb"]["tmp_name"])){
                $sjtext1=rand(10,99);
                move_uploaded_file($_FILES["thumb"]["tmp_name"],dirname(__FILE__)."/data/tb" . $sjtext1.$time .'.jpg');
                $thumb=$_W['siteroot'].'addons/release_news/data/tb'. $sjtext1.$time .'.jpg';
            }else{
                $thumb='';
            }


            $data=array(
                'uniacid'=>$uniacid,
                'uid'=>$this->user['id'],
                'name'=>$_GPC['name'],
                'address'=>$_GPC['address'],
                'address_ex'=>$_GPC['address_ex'],
                'contactname'=>$_GPC['contactname'],
                'contactmobile'=>$_GPC['contactmobile'],
                'tel'=>$_GPC['tel'],
                'businessarea'=>$_GPC['businessarea'],
                'content'=>$_GPC['content'],
                'thumb'=>$thumb,
                'createtime'=>$time
            );
            pdo_insert('release_news_company',$data);
            message("新增成功",$this->createMobileUrl('company'));
        }

        $area=$this->getarea();

        include $this->template('addcompany');
    }

    public function doMobileHome(){
        $this->release_check();
        global $_W,$_GPC;
        $uniacid=$_W['uniacid'];

        include $this->template('home');
    }

    public function doMobileMynews(){
        $this->release_check();
        global $_W,$_GPC;
        $uniacid=$_W['uniacid'];
        $time=time();
        $pindex = max(1, intval($_GPC['page']));
        $psize = 15;
        $params=array(':uniacid'=>$uniacid);
        $codition='';

        $codition.=" and a.uid = ({$this->user['id']}) ";

        $list=pdo_fetchall("select a.*,b.name,b.avatar from ".tablename('release_news_news')." a left join ".tablename('release_news_users')." b on a.uid=b.id where a.uniacid=:uniacid {$codition} ORDER BY createtime DESC LIMIT " . ($pindex - 1) * $psize . ',' . $psize,$params);

        foreach($list as &$v){
            $gap=$time-$v['createtime'];
            $day_10=10*24*60*60;
            $day_1=24*60*60;
            $hour_1=60*60;
            $minute_1=60;
            if($gap>$day_10){
                $v['timestr']=date('m月d日',$v['createtime']);
            }elseif($gap>$day_1){
                $v['timestr']=intval($gap/$day_1)."天前";
            }elseif($gap>$hour_1){
                $v['timestr']=intval($gap/$hour_1)."小时前";
            }elseif($gap>$minute_1){
                $v['timestr']=intval($gap/$minute_1)."分钟前";
            }else{
                $v['timestr']=intval($gap)."秒前";
            }

        }
        unset($v);

        include $this->template('mynews');
    }

    public function doMobileMyfollow(){
        $this->release_check();
        global $_W,$_GPC;
        $uniacid=$_W['uniacid'];
        $time=time();
        $pindex = max(1, intval($_GPC['page']));
        $psize = 15;
        $params=array(':uniacid'=>$uniacid);
        $codition='';

        if(!empty($this->user['follow'])){
            $followids=substr($this->user['follow'],0,-1);
            $codition.=" and a.id in ({$followids}) ";
        }else{
            $list='';
            include $this->template('myfollow');die;
        }

        $list=pdo_fetchall("select a.*,b.name,b.avatar from ".tablename('release_news_news')." a left join ".tablename('release_news_users')." b on a.uid=b.id where a.uniacid=:uniacid {$codition} ORDER BY createtime DESC LIMIT " . ($pindex - 1) * $psize . ',' . $psize,$params);

        foreach($list as &$v){
            $gap=$time-$v['createtime'];
            $day_10=10*24*60*60;
            $day_1=24*60*60;
            $hour_1=60*60;
            $minute_1=60;
            if($gap>$day_10){
                $v['timestr']=date('m月d日',$v['createtime']);
            }elseif($gap>$day_1){
                $v['timestr']=intval($gap/$day_1)."天前";
            }elseif($gap>$hour_1){
                $v['timestr']=intval($gap/$hour_1)."小时前";
            }elseif($gap>$minute_1){
                $v['timestr']=intval($gap/$minute_1)."分钟前";
            }else{
                $v['timestr']=intval($gap)."秒前";
            }

        }
        unset($v);

        include $this->template('myfollow');
    }

	public function doMobileMylinkman(){
		$this->release_check();
		global $_W,$_GPC;
		$uniacid=$_W['uniacid'];
		$time=time();
//		$pindex = max(1, intval($_GPC['page']));
//		$psize = 15;
		$params=array(':uniacid'=>$uniacid,':userid'=>$this->user['id']);

		$list_puppet=pdo_fetchall("select a.*,b.name,b.avatar,b.address2 from ".tablename('release_news_chatlog')." a left join ".tablename('release_news_users')." b on a.fromuid=b.id where a.uniacid=:uniacid and a.touid=:userid ORDER BY createtime DESC",$params);

		$list=array();
		$ids=array();

		foreach($list_puppet as &$v){
			$gap=$time-$v['createtime'];
			$day_10=10*24*60*60;
			$day_1=24*60*60;
			$hour_1=60*60;
			$minute_1=60;
			if($gap>$day_10){
				$v['timestr']=date('m月d日',$v['createtime']);
			}elseif($gap>$day_1){
				$v['timestr']=intval($gap/$day_1)."天前";
			}elseif($gap>$hour_1){
				$v['timestr']=intval($gap/$hour_1)."小时前";
			}elseif($gap>$minute_1){
				$v['timestr']=intval($gap/$minute_1)."分钟前";
			}else{
				$v['timestr']=intval($gap)."秒前";
			}

			if(in_array($v['fromuid'],$ids)){
				$ids[]=$v['fromuid'];
			}else{
				$list[]=$v;
			}

		}
		unset($v);

		include $this->template('mylinkman');
	}

    public function doMobileMyinfo(){
        $this->release_check();
        global $_W,$_GPC;
        $uniacid=$_W['uniacid'];
        if($_W['ispost']){
            if(empty($_GPC['name'])){
                message("未填写名称");
            }

            $preg_phone='/^1[34578]\d{9}$/ims';
            if(!preg_match($preg_phone,$_GPC['mobile'])){
                message("手机号不正确");
            }
            $time=time();

            $data=array(
                'uniacid'=>$uniacid,
                'name'=>$_GPC['name'],
                'mobile'=>$_GPC['mobile'],
                'address2'=>$_GPC['address'],
                'type'=>$_GPC['type'],
                'updatetime'=>$time
            );
            pdo_update('release_news_users',$data,array('id'=>$this->user['id']));
            message("修改成功",$this->createMobileUrl('home'));
        }
        $area=$this->getarea();

        include $this->template('myinfo');
    }

    public function doMobileMyserve(){
        global $_W,$_GPC;
        $this->user=pdo_get('release_news_users',array('openid'=>$_W['openid']));
        if(empty($this->user)){
            message("未注册账号",$this->createMobileUrl('reg'));
        }
        $uniacid=$_W['uniacid'];
        $set=pdo_get('release_news_set',array('uniacid'=>$uniacid));

        if($this->user['stoptime']<time()){
            $status=0;
        }else{
            $status=1;
        }

        include $this->template('myserve');
    }

    public function doMobileMyidea(){
        $this->release_check();
        global $_W,$_GPC;
        $uniacid=$_W['uniacid'];
        if($_W['ispost']){
            if(empty($_GPC['content'])){
                message("内容不得为空");
            }
            $_GPC['content']=str_replace("\n","<br>",$_GPC['content']);
            $data=array(
                'uniacid'=>$uniacid,
                'uid'=>$this->user['id'],
                'content'=>$_GPC['content'],
                'createtime'=>time()
            );
            pdo_insert('release_news_idea',$data);
            message("提交成功",$this->createMobileUrl('home'));
        }

        include $this->template('myidea');
    }

    public function getarea(){
        global $_W,$_GPC;

        $data=pdo_getall('release_news_area',array('uniacid'=>$_W['uniacid'],'level'=>1,'status'=>1));
        foreach($data as &$v){
            $city=pdo_getall('release_news_area',array('uniacid'=>$_W['uniacid'],'level'=>2,'aid'=>$v['id'],'status'=>1));
            if(empty($city)){
                $v['city']=array('');
            }else{
                $v['city']=$city;
            }
        }
        unset($v);

        return $data;
    }

    public function doMobileGetlistajax(){
        $this->release_check();
        global $_W,$_GPC;
        $uniacid=$_W['uniacid'];
        $time=time();
        $pindex = max(1, intval($_GPC['page']));
        $psize = 15;
        $params=array(':uniacid'=>$uniacid);
        $codition='';
        $address=$this->user['address']?$this->user['address']:'全国';
        $followarr=explode(',',$this->user['follow']);

        if($address!=$_GPC['address']){
            pdo_update('release_news_users',array('address'=>$_GPC['address']),array('id'=>$this->user['id']));
            $address=$_GPC['address'];
        }

        if(!empty($address)&&$address!='全国'){

            $area=pdo_get('release_news_area',array('uniacid'=>$uniacid,'name'=>$_GPC['address'],'level'=>1));
            if(!empty($area)){
                $codition.=" and (a.address='{$address}' ";
                $citys=pdo_getall('release_news_area',array('aid'=>$area['id']));
                foreach($citys as $v){
                    $codition.=" or a.address='{$v['name']}' ";
                }
                $codition.=" ) ";
            }else{
                $codition.=" and a.address='{$address}' ";
            }
        }

        if(!empty($_GPC['type'])){
            $codition.=" and a.type='{$_GPC['type']}' ";
        }

        if(!empty($_GPC['keyword'])){
            $codition.=" and (a.content like '%{$_GPC['keyword']}%' or b.name like '%{$_GPC['keyword']}%' or b.mobile like '%{$_GPC['keyword']}%') ";
        }

        $list=pdo_fetchall("select a.*,b.name,b.avatar from ".tablename('release_news_news')." a left join ".tablename('release_news_users')." b on a.uid=b.id where a.uniacid=:uniacid {$codition} ORDER BY createtime DESC LIMIT " . ($pindex - 1) * $psize . ',' . $psize,$params);
        $total=pdo_fetchcolumn("select COUNT(*) from ".tablename('release_news_news')." a left join ".tablename('release_news_users')." b on a.uid=b.id where a.uniacid=:uniacid {$codition} ",$params);

        $html='';

        foreach($list as &$v){
            $gap=$time-$v['createtime'];
            $day_10=10*24*60*60;
            $day_1=24*60*60;
            $hour_1=60*60;
            $minute_1=60;
            $timestr='';
            if($gap>$day_10){
                $timestr=date('m月d日',$v['createtime']);
            }elseif($gap>$day_1){
                $timestr=intval($gap/$day_1)."天前";
            }elseif($gap>$hour_1){
                $timestr=intval($gap/$hour_1)."小时前";
            }elseif($gap>$minute_1){
                $timestr=intval($gap/$minute_1)."分钟前";
            }else{
                $timestr=intval($gap)."秒前";
            }
            $html.='<a id="info_'.$v['id'].'" '.(in_array($v['id'],$followarr)?"class='follow'":"").'>
            <dl>
                <dt onclick="showUser('.$v['uid'].')"><i style="background-image:url('.$v['avatar'].')"></i></dt>
                <dd onclick="showInfo('.$v['id'].')">
                    <div class="title">
                        <span class="name">'.$v['name'].'</span><span style="margin-left: 5px;margin-right: 5px;" >'.$timestr.'</span><span>'.$v['address'].'</span>
                        <span class="xtype" style="color:'.($v['type']==1?'red':($v['type']==2?'green':'blue')).';">'.($v['type']==1?'供':($v['type']==2?'采':'运')).'</span>
                    </div>
                    <div class="content">
                        <div class="inner">
                            '.$v['content'].'
                        </div>
                    </div>
                </dd>
            </dl>
        </a>';
        }
        unset($v);

        echo json_encode(array('total'=>$total,'data'=>$html));
    }

    public function doMobileGetnewsinfoajax(){
        $this->release_check();
        global $_W,$_GPC;
        $uniacid=$_W['uniacid'];
        $info=pdo_get('release_news_news',array('id'=>$_GPC['id']));
        $user=pdo_get('release_news_users',array('id'=>$info['uid']));
        $telarr=$this->findThePhoneNumbers($info['content']);
        $followarr=explode(',',$this->user['follow']);
        $area=pdo_get('release_news_area',array('name'=>$info['address'],'uniacid'=>$uniacid));
        if($area['level']==2){
            $provence=pdo_get('release_news_area',array('id'=>$area['aid']));
            $address=$provence['name'].' '.$area['name'];
        }else{
            $address=$area['name'];
        }
        $mobilearr=array();
        foreach($telarr['mobile'] as $v){
            if(!in_array($v['number'],$mobilearr)){
                $mobilearr[]=$v['number'];
                $info['content']=str_replace($v['number'],'<a href="tel:'.$v['number'].'" >'.$v['number'].'</a>',$info['content']);
            }
        }
        $html='<div class="xinfo">
                                <div>
                                    用户： <a href="'.$this->createMobileUrl('chat',array('touid'=>$user['id'])).'">'.$user['name'].'</a>
                                </div>
                                <div>
                                    区域： '.$address.'
                                </div>
                                <div>
                                    手机： <a href="tel:'.$user['mobile'].'">'.$user['mobile'].'</a>
                                </div>
                                <div>
                                    联系我时说是在钢铁人联盟看到的！
                                </div>
                                <div>
                                    时间： '.date('Y-m-d H:i:s',$info['createtime']).'
                                </div>
                                <div class="content">
                                    '.$info['content'].'
                                </div>
                                <div class="winbtns">
                                    <a class="submit" onclick="changefollow('.$info['id'].',this)">'.(in_array($info['id'],$followarr)?"取消收藏":"收藏").'</a>
                                </div>
                            </div>';

        echo json_encode($html);
    }

    public function doMobileGetnewsuserajax(){
        $this->release_check();
        global $_W,$_GPC;
        $uniacid=$_W['uniacid'];
        $user=pdo_get('release_news_users',array('id'=>$_GPC['id']));
        $area=pdo_get('release_news_area',array('name'=>$user['address2'],'uniacid'=>$uniacid));
        if($area['level']==2){
            $provence=pdo_get('release_news_area',array('id'=>$area['aid']));
            $address=$provence['name'].' '.$area['name'];
        }else{
            $address=$area['name'];
        }

        $usertype='';
        if($user['type']==1){
            $usertype='供应';
        }elseif($user['type']==2){
            $usertype='采购';
        }elseif($user['type']==3){
            $usertype='运输';
        }

        $html='<div class="xinfo">
                                <img class="face" src="'.$user['avatar'].'">
                                <div>
                                    用户： '.$user['name'].'
                                </div>
                                <div>
                                    类型： '.$usertype.'
                                </div>
                                <div>
                                    港口： '.($address?$address:"全国").'
                                </div>
                                <div>
                                    手机： <a href="tel:'.$user['mobile'].'">'.$user['mobile'].'</a>
                                </div>
                                <div>
                                    注册： '.date('Y-m-d h:i:s',$user['createtime']).'
                                </div>
                                <div>
                                    更新： '.date('Y-m-d h:i:s',$user['updatetime']).'
                                </div>
                                <div>
                                    <a class="submit margin" href="'.$this->createMobileUrl('chat',array('touid'=>$user['id'])).'">发消息</a>
                                </div>
                            </div>';

        echo json_encode($html);
    }

    public function doMobileGetcompanylistajax(){
        $this->release_check();
        global $_W,$_GPC;
        $uniacid=$_W['uniacid'];
        $time=time();
        $pindex = max(1, intval($_GPC['page']));
        $psize = 15;
        $params=array(':uniacid'=>$uniacid);
        $codition='';
        $address=$_GPC['address'];

        if(!empty($address)&&$address!='全国'){

            $area=pdo_get('release_news_area',array('uniacid'=>$uniacid,'name'=>$address,'level'=>1));
            if(!empty($area)){
                $codition.=" and (a.address='{$address}' ";
                $citys=pdo_getall('release_news_area',array('aid'=>$area['id']));
                foreach($citys as $v){
                    $codition.=" or a.address='{$v['name']}' ";
                }
                $codition.=" ) ";
            }else{
                $codition.=" and a.address='{$address}' ";
            }
        }
        if(!empty($_GPC['keyword'])){
            $codition.=" and (a.content like '%{$_GPC['keyword']}%' or a.contactname like '%{$_GPC['keyword']}%' or a.contactmobile like '%{$_GPC['keyword']}%' or a.tel like '%{$_GPC['keyword']}%' or b.name like '%{$_GPC['keyword']}%' or b.mobile like '%{$_GPC['keyword']}%') ";
        }
        $list=pdo_fetchall("select a.* from ".tablename('release_news_company')." a left join ".tablename('release_news_users')." b on a.uid=b.id where a.uniacid=:uniacid {$codition} ORDER BY createtime DESC LIMIT " . ($pindex - 1) * $psize . ',' . $psize,$params);
        $total=pdo_fetchcolumn("select COUNT(*) from ".tablename('release_news_company')." a left join ".tablename('release_news_users')." b on a.uid=b.id where a.uniacid=:uniacid {$codition} ",$params);

        $html='';
        foreach($list as &$v){
            $gap=$time-$v['createtime'];
            $day_10=10*24*60*60;
            $day_1=24*60*60;
            $hour_1=60*60;
            $minute_1=60;
            $timestr='';
            if($gap>$day_10){
                $timestr=date('m月d日',$v['createtime']);
            }elseif($gap>$day_1){
                $timestr=intval($gap/$day_1)."天前";
            }elseif($gap>$hour_1){
                $timestr=intval($gap/$hour_1)."小时前";
            }elseif($gap>$minute_1){
                $timestr=intval($gap/$minute_1)."分钟前";
            }else{
                $timestr=intval($gap)."秒前";
            }
            $html.='<dl id="data_'.$v['id'].'" onclick="showData('.$v['id'].')">
        <dt><i style="background-image:url('.($v['thumb']?$v['thumb']:$_W['siteroot'].'addons/release_news/static/img/nopic.jpg').')"></i></dt>
        <dd>
            <div class="title">
                <span class="name">'.$v['name'].'</span><span style="margin-left: 5px;margin-right: 5px;" >'.$timestr.'</span>
            </div>
            <div class="content" style="font-size:12px;color:#666;">
                <span>'.$v['content'].'</span><br>
                <span style="font-size:12px;color:#999;">'.$v['contactname'].'：</span><span style="color:#07f;">'.$v['contactmobile'].'</span>
            </div>
        </dd>
    </dl>';
        }
        unset($v);

        echo json_encode(array('total'=>$total,'data'=>$html));
    }

    public function doMobileGetcompanyinfoajax(){
        $this->release_check();
        global $_W,$_GPC;
        $uniacid=$_W['uniacid'];
        $info=pdo_get('release_news_company',array('id'=>$_GPC['id']));

        $html='<div class="xinfo">
                                <div>
                                    业务： '.$info['contactname'].'
                                </div>
                                <div>
                                    电话： <a href="tel:'.$info['contactmobile'].'">'.$info['contactmobile'].'</a><a href="tel:'.$info['tel'].'" style="margin-left: 5px;margin-right: 5px;" >'.$info['tel'].'</a>
                                </div>
                                <div>
                                    联系我时说是在钢铁人联盟看到的！
                                </div>
                                <div>
                                    地址： '.$info['address_ex'].'
                                </div>
                                <div>
                                    更新： '.date('Y-m-d h:i:s',$info['createtime']).'
                                </div>
                                <div class="content">
                                    '.$info['content'].'
                                </div>
                                <div style="display:none;" >
                                    业务港口： <span style="color:#f60;">'.$info['businessarea'].'</span>
                                </div>
                                <div>
                                    <img src="'.$info['thumb'].'" style="width:100%;">
                                </div>
                            </div>';

        echo json_encode(array('title'=>$info['name'],'data'=>$html));
    }

    public function doMobileFollowajax(){
        $this->release_check();
        global $_W,$_GPC;
        $uniacid=$_W['uniacid'];
        $info=pdo_get('release_news_news',array('id'=>$_GPC['id']));
        $followarr=explode(',',$this->user['follow']);
        $follow='';
        $flag=in_array($info['id'],$followarr)?true:false;

        foreach($followarr as $v){
            if(!empty($v)){
                if($flag){
                    if($v!=$info['id']){
                        $follow.=$v.',';
                    }
                }else{
                    $follow.=$v.',';
                }
            }
        }

        if(!$flag){
            $follow.=$info['id'].',';
        }

        pdo_update('release_news_users',array('follow'=>$follow),array('id'=>$this->user['id']));

        if($flag){
            echo 2;
        }else{
            echo 1;
        }

    }

    public function doMobileGetmynewslistajax(){
        $this->release_check();
        global $_W,$_GPC;
        $uniacid=$_W['uniacid'];
        $time=time();
        $pindex = max(1, intval($_GPC['page']));
        $psize = 15;
        $params=array(':uniacid'=>$uniacid);
        $codition='';

        $codition.=" and a.uid = ({$this->user['id']}) ";

        $list=pdo_fetchall("select a.*,b.name,b.avatar from ".tablename('release_news_news')." a left join ".tablename('release_news_users')." b on a.uid=b.id where a.uniacid=:uniacid {$codition} ORDER BY createtime DESC LIMIT " . ($pindex - 1) * $psize . ',' . $psize,$params);
        $html='';

        foreach($list as &$v){
            $gap=$time-$v['createtime'];
            $day_10=10*24*60*60;
            $day_1=24*60*60;
            $hour_1=60*60;
            $minute_1=60;
            $timestr='';
            if($gap>$day_10){
                $timestr=date('m月d日',$v['createtime']);
            }elseif($gap>$day_1){
                $timestr=intval($gap/$day_1)."天前";
            }elseif($gap>$hour_1){
                $timestr=intval($gap/$hour_1)."小时前";
            }elseif($gap>$minute_1){
                $timestr=intval($gap/$minute_1)."分钟前";
            }else{
                $timestr=intval($gap)."秒前";
            }
            $html.='<a id="info_'.$v['id'].'" onclick="showInfo('.$v['id'].')" >
        <dl>
            <dt><i style="background-image:url('.$v['avatar'].')"></i></dt>
            <dd>
                <div class="title">
                    <span class="name">'.$v['name'].'</span><span></span><span style="margin-left: 5px;margin-right: 5px;" >'.$timestr.'</span><span>'.$v['address'].'</span>
                    <span class="xtype" style="color:'.($v['type']==1?'red':($v['type']==2?'green':'blue')).';">'.($v['type']==1?'供':($v['type']==2?'采':'运')).'</span>
                </div>
                <div class="content">
                    '.$v['content'].'
                </div>
            </dd><dd class="r" style="display:none;"><b>电话</b><i>xxx</i></dd>
        </dl>
    </a>';
        }
        unset($v);

        echo json_encode(array('data'=>$html));
    }

    public function doMobileGetmynewsinfoajax(){
        $this->release_check();
        global $_W,$_GPC;
        $uniacid=$_W['uniacid'];

        $info=pdo_get('release_news_news',array('id'=>$_GPC['id']));
        $telarr=$this->findThePhoneNumbers($info['content']);

        $area=pdo_get('release_news_area',array('name'=>$info['address'],'uniacid'=>$uniacid));
        if($area['level']==2){
            $provence=pdo_get('release_news_area',array('id'=>$area['aid']));
            $address=$provence['name'].' '.$area['name'];
        }else{
            $address=$area['name'];
        }
        $mobilearr=array();
        foreach($telarr['mobile'] as $v){
            if(!in_array($v['number'],$mobilearr)){
                $mobilearr[]=$v['number'];
                $info['content']=str_replace($v['number'],'<a href="tel:'.$v['number'].'" >'.$v['number'].'</a>',$info['content']);
            }
        }

        $html='<div class="xinfo">
                                <div>
                                    区域： '.$address.'
                                </div>
                                <div>
                                     时间： '.date('Y-m-d H:i:s',$info['createtime']).'
                                </div>
                                <div class="content">
                                    '.$info['content'].'
                                </div>
                                <div class="winbtns">
                                    <a class="submit" style="background:red;" onclick="delInfo('.$info['id'].')">删除</a>
                                </div>
                            </div>';

        echo json_encode($html);
    }

    public function doMobileDelmynewsajax(){
        $this->release_check();
        global $_W,$_GPC;
        pdo_delete('release_news_news',array('id'=>$_GPC['id']));

        echo 1;
    }

    public function doMobileGetmyfollowlistajax(){
        $this->release_check();
        global $_W,$_GPC;
        $uniacid=$_W['uniacid'];
        $time=time();
        $pindex = max(1, intval($_GPC['page']));
        $psize = 15;
        $params=array(':uniacid'=>$uniacid);
        $codition='';

        if(!empty($this->user['follow'])){
            $followids=substr($this->user['follow'],0,-1);
            $codition.=" and a.id in ({$followids}) ";
        }else{
            echo '';die;
        }

        $list=pdo_fetchall("select a.*,b.name,b.avatar from ".tablename('release_news_news')." a left join ".tablename('release_news_users')." b on a.uid=b.id where a.uniacid=:uniacid {$codition} ORDER BY createtime DESC LIMIT " . ($pindex - 1) * $psize . ',' . $psize,$params);
        $html='';

        foreach($list as &$v){
            $gap=$time-$v['createtime'];
            $day_10=10*24*60*60;
            $day_1=24*60*60;
            $hour_1=60*60;
            $minute_1=60;
            $timestr='';
            if($gap>$day_10){
                $timestr=date('m月d日',$v['createtime']);
            }elseif($gap>$day_1){
                $timestr=intval($gap/$day_1)."天前";
            }elseif($gap>$hour_1){
                $timestr=intval($gap/$hour_1)."小时前";
            }elseif($gap>$minute_1){
                $timestr=intval($gap/$minute_1)."分钟前";
            }else{
                $timestr=intval($gap)."秒前";
            }
            $html.='<a id="info_'.$v['id'].'" >
            <dl>
                <dt onclick="showUser('.$v['uid'].')"><i style="background-image:url('.$v['avatar'].')"></i></dt>
                <dd onclick="showInfo('.$v['id'].')">
                    <div class="title">
                        <span class="name">'.$v['name'].'</span><span style="margin-left: 5px;margin-right: 5px;" >'.$timestr.'</span><span>'.$v['address'].'</span>
                        <span class="xtype" style="color:'.($v['type']==1?'red':($v['type']==2?'green':'blue')).';">'.($v['type']==1?'供':($v['type']==2?'采':'运')).'</span>
                    </div>
                    <div class="content">
                        <div class="inner">
                            '.$v['content'].'
                        </div>
                    </div>
                </dd>
            </dl>
        </a>';
        }
        unset($v);

        echo json_encode(array('data'=>$html));
    }

    public function doMobileWxpay(){
        global $_W,$_GPC;
        $uniacid=$_W['uniacid'];

        $set=pdo_get('release_news_set',array('uniacid'=>$uniacid));
        if($set['rechargeprice'] <= 0) {
            message('支付错误, 金额小于0');
        }
        // 一些业务代码。
        //构造支付请求中的参数
        $params = array(
            'tid' => 'XQ'.time(),      //充值模块中的订单号，此号码用于业务模块中区分订单，交易的识别码
            'ordersn' => 'XQ'.time(),  //收银台中显示的订单号
            'title' => '账号服务续期',          //收银台中显示的标题
            'fee' => $set['rechargeprice'],      //收银台中显示需要支付的金额,只能大于 0
            'user' => $_W['member']['uid'],     //付款用户, 付款的用户名(选填项)
        );

        include $this->template('pay');
    }

    public function payResult($params) {
        global $_W,$_GPC;
        $this->user=pdo_get('release_news_users',array('openid'=>$_W['openid']));
        if(empty($this->user)){
            message("未注册账号",$this->createMobileUrl('reg'));
        }
        $uniacid=$_W['uniacid'];

        if ($params['result'] == 'success' && $params['from'] == 'return') {
            $set=pdo_get('release_news_set',array('uniacid'=>$uniacid));
            $time=time();
            if($this->user['stoptime']<time()){
                pdo_update('release_news_users',array('stoptime'=>($time+$set['rechargedays']*24*60*60)),array('id'=>$this->user['id']));
            }else{
                pdo_update('release_news_users',array('stoptime'=>($this->user['stoptime']+$set['rechargedays']*24*60*60)),array('id'=>$this->user['id']));
            }
            message('续费成功',$this->createWebUrl('myserve'));
        }else{
            message('支付出错，续费失败',$this->createWebUrl('myserve'));
        }
    }

}