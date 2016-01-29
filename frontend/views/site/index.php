<?php
/* @var $this yii\web\View */

$this->title = 'diadoo';
?>

<?= $this->render('/g-search/_gsearch-form', ['searchModel' => $searchModel, 'dataProvider' => $dataProvider]); ?>


<div class="container">
    <div class="row">
        <div class="col-lg-9">
            <div class="panel">
                <div class="panel-heading">
                    <h2 class="heading2"> List Category</h2>
                </div>
                <div class="panel-body">
                    <div class="mt40">
                        <ul class="row clearfix">

                            <?php
// if($maincategory){
                            $maincategory2 = \common\models\MainCategory::find()->where(['is_status' => 1])->all();
                            foreach ($maincategory2 as $row) {
                                $category = \common\models\Category::find()->where(['main_category_id' => $row['id'], 'is_status' => 1])->all();
                                ?>
                                <li class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                    <section class="directorylist" style="min-height: 250px">
                                        <div><i class="fa <?= $row['icon']; ?>"></i><span class="directorytitle"><?= $row['main_category'] ?></span></div>
                                        <ul class="list">
                                            <?php foreach ($category as $cat) { ?>

                                                <li>
                                                    <a href="<?= Yii::$app->urlManager->createUrl(['classified/list', 'id' => $cat['id']]) ?>">
<?php echo $cat['category']; ?> 

(<?php 
                                                        echo $countCat = \common\models\Classified::find()
                                                                ->where(['category_id' => $cat['id']])
                                                                ->count();
                                                        ?>)
</a>
                                                </li>

                                            <?php } ?>
                                        </ul>
                                    </section>
                                </li>

                                <?php
                            }
// }
                            ?>
                        </ul>
			
			<div style="text-align: center;">
<h3>Total data</h3>
<p style="font-size: 20px"><?php echo $countAll = \common\models\Classified::find()->count(); ?></p>
</div>
                    </div>
                </div>
            </div>
<div style="text-align: center; padding-bottom: 15px">
<img src="banner/image/digitalocean-banner.jpg">
</div>
        </div>
        <div class="col-lg-3">
            <div class="panel">
                <div class="panel-heading">

                </div>
                <div class="panel-body" style="text-align: center">
                    <div>
                        <?php //echo yii\helpers\Html::img('@web/logo.jpg') ?>
			<object width="100%" height="100%">
  <param name="movie" value="banner/flash/BannerSnack-ad-336x280.swf">
  <embed src="banner/flash/BannerSnack-ad-336x280.swf" width="100%" height="100%"> </embed>
</object>
                    </div>
                </div>
            </div>
            <div class="panel">
                <div class="fb-page" data-href="https://www.facebook.com/diadooworld/" data-tabs="timeline" data-small-header="false" data-adapt-container-width="true" data-hide-cover="false" data-show-facepile="true"><div class="fb-xfbml-parse-ignore"><blockquote cite="https://www.facebook.com/diadooworld/"><a href="https://www.facebook.com/diadooworld/">Diadoo</a></blockquote></div></div>
            </div>
        </div>
    </div>
</div>
