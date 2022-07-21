<?php

use app\assets\AppAsset;
use kartik\date\DatePicker;
use yii\helpers\Html;
use yii\widgets\ActiveForm;
use kartik\depdrop\DepDrop;
use yii\helpers\Url;
use kartik\select2\Select2;



/* @var $this yii\web\View */
/* @var $model app\models\Basecalculo */
/* @var $form yii\widgets\ActiveForm */
?>

<?php $form = ActiveForm::begin(); ?>
<div class="basecalculo-form">
    <div class="row">
        <div class="col-md-12">
            <div class="card card-primary">
                <div class="card-header">
                    <h3><?= Html::encode($this->title) ?></h3>
                </div>
                <div class="card-body" >
                    <div class="row">
                        <div class="col-md-3">
                            <?= $form->field($model, 'id_tipo')->widget(Select2::classname(), [
                            'data' => $lista_tipo,
                            'options' => ['id'=>'id_tipo', 'placeholder' => 'Seleccionar...'],
                            'pluginOptions' => [
                            'allowClear' => true
                            ],
                            ]) ?>
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
                            <?= $form->field($model, 'id_accion')->widget(DepDrop::classname(), [
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
                            <?= $form->field($model, 'id_actividad')->widget(DepDrop::classname(), [
                            'type' => DepDrop::TYPE_SELECT2,
                            'data' => [2 => ''],
                            'options' => ['id' => 'idactividad', 'placeholder' => 'Seleccione...'],
                            'select2Options' => ['pluginOptions' => ['allowClear' => true]],
                            'pluginOptions'=>[
                                'depends'=>['idaccionespecifica'],
                                'url' => Url::to(['actividades']),
                                'params' => ['input-type-1', 'input-type-2']
                                ]
                            ]) ?>
                        </div>
                    </div>
                    <div class="row">
                            <div class="col-md-3">
                                <?= $form->field($model, 'fecha_i')->widget(DatePicker::classname(), [
                                'options' => ['placeholder' => 'Fecha de Inicio...'],
                                'pluginOptions' => [
                                    'autoclose' => true,
                                ]
                                ]);
                                ?>
                            </div>
                            <div class="col-md-3">
                                <?= $form->field($model, 'fecha_f')->widget(DatePicker::classname(), [
                                'options' => ['placeholder' => 'Fecha de Fin...'],
                                'pluginOptions' => [
                                    'autoclose' => true,
                                ]
                                ]);
                                ?>
                            </div>
                            <div class="col-md-3">
                                <?= $form->field($model, 'ponderacion')->textInput() ?>
                            </div>
                            <div class="col-md-3">
                             <?= $form->field($model, 'id_producto')->widget(Select2::classname(), [
                            'data' => $lista_producto,
                            'options' => [
                                'id'=>'id_producto', 
                                'placeholder' => 'Seleccionar...',
                                'onchange'=>'$.post( "'.Yii::$app->urlManager->createUrl('basecalculo/costos?id=').'"+$(this).val(), function( data ) {
                                    dato = data.split("$$");
                                    $( "#basecalculo-costo").val( dato[0] );
                                    $( "#basecalculo-iva").val( dato[1] );
                                    $( "#tabla-datos").show();
                                });',
                               
                             ],
                            'pluginOptions' => [
                                'allowClear' => true
                            ],
                            ]) ?>
                        </div>
                    </div>
                    <div id="tabla-datos" style="display: none;">
                        
                    <div class="row">
                        <div class="col-md-4">
                            <?= $form->field($model, 'id_partida')->widget(DepDrop::classname(), [
                            'type' => DepDrop::TYPE_SELECT2,
                            'data' => [2 => ''],
                            'options' => ['id' => 'id_partida', 'placeholder' => 'Seleccione...'],
                            'select2Options' => ['pluginOptions' => ['allowClear' => true]],
                            'pluginOptions'=>[
                                'depends'=>['id_generica'],
                                'url' => Url::to(['partidas']),
                                'params' => ['input-type-1', 'input-type-2']
                                ]
                            ]) ?>
                        </div>
                        <div class="col-md-4">
                            <?= $form->field($model, 'id_generica')->widget(DepDrop::classname(), [
                            'type' => DepDrop::TYPE_SELECT2,
                            'data' => [2 => ''],
                            'options' => ['id' => 'id_generica', 'placeholder' => 'Seleccione...'],
                            'select2Options' => ['pluginOptions' => ['allowClear' => true]],
                            'pluginOptions'=>[
                                'depends'=>['id_especifico'],
                                'url' => Url::to(['genericas']),
                                'params' => ['input-type-1', 'input-type-2']
                                ]
                            ]) ?>
                        </div>
                        <div class="col-md-4">
                            <?= $form->field($model, 'id_especifico')->widget(DepDrop::classname(), [
                            'type' => DepDrop::TYPE_SELECT2,
                            'data' => [2 => ''],
                            'options' => ['id' => 'id_especifico', 'placeholder' => 'Seleccione...'],
                            'select2Options' => ['pluginOptions' => ['allowClear' => true]],
                            'pluginOptions'=>[
                                'depends'=>['id_producto'],
                                'url' => Url::to(['especificos']),
                                'params' => ['input-type-1', 'input-type-2']
                                ]
                            ]) ?>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-3">
                            <?= $form->field($model, 'cantidad')->textInput() ?>
                        </div> 
                        <div class="col-md-3">
                            <?= $form->field($model, 'id_medida')->widget(DepDrop::classname(), [
                            'type' => DepDrop::TYPE_SELECT2,
                            'data' => [2 => ''],
                            'options' => ['id' => 'idmedida', 'placeholder' => 'Seleccione...'],
                            'select2Options' => ['pluginOptions' => ['allowClear' => true]],
                            'pluginOptions'=>[
                                'depends'=>['id_producto'],
                                'url' => Url::to(['medidas']),
                                'params' => ['input-type-1', 'input-type-2']
                                ]
                            ]) ?>
                        </div>
                        <div class="col-md-3">
                            <?= $form->field($model, 'costo')->textInput(['readonly' => true]) ?>
                        </div>
                        <div class="col-md-3">
                            <?= $form->field($model, 'iva')->textInput(['readonly' => true]) ?>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-4">
                            <?= $form->field($model, 'monto_total')->textInput(['readonly' => true]) ?>
                        </div>
                        <div class="col-md-4">
                            <?= $form->field($model, 'iva_monto')->textInput(['readonly'=> true]) ?>
                        </div>
                        <div class="col-md-4">
                            <?= $form->field($model, 'total_iva')->textInput(['readonly'=> true]) ?>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-4"></div>
                        <div class="col-md-4">
                            <h5><b>Distribucion mensual del Gasto</b></h5>
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
                    <div class="col-md-12">
                        <?= Html::submitButton('Guardar', ['class' => 'btn btn-warning btn-send']) ?>
                    </div>

                    </div>
                </div>
            </div>
        </div>
    </div>    
</div>
<?php ActiveForm::end(); ?>
