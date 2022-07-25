<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use kartik\depdrop\DepDrop;
use yii\helpers\Url;
use wbraganca\dynamicform\DynamicFormWidget;



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
                        <div class="col-md-3">
                            <?= $form->field($model, 'id_tipo')->dropDownList($lista_tipo, ['id'=>'id_tipo', 'prompt' => 'Seleccionar']); ?>
                        </div>
                        <div class="col-md-3">
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
                        <div class="col-md-3">
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
                        <div class="col-md-3">
                            <?= $form->field($model, 'descripcion')->textinput(['rows' => 6]) ?>
                        </div>
                    </div>
                    <div class="row">
                        <?php DynamicFormWidget::begin([
                            'widgetContainer' => 'dynamicform_wrapper', // required: only alphanumeric characters plus "_" [A-Za-z0-9_]
                            'widgetBody' => '.container-items', // required: css class selector
                            'widgetItem' => '.item', // required: css class
                            'limit' => 4, // the maximum times, an element can be cloned (default 999)
                            'min' => 1, // 0 or 1 (default 1)
                            'insertButton' => '.add-item', // css class
                            'deleteButton' => '.remove-item', // css class
                            'model' => $modelsUnidadmedida[0],
                            'formId' => 'dynamic-form',
                            'formFields' => [
                                'unidadmedida',
                                'enero',
                                'febrero',
                                'marzo',
                                'abril',
                                'mayo',
                                'junio',
                                'agosto',
                                'septiembre',
                                'octubre',
                                'novimbre',
                                'diciembre',
                            ],
                        ]); ?>

                        <div class="panel-heading">
                            <h4><i class="glyphicon glyphicon-envelope"></i> Addresses
                                <button type="button" class="add-item btn btn-success btn-sm pull-right"><i class="glyphicon glyphicon-plus"></i> Add</button>
                            </h4>
                        </div>

                        <div class="container-items"><!-- widgetContainer -->
                            <?php foreach ($modelsUnidadmedida as $i => $modelUnidadmedida): ?>
                                <div class="item panel panel-default"><!-- widgetBody -->
                                    <div class="panel-heading">
                                        <h3 class="panel-title pull-left">Programacion fisica de la meta</h3>
                                        <div class="pull-right">
                                            <button type="button" class="add-item btn btn-success btn-xs"><i class="fa fa-plus"></i></button>
                                            <button type="button" class="remove-item btn btn-danger btn-xs"><i class="fa fa-minus"></i></button>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>
                                    <div class="panel-body">
                                        <?php
                                            // necessary for update action.
                                            if (! $modelUnidadmedida->isNewRecord) {
                                                echo Html::activeHiddenInput($modelUnidadmedida, "[{$i}]id");
                                            }
                                        ?>
                                        <?= $form->field($modelUnidadmedida, "[{$i}]unidadmedida")->textInput(['maxlength' => true]) ?>
                                        <div class="row">
                                            <div class="col-sm-2">
                                                <?= $form->field($modelUnidadmedida, "[{$i}]enero")->textInput(['maxlength' => true]) ?>
                                            </div>
                                            <div class="col-sm-2">
                                                <?= $form->field($modelUnidadmedida, "[{$i}]febrero")->textInput(['maxlength' => true]) ?>
                                            </div>
                                            <div class="col-sm-2">
                                                <?= $form->field($modelUnidadmedida, "[{$i}]marzo")->textInput(['maxlength' => true]) ?>
                                            </div>
                                            <div class="col-sm-2">
                                                <?= $form->field($modelUnidadmedida, "[{$i}]abril")->textInput(['maxlength' => true]) ?>
                                            </div>
                                            <div class="col-sm-2">
                                                <?= $form->field($modelUnidadmedida, "[{$i}]mayo")->textInput(['maxlength' => true]) ?>
                                            </div>
                                            <div class="col-sm-2">
                                                <?= $form->field($modelUnidadmedida, "[{$i}]junio")->textInput(['maxlength' => true]) ?>
                                            </div>
                                        </div><!-- .row -->
                                        <div class="row">
                                            <div class="col-sm-2">
                                                <?= $form->field($modelUnidadmedida, "[{$i}]julio")->textInput(['maxlength' => true]) ?>
                                            </div>
                                            <div class="col-sm-2">
                                                <?= $form->field($modelUnidadmedida, "[{$i}]agosto")->textInput(['maxlength' => true]) ?>
                                            </div>
                                            <div class="col-sm-2">
                                                <?= $form->field($modelUnidadmedida, "[{$i}]septiembre")->textInput(['maxlength' => true]) ?>
                                            </div>
                                            <div class="col-sm-2">
                                                <?= $form->field($modelUnidadmedida, "[{$i}]octubre")->textInput(['maxlength' => true]) ?>
                                            </div>
                                            <div class="col-sm-2">
                                                <?= $form->field($modelUnidadmedida, "[{$i}]noviembre")->textInput(['maxlength' => true]) ?>
                                            </div>
                                            <div class="col-sm-2">
                                                <?= $form->field($modelUnidadmedida, "[{$i}]diciembre")->textInput(['maxlength' => true]) ?>
                                            </div>
                                        </div><!-- .row -->
                                       
                                    </div>
                                </div>
                            <?php endforeach; ?>
                        </div>
                        <?php DynamicFormWidget::end(); ?>
                        
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
