<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = Yii::t('app', 'Classifieds');
$this->params['breadcrumbs'][] = $this->title;
?>
<?= $this->render('_top') ?>
<div class="row">
    <div class="col-lg-12">
        <div class="box box-primary">
            <div class="box-header">
                <a href="<?= yii\helpers\Url::to(['/statistic-classified/']); ?>" class="btn bg-maroon btn-flat pull-right"><i class="fa fa-bar-chart-o"></i> Statistics Classified</a>
            </div>
            <div class="box-body">
                <div class="classified-index">
                    <?=
                    GridView::widget([
                        'dataProvider' => $dataProvider,
                        'filterModel' => $searchModel,
                        'summary' => '',
                        'columns' => [
                            ['class' => 'yii\grid\SerialColumn'],
                            // 'id',
                            'title',
                            //'description:ntext',
                            //'main_category_id',
                            //'category_id',
                            // 'country_id',
                            // 'region_id',
                            // 'city_id',
                            // 'price',
                            'create_at',
                            // 'update_at',
                            // 'user_id',
                             [
                            'attribute' => 'is_status',
                            'class' => '\pheme\grid\ToggleColumn',
                            'enableAjax' => false,
                            'filter' => ['1' => 'Active', '0' => 'Not Active']
                        ],
                            // 'type',
                            ['class' => 'yii\grid\ActionColumn'],
                        ],
                    ]);
                    ?>
                </div>
            </div>
        </div>
    </div>
</div>