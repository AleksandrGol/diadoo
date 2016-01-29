<?php

$params = array_merge(
        require(__DIR__ . '/../../common/config/params.php'), require(__DIR__ . '/../../common/config/params-local.php'), require(__DIR__ . '/params.php'), require(__DIR__ . '/params-local.php')
);

return [
    'id' => 'app-frontend',
    'name' => 'diadoo',
    //'homeUrl' => '/', // hosting config
    'basePath' => dirname(__DIR__),
    'bootstrap' => ['log'],
    'controllerNamespace' => 'frontend\controllers',
    'modules' => [
        // Yii2-user configuration frontend
        'user' => [
            // following line will restrict access to admin controller from frontend application
            'as frontend' => 'dektrium\user\filters\FrontendFilter',
            'modelMap' => [
                'Account' => 'frontend\models\Account',
                'LoginForm' => 'frontend\models\LoginForm',
                'Profile' => 'frontend\models\Profile',
                'RecoveryForm' => 'frontend\models\RecoveryForm',
                'RegistrationForm' => 'frontend\models\RegistrationForm',
                'ResendForm' => 'frontend\models\ResendForm',
                'SettingsForm' => 'frontend\models\SettingsForm',
                'Token' => 'frontend\models\Token',
                'User' => 'frontend\models\User',
            ],
            'controllerMap' => [
                'profile' => 'frontend\controllers\user\ProfileController',
                'recovery' => 'frontend\controllers\user\RecoveryController',
                'registration' => 'frontend\controllers\user\RegistrationController',
                'security' => 'frontend\controllers\user\SecurityController',
                'settings' => 'frontend\controllers\user\SettingsController',
            ],
        ],
    ],
    'components' => [
/*
	// hosting config
	'request' => [
            'baseUrl' => '',
        ],
	// hosting config
        'urlManager' => [
	    'class' => 'yii\web\UrlManager',
            'enablePrettyUrl' => true,
            'showScriptName' => false,
	    'rules' => [
                '<controller:\w+>/<id:\d+>' => '<controller>/view',
                '<controller:\w+>/<action:\w+>/<id:\d+>' => '<controller>/<action>',
                '<controller:\w+>/<action:\w+>' => '<controller>/<action>',
                '<alias:register>' => 'user/registration/<alias>',
                '<alias:logout|login>' => 'user/security/<alias>'
            ],
        ],
*/
        'user' => [
            'identityCookie' => [
                'name' => '_frontendIdentity',
                'path' => 'http://diadoo.me/frontend/web/', //sesuaikan dimana file project anda disimpan
                'httpOnly' => true,
            ],
        ],
        'session' => [
            'name' => 'FRONTENDSESSID',
            'cookieParams' => [
                'httpOnly' => true,
                'path' => 'http://diadoo.me/frontend/web/', //sesuaikan dimana file project anda disimpan
            ],
        ],
        'view' => [
            'theme' => [
                'pathMap' => [
                    '@dektrium/user/views' => '@app/views/user',
                ],
            ],
        ],
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
        'authClientCollection' => [
            'class' => \yii\authclient\Collection::className(),
            'clients' => [
                'facebook' => [
                    'class' => 'dektrium\user\clients\Facebook',
                    'clientId' => '1547326xxxxxxxx', // clientId FB
                    'clientSecret' => 'c6190dcd3f310xxxxxxxxxxx', //clientSecret FB
                ],
                'twitter' => [
                    'class' => 'dektrium\user\clients\Twitter',
                    'consumerKey' => '5HK13urUrYHSgAxxxxxxxxxxxx', // cunsumerKey twitter
                    'consumerSecret' => 'thl4zLXiBASdewsQUFCCRBavhfYipEP3SeFxxxxxxxxx', // consumer secret twitter
                ],
//                'google' => [
//                    'class' => 'dektrium\user\clients\Google',
//                    'clientId' => '80130023845-8l37uxxxxxxxxxxxxx.apps.googleusercontent.com',
//                    'clientSecret' => 'xxxxxxxxxxxxR8-kQfThyA',
//                ],
            ],
        ],
    ],
    'params' => $params,
];
