
<?= $this->render('/g-search/_gsearch-form', ['searchModel' => $searchModel, 'dataProvider' => $dataProvider]); ?>

<div class="container">
    <div class="row">
        <div class="col-lg-12 ">
            <div class="row">
                <div class="col-lg-12">
                    <div class="sorting panel panel-body" style="box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0 rgba(0, 0, 0, 0.12);">

                       
                        <?php if ($dataProvider->models) { ?>
                            <div class="btn-group pull-right">
                                <button class="btn btn-orange" id="list"><i class="fa fa-th-list fa-white icon-white"></i> </button>
                                <button class="btn" id="grid"><i class="fa fa-th fa"></i></button>
                            </div>
                            <?php
                        } else {

                            echo '';
                        }
                        ?>

                    </div>


                    <div class="searchresult list" style="display: block;">
                        <?php
                        if ($dataProvider->models) {
                            ?>
                            <ul>
                                <?php
                                foreach ($dataProvider->models as $row) {
                                    ?>

                                    <?php
                                    $query = new yii\db\Query();
                                    $query->select(['image'])
                                            ->from('classified_image')
                                            ->where(['classified_id' => $row['id']])
                                            ->limit(1);

                                    $command = $query->createCommand();
                                    $dataImg = $command->queryAll();
                                    ?>
                                    <li class="clearfix">
                                        <?php foreach ($dataImg as $dataImg) { ?>
                                            <div class="col-sm-2"> <a class="thumbnail" href="detail.html"><img src="<?php echo $dataImg['image'] ?>" alt="" style="height: 120px; width: 100%"></a>
                                                <?php if ($row['is_status'] == 0) { ?>
                                                    <div class="latest">Pending Verified</div>    
                                                    <?php
                                                } else {

                                                    //something
                                                }
                                                ?>
                                            </div>
                                        <?php } ?>
                                        <div class="col-sm-8">
                                            <h3><a class="title" href="<?= Yii::$app->urlManager->createUrl(['classified/detail-classified', 'id' => $row['id']]) ?>"><?= $row['title'] ?> </a></h3>

                                            <ul class="icondetail">
                                                <li><i class="fa fa-th-list"></i> Category : <?= $row['category'] ?><a href="#"></a></li>
                                                <li><i class="fa fa-map-marker"></i> Location : <?= $row['region'] ?>, <?= $row['city'] ?></li>
                                                <li><i class="fa fa-calendar"></i> Posted On : <?= Yii::$app->formatter->format($row['create_at'], 'date') ?> </li>
                                                <?php
                                                // 0 = untuk produk/classified user yang belum login
                                                if ($row['type'] == 0) {

                                                    // Query classified free, cek {name} classified free
                                                    $query = new yii\db\Query();
                                                    $query->select(['name', 'id'])
                                                            ->from('classified_guest')
                                                            ->where(['id' => $row['user_id']]);

                                                    $command = $query->createCommand();
                                                    $dataUserFree = $command->queryAll();

                                                    foreach ($dataUserFree as $dataUserFree) {
                                                        if ($row['user_id'] == $dataUserFree['id']) {
                                                            ?>
                                                            <li><i class="fa fa-user"></i> Posted by : <a href="#"><?= $dataUserFree['name'] ?></a></li>
                                                            <?php
                                                        }
                                                    }
                                                } elseif ($row['type'] == 1) {

                                                    // Query user, cek {username} user
                                                    $query = new yii\db\Query();
                                                    $query->select(['username', 'id'])
                                                            ->from('user')
                                                            ->where(['id' => $row['user_id']]);

                                                    $command = $query->createCommand();
                                                    $dataUserLogin = $command->queryAll();

                                                    //query profile, cek {name} profile

                                                    $queryProfile = new yii\db\Query;
                                                    $queryProfile->select(['profile.user_id', 'profile.name'])
                                                            ->from('profile')
                                                            ->where(['user_id' => $row['user_id']]);

                                                    $commandProfile = $queryProfile->createCommand();
                                                    $dataProfile = $commandProfile->queryAll();

                                                    foreach ($dataProfile as $dataProfile) {
                                                        if ($dataProfile['name'] == null) {
                                                            foreach ($dataUserLogin as $dataUserLogin) {
                                                                if ($row['user_id'] == $dataUserLogin['id']) {
                                                                    ?>
                                                                    <li><i class="fa fa-user"></i> Posted by : <a href="#"><?= $dataUserLogin['username'] ?></a></li>
                                                                    <?php
                                                                }
                                                            }
                                                        } else {
                                                            if ($row['user_id'] == $dataProfile['user_id']) {
                                                                ?>
                                                                <li><i class="fa fa-user"></i> Posted by : <a href="#"><?= $dataProfile['name'] ?></a></li>
                                                                <?php
                                                            }
                                                        }
                                                    }
                                                }
                                                ?>

                                            </ul>
                                            <div class="discrption"> <?php
                                                $substr = $row['description'];
                                                echo substr($substr, 0, 167);
                                                ?>...</div>
                                        </div>
                                        <!--                                        <div class="col-sm-2">
                                                                                    <div class="share"> Share On : <br>
                                                                                        <a data-original-title="Facebook" class="tooltip-test"><i class="fa fa-facebook"></i></a> <a data-original-title="Twitter" class="tooltip-test"><i class="fa fa-twitter"></i></a> <a data-original-title="Google Plus" class="tooltip-test"><i class="fa fa-google-plus"></i></a> </div>
                                                                                    <a class="btn  contact"><i class="fa fa-envelope-o"></i> Contact</a> </div>
                                        -->
                                        <?php
                                    }
                                    ?>
                            </ul>
                        <?php } else { ?>
                            <div class="container" style="text-align: center; margin-left: auto; margin-right: auto; margin-bottom: auto; margin-top: auto">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="error-template">
                                            <br>
                                            <h1>
                                                Oops!</h1>
                                            <h2>
                                                404 Not Found</h2>
                                            <div class="error-details">
                                                Sorry, an error has occured, Requested page not found!
                                            </div>
                                            <br><br>
                                            <div class="error-actions">
                                                <a href="<?php echo \yii\helpers\Url::to(['/site/index']); ?>" class="btn btn-lg btn-orange tooltip-test mainserarchsubmit"><span class="glyphicon glyphicon-home"></span>
                                                    Take Me Home </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <?php
                        }
                        ?>


                        <div class="mt30 clearfix">
                            <!-- Paging-->
                            <?php
                            echo \yii\widgets\LinkPager::widget([
                                'pagination' => $dataProvider->pagination,
                            ]);
                            ?>
                        </div>
                    </div>
                    <div class="searchresult grid" style="display: none;">
                        <?php
                        if ($dataProvider->models) {
                            ?>
                            <ul class="mt30 clearfix row">
                                <?php
                                foreach ($dataProvider->models as $row) {
                                    ?>
                                    <?php
                                    $query = new yii\db\Query();
                                    $query->select(['image'])
                                            ->from('classified_image')
                                            ->where(['classified_id' => $row['id']])
                                            ->limit(1);

                                    $command = $query->createCommand();
                                    $dataImg = $command->queryAll();
                                    ?>
                                    <li class="col-sm-4">
                                        <div class="searchgrid"> 
                                            <?php foreach ($dataImg as $dataImg) { ?>
                                                <a class="thumbnail" href="detail.html"><img src="<?php echo $dataImg['image'] ?>" alt="" style="height: 200px; width: 100%"></a>
                                            <?php } ?>
                                            <div>
                                                <h3><a class="title" href="<?= Yii::$app->urlManager->createUrl(['classified/detail-classified', 'id' => $row['id']]) ?>"><?= $row['title'] ?> </a></h3>
                                                <?php if ($row['is_status'] == 0) { ?>
                                                    <div class="latest">Pending Verified</div>    
                                                    <?php
                                                } else {
                                                    //something
                                                }
                                                ?>
                                                <ul class="icondetail">
                                                    <li><i class="fa fa-th-list"></i> Category : <?= $row['category'] ?><a href="#"></a></li>
                                                    <li><i class="fa fa-map-marker"></i> Location : <?= $row['region'] ?>, <?= $row['city'] ?></li>
                                                    <li><i class="fa fa-calendar"></i> Posted On : <?= Yii::$app->formatter->format($row['create_at'], 'date') ?> </li>
                                                    <?php
                                                    // 0 = untuk produk/classified user yang belum login
                                                    if ($row['type'] == 0) {

                                                        // Query classified free, cek {name} classified free
                                                        $query = new yii\db\Query();
                                                        $query->select(['name', 'id'])
                                                                ->from('classified_guest')
                                                                ->where(['id' => $row['user_id']]);

                                                        $command = $query->createCommand();
                                                        $dataUserFree = $command->queryAll();

                                                        foreach ($dataUserFree as $dataUserFree) {
                                                            if ($row['user_id'] == $dataUserFree['id']) {
                                                                ?>
                                                                <li><i class="fa fa-user"></i> Posted by : <a href="#"><?= $dataUserFree['name'] ?></a></li>
                                                                <?php
                                                            }
                                                        }
                                                    } elseif ($row['type'] == 1) {

                                                        // Query user, cek {username} user
                                                        $query = new yii\db\Query();
                                                        $query->select(['username', 'id'])
                                                                ->from('user')
                                                                ->where(['id' => $row['user_id']]);

                                                        $command = $query->createCommand();
                                                        $dataUserLogin = $command->queryAll();

                                                        //query profile, cek {name} profile

                                                        $queryProfile = new yii\db\Query;
                                                        $queryProfile->select(['profile.user_id', 'profile.name'])
                                                                ->from('profile')
                                                                ->where(['user_id' => $row['user_id']]);

                                                        $commandProfile = $queryProfile->createCommand();
                                                        $dataProfile = $commandProfile->queryAll();

                                                        foreach ($dataProfile as $dataProfile) {
                                                            if ($dataProfile['name'] == null) {
                                                                foreach ($dataUserLogin as $dataUserLogin) {
                                                                    if ($row['user_id'] == $dataUserLogin['id']) {
                                                                        ?>
                                                                        <li><i class="fa fa-user"></i> Posted by : <a href="#"><?= $dataUserLogin['username'] ?></a></li>
                                                                        <?php
                                                                    }
                                                                }
                                                            } else {
                                                                if ($row['user_id'] == $dataProfile['user_id']) {
                                                                    ?>
                                                                    <li><i class="fa fa-user"></i> Posted by : <a href="#"><?= $dataProfile['name'] ?></a></li>
                                                                    <?php
                                                                }
                                                            }
                                                        }
                                                    }
                                                    ?>

                                                </ul>
                                            </div>
                                            <!--                                        <div>
                                                                                        <div class="share"> Share On : <a data-original-title="Facebook" class="tooltip-test"><i class="fa fa-facebook"></i></a> <a data-original-title="Twitter" class="tooltip-test"><i class="fa fa-twitter"></i></a> <a data-original-title="Google Plus" class="tooltip-test"><i class="fa fa-google-plus"></i></a> </div>
                                                                                        <a class="btn  contact"><i class="fa fa-envelope-o"></i> Contact</a> </div>-->
                                        </div>
                                    </li>
                                    <?php
                                }
                                ?>
                            </ul>
                        <?php } else { ?>
                            <div class="container" style="text-align: center; margin-left: auto; margin-right: auto; margin-bottom: auto; margin-top: auto">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="error-template">
                                            <br>
                                            <h1>
                                                Oops!</h1>
                                            <h2>
                                                404 Not Found</h2>
                                            <div class="error-details">
                                                Sorry, an error has occured, Requested page not found!
                                            </div>
                                            <br><br>
                                            <div class="error-actions">
                                                <a href="<?php echo \yii\helpers\Url::to(['/site/index']); ?>" class="btn btn-lg btn-orange tooltip-test mainserarchsubmit"><span class="glyphicon glyphicon-home"></span>
                                                    Take Me Home </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <?php
                        }
                        ?>

                        <!-- Paging-->
                        <div class="mt30 clearfix">
                            <?php
                            echo \yii\widgets\LinkPager::widget([
                                'pagination' => $dataProvider->pagination,
                            ]);
                            ?>
                            ?>
                        </div>
                    </div>


                </div>
            </div>

        </div>
    </div>
</div>