
<div class="container" style="margin-top: 160px; text-align: center">
    <div class="col-lg-8 col-lg-offset-2">
        <?= Yii::$app->session->getFlash('success'); ?>
    <div style="font-size: 22px">
        <p>
            Iklan anda berhasil diperbarui. Iklan anda sedang dalam proses <b>verifikasi ulang</b> oleh team diadoo.com
        </p>
    </div>
        <br>
        <div>
            <?= yii\helpers\Html::a('View Your Classified', ['detail-classified', 'id' => $model->id], ['class' => 'btn btn-primary btn-large d-font-size']) ?>
            OR
            <?= yii\helpers\Html::a('Post New Classified', ['post-classified'], ['class' => 'btn btn-orange btn-large d-font-size']) ?>
        </div>
    </div>
</div>