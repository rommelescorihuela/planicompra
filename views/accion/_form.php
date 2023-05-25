<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use kartik\depdrop\DepDrop;
use yii\helpers\Url;
use kartik\date\DatePicker;
use kartik\select2\Select2;
use app\models\Poa;
use app\models\Tipo;
use yii\helpers\ArrayHelper;




/* @var $this yii\web\View */
/* @var $model app\models\Accion */
/* @var $form yii\widgets\ActiveForm */
?>
<?php $form = ActiveForm::begin(["id" =>"formulario-ae"]); ?>
<div class="accion-form">
    <div class="row">
        <div class="col-md-12">
            <div class="card card-primary">
                <div class="card-header">
                    <h3><?= Html::encode($this->title) ?></h3>
                </div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-md-3">
                            <?= $form->field($model, 'id_tipo')->dropDownList(ArrayHelper::map(Tipo::find()->orderBy('tipo')->where(['id_tipo' => 2])->all(), 'id_tipo', 'tipo'), ['id'=>'id_tipo', 'prompt' => 'Seleccionar'])->label('Categoría Presupuestaria'); ?>
                        </div>
        
                        <div class="col-md-4">
                            <?= $form->field($model, 'idpoa')->widget(DepDrop::classname(), [
                            'type' => DepDrop::TYPE_SELECT2,
                            'data' => ArrayHelper::map(Poa::find()->orderBy('idpoa')->all(), 'idpoa', 'descripcion'),
                            'options' => ['id' => 'idpoa', 'placeholder' => 'Seleccione...'],
                            'select2Options' => ['pluginOptions' => ['allowClear' => true]],
                            'pluginOptions'=>[
                                'depends'=>['id_tipo'],
                                'url' => Url::to(['poas']),
                                'params' => ['input-type-1', 'input-type-2']
                                ]
                            ]) ?>
                        </div>
                        <div class="col-md-3">
                            <?= $form->field($model, 'idgerencia')->widget(Select2::classname(), [
                            'data' => $listagerenci,
                            'options' => ['placeholder' => 'Seleccionar...', 'disabled' => Yii::$app->user->identity->id_perfil == 2 ? true : false],
                                'pluginOptions' => [
                                'allowClear' => true
                                ],
                            ])->label('Unidad ejecutora') ?>
                        </div>
                        <div class="col-md-2">
                            <?= $form->field($model, 'unidadmedida')->textInput()->label('Unidad de medida') ?>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-3">
                            <?php echo $form->field($model, 'fechainicio')->widget(DatePicker::classname(), [
                                 'options' => ['placeholder' => 'Seleccione fecha...'],
                                 'pluginOptions' => [
                                     'autoclose' => true
                                 ]
                             ])->label('Inicio del plazo de ejecucion');?>
                        </div>
                        <div class="col-md-3">
                            <?php echo $form->field($model, 'fechafin')->widget(DatePicker::classname(), [
                                'options' => ['placeholder' => 'Seleccione fecha...'],
                                'pluginOptions' => [
                                    'autoclose' => true
                                ]
                            ])->label('Fin del plazo de ejecucion');?>
                        </div>
                        <div class="col-md-6">
                            <?= $form->field($model, 'descripcion')->textInput() ?>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-4"></div>
                        <div class="col-md-4">
                            <h5><b>Programacion fisica de la meta</b></h5>
                        </div>
                        <div class="col-md-4"></div>
                    </div>
                    <div class="row">
                        <div class="col-md-2">
                            <?= $form->field($model, 'cantidad')->textInput()->label('Cantidad Total de la Meta') ?>
                        </div>
                    </div>
                    <?php if($flag == 'update'):?>
                    <div id="meta" style="display: block;">
                    <?php else: ?>
                    <div id="meta" style="display: none;">
                    <?php endif ?>
                        <div class="row">
                            <div class="col-md-2"><?= $form->field($model, 'enero')->textInput() ?></div>
                            <div class="col-md-2"><?= $form->field($model, 'febrero')->textInput() ?></div>
                            <div class="col-md-2"><?= $form->field($model, 'marzo')->textInput() ?></div>
                            <div class="col-md-2"><?= $form->field($model, 'abril')->textInput() ?></div>
                            <div class="col-md-2"><?= $form->field($model, 'mayo')->textInput() ?></div>
                            <div class="col-md-2"><?= $form->field($model, 'junio')->textInput() ?></div>
                        </div>
                        <div class="row">
                             <div class="col-md-2"><?= $form->field($model, 'julio')->textInput() ?></div>
                             <div class="col-md-2"><?= $form->field($model, 'agosto')->textInput() ?></div>
                             <div class="col-md-2"><?= $form->field($model, 'septiembre')->textInput() ?></div>
                             <div class="col-md-2"><?= $form->field($model, 'octubre')->textInput() ?></div>
                             <div class="col-md-2"><?= $form->field($model, 'noviembre')->textInput() ?></div>
                             <div class="col-md-2"><?= $form->field($model, 'diciembre')->textInput() ?></div>
                        </div>  
                        <div class="form-group">
                            <?= Html::Button('Guardar', ['class' => 'btn btn-success','id'=>'guardar']) ?>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<?php ActiveForm::end(); ?>