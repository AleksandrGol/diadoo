<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model common\models\Classified */

$this->title = Yii::t('app', 'Create Classified');
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Classifieds'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>

<div class="container" style="margin-top: 20px">
    <div class="row">
        <div class="col-lg-8">
            <div class="classified-create">

                <?=
                $this->render('_form', [
                    'modelClassified' => $modelClassified,
                    'modelImage' => $modelImage,
                    'modelClassifiedGuest' => $modelClassifiedGuest,
                ]);
                ?>

            </div>
        </div>
        <div class="col-lg-4">
            <div class="panel sidebar-panel" style="box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0 rgba(0, 0, 0, 0.12);">
                <div class="panel-heading">Tips Add Classified</div>
                <div class="panel-content">
                    <div class="panel-body text-left">
                        <div><i class="fa fa-check"></i> Use interesting titles.</div>
                        <br>
                        <div><i class="fa fa-check"></i> Fill a clear description.</div>
                        <br>
                        <div><i class="fa fa-check"></i> Choose a clear photo.</div>
                        <br>
                        <div><i class="fa fa-check"></i> Pray.</div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>
