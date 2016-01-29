<?php

namespace frontend\controllers;

use Yii;

use yii\web\Controller;
use common\models\MainCategory;


/**
 * Site controller
 */
class SiteController extends Controller {

    /**
     * @inheritdoc
     */
    public function actions() {
        return [
            'error' => [
                'class' => 'yii\web\ErrorAction',
            ],
            'captcha' => [
                'class' => 'yii\captcha\CaptchaAction',
                'fixedVerifyCode' => YII_ENV_TEST ? 'testme' : null,
            ],
        ];
    }

    /**
     * Displays homepage.
     *
     * @return mixed
     */
    public function actionIndex() {
        //$mainCategory = new MainCategory();
        // $category = new Category();
        //Search
        $mainCategory = MainCategory::find()->all();
        $searchModel = new \common\models\search\GSearch();
        $dataProvider = $searchModel->search(\Yii::$app->request->queryParams);

        return $this->render('index', [
                    'maincategory' => $mainCategory,
                    'searchModel' => $searchModel,
                    'dataProvider' => $dataProvider
        ]);
    }

public function actionAnnouncement(){
        return $this->render('announcement');
    }
}
