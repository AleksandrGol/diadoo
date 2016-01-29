
<?= $this->render('_cover', ['modelCover' => $modelCover]); ?>

<div class="row">
    <div class="col-lg-12">
        <div class="panel">
            <div class="panel-heading text-center">

                <?php
                
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
                
                <?php foreach ($data as $row) { ?>

                    <?php if (empty($row['name'])) { ?>
                        <h2>Hello, I am <strong><?php foreach($dataUser as $dataUser){
                            echo $dataUser['username'];
                        } ?></strong></h2>
                    <?php } else { ?>
                        <h2>Hello, I am <strong><?= $row['name'] ?></strong></h2>
                    <?php } ?>
                    <p>Join date, <?= $row['created_at'] ?></p>
                    <p><?= $row['bio'] ?></p>

                <?php } ?>

<!--                <span>Klaten, Indonesia.</span>-->
            </div>
            <div class="panel-body">
<!--                <p>asdkfja falsfj aslf aslf asfa</p>-->
            </div>
        </div>
    </div>
</div>