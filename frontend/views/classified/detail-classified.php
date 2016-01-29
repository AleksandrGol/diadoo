<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model common\models\Classified */
/* @var $form yii\widgets\ActiveForm */
?>
<?= Yii::$app->session->getFlash('success'); ?>
<div class="main-container">

    <!--    <div class="container">
            <ol class="breadcrumb pull-left">
                <li><a href="#"><i class="icon-home fa"></i></a></li>
                <li><a href="category.html">All Ads</a></li>
                <li><a href="sub-category-sub-location.html">Electronics</a></li>
                <li class="active">Mobile Phones</li>
            </ol>
            <div class="pull-right backtolist"><a href="sub-category-sub-location.html"> <i class="fa fa-angle-double-left"></i> Back to Results</a></div>
        </div>-->


    <div class="container" style="margin-top: 10px">

        <?php foreach ($data as $row) { ?>
            <?php
            $query = new yii\db\Query();
            $query->select(['image'])
                    ->from('classified_image')
                    ->where(['classified_id' => $row['id']]);

            $command = $query->createCommand();
            $dataImg = $command->queryAll();

            $item = [];

            foreach ($dataImg as $dataImg) {
                $item[] = [
                    'content' => '<img src="' . $dataImg['image'] . '" style="width: 850px; height: 550px;">'
                ];
            }
            ?>


            <div class="row">
                <div class="col-sm-9 page-content col-thin-right">
                    <div class="inner inner-box ads-details-wrapper" style="box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0 rgba(0, 0, 0, 0.12);">
                        <h2> <?= $row['title']; ?> </h2>
                        <span class="info-row"> <span class="date"><i class=" icon-clock"> </i> <?= Yii::$app->formatter->format($row['create_at'], 'date') ?> </span> - <span class="category"><?= $row['category'] ?> </span>- <span class="item-location"><i class="fa fa-map-marker"></i> <?= $row['city'] ?>, <?= $row['region'] ?> </span> </span>
                        <div class="ads-image">


                            <h1 class="pricetag">Rp. <?= $row['price'] ?></h1>
                            <div class="bx-wrapper" style="max-width: 100%;">
                                <div class="bx-viewport" style="width: 100%; overflow: hidden; position: relative; height: 550px;">
                                    <?=
                                    \yii\bootstrap\Carousel::widget([
                                        'items' => $item,
                                        'options' => ['class' => 'slide'],
                                        'controls' => [
                                            yii\bootstrap\Html::tag('span', '', ['class' => 'glyphicon glyphicon-chevron-left']),
                                            yii\bootstrap\Html::tag('span', '', ['class' => 'glyphicon glyphicon-chevron-right']),
                                        ],
                                    ])
                                    ?>

                                </div>
                            </div>

                        </div>

                        <div class="Ads-Details">
                            <h5 class="list-title"><strong>Ads Details</strong></h5>
                            <div class="row">
                                <div class="ads-details-info col-md-8">
                                    <?= $row['description']; ?>
                                </div>
                                <div class="col-md-4">
                                    <aside class="panel panel-body panel-details">
                                        <ul>
                                            <li>
                                                <p class=" no-margin "><strong><i class="fa fa-money"></i> Price:</strong> <?= $row['price']; ?></p>
                                            </li>
                                            <li>
                                                <p class="no-margin"><strong><i class="fa fa-tag"></i> Category:</strong> <?= $row['main_category']; ?> - <?= $row['category'] ?></p>
                                            </li>
                                            <li>
                                                <p class="no-margin"><strong><i class="fa fa-map-marker"></i> Location:</strong> <?= $row['city']; ?>, <?= $row['region'] ?></p>
                                            </li>
                                            <?php if ($row['type'] == 0) { ?>
                                                <li><p class="no-margin"><i class="fa fa-info-circle"></i><a href="#reportAdvertiser" data-toggle="modal" style="color: #5bc0de"> Report abuse </a> </p></li>
                                            <?php } else { ?>
                                                <li><p class="no-margin"><i class=" fa fa-user"></i> <a href="<?php echo Yii::$app->urlManager->createUrl(['/home/index', 'id' => $row['user_id']]) ?>" style="color: #5bc0de"> More ads by User </a> </p></li>
                                                <li><p class="no-margin"><i class="fa fa-info-circle"></i><a href="#reportAdvertiser" data-toggle="modal" style="color: #5bc0de"> Report abuse </a> </p></li>
                                            <?php } ?>
                                        </ul>
                                        
                                    </aside>
                                    <!--                                    <div class="ads-action">
                                                                            <ul class="list-border">
                                                                                
                                                                            </ul>
                                                                        </div>-->
                                    
                                </div>
                                
                                <div class="col-sm-12" style="padding: 15px; border-top: 1px solid #ddd">
                                    <?= \imanilchaudhari\socialshare\ShareButton::widget([
        'style'=>'horizontal',
        'networks' => ['facebook','googleplus','twitter'],
        'data_via'=>'', //twitter username (for twitter only, if exists else leave empty)
]); ?>
                                </div>
                                
                            </div>
                            
                        </div>
                    </div>
<div class="fb-comments" data-href="http://diadoo.me/" data-width="100%" data-numposts="5"></div>
                </div>

                <div class="col-sm-3  page-sidebar-right">
                    <aside>
                        <div class="panel sidebar-panel" style="box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0 rgba(0, 0, 0, 0.12);">
                            <div class="panel-heading">Contact Seller</div>
                            <div class="panel-content">
                                <div class="panel-body text-center">
                                    <div class="seller-info">
                                        <?php
                                        //select profile
                                        $queryProfile = new yii\db\Query();
                                        $queryProfile->select(['name', 'image_profile', 'phone_number'])
                                                ->from('profile')
                                                ->where(['user_id' => $row['user_id']]);


                                        $commandProfile = $queryProfile->createCommand();
                                        $dataProfile = $commandProfile->queryAll();

                                        //select user
                                        $queryUser = new yii\db\Query();
                                        $queryUser->select(['username'])
                                                ->from('user')
                                                ->where(['id' => $row['user_id']]);


                                        $commandUser = $queryUser->createCommand();
                                        $dataUser = $commandUser->queryAll();

                                        //select user free
                                        $queryUserFree = new yii\db\Query();
                                        $queryUserFree->select(['name', 'email', 'phone'])
                                                ->from('classified_guest')
                                                ->where(['id' => $row['user_id']]);


                                        $commandUserFree = $queryUserFree->createCommand();
                                        $dataUserFree = $commandUserFree->queryAll();
                                        ?>


                                        <?php
                                        if ($row['type'] == 1) {
                                            foreach ($dataUser as $dataUser) {
                                                ?>
                                                <?php foreach ($dataProfile as $dataProfile) { ?>
                                                    <?php if(empty($dataProfile['image'])){ ?>
                                                        <img src="<?= $dataProfile['image_profile'] ?>" class="img-thumbnail" style="width: 80%; height: 200px">
                                                    <?php }else{ ?>
                                                        <img src="g-profile.png" class="img-thumbnail" style="width: 80%; height: 200px">
                                                    <?php } ?>
                                                    <?php if(empty($dataProfile['name'])){ ?>
                                                        <h3 class="no-margin"><?= $dataUser['username'] ?></h3>
                                                    <?php }else{ ?>
                                                        <h3 class="no-margin"><?= $dataProfile['name'] ?></h3>
                                                    <?php } ?>
                                                    <p> Joined: <strong><?= Yii::$app->formatter->format($row['create_at'], 'date') ?></strong></p>                
                                                    <div class="user-ads-action"> 
                                                        <a class="btn  btn-info btn-block"><i class=" icon-phone-1"></i> <?= $dataProfile['phone_number'] ?> </a> 
                                                    </div>
                                                <?php } ?>

                                                <?php
                                            }
                                        } else {

                                            foreach ($dataUserFree as $dataUserFree) {
                                                ?>
                                                <h3 class="no-margin"><?= $dataUserFree['name'] ?></h3>
                                                <label class=""><i class="fa fa-user-times "></i> Sorry, no user profile.</label>
                                                <label class=""><i class="fa fa-send "></i> <?= $dataUserFree['email'] ?></label>
                                                <br><br>
                                                <a class="btn  btn-info btn-block"><i class=" icon-phone-1"></i> <?= $dataUserFree['phone'] ?> </a> 
                                                <?php
                                            }
                                        }
                                        ?>


                                    </div>

                                </div>
                            </div>
                        </div>

                        <div class="panel sidebar-panel" style="box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0 rgba(0, 0, 0, 0.12);">
                            <div class="panel-heading">Tips for Buyers</div>
                            <div class="panel-content">
                                <div class="panel-body text-left">
                                    <div><i class="fa fa-check"></i> Meet in a safe place.</div>
                                    <br>
                                    <div><i class="fa fa-check"></i> Carefully before buying.</div>
                                    <br>
                                    <div><i class="fa fa-check"></i> Pay upon receipt.</div>
                                    <br>
                                    <div><i class="fa fa-check"></i> Smile.</div>
                                </div>
                            </div>
                        </div>
 
                   </aside>

<!--
<div style="text-align: center; padding-bottom: 15px">
<img src="banner/image/Sale-banner.jpg">
</div>
-->
                </div>

                
            </div>
        </div>
    </div>


    <div class="modal fade" id="reportAdvertiser" tabindex="-1" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title"><i class="fa icon-info-circled-alt"></i> There's something wrong with this ads? </h4>
                </div>

                <div class="form-report">
                    <?php
                    $form = ActiveForm::begin([
                                'id' => 'form-report',
                                'method' => 'post',
                                'action' => ['report-classified/report']
                    ]);
                    ?>
                    <div class="modal-body">
                        <div class="form-group">
                            <?php echo $form->field($modelReport, 'classified_id')->hiddenInput(['value' => $row['id']])->label(false) ?>
                            <?php echo $form->field($modelReport, 'type')->hiddenInput(['value' => $row['type']])->label(false) ?>
                            <?php echo $form->field($modelReport, 'user_id')->hiddenInput(['value' => $row['user_id']])->label(false) ?>
                        </div>
                        <div class="form-group">
                            <?php
                            $subjectReport = common\models\SubjectReport::find()->all();
                            $listData = \yii\helpers\ArrayHelper::map($subjectReport, 'id', 'subject');
                            ?>
                            <?= $form->field($modelReport, 'subject_id')->dropDownList($listData, ['prompt' => '-- Select Subject --']); ?>
                        </div>
                        <div class="form-group">
                            <?= $form->field($modelReport, 'email_reporter')->textInput(['placeholder' => 'Your email']); ?>
                        </div>
                        <div class="form-group">
                            <?= $form->field($modelReport, 'message')->textarea(['rows' => '8']); ?>
                        </div>

                    </div>
                    <div class="modal-footer">
                        <?= Html::button(Yii::t('app', 'Cancel'), ['data-dismiss' => 'modal', 'class' => 'btn btn-default']) ?>
                        <?= Html::submitButton(Yii::t('app', 'Send Report'), ['class' => 'btn btn-primary', 'id' => $row['id']]); ?>
                    </div>
                    <?php ActiveForm::end() ?>
                </div>

            </div>
        </div>
    </div>
<?php } ?>
