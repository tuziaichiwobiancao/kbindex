<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:82:"/www/wwwroot/admin.hyperindex.tk/public/../application/index/view/index/index.html";i:1695404260;}*/ ?>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title><?php echo htmlentities($site['name']); ?></title>
    <link rel="shortcut icon" href="/assets/img/favicon.ico"/>
    <link href="/assets/css/index.css" rel="stylesheet">
</head>

<body>

<div id="mainbody">
    <div class="container">
        <div class="text-center">
            <h1><?php echo htmlentities($site['name']); ?></h1>
            <a href="<?php echo url('index/user/index', '', false, true); ?>"><?php echo __('Member center'); ?></a>
        </div>
    </div>
</div>

<div class="footer">
    <div class="container">
        <p>Copyright @ <?php echo htmlentities($site['name']); ?> <?php echo date('Y',time()); ?> 版权所有 <a href="https://beian.miit.gov.cn" target="_blank"><?php echo htmlentities($site['beian']); ?></a></p>
    </div>
</div>

</body>

</html>
