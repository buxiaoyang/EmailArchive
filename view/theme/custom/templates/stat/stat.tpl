
    <?php if($timespan == "daily"){ ?>
    <ul class="nav nav-tabs">
        <li class="active">
            <a href="index.php?route=stat/stat&amp;timespan=daily"
                <?php if(isset($uid)) { ?>&amp;uid=<?php print $uid; } ?>"><span style="font-size:14px;">
                <i class="icon-tasks"></i>
            </span><?php print $text_daily_report; ?>
            </a>
        </li>
        <li>
            <a href="index.php?route=stat/stat&amp;timespan=monthly"
                <?php if(isset($uid)) { ?>&amp;uid=<?php print $uid; } ?>"><span style="font-size:14px;">
                <i class="icon-calendar"></i>
            </span><?php print $text_monthly_report; ?>
            </a>
        </li>
    </ul>
    <?php } else { ?>
    <ul class="nav nav-tabs">
        <li>
            <a href="index.php?route=stat/stat&amp;timespan=daily"
                <?php if(isset($uid)) { ?>&amp;uid=<?php print $uid; } ?>"><span style="font-size:14px;">
                <i class="icon-tasks"></i>
            </span><?php print $text_daily_report; ?>
            </a>
        </li>
        <li class="active">
            <a href="index.php?route=stat/stat&amp;timespan=monthly"
                <?php if(isset($uid)) { ?>&amp;uid=<?php print $uid; } ?>"><span style="font-size:14px;"><i class="icon-calendar"></i>
                </span><?php print $text_monthly_report; ?>
            </a>
        </li>
    </ul>
    <?php } ?>

<div>
    <img src="index.php?route=stat/graph&amp;timespan=<?php print $timespan; ?>&amp;uid=<?php print $uid; ?>" border="1" /> 
</div>

