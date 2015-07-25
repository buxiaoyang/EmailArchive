
<?php if(!isset($x)){ ?>


<table class="table" width="95%">
    <tbody>
        <tr>
            <th colspan="2">
                <?php print $text_access_settings; ?>
                <span class="description">
                    &nbsp;&nbsp;(<?php print $text_access_setting_explanation; ?>)
                </span>
            </th>
        </tr>
        <tr>
            <td class="tdleft" style="width:15%;">
                <?php print $text_email_addresses; ?>:
            </td>
            <td style="width:85%;">
                <?php print $emails; ?>
            </td>
        </tr>

        <?php if(Registry::get('auditor_user') == 1 && RESTRICTED_AUDITOR == 1) { ?>

        <tr>
            <td class="tdleft" style="width:15%;">
                <?php print $text_domains; ?>:
            </td>
            <td style="width:85%;">
                <?php print $domains; ?>
            </td>
        </tr>

        <?php } ?>

        <?php if(Registry::get('auditor_user') == 0 || RESTRICTED_AUDITOR == 0) { ?>

        <tr>
            <td class="tdleft" style="width:15%;">
                <?php print $text_groups; ?>:
            </td>
            <td style="width:85%;">
                <?php print $groups; ?>
            </td>
        </tr>

        <?php } ?>

        <?php if(ENABLE_FOLDER_RESTRICTIONS == 1) { ?>

        <tr>
            <td class="tdleft" style="width:15%;">
                <?php print $text_folders; ?>:
            </td>
            <td style="width:85%;">
                <?php print $folders; ?>
            </td>
        </tr>
        <?php } ?>
    </tbody>

</table>
    
<form action="/settings.php" method="post" name="setpagelen">

    <table class="table" width="95%">
        <tbody>
            <tr>
                <th colspan="2">
                    <?php print $text_display_settings; ?>
                </th>
            </tr>
            <tr>
                <td class="tdleft" style="width:15%;" for="pagelen">
                    <?php print $text_page_length; ?>:
                </td>
                <td style="width:85%;">
                    <select name="pagelen">
                        <?php foreach(Registry::get('paging') as $t) { ?>
                        <option value="<?php print $t; ?>"<?php if($page_len == $t) { ?> selected="selected"<?php } ?>><?php print $t; ?></option>
                        <?php } ?>
                    </select>
                </td>
            </tr>
            <tr>
                <td class="tdleft" style="width:15%;" for="theme">
                    <?php print $text_theme; ?>:
                </td>
                <td style="width:85%;">
                    <select name="theme">
                        <?php foreach(Registry::get('themes') as $t) { ?>
                        <option value="<?php print $t; ?>"<?php if($theme == $t) { ?> selected="selected"<?php } ?>><?php print $t; ?></option>
                        <?php } ?>
                    </select>
                </td>
            </tr>
            <tr>
                <td class="tdleft" style="width:15%;" for="language">
                    <?php print $text_language; ?>:
                </td>
                <td style="width:85%;">
                    <select name="lang">
                        <option value=""><?php print $text_use_browser_settings; ?></option>
                        <?php foreach(Registry::get('langs') as $t) { ?>
                        <option value="<?php print $t; ?>"<?php if($lang == $t) { ?> selected="selected"<?php } ?>><?php print $t; ?></option>
                        <?php } ?>
                    </select>
                </td>
            </tr>
        </tbody>
        <tfoot>
            <tr>
                <td style="text-align: left;" colspan="4">
                    <input type="submit" value="<?php print $text_set; ?>" class="btn btn-primary" />
                    &nbsp;
                    <input type="reset" value="<?php print $text_cancel; ?>" class="btn btn" onclick="Piler.go_to_default_page();" />
                </td>
            </tr>
        </tfoot>
    </table>
</form>

<p>&nbsp;</p>

<?php if(PASSWORD_CHANGE_ENABLED == 1) { ?>
<form name="pwdchange" action="index.php?route=common/home" method="post" autocomplete="off">
    <table class="table" width="95%">
        <tbody>
            <tr>
                <th colspan="2">
                    <?php print $text_change_password; ?>
                </th>
            </tr>
            <tr>
                <td class="tdleft" style="width:15%;" for="pagelen">
                    <?php print $text_password; ?>:
                </td>
                <td style="width:85%;">
                    <input type="password" name="password" class="user_input"/>
                </td>
            </tr>
            <tr>
                <td class="tdleft" style="width:15%;" for="pagelen">
                    <?php print $text_password_again; ?>:
                </td>
                <td style="width:85%;">
                    <input type="password" name="password2"  class="user_input"/>
                </td>
            </tr>
        </tbody>
        <tfoot>
            <tr>
                <td style="text-align: left;" colspan="4">
                    <input type="submit" value="<?php print $text_submit; ?>"  class="btn btn-primary" />
                        &nbsp;
                    <input type="reset" value="<?php print $text_cancel; ?>"  class="btn btn"/>
                </td>
            </tr>
        </tfoot>
    </table>
</form>
<?php } ?>

<?php } else { ?>
    <?php print $x; ?>. <a href="index.php?route=common/home"><?php print $text_back; ?></a>
<?php } ?>


