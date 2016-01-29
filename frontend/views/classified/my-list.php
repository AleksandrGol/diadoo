<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel common\models\search\CategoryListSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = Yii::t('app', 'Classifieds');
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="row">
    <div class="col-md-3">
        <?= $this->render('_menu') ?>
    </div>
    <div class="col-md-9" style="margin-top: 20px">
        <div class="panel panel-default">
            <div class="panel-heading">
                <?= Html::encode($this->title) ?>
            </div>
            <div class="panel-body">

                <p>
                    <?= Html::a(Yii::t('app', 'Post Classified'), ['post-classified'], ['class' => 'btn btn-orange']) ?>
                </p>
                <div class="classified-index">

                    <?=
                    GridView::widget([
                        'dataProvider' => $dataProvider,
                        //'filterModel' => $searchModel,
                        'summary' => '',
                        'columns' => [
                            ['class' => 'yii\grid\SerialColumn'],
                            'title',
                            [
                                'format' => 'html',
                                'attribute' => 'is_status',
                                'value' => function($model) {
                                    return ($model->is_status == 1 ? "<span class='label label-pill label-success'>active</span>" : "<span class='label label-pill label-danger'>Pending</span>");
                                },
                            ],
                            [
                                'class' => 'yii\grid\ActionColumn',
                                'headerOptions' => ['style' => 'width: 70px;'],
                                'template' => '{detail-classified} {update-classified} {delete}',
                                'buttons' => [
                                    'detail-classified' => function ($url, $model) {
                                        return Html::a('<span class="glyphicon glyphicon-eye-open"></span>', $url, [
                                                    'title' => Yii::t('app', 'Detail classified'),
                                        ]);
                                    },
                                            'update-classified' => function ($url, $model) {
                                        return Html::a('<span class="glyphicon glyphicon-pencil"></span>', $url, [
                                                    'title' => Yii::t('app', 'Update Classified'),
                                        ]);
                                    },
                                            'delete' => function ($url, $model) {
                                        $options = [
                                            'title' => Yii::t('yii', 'Delete'),
                                            'aria-label' => Yii::t('yii', 'Delete'),
                                            'data-confirm' => Yii::t('yii', 'Are you sure you want to delete this item?'),
                                            'data-method' => 'post',
                                            'data-pjax' => '0',
                                        ];
                                        return Html::a('<span class="glyphicon glyphicon-trash"></span>', $url, $options);
                                    },
                                        ],
                                        'urlCreator' => function ($action, $model, $key) {
                                    if ($action === 'detail-classified') {
                                        $url = \yii\helpers\Url::toRoute(['classified/detail-classified', 'id' => $model->id]);
                                        return $url;
                                    } else if ($action === 'update-classified') {
                                        $url = \yii\helpers\Url::toRoute(['classified/update-classified', 'id' => $model->id]);
                                        return $url;
                                    } else if ($action === 'delete') {
                                        $url = \yii\helpers\Url::toRoute(['classified/delete', 'id' => $model->id]);
                                        return $url;
                                    }
                                }
                                    ],
                                ],
                            ]);
                            ?>

                </div>

            </div>
        </div>
    </div>
</div>