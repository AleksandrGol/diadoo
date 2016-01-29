<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use wbraganca\dynamicform\DynamicFormWidget;

/* @var $this yii\web\View */
/* @var $model common\models\Classified */
/* @var $form yii\widgets\ActiveForm */
?>


<div class="box view-item">
    <div class="box-success">
        <div class="box-header" style="margin-bottom: 20px">
            <h3><i class="fa fa-thumbs-up"></i> Post Classified</h3>
        </div>
        <div class="box-body">
            <div class="classified-form-free">

                <?php
                $form = ActiveForm::begin([
                      'options' => [
                          'enctype' => 'multipart/form-data', 
                          'id' => 'dynamic-form'
                          ],
                ]);
                ?>

                <?= $form->field($modelClassified, 'title')->textInput(['maxlength' => true]) ?>

                <?= $form->field($modelClassified, 'description')->textarea(['rows' => 6]) ?>

                <!-- Main Category -->
                <?php $listDataMainCategory = \yii\helpers\ArrayHelper::map(common\models\MainCategory::find()->where(['is_status' => 1])->all(), 'id', 'main_category') ?>
                <?=
                $form->field($modelClassified, 'main_category_id')->dropDownList($listDataMainCategory, [
                    'prompt' => '-- Select Main Category --',
                    'onChange' => '
                        $.get("' . yii\helpers\Url::toRoute(['dependent/getcategory']) . '", { id: $(this).val() })
                                .done(function(data){
                                    $("#' . Html::getInputId($modelClassified, 'category_id') . '").html( data );
                                });'
                ]);
                ?>

                <!-- Category -->
                <?php $listDataCategory = \yii\helpers\ArrayHelper::map(common\models\Category::find()->where(['is_status' => 1])->all(), 'id', 'category') ?>
                <?php
                if (isset($modelClassified->category_id)) {
                    echo $form->field($modelClassified, 'category_id', ['inputOptions' => ['class' => 'form-control']])->dropDownList($listDataCategory, ['prompt' => '-- Select Category --']);
                } else {
                    echo $form->field($modelClassified, 'category_id')->dropDownList(['prompt' => '-- Select Category --']);
                }
                ?>

                <?php
                DynamicFormWidget::begin([
                    'widgetContainer' => 'dynamicform_wrapper', // required: only alphanumeric characters plus "_" [A-Za-z0-9_]
                    'widgetBody' => '.container-items', // required: css class selector
                    'widgetItem' => '.item', // required: css class
                    'limit' => 4, // the maximum times, an element can be cloned (default 999)
                    'min' => 1, // 0 or 1 (default 1)
                    'insertButton' => '.add-item', // css class
                    'deleteButton' => '.remove-item', // css class
                    'model' => $modelImage[0],
                    'formId' => 'dynamic-form',
                    'formFields' => [
                        'id',
                        'image',
                    ],
                ]);
                ?>
                <div class="container-items"><!-- widgetContainer -->
                    <?php foreach ($modelImage as $i => $modelImage): ?>
                        <div class="item panel panel-default"><!-- widgetBody -->
                            <div class="panel-heading">
                                <h3 class="panel-title pull-left">Image</h3>
                                <div class="pull-right">
                                    <button type="button" class="add-item btn btn-success btn-xs"><i class="glyphicon glyphicon-plus"></i></button>
                                    <button type="button" class="remove-item btn btn-danger btn-xs"><i class="glyphicon glyphicon-minus"></i></button>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                            <div class="panel-body">
                                <?php
                                // necessary for update action.
                                if (!$modelImage->isNewRecord) {
                                    echo Html::activeHiddenInput($modelImage, "[{$i}]id");
                                }
                                ?>

                                <?php
                                if (!$modelImage->isNewRecord) {

                                    echo Html::img($modelImage->image, ['class' => 'file-preview-image', 'style' => 'width: 250px;']) . "<br>";
                                    echo Html::a('Delete Image', ['deleteimg', 'id' => $modelImage->id, 'field' => 'image'], ['class' => 'btn btn-danger']) . '<p>';
                                    echo $form->field($modelImage, "[{$i}]imageFile")->fileInput();
                                } else {
                                    echo $form->field($modelImage, "[{$i}]imageFile")->fileInput();
                                }
                                ?>

                                <?php //echo $form->field($modelImage, "[{$i}]imageFile")->fileInput();  ?>
                            </div>
                        <?php endforeach; ?>
                    </div>
                    <?php DynamicFormWidget::end(); ?>

                    <!-- Country -->
                    <?php $listDataCountry = yii\helpers\ArrayHelper::map(common\models\Country::find()->where(['is_status' => 1])->all(), 'id', 'country') ?>

                    <?=
                    $form->field($modelClassified, 'country_id', ['inputOptions' => ['class' => 'form-control']])->dropDownList($listDataCountry, [
                        'prompt' => Yii::t('app', '-- Select Country --'),
                        'onchange' => '
                            $.get("' . yii\helpers\Url::toRoute(['dependent/getregion']) . '", { id: $(this).val() })
                                .done(function(data){
                                    $("#' . Html::getInputId($modelClassified, 'region_id') . '").html( data );
                                });'
                    ]);
                    ?>

                    <!-- Region -->
                    <?php $listDataRegion = yii\helpers\ArrayHelper::map(common\models\Region::find()->all(), 'id', 'region') ?>



                    <?php
                    echo $form->field($modelClassified, 'region_id')->dropDownList($listDataRegion, [
                        'prompt' => '-- Select Region --',
                        'onchange' => '
                            $.get("' . yii\helpers\Url::toRoute(['dependent/getcity']) . '", { id: $(this).val() })
                                .done(function(data){
                                    $("#' . Html::getInputId($modelClassified, 'city_id') . '").html( data );
                                });'
                    ]);
                    ?>

                    <!-- City -->
                    <?php $listDataCity = \yii\helpers\ArrayHelper::map(\common\models\City::find()->all(), 'id', 'city') ?>

                    <?php
                    if (isset($modelClassified->city_id)) {
                        echo $form->field($modelClassified, 'city_id')->dropDownList($listDataCity, ['prompt' => '-- Select City --']);
                    } else {
                        echo $form->field($modelClassified, 'city_id')->dropDownList(['prompt' => Yii::t('app', '--- Select City ---')]);
                    }
                    ?>


                    <?= $form->field($modelClassified, 'price')->textInput() ?>



                    <?php if (Yii::$app->user->isGuest) { ?>

                        <div style="padding-top: 15px; padding-bottom: 15px">
                            <hr>
                            <h3><i class="fa fa-user"></i> User Information</h3>
                        </div>
                        <?php echo $form->field($modelClassifiedGuest, 'name')->textInput() ?>

                        <?php echo $form->field($modelClassifiedGuest, 'email')->textInput() ?>

                        <?php echo $form->field($modelClassifiedGuest, 'phone')->textInput() ?>

                        <?php
                    }
                    ?>

                    <div class="form-group">
                        <?= Html::submitButton($modelClassified->isNewRecord ? Yii::t('app', 'Post Classified') : Yii::t('app', 'Update Classified'), ['class' => $modelImage->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
                    </div>

                    <?php ActiveForm::end(); ?>

                </div>
            </div>
        </div>
    </div>
</div>
<br>
<br>
