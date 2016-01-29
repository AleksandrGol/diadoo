<?php

use yii\helpers\Html;

/* @var $this \yii\web\View */
/* @var $content string */
?>

<?php
//classified notif
$classifiedNotif = \common\models\Classified::find()
        ->where(["LIKE", "create_at", date('Y-m-d')])
        ->andWhere(['is_status' => 0])
        ->count();

//report notif
$reportNotif = \common\models\ReportClassified::find()
        ->where(["LIKE", "create_at", date('Y-m-d')])
        ->andWhere(['checked' => 0])
        ->count();
?>

<header class="main-header">

    <?= Html::a('<span class="logo-mini">APP</span><span class="logo-lg">' . Yii::$app->name . '</span>', Yii::$app->homeUrl, ['class' => 'logo']) ?>

    <nav class="navbar navbar-static-top" role="navigation">

        <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
            <span class="sr-only">Toggle navigation</span>
        </a>
        <a href="<?= Yii::$app->urlManagerFrontend->baseUrl; ?>" target="_blank" style="float: left;padding: 15px 15px; background-color: transparent; color: #ffffff">Open site</a>

        <div class="navbar-custom-menu">
            <?php
            //query model
            $query = new \yii\db\Query();
            $query->select([
                        'profile.image_profile',
                        'profile.image_header',
                        'profile.name',
                    ])
                    ->from('profile')
                    ->where(['user_id' => Yii::$app->user->identity->id])
                    ->all();

            $command = $query->createCommand();
            $data = $command->queryAll();
            ?>
            <?php foreach ($data as $row) { ?>

                <ul class="nav navbar-nav">

                    <!--                     Messages: style can be found in dropdown.less-->
                    <li class="dropdown messages-menu">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <i class="fa fa-bell-o"></i>
    <!--                                            <span class="label label-success">-->

                            <span class="label label-success"><?= ($classifiedNotif) ? $classifiedNotif : "0"; ?></span>
                            <!--                                            </span>-->
                        </a>
                        <ul class="dropdown-menu">
                            <li class="header"><?= (($classifiedNotif) ? (Yii::t('app', "You have ") . $classifiedNotif . Yii::t('app', " notifications")) : (Yii::t('app', "You have No notifications"))); ?></li>
                            <li>
                                <!--                                                 inner menu: contains the actual data -->
                                <ul class="menu">
                                    <?php
                                    if ($classifiedNotif == 0) {
                                        echo '';
                                    } else {
                                        ?>

                                        <?php
                                        $classifiedNotifData = new \yii\db\Query();
                                        $classifiedNotifData->select([
                                                    'classified.id',
                                                    'classified.title',
                                                    'classified.description',
                                                    'classified.create_at',
                                                    'classified_image.image'
                                                ])
                                                ->from('classified')
                                                ->join('JOIN', 'classified_image', 'classified_image.classified_id = classified.id')
                                                ->where(["LIKE", "create_at", date('Y-m-d')])
                                                ->andWhere(['is_status' => 0])->all();

                                        $commandNotif = $classifiedNotifData->createCommand();
                                        $dataNotif = $commandNotif->queryAll();
                                        ?>
                                        <?php foreach ($dataNotif as $dataNotif) { ?>
                                            <li>
                                                <a href="<?= Yii::$app->urlManager->createUrl(['/manage-classified/view/', 'id' => $dataNotif['id']]) ?>">
                                                    <div class="pull-left">
                                                        <img src="<?= Yii::getAlias('@urlFrontend') . '/' . $dataNotif['image'] ?>" class="img-circle"
                                                             alt="user image"/>
                                                    </div>
                                                    <h4>
                                                        <?= $dataNotif['title'] ?>
                                                        <small><i class="fa fa-clock-o"></i> <?= Yii::$app->formatter->asDatetime($dataNotif['create_at'], "php:H:i:s") ?></small>
                                                    </h4>
                                                    <p><?php
                                                        $dataDesc = $dataNotif['description'];
                                                        echo substr($dataDesc, 0, 33);
                                                        ?> ...
                                                    </p>
                                                </a>
                                            </li>
                                        <?php } ?>

                                    <?php }
                                    ?>
                                </ul>
                            </li>
                            <?php
                            if ($classifiedNotif == 0) {
                                
                            } else {
                                ?>
                                <li class="footer"><a href="<?= yii\helpers\Url::to(['/manage-classified/']) ?>">See All Messages</a></li>
                            <?php } ?>
                        </ul>
                    </li>

                    <li class="dropdown messages-menu">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <i class="fa fa-flag-o"></i>
                            <span class="label label-danger"><?= ($reportNotif) ? $reportNotif : "0"; ?></span>
                        </a>
                        <ul class="dropdown-menu">
                            <li class="header"><?= (($reportNotif) ? (Yii::t('app', "You have ") . $reportNotif . Yii::t('app', " notifications")) : (Yii::t('app', "You have No notifications"))); ?></li>
                            <li>

                                <ul class="menu">
                                    <?php
                                    if ($reportNotif == 0) {
                                        echo '';
                                    } else {
                                        ?>

                                    <?php } ?>

                                    <?php
                                    $reportNotifData = new \yii\db\Query();
                                    $reportNotifData->select([
                                                'report_classified.id',
                                                'report_classified.create_at',
                                                'report_classified.message',
                                                'subject_report.subject',
                                               // 'classified_image.image',
                                                //'classified.is_status'
                                            ])
                                            ->from('report_classified')
                                           // ->join('JOIN', 'classified_image', 'classified_image.classified_id = report_classified.classified_id')
                                            ->join('JOIN', 'subject_report', 'subject_report.id = report_classified.subject_id')
                                            //->join('JOIN', 'classified', 'classified.id = report_classified.classified_id')
                                            ->where(["LIKE", "report_classified.create_at", date('Y-m-d')])
                                            ->andWhere(['checked' => 0])
                                            //->andWhere(['classified.is_status' => 0])
                                            ->all();

                                    $commandNotifReport = $reportNotifData->createCommand();
                                    $dataNotifReport = $commandNotifReport->queryAll();
                                    ?>
                                    <?php foreach ($dataNotifReport as $dataNotifReport) { ?>

                                        <li>
                                            <a href="<?= Yii::$app->urlManager->createUrl(['/review-report/view/', 'id' => $dataNotifReport['id']]) ?>">
<!--                                                <div class="pull-left">
                                                    <img src="<?php // Yii::getAlias('@urlFrontend') . '/' . $dataNotifReport['image'] ?>" class="img-circle"
                                                         alt="user image"/>
                                                </div>-->
                                                <h4>
                                                    <?= $dataNotifReport['subject'] ?>
                                                    <small><i class="fa fa-clock-o"></i> <?= Yii::$app->formatter->asDatetime($dataNotifReport['create_at'], "php:H:i:s") ?></small>
                                                </h4>
                                                <p><?php
                                                    $dataDesc = $dataNotifReport['message'];
                                                    echo substr($dataDesc, 0, 33);
                                                    ?> ...
                                                </p>
                                            </a>
                                        </li>
                                    <?php } ?>
                                    <!--                                                     end task item -->
                                </ul>
                            </li>
                            <?php
                            if ($dataNotifReport == 1) {
                                
                            } else {
                                ?>
                                <li class="footer"><a href="<?= yii\helpers\Url::to(['/review-report/']) ?>">See All Report</a></li>
                            <?php } ?>
                        </ul>
                    </li>
                    <!--                                     User Account: style can be found in dropdown.less -->

                    <li class="dropdown user user-menu">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <?php if (!empty($row['image_profile'])) { ?>
                                <img src="<?php echo \Yii::$app->request->BaseUrl . '/' . $row['image_profile'] ?>" class="user-image" alt="User Image" style=""/>
                            <?php } else { ?>
                                <img src="g-profile.png" class="img-thumbnail img-profile">
                            <?php } ?>

                            <?php if (empty($row['name'])) { ?>
                                <span class="hidden-xs"><?= Yii::$app->user->identity->username; ?></span>
                            <?php } else { ?>
                                <span class="hidden-xs"><?= $row['name']; ?></span>
                            <?php } ?>
                        </a>
                        <ul class="dropdown-menu">
                            <!-- User image -->
                            <li class="user-header">
                                <?php if (!empty($row['image_profile'])) { ?>
                                    <img src="<?php echo \Yii::$app->request->BaseUrl . '/' . $row['image_profile'] ?>" class="img-circle" alt="User Image" style=""/>
                                <?php } else { ?>
                                    <img src="g-profile.png" class="img-thumbnail img-profile">
                                <?php } ?>

                                <?php if (empty($row['name'])) { ?>
                                    <p><?= Yii::$app->user->identity->username; ?></p>
                                <?php } else { ?>
                                    <p><?= $row['name']; ?></p>
                                <?php } ?>

                                <?php
                                $queryJoined = new yii\db\Query();
                                $queryJoined->select(['created_at'])
                                        ->from('user')
                                        ->where(['id' => Yii::$app->user->identity->id])
                                        ->all();

                                $commandJoined = $queryJoined->createCommand();
                                $dataJoined = $commandJoined->queryAll();
                                ?>

                                <?php foreach ($dataJoined as $rowJoined) { ?>

                                    <p><small>Joined : <?= Yii::$app->formatter->format($rowJoined['created_at'], 'date') ?></small></p>
                                <?php } ?>
                            </li>
                            <!-- Menu Body -->

                            <!-- /End Menu Body -->

                            <!-- Menu Footer-->
                            <li class="user-footer">
                                <div class="pull-left">
                                    <a href="<?php echo yii\helpers\Url::to(['/user/settings/']); ?>" class="btn btn-primary btn-flat btn-sm"><i class="fa fa-user"></i> Profile</a>
                                    <a href="<?php echo yii\helpers\Url::to(['/user/settings/account']); ?>" class="btn btn-success btn-flat btn-sm"><i class="fa fa-key"></i> Account</a>
                                </div>
                                <div class="pull-right">
                                    <a href="<?php echo yii\helpers\Url::to(['/user/security/logout/']); ?>" class="btn btn-danger btn-flat btn-sm" data-method="post"><i class="fa fa-remove"></i> Sign out</a>

                                </div>
                            </li>
                        </ul>
                    </li>

                    <!-- User Account: style can be found in dropdown.less -->
                    <!--                <li>
                                        <a href="#" data-toggle="control-sidebar"><i class="fa fa-gears"></i></a>
                                    </li>-->
                </ul>
            <?php } ?>
        </div>
    </nav>
</header>
