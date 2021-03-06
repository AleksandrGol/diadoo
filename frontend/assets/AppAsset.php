<?php
/**
 * @link http://www.yiiframework.com/
 * @copyright Copyright (c) 2008 Yii Software LLC
 * @license http://www.yiiframework.com/license/
 */

namespace frontend\assets;

use yii\web\AssetBundle;

/**
 * @author Qiang Xue <qiang.xue@gmail.com>
 * @since 2.0
 */
class AppAsset extends AssetBundle
{
    public $basePath = '@webroot';
    public $baseUrl = '@web';
    public $css = [
        'dist/bootstrap/css/bootstrap.min.css',
        'dist/assets/css/style-custom.css',
        'dist/assets/css/style.css',
        'dist/assets/css/style-2.css',
        'dist/assets/css/d-custom.css',
        'dist/assets/css/d-custom-2.css',
        'dist/font-awesome-4.4.0/css/font-awesome.min.css',
        'css/user.profile.css',
        //'css/site.css',
    ];
    public $js = [
        'dist/assets/js/scripts.js',
    ];
    public $depends = [
        'yii\web\YiiAsset',
        'yii\bootstrap\BootstrapAsset',
        'yii\bootstrap\BootstrapPluginAsset'
    ];
}
