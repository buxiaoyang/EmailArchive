
	<div class="alert alert-info"><strong><?php print $text_refresh_period; ?>:</strong> <?php print HEALTH_REFRESH; ?> sec</div>

    <div>
        <table style="width:100%;">
            <tbody>
                <tr>
                    <td style="width:60%; vertical-align: top;">
                        <!--left part start-->

                        <!--状态-->
                        <table class="table" width="95%">
                            <tbody>
                                <tr>
                                    <th colspan="2">
                                        <span style="font-size:15px;">
                                            <i class="icon-dashboard pull-left"></i>
                                        </span>
                                        状态
                                    </th>
                                </tr>
                                <tr>
                                    <td class="tdleft" style="width:15%;">
                                        IP地址:
                                    </td>
                                    <td style="width:85%;">
                                        <?php print $sysinfo[0]; ?>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="tdleft" style="width:15%;">
                                       运行时间:
                                    </td>
                                    <td style="width:85%;">
                                        <?php print $uptime; ?>:
                                    </td>
                                </tr>
                                <tr>
                                    <td class="tdleft" style="width:15%;">
                                        <?php print $text_server_operating_system; ?>:
                                    </td>
                                    <td style="width:85%;">
                                        <?php print $sysinfo[1]; ?>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="tdleft" style="width:15%;">
                                        <?php print $text_cpu_usage; ?>:
                                    </td>
                                    <td style="width:85%;">
                                        <div style="width:70%;" class="progress <?php if($cpuinfo < HEALTH_RATIO) { ?>progress-success<?php } else { ?>progress-danger<?php } ?>">
                                            <div class="bar" style="width:<?php print $cpuinfo; ?>%"></div>
                                            &nbsp;<?php print $cpuinfo; ?>% <?php print $cpuload; ?>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="tdleft" style="width:15%;">
                                        <?php print $text_memory_usage; ?>:
                                    </td>
                                    <td style="width:85%;">
                                        <div style="width:70%;" class="progress <?php if($meminfo < HEALTH_RATIO) { ?>progress-success<?php } else { ?>progress-danger<?php } ?>">
                                            <div class="bar" style="width:<?php print $meminfo; ?>%"></div>
                                             &nbsp;<?php print $meminfo; ?>% / <?php print $totalmem; ?> MB
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="tdleft" style="width:15%;">
                                        <?php print $text_swap_usage; ?>:
                                    </td>
                                    <td style="width:85%;">
                                        <div style="width:70%;" class="progress <?php if($swapinfo < HEALTH_RATIO) { ?>progress-success<?php } else { ?>progress-danger<?php } ?>">
                                            <div class="bar" style="width:<?php print $swapinfo; ?>%"></div>
                                            &nbsp;<?php print $swapinfo; ?>% / <?php print $totalswap; ?> MB
                                        </div>
                                    </td>
                                </tr>

                                <?php if(ENABLE_SAAS == 1) { ?>
                                    <tr>
                                        <td class="tdleft" style="width:15%;">
                                            <?php print $text_online_users; ?>:
                                        </td>
                                        <td style="width:85%;">
                                            <a href="index.php?route=stat/online">
                                                <?php print $num_of_online_users; ?>
                                            </a>
                                        </td>
                                    </tr>
                                <?php } ?>  
                            </tbody>
                        </table>
                        <!--存储-->
                        <table class="table" width="95%">
                            <tbody>
                                <tr>
                                    <th colspan="2">
                                        <span style="font-size:15px;">
                                            <i class="icon-hdd pull-left"></i>
                                        </span>
                                        存储
                                    </th>
                                </tr>
                                <tr>
                                    <td class="tdleft" style="width:15%;">
                                        <?php print $text_archive_size; ?>:
                                    </td>
                                    <td style="width:85%;">
                                        <?php print $archive_size; ?>B (<?php print $archive_stored_size; ?>B)
                                    </td>
                                </tr>
                                <tr>
                                    <td class="tdleft" style="width:15%;">
                                        <?php print $text_disk_usage; ?>
                                    </td>
                                    <td style="width:85%;">
                                        <table>
                                            <?php foreach($shortdiskinfo as $partition) { ?>
                                                <tr class="<?php if($partition['utilization'] < HEALTH_RATIO) { ?>text-success<?php } else { ?>text-error<?php } ?>">
                                                    <td>
                                                        <?php print $partition['partition']; ?>
                                                    </td>
                                                    <td>
                                                        <?php print nice_size(1000*$partition['used']); ?> / <?php print nice_size(1000*$partition['total']); ?>
                                                    </td>
                                                    <td>
                                                        (<?php print $partition['utilization']; ?>%)
                                                    </td>
                                                </tr>
                                            <?php } ?>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="tdleft" style="width:15%;">
                                        <?php print $text_smtp_status; ?>:
                                    </td>
                                    <td style="width:85%;">
                                        <?php foreach($health as $h) {
								            if(preg_match("/^220/", $h[1])) {
								                $status = 'OK'; $class = 'text-success';
								            } else {
								                $status = 'ERROR'; $class = 'text-error';
								            }
					                    ?>
                                        <div class="<?php print $class; ?>">
                                            <span title="<?php print preg_replace("/\'/", "\'", $h[1]); ?> <?php print $h[2]; ?>"><?php print $h[3]; ?>: <?php print $status; ?></span>
                                        </div>
                                        <?php } ?>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="tdleft" style="width:15%;">
                                        <?php print $text_periodic_purge; ?>:
                                    </td>
                                    <td style="width:85%;">
                                        <span class="<?php if($options['enable_purge'] == 1) { ?>ok<?php } else { ?>error<?php } ?>">
                                            <?php if($options['enable_purge'] == 1) { print $text_enabled; ?>. 
                                                <a href="<?php print HEALTH_URL; ?>&toggle_enable_purge"><?php print $text_disable; ?></a>
                                                <?php if($purge_stat[0]) { print $text_last; ?>:<?php print $purge_stat[0]; ?>, <?php print $text_next; ?>:  <?php print $purge_stat[1]; } ?>
                                                <?php } else { print $text_disabled; ?>. <a href="<?php print HEALTH_URL; ?>&toggle_enable_purge"><?php print $text_enable; ?></a>
                                            <?php } ?>
                                        </span>
                                    </td>
                                </tr>
                                <?php if($indexer_stat[0]) { ?>
                                    <tr>
                                        <td class="tdleft" style="width:15%;">
                                            <?php print $text_indexer_job; ?>:
                                        </td>
                                        <td style="width:85%;">
                                            <?php print $text_last; ?>: <?php print $indexer_stat[0]; ?>, <?php print $text_next; ?>:  <?php print $indexer_stat[1]; ?>
                                        </td>
                                    </tr>
                                <?php } ?>
                                
                            </tbody>
                        </table>
                        <!--left part end-->
                    </td>
                    <td style="width:40%; vertical-align: top; padding-left:20px;">
                        <!--right part start-->
                        <!--累积计数-->
                        <table class="table" width="95%">
                            <tbody>
                                <tr>
                                    <th colspan="2">
                                        <span style="font-size:15px;">
                                            <i class="icon-foursquare pull-left"></i>
                                        </span>
                                        累积计数
                                    </th>
                                </tr>
                                <tr>
                                    <td class="tdleft" style="width:23%;">
                                        <?php print $text_oldest_record; ?>:
                                    </td>
                                    <td style="width:70%;">
                                        <?php print date(DATE_TEMPLATE, $oldestmessagets); ?>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="tdleft" style="width:23%;">
                                        <?php print $text_processed_emails; ?>:
                                    </td>
                                    <td style="width:70%;">
                                        <?php print $processed_emails[0]; ?> (<?php print $text_60_minutes; ?>)<br /><?php print $processed_emails[1]; ?> (<?php print $text_24_hours; ?>)<br /><?php print $processed_emails[2]; ?> (<?php print $text_1_week; ?>)<br /><?php print $processed_emails[3]; ?> (<?php print $text_30_days; ?>)
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <!--邮件处理-->
                        <table class="table" width="95%">
                            <tbody>
                                <tr>
                                    <th colspan="2">
                                        <span style="font-size:15px;">
                                            <i class="icon-folder-close-alt pull-left"></i>
                                        </span>
                                        邮件处理
                                    </th>
                                </tr>
                                <?php while(list($k, $v) = each($counters)) {
		                        if(!is_numeric($k)) { ?>
                                    <tr>
                                        <td class="tdleft" style="width:23%;">
                                            <?php $a = preg_replace("/^_piler\:/", "", $k); if(isset($$a)) { print $$a; } else { print $k; } ?>:
                                        </td>
                                        <td style="width:70%;">
                                            <?php print $v; ?>
                                        </td>
                                    </tr>
                                <?php } } ?>                              
                            </tbody>
                        </table>
                        <!--空间规划-->
                        <table class="table" width="95%">
                            <tbody>
                                <tr>
                                    <th colspan="2">
                                        <span style="font-size:15px;">
                                            <i class="icon-hdd pull-left"></i>
                                        </span>
                                        <?php print $text_space_projection; ?>
                                    </th>
                                </tr>
                                <tr>
                                    <td class="tdleft" style="width:23%;">
                                        <?php print $text_average_messages_day; ?>:
                                    </td>
                                    <td style="width:70%;">
                                        <?php print $averagemessages; ?>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="tdleft" style="width:23%;">
                                        <?php print $text_average_message_size; ?>
                                    </td>
                                    <td style="width:70%;">
                                        <?php print $averagemessagesize; ?> + <?php print $averagesqlsize; ?> + <?php print $averagesphinxsize; ?>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="tdleft" style="width:23%;">
                                        <?php print $text_average_size_day; ?>
                                    </td>
                                    <td style="width:70%;">
                                        <?php print $averagesizeday; ?>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="tdleft" style="width:23%;">
                                        "<?php print DATA_PARTITION; ?>" <?php print $text_partition_full; ?>
                                    </td>
                                    <td style="width:70%;">
                                        <?php print $daysleftatcurrentrate[0]; ?> years, <?php print $daysleftatcurrentrate[1]; ?> months, <?php print $daysleftatcurrentrate[2]; ?> days
                                    </td>
                                </tr>
                                <tr>
                                    <td class="tdleft" style="width:23%;">
                                        <?php print $text_usage_trend; ?>
                                    </td>
                                    <td style="width:70%;">
                                        <?php if ( $usagetrend > 0 ) { print $text_usage_increasing; } elseif( $usagetrend < 0 ) { print $text_usage_decreasing; } else { print $text_usage_neutral; } ?>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <!--right part end-->
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

    <!--
    <div id="health2">
        <?php if(isset($queues)) { ?>
                 <tr>
                    <th><?php print $text_queue_status; ?></div>
                 </div>

                 <?php foreach ($queues as $queue) {

                          if(isset($queue['desc'])) { ?>

                       <tr>
                          <th><?php print $queue['desc']; ?></div>
                       </div>

                       <tr>
                          <td><pre><?php print $queue['lines']; ?></pre></div>
                       </div>

                    <?php } 
                   } ?>

        <?php } ?>
    </div>
    -->



