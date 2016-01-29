<?php

$params = array_merge(
        require(__DIR__ . '/../../common/config/params.php'), require(__DIR__ . '/../../common/config/params-local.php'), require(__DIR__ . '/params.php'), require(__DIR__ . '/params-local.php')
);

return [
    'id' => 'app-backend',
    'name' => 'diadoo',
    //'homeUrl' => '/d-admin', // hosting config
    'basePath' => dirname(__DIR__),
    'controllerNamespace' => 'backend\controllers',
    'bootstrap' => ['log'],
    'modules' => [
        // Configuration Yii2-user
        'user' => [
            'as backend' => 'dektrium\user\filters\BackendFilter',
            'controllers' => ['registration'], // not allowed controller in 'backend'
            'enableUnconfirmedLogin' => true,
            'confirmWithin' => 21600,
            'cost' => 12,
            'admins' => ['sysadmin'],
            // Override Model Yii2-user
            'modelMap' => [
                'Account' => 'backend\models\Account',
                'LoginForm' => 'backend\models\LoginForm',
                'Profile' => 'backend\models\Profile',
                'RecoveryForm' => 'backend\models\RecoveryForm',
                'RegistrationForm' => 'backend\models\RegistrationForm',
                'ResendForm' => 'backend\models\ResendForm',
                'SettingsForm' => 'backend\models\SettingsForm',
                'Token' => 'backend\models\Token',
                'User' => 'backend\models\User',
                'UserSearch' => 'backend\models\UserSearch',
            ],
            // Overide Controller Yii2-user
            'controllerMap' => [
                'profile' => 'backend\controllers\user\ProfileController',
                'recovery' => 'backend\controllers\user\RecoveryController',
                'registration' => 'backend\controllers\user\RegistrationController',
                'security' => 'backend\controllers\user\SecurityController',
                'settings' => 'backend\controllers\user\SettingsController',
                'admin' => 'backend\controllers\user\AdminController',
            ],
        ],
    // End Configuration Yii2-user
    ],
    'components' => [
	// hosting config
	//'request' => [
         //   'baseUrl' => '/admin',
       // ],
	// hosting config
       // 'urlManager' => [
        //    'enablePrettyUrl' => true,
        //    'showScriptName' => false,
       // ],
        // Session on one domain yii2-user
        'user' => [
            'identityCookie' => [
                'name' => '_backendIdentity',
                'path' => 'http://localhost/ta/diadoo/backend/web/',
                'httpOnly' => true,
            ],
        ],
        'session' => [
            'name' => 'BACKENDSESSID',
            'cookieParams' => [
                'httpOnly' => true,
                'path' => 'http://localhost/ta/diadoo/backend/web/',
            ],
        ],
        // End session on one domain yii2-user
        // Overide view yii2-user
        'view' => [
            'theme' => [
                'pathMap' => [
                    '@dektrium/user/views' => '@app/views/user',
                ],
            ],
        ],
        // End overide view yii2-user
        'log' => [
            'traceLevel' => YII_DEBUG ? 3 : 0,
            'targets' => [
                [
                    'class' => 'yii\log\FileTarget',
                    'levels' => ['error', 'warning'],
                ],
            ],
        ],
        'errorHandler' => [
            'errorAction' => 'site/error',
        ],
        'assetManager' => [
            'bundles' => [
                'dmstr\web\AdminLteAsset' => [
                    'skin' => 'skin-blue',
                ],
            ],
        ],
    ],
    'as access' => [
            'class' => 'mdm\admin\components\AccessControl',
            'allowActions' => [
                'site/*',
                //'admin/*',
                //'/user/admin/*',
               // 'gii/*',
                //'debug/*',
            ]
        ],
    'params' => $params,
];
