<div class="container">
    <div class="search-row">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12">
                    <?php
                    $form = yii\widgets\ActiveForm::begin([
                                'action' => ['/g-search/gsearch'],
                                'method' => 'get',
                                'options' => [
                                    'class' => 'form-inline',
                                    'style' => 'margin: 0 auto; float: none; width: 70%'
                                ]
                    ]);
                    ?>

                    <div class="form-group">
                        <?= $form->field($searchModel, 'cat')
                                ->dropDownList(common\models\Category::getHierarchy(), 
                                        [
                                            'prompt' => '-- All Category --', 
                                            'class' => 'form-control input-lg', 
                                            'style' => 'width: 250px;'
                                        ])
                                ->label(false) ?>
                    </div>
                    <div class="form-group">
                        <?= $form->field($searchModel, 'keyword')->textInput(['class' => 'form-control input-lg', 'autocomplete' => 'off', 'style' => 'width: 420px;'])->label(false) ?>
                    </div>
                    <?= yii\helpers\Html::button('<span class="fa fa-search"></span> Search', ['class' => 'btn btn-lg btn-orange tooltip-test mainserarchsubmit', 'style' => 'margin-top: -10px;', 'type' => 'submit']) ?>

                    <?php \yii\widgets\ActiveForm::end(); ?>
                </div>
            </div>
        </div>
    </div>
</div>