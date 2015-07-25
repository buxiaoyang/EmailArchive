<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title><?php if($title_prefix) { print $title_prefix; ?> | <?php } ?><?php print $title; ?></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <?php if(SITE_KEYWORDS) { ?><meta name="keywords" content="<?php print SITE_KEYWORDS; ?>" /><?php } ?>
    <?php if(SITE_DESCRIPTION) { ?><meta name="description" content="<?php print SITE_DESCRIPTION; ?>" /><?php } ?>
    <?php if(PROVIDED_BY) { ?><meta name="author" content="<?php print PROVIDED_BY; ?>" /><?php } ?>

   <link href="/view/theme/custom/assets/css/bootstrap.css" rel="stylesheet">

	<link href="/view/theme/custom/assets/css/navbar-fixed-top.css" rel="stylesheet" />

    <?php if(BRANDING_FAVICON) { ?><link rel="shortcut icon" href="<?php print BRANDING_FAVICON; ?>" /><?php } ?>
  </head>


  <body>

  
<!-- Fixed navbar -->
<nav class="navbar navbar-blue navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <div style="padding-right: 5px; padding-top: 6px;" class="pull-left">
                <img style="height: 40px; width:100px;" src="/view/theme/custom/assets/images/archive-logo-sm.png">
            </div>
            <a class="navbar-brand" href="#"></a>
        </div>
    </div>
</nav>
<div id="piler1" class="container">
    <div id="main" style="width: 400px; min-height: 250px; margin-top: 40px;">
        <div class="page-header">
            <h4><?php print $title; ?></h4>
        </div>
        <div class="alert alert-success">
         <?php print $text_logged_out; ?>. 
             <a href="<?php if(ENABLE_SSO_LOGIN == 1) { ?>sso.php<?php } else { ?>login.php<?php } ?>" class="messagelink"><?php print $text_back; ?></a>
        </div>
         <p><?php if(TRACKING_CODE) { print TRACKING_CODE; } ?></p>     
         
        <div class="row-fluid wukong">
            <div class="span3">
                <img style="height:40px; width:100px;" src="<?php print SITE_URL; ?><?php print SITE_LOGO_LG; ?>" alt="Archive Logo Image"/>
            </div>
            <div class="span9">
                <p>上海纤讯信息科技有限公司</p>
                <p><small><a href="#" target="_blank">使用帮助</a><span class="muted">·</span><a href="#" target="_blank">技术支持</a><span class="muted">·</span><a href="#" target="_blank">联系我们</a></small></p>
            </div>
        </div>    
    </div> <!-- main -->
</div><!-- /container --></body>

</body>
</html>
