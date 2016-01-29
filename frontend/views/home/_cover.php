<div class="row">
    <div class="col-lg-12">
        <div class="profile clearfix" style="margin-bottom: 0px">
            <div class="image">
                <?php if (!empty($modelCover->image_header)) { ?>
                    <img src="<?php echo \Yii::$app->request->BaseUrl . '/' . $modelCover->image_header ?>" style="height: 300px; width: 100%">
                <?php } else { ?>
                    <img src="back-default.png" style="height: 350px; width: 100%">
                <?php } ?>
            </div>
            <div class="user clearfix">
                <div class="avatar">
                    <?php if (!empty($modelCover->image_profile)) { ?>
                        <img src="<?php echo \Yii::$app->request->BaseUrl . '/' . $modelCover->image_profile ?>" class="img-thumbnail img-profile">
                    <?php } else { ?>
                        <img src="pp-default.png" class="img-thumbnail img-profile">
                    <?php } ?>
                </div>
                <?php
                //query profile
                $query = new \yii\db\Query();
                $query->select([
                            'profile.name',
                        ])
                        ->from('profile')
                        ->where(['user_id' => $modelCover->user_id])
                        ->all();

                $command = $query->createCommand();
                $data = $command->queryAll();

                //query user
                $queryUser = new \yii\db\Query();
                $queryUser->select([
                            'user.username',
                        ])
                        ->from('user')
                        ->where(['id' => $modelCover->user_id])
                        ->all();

                $commandUser = $queryUser->createCommand();
                $dataUser = $commandUser->queryAll();
                ?>
                <h2><?php
                    foreach ($data as $row) {
                        if (empty($row['name'])) {
                            foreach($dataUser as $dataUser){
                                echo $dataUser['username'];
                            }
                        } else {
                            echo $row['name'];
                        }
                    }
                    ?></h2>
                <div class="actions">
                    <div class="btn-group">
                       <?php if(Yii::$app->user->isGuest){ ?>
                        
                       <?php }elseif(Yii::$app->user->identity->id){ ?>
                           <a href="<?= yii\helpers\Url::to(['/classified/post-classified/']); ?>" class="btn btn-orange btn-sm"><span class="glyphicon glyphicon-plus glyphicon glyphicon-white"></span> Post Classified</a>
                       <?php }else{
                           echo 'Ada yang salah !';
                       } ?>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<div class="row">
    <div class="col-lg-12 text-center">
        <nav class="navbar navbar-white navbar-xs" role="navigation" style="border-top: 0px; border-bottom: 1px solid #D5D5D5; border-left: 1px solid #D5D5D5; border-right: 1px solid #D5D5D5; border-radius: 0px;">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-2">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar" style="background-color: orange"></span>
                    <span class="icon-bar" style="background-color: orange"></span>
                    <span class="icon-bar" style="background-color: orange"></span>
                </button>
                <form class="navbar-form navbar-left hidden-md hidden-sm hidden-lg" role="search" style="margin-left: 10px; width: 50%; margin-top: 0px">
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="Search">
                    </div>
                </form>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-2">
                <ul class="nav navbar-nav">
                    <li><a href="<?= Yii::$app->urlManager->createUrl(['/home/', 'id' => $modelCover->user_id]) ?>"> <i class="fa fa-user"></i> Profile</a></li>
                    <li><a href="<?= Yii::$app->urlManager->createUrl(['/home/classified/', 'id' => $modelCover->user_id]) ?>"> <i class="glyphicon glyphicon-tag"></i> Classified</a> </li>
                    <li><a href="<?= Yii::$app->urlManager->createUrl(['/home/contact/', 'id' => $modelCover->user_id]) ?>">  <i class="glyphicon glyphicon-phone"></i> Contact</a> </li>
                </ul>
                <form class="navbar-form navbar-right hidden-xs" role="search">
                    <div class="form-group">
<!--                        <input type="text" class="form-control" placeholder="Search">-->
                    </div>
                </form>
            </div><!--/.nav-collapse -->
        </nav>
    </div>
</div>
