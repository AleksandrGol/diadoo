<?php

namespace frontend\controllers;

use Yii;
use common\models\Classified;
//use common\models\search\ClassifiedSearch;
use common\models\ClassifiedImage;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\web\UploadedFile;
use common\models\ClassifiedGuest;

/**
 * ClassifiedController implements the CRUD actions for Classified model.
 */
class ClassifiedController extends Controller {

    public function behaviors() {
        return [
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'delete' => ['post'],
                ],
            ],
        ];
    }

    /**
     * PostClassified
     * Status : Oke
     * @return mixed
     */
    public function actionPostClassified() {
        $modelClassified = new Classified();
        $modelImage = [new ClassifiedImage];
        $modelClassifiedGuest = new ClassifiedGuest();

        if (\Yii::$app->user->isGuest) {
            if ($modelClassifiedGuest->load(Yii::$app->request->post())) {
                $length = rand(1111111111, 99999999999);
                $modelClassifiedGuest->id = $length;
                if ($modelClassifiedGuest->save()) {
                    if ($modelClassified->load(\Yii::$app->request->post())) {

                        $modelImage = \common\models\Model::createMultiple(ClassifiedImage::className());
                        \common\models\Model::loadMultiple($modelImage, \Yii::$app->request->post());


                        //ajax validation
                        if (\Yii::$app->request->isAjax) {
                            \Yii::$app->response->format = \yii\web\Response::FORMAT_JSON;
                            return \yii\helpers\ArrayHelper::merge(
                                    \yii\widgets\ActiveForm::validateMultiple($modelImage), 
                                    \yii\widgets\ActiveForm::validate($modelClassified)
                            );
                    }else{
                        echo 'salah 3';
                    }

                        // validate all
                        $valid = $modelClassified->validate();
                        $valid = \common\models\Model::validateMultiple($modelImage) && $valid;

                        $modelClassified->create_at = new \yii\db\Expression('NOW()');
                        $modelClassified->update_at = new \yii\db\Expression('NOW()');
                        $modelClassified->user_id = $modelClassifiedGuest->id;
                        $modelClassified->is_status = 1;
                        $modelClassified->type = 0; // 1 = login; 0 = guest

                        if ($valid) {
                            $transaction = \Yii::$app->db->beginTransaction();
                            try {
                                if ($flag = $modelClassified->save(false)) {

                                    foreach ($modelImage as $i => $modelImage) {
                                        $modelImage->classified_id = $modelClassified->id;

                                        $name = Yii::$app->security->generateRandomString();
                                        $modelImage->imageFile = UploadedFile::getInstance($modelImage, "[$i]imageFile");

                                        $modelImage->imageFile->saveAs('uploads/classified/' . $name . '.' . $modelImage->imageFile->extension); //Upload files to server
                                        ////save path in db column
                                        $modelImage->image = 'uploads/classified/' . $name . '.' . $modelImage->imageFile->extension;

                                        if (!($flag = $modelImage->save(false))) {
                                            $transaction->rollBack();
                                            break;
                                        }
                                    }
                                }  else {
                                echo 'salah 2';
                                }
                                if ($flag) {
                                    $transaction->commit();
                                    \Yii::$app->getSession()->setFlash('success', '<div class="alert d-alert-success" role="alert"><b>Thank you, your ads successfully saved!</b></div>');
                                    return $this->redirect(['success', 'id' => $modelClassified->id]);
                                }
                            } catch (Exception $ex) {
                                $transaction->rollBack();
                            }
                        }
                    }else{
                        echo 'ada salah 1';
                    }
                }
            } else {
                return $this->render('guest/post-classified', [
                            'modelClassifiedGuest' => $modelClassifiedGuest,
                            'modelClassified' => $modelClassified,
                            'modelImage' => (empty($modelImage)) ? [new ClassifiedImage()] : $modelImage
                ]);
            }
        } else {
            if ($modelClassified->load(\Yii::$app->request->post())) {

                $modelImage = \common\models\Model::createMultiple(ClassifiedImage::className());
                \common\models\Model::loadMultiple($modelImage, \Yii::$app->request->post());


                //ajax validation
                if (\Yii::$app->request->isAjax) {
                    \Yii::$app->response->format = \yii\web\Response::FORMAT_JSON;
                    return \yii\helpers\ArrayHelper::merge(
                                    \yii\widgets\ActiveForm::validateMultiple($modelImage), 
                            \yii\widgets\ActiveForm::validate($modelClassified)
                    );
                }

                // validate all
                $valid = $modelClassified->validate();
                $valid = \common\models\Model::validateMultiple($modelImage) && $valid;

                $modelClassified->create_at = new \yii\db\Expression('NOW()');
                $modelClassified->update_at = new \yii\db\Expression('NOW()');
                $modelClassified->user_id = Yii::$app->user->identity->id;
                $modelClassified->is_status = 1;
                $modelClassified->type = 1; // 1 = member ; 0 = guest

                if ($valid) {
                    $transaction = \Yii::$app->db->beginTransaction();
                    try {
                        if ($flag = $modelClassified->save(false)) {

                            foreach ($modelImage as $i => $modelImage) {
                                $modelImage->classified_id = $modelClassified->id;

                                $name = Yii::$app->security->generateRandomString();
                                $modelImage->imageFile = UploadedFile::getInstance($modelImage, "[$i]imageFile");

                                $modelImage->imageFile->saveAs('uploads/classified/' . $name . '.' . $modelImage->imageFile->extension); //Upload files to server
                                ////save path in db column
                                $modelImage->image = 'uploads/classified/' . $name . '.' . $modelImage->imageFile->extension;

                                if (!($flag = $modelImage->save(false))) {
                                    $transaction->rollBack();
                                    break;
                                }
                            }
                        }
                        if ($flag) {
                            $transaction->commit();
                            \Yii::$app->getSession()->setFlash('success', '<div class="alert d-alert-success" role="alert"><b>Thank you, your ads successfully saved!</b></div>');
                            return $this->redirect(['success', 'id' => $modelClassified->id]);
                        }
                    } catch (Exception $ex) {
                        $transaction->rollBack();
                    }
                }
            } else {
                return $this->render('post-classified', [
                            'modelClassifiedGuest' => $modelClassifiedGuest,
                            'modelClassified' => $modelClassified,
                            'modelImage' => (empty($modelImage)) ? [new ClassifiedImage()] : $modelImage
                ]);
            }
        }
    }
    
    public function actionUpdateClassified($id) {
        $modelClassified = Classified::findOne($id);
        $modelImage = ClassifiedImage::find()->where(['classified_id' => $id])->all();
        //$modelImage = $modelClassified->id;

        if ($modelClassified->load(Yii::$app->request->post())) {

            $modelClassified->is_status = 0;
            $modelClassified->update_at = new \yii\db\Expression('NOW()');
            
            $oldIDs = \yii\helpers\ArrayHelper::map($modelImage, 'id', 'classified_id');
            print_r($oldIDs);
            $modelImage = \common\models\Model::createMultiple(ClassifiedImage::classname(), $modelImage);
            \common\models\Model::loadMultiple($modelImage, Yii::$app->request->post());
            $deletedIDs = array_diff($oldIDs, array_filter(\yii\helpers\ArrayHelper::map($modelImage, 'id', 'classified_id')));

            // ajax validation
            if (Yii::$app->request->isAjax) {
                Yii::$app->response->format = \yii\web\Response::FORMAT_JSON;
                return \yii\helpers\ArrayHelper::merge(
                                \yii\widgets\ActiveForm::validateMultiple($modelImage), \yii\widgets\ActiveForm::validate($modelClassified)
                );
            }

            // validate all models
            $valid = $modelClassified->validate();
            $valid = \common\models\Model::validateMultiple($modelImage) && $valid;

            if ($valid) {
                $transaction = \Yii::$app->db->beginTransaction();
                try {
                    if ($flag = $modelClassified->save(false)) {
                        if (!empty($deletedIDs)) {
                            ClassifiedImage::deleteAll(['id' => $deletedIDs]);
                        }
                        foreach ($modelImage as $i => $modelImage) {
                            $modelImage->classified_id = $modelClassified->id;

                            if (empty($modelImage->imageFile)) {
                                $name = Yii::$app->security->generateRandomString();
                                $modelImage->imageFile = UploadedFile::getInstance($modelImage, "[$i]imageFile");

                                if ($modelImage->imageFile) {
                                    $modelImage->imageFile->saveAs('uploads/classified/' . $name . '.' . $modelImage->imageFile->extension); //Upload files to server
                                    ////save path in db column
                                    $modelImage->image = 'uploads/classified/' . $name . '.' . $modelImage->imageFile->extension;
                                    //$model->fileProfile->saveAs($model->image_profile);
                                }
                            }

                            if (!($flag = $modelImage->save(false))) {
                                $transaction->rollBack();
                                break;
                            }
                        }
                    }
                    if ($flag) {
                        $transaction->commit();
                        \Yii::$app->getSession()->setFlash('success', '<div class="alert d-alert-success" role="alert"><b>Thank you, your ads successfully update!</b></div>');
                        return $this->redirect(['success-update', 'id' => $modelClassified->id]);
                    }
                } catch (Exception $e) {
                    $transaction->rollBack();
                }
            }
        }

        return $this->render('update-classified', [
                    'modelClassified' => $modelClassified,
                    'modelImage' => (empty($modelImage)) ? [new ClassifiedImage()] : $modelImage
        ]);
    }
    
    /**
     * List
     * Status : Oke
     * @return mixed
     */
    public function actionList($id) {
        
        $sort = new \yii\data\Sort([
            'attributes' => [
                'create_at' => [
                    'asc' => ['create_at' => SORT_ASC],
                    'desc' => ['create_at' => SORT_DESC],
                    'default' => SORT_DESC,
                ],
            ],
        ]);


        //Pagination
        $queryPage = Classified::find()->where(['category_id' => $id]);
        $countQueryPage = clone $queryPage;
        $pagination = new \yii\data\Pagination(['totalCount' => $countQueryPage->count(), 'pageSize' => 10]);

        //Search
        $mainCategory = \common\models\MainCategory::find()->all();
        $searchModel = new \common\models\search\GSearch();
        $dataProvider = $searchModel->search(\Yii::$app->request->queryParams);


        //query model
        $query = new \yii\db\Query();
        $query->select([
                    'classified.id',
                    'classified.title',
                    'classified.description',
                    'classified.price',
                    'classified.create_at',
                    'classified.is_status',
                    'classified.type',
                    'classified.user_id',
                    'main_category.main_category',
                    'category.category',
                    'country.country',
                    'region.region',
                    'city.city'
                ])
                ->from('classified')
                ->join('JOIN', 'category', 'category.id = classified.category_id')
                ->join('JOIN', 'main_category', 'main_category.id = classified.main_category_id')
                ->join('JOIN', 'country', 'country.id = classified.country_id')
                ->join('JOIN', 'region', 'region.id = classified.region_id')
                ->join('JOIN', 'city', 'city.id = classified.city_id')
                //->join('JOIN', 'classified_free', 'classified_free.id = classified.user_id')
                ->where(['category_id' => $id, 'classified.is_status' => 1])
                ->offset($pagination->offset)
                ->limit($pagination->limit)
                ->orderBy($sort->orders)
                ->all();

        $command = $query->createCommand();
        $data = $command->queryAll();



        return $this->render('list', [
                    'data' => $data,
                    'sort' => $sort,
                    'pagination' => $pagination,
                    'maincategory' => $mainCategory,
                    'searchModel' => $searchModel,
                    'dataProvider' => $dataProvider
        ]);
    }
    
    /**
     * Detail
     * Status : Oke
     * @return mixed
     */
    public function actionDetailClassified($id) {
        $modelReport = new \common\models\ReportClassified();
        
        $query = new \yii\db\Query();
        $query->select([
                    'classified.id',
                    'classified.title',
                    'classified.description',
                    'classified.price',
                    'classified.create_at',
                    'classified.user_id',
                    'classified.type',
                    'main_category.main_category',
                    'category.category',
                    'country.country',
                    'region.region',
                    'city.city'
                ])
                ->from('classified')
                ->join('JOIN', 'category', 'category.id = classified.category_id')
                ->join('JOIN', 'main_category', 'main_category.id = classified.main_category_id')
                ->join('JOIN', 'country', 'country.id = classified.country_id')
                ->join('JOIN', 'region', 'region.id = classified.region_id')
                ->join('JOIN', 'city', 'city.id = classified.city_id')
                ->where(['classified.id' => $id])->all();

        $command = $query->createCommand();
        $data = $command->queryAll();

        return $this->render('detail-classified', [
                    'data' => $data,
                    'modelReport' => $modelReport,
        ]);
    }

    /**
     * MyList
     * Status : Oke
     * @return mixed
     */
    public function actionMyList() {
        $query = Classified::find()
                ->join('JOIN', 'category', 'category.id = classified.category_id')
                ->where(['user_id' => Yii::$app->user->identity->id]);

        $dataProvider = new \yii\data\ActiveDataProvider([
            'query' => $query,
            'pagination' => [
                'pageSize' => 20,
            ],
        ]);

        return $this->render('my-list', [
                    //'searchModel' => $searchModel,
                    //'model' => $model,
                    'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Success message
     * Status : Oke
     * @return mixed
     */
    public function actionSuccess($id) {

      return $this->render('success', [
                    'model' => $this->findModel($id),
        ]);
    }
    
    public function actionSuccessUpdate($id) {

      return $this->render('success-update', [
                    'model' => $this->findModel($id),
        ]);
    }
    
    

    public function actionDeleteimg($id, $field) {

        $img = $this->findModelImage($id)->$field;
        if ($img) {
            if (!unlink($img)) {
                return false;
            }
        }

        if ($img) {
            $img = $this->findModelImage($id)->delete();
        }

        return $this->redirect(Yii::$app->request->referrer);
    }
    
    protected function findModelImage($id) {
        if (($model = ClassifiedImage::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }

    /**
     * Deletes an existing Classified model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     */
    public function actionDelete($id) {
        $this->findModel($id)->delete();

        return $this->redirect(['my-list']);
    }

    /**
     * Finds the Classified model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return Classified the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id) {
        if (($model = Classified::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }

}
