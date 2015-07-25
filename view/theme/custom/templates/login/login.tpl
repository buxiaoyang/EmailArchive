<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title><?php if($title_prefix) { print $title_prefix; ?> | <?php } ?>登陆</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <?php if(SITE_KEYWORDS) { ?><meta name="keywords" content="<?php print SITE_KEYWORDS; ?>" /><?php } ?>
    <?php if(SITE_DESCRIPTION) { ?><meta name="description" content="<?php print SITE_DESCRIPTION; ?>" /><?php } ?>
    <?php if(PROVIDED_BY) { ?><meta name="author" content="<?php print PROVIDED_BY; ?>" /><?php } ?>

    <link href="/view/theme/custom/assets/css/bootstrap.css" rel="stylesheet">

	<link href="/view/theme/custom/assets/css/signin.css" rel="stylesheet">

    <?php if(BRANDING_FAVICON) { ?><link rel="shortcut icon" href="<?php print BRANDING_FAVICON; ?>" /><?php } ?>
  </head>

  <body id="loginpage">
   
<?php if(!Registry::get('username')) { ?>

    <div class="container">
        <div class="logo-signin"><img src="<?php print SITE_URL; ?><?php print SITE_LOGO_LG; ?>" alt="Archive Logo Image" title="Login" /></div>

        <form name="login" action="login.php" method="post" class="form-signin">

            <h3 class="form-signin-heading">登陆</h3>

            <?php if(isset($x)){ ?><p class="alert alert-error lead">无效的邮件地址或密码</p><?php } ?>
            <input type="hidden" name="relocation" value="<?php if(isset($_GET['route']) && !preg_match("/^login/", $_GET['route']) ) { if(isset($_SERVER['REDIRECT_URL'])) { print $_SERVER['REDIRECT_URL']; } else { print $_SERVER['QUERY_STRING']; } } ?>" />

            <input type="text" class="form-control" name="username" placeholder="<?php print $text_email; ?>" required autofocus>
            <input type="password" class="form-control" name="password" placeholder="<?php print $text_password; ?>">

        <?php if(CAPTCHA_FAILED_LOGIN_COUNT > 0 && $failed_login_count > CAPTCHA_FAILED_LOGIN_COUNT) { ?>
            <img src="securimage/securimage_show.php" alt="captcha image" id="captcha" />
            <input type="text" class="input-block-level" name="captcha" placeholder="CAPTCHA" />
        <?php } ?>

            <button class="btn btn-lg btn-primary btn-block" type="submit" value="<?php print $text_submit; ?>">提交</button>

        </form>


        <div id="compatibility" class="compatibility-signin">

            <?php if(ENABLE_GOOGLE_LOGIN == 1) { ?>
               <p><a href="<?php print $auth_url; ?>"><?php print $text_login_via_google; ?></a></p>
            <?php } ?>

            <p><?php print COMPATIBILITY; ?></p>
        </div>


   </div>

<?php } ?>

<!-- <?php print PILER_LOGIN_HELPER_PLACEHOLDER; ?> -->

  <?php if(TRACKING_CODE) { print TRACKING_CODE; } ?>


  </body>
</html>
