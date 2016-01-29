
<?php echo $this->render('_cover', ['modelCover' => $modelCover]); ?>
<div class="row">
    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
        <div class="panel">
            <div class="panel-heading text-center">
                <h3 class="panel-title">Hello, This detail information for me : </h3>
            </div>
            <div class="panel-body">
                <div class="row">
                    <?php foreach ($data as $row) { ?>
                        <div class="col-md-3 col-lg-3 " align="center">
                            <?php if(!empty($row['image_profile'])){ ?>
                                <img alt="User Pic" src="<?= $row['image_profile'] ?>" class="img-thumbnail img-responsive" style="height: 300px"> 
                            <?php }else{ ?>
                                <img alt="User Pic" src="g-profile.png" class="img-thumbnail img-responsive" style="height: 300px"> 
                            <?php } ?>
                            
                        </div>
                        <div class=" col-md-9 col-lg-9 ">
                            <table class="table table-user-information">
                                <tbody>
                                    <tr>
                                        <td>You call me:</td>
                                        <td><?php
                                            if (empty($row['name'])) {
                                                echo "{empty}";
                                            } else {
                                                echo $row['name'];
                                            }
                                            ?></td>
                                    </tr>
                                    <tr>
                                        <td>Join date with diadoo:</td>
                                        <td><?php
                                            if (empty($row['created_at'])) {
                                                echo "{empty}";
                                            } else {
                                                echo $row['created_at'];
                                            }
                                            ?></td>
                                    </tr>

                                    <tr>
                                        <td>Gender</td>
                                        <td><?php
                                            if (empty($row['gender'])) {
                                                echo "{empty}";
                                            } else {
                                                if ($row['gender'] == 1) {
                                                    echo 'Male';
                                                } else {
                                                    echo 'Female';
                                                }
                                            }
                                            ?></td>
                                    </tr>
                                    <tr>
                                        <td>Home Address</td>
                                        <td><?= $row['city'] ?>, <?= $row['region'] ?>, <?= $row['country'] ?></td>
                                    </tr>
                                    <tr>
                                        <td>Email</td>
                                        <td><?php
                                            if (empty($row['public_email'])) {
                                                echo "{empty}";
                                            } else {
                                                echo $row['public_email'];
                                            }
                                            ?></td>
                                    </tr>
                                    <tr>
                                        <td>Phone Number</td>
                                        <td> <?php
                                            if (empty($row['phone_number'])) {
                                                echo "{empty}";
                                            } else {
                                                echo $row['phone_number'];
                                            }
                                            ?></td>
                                    </tr>

                                    <tr>
                                        <td>Social Media</td>
                                        <td>
                                            <div>
                                                <?php
                                                if (empty($row['facebook_url'])) {
                                                   // echo "{empty}";
                                                } else {
                                                    ?>
                                                    <a href="<?php echo $row['facebook_url'] ?>" class="btn btn-social-icon btn-facebook"><i class="fa fa-facebook"></i></a>
                                                <?php } ?>
                                                    
                                                <?php
                                                if (empty($row['twitter_url'])) {
                                                    //echo "{empty}";
                                                } else {
                                                    ?>
                                                    <a href="<?php echo $row['twitter_url'] ?>" class="btn btn-social-icon btn-twitter"><i class="fa fa-twitter"></i></a>
                                                    <?php } ?>
                                                    
                                                     <?php
                                                if (empty($row['instagram_url'])) {
                                                    //echo "{empty}";
                                                } else {
                                                    ?>
                                                    <a href="<?php echo $row['instagram_url'] ?>" class="btn btn-social-icon btn-instagram"><i class="fa fa-instagram"></i></a>
                                                    <?php } ?>
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>

                        </div>
                    <?php } ?>
                </div>
            </div>
        </div>
    </div>
</div>