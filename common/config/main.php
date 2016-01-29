<?php

return [
    'vendorPath' => dirname(dirname(__DIR__)) . '/vendor',
    'modules' => [
        // Yii2-admin
        //Yii2-admin Configuration Backend
        'admin' => [
            'class' => 'mdm\admin\Module',
            'controllerMap' => [
                'assignment' => [
                    'class' => 'mdm\admin\controllers\AssignmentController',
                    'userClassName' => 'dektrium\user\models\User',
                ],
            ],
        ],
        // Yii2-user
        'user' => [
            'class' => 'dektrium\user\Module',
            'mailer' => [
        'sender'                => 'deviardn@gmail.com', // or ['no-reply@myhost.com' => 'Sender name']
        'welcomeSubject'        => 'Welcome Diadoo',
        'confirmationSubject'   => 'Confirmation Diadoo',
        'reconfirmationSubject' => 'Email change Diadoo',
        'recoverySubject'       => 'Recovery Diadoo',
],
        ],
    ],
    'components' => [
        'cache' => [
            'class' => 'yii\caching\FileCache',
        ],
        // Yii2-admin DbManager
        'authManager' => [
            'class' => 'yii\rbac\DbManager',
        ],
        // Checked
        'checked' => [
            'class' => 'common\components\Checked'
        ],
        'urlManagerFrontend' => [
            'class' => 'yii\web\urlManager',
            'baseUrl' => 'http://diadoo.me/frontend/web/',
        ],
        'urlManagerBackend' => [
            'class' => 'yii\web\urlManager',
            'baseUrl' => 'http://diadoo.me/backend/web/',
        ],
        'urlManagerCommon' => [
            'class' => 'yii\web\urlManager',
            'baseUrl' => 'http://diadoo.me/common'
        ],
    ],
];
