<nav class="navbar navbar-default navbar-fixed-top">
    <div class="container">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="<?php echo \yii\helpers\Url::to(['/site/']); ?>" style="margin-left: 0px"><b><?php echo Yii::t('app', 'diadoo') ?></b> </a>
<!-- <a class="navbar-brand" href="http://diadoo.me/" style="margin-left: 0px"><b><?php echo Yii::t('app', 'diadoo') ?></b> </a> -->
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
	   <ul class="nav navbar-nav">
		<li class="pull-left" style=""><a href="<?php echo \yii\helpers\Url::to(['/site/announcement/']); ?>" style="color: red"><b>Announcement <span class="fa fa-exclamation-triangle"></span></b></a></li>
	   </ul>
            <ul class="nav navbar-nav navbar-right">
                <?php if(Yii::$app->user->isGuest) { ?>
                    <li><a href="<?= yii\helpers\Url::to(['/user/security/login']) ?>">Login</a></li>
                    <li><a href="<?= yii\helpers\Url::to(['/user/registration/register']) ?>">Register</a></li>
                    <li>
                        <p class="navbar-btn">
                            <a href="<?= yii\helpers\Url::to(['/classified/post-classified']) ?>" class="btn btn btn-orange tooltip-test mainserarchsubmit">Post Classified</a>
                        </p>
                    </li>

                <?php }elseif(!Yii::$app->user->isGuest){ ?>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                            <i class="fa fa-user"></i> <?= Yii::$app->user->identity->username; ?> <i class="fa fa-caret-down"></i>
                        </a>
                        <ul class="dropdown-menu">
                            <li><a href="<?= Yii::$app->urlManager->createUrl(['/home/', 'id' => Yii::$app->user->identity->id]) ?>"><i class="fa fa-newspaper-o"></i> Home</a></li>
                            <li><a href="<?= yii\helpers\Url::to(['/user/settings/']); ?>"><i class="fa fa-cogs"></i> Settings</a></li>
                            <li role="separator" class="divider"></li>
                            <li><a href="<?= yii\helpers\Url::to(['/user/security/logout/']); ?>" data-method='post'><i class="fa fa-power-off"></i> Logout</a></li>
                        </ul>
                    </li>
                <?php } ?>
            </ul>

        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>
