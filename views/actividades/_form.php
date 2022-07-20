<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use kartik\depdrop\DepDrop;
use yii\helpers\Url;


/* @var $this yii\web\View */
/* @var $model app\models\Actividades */
/* @var $form yii\widgets\ActiveForm */
?>

<?php $form = ActiveForm::begin(); ?>
<div class="actividades-form">
    <div class="row">
        <div class="col-md-12">
            <div class="card card-primary">
                <div class="card-header">
                    <h3><?= Html::encode($this->title) ?></h3>
                </div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-md-4">
                            <?= $form->field($model, 'id_tipo')->dropDownList($lista_tipo, ['id'=>'id_tipo', 'prompt' => 'Seleccionar']); ?>
                        </div>
                        <div class="col-md-4">
                            <?= $form->field($model, 'id_poa')->widget(DepDrop::classname(), [
                            'type' => DepDrop::TYPE_SELECT2,
                            'data' => [2 => ''],
                            'options' => ['id' => 'idpoa', 'placeholder' => 'Seleccione...'],
                            'select2Options' => ['pluginOptions' => ['allowClear' => true]],
                            'pluginOptions'=>[
                                'depends'=>['id_tipo'],
                                'url' => Url::to(['poas']),
                                'params' => ['input-type-1', 'input-type-2']
                                ]
                            ]) ?>
                        </div>
                        <div class="col-md-4">
                            <?= $form->field($model, 'idaccionespecifica')->widget(DepDrop::classname(), [
                                'type' => DepDrop::TYPE_SELECT2,
                                'data' => [2 => ''],
                                'options' => ['id' => 'idaccionespecifica', 'placeholder' => 'Seleccione...'],
                                'select2Options' => ['pluginOptions' => ['allowClear' => true]],
                                'pluginOptions'=>[
                                    'depends'=>['idpoa'],
                                    'url' => Url::to(['accionespecif']),
                                    'params' => ['input-type-1', 'input-type-2']
                                    ]
                                ]) ?>
                        </div>                        
                    </div>
                    <div class="row">
                        <div class="col-md-4">
                            <?= $form->field($model, 'descripcion')->textinput(['rows' => 6]) ?>
                        </div>
                        <div class="col-md-4">
                            <?= $form->field($model, 'unidadmedida')->textinput(['rows' => 6]) ?>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-4"></div>
                        <div class="col-md-4">
                            <h5><b>Programacion mensual fisica de la meta</b></h5>
                        </div>
                        <div class="col-md-4"></div>
                    </div>
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

                </div>
            </div>
        </div>    
    </div>


    

    


    

    <div class="form-group">
        <?= Html::submitButton('Guardar', ['class' => 'btn btn-success']) ?>
    </div>


</div>
<?php ActiveForm::end(); ?>
