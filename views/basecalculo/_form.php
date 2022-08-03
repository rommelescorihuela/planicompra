<?php

use app\assets\AppAsset;
use kartik\date\DatePicker;
use yii\helpers\Html;
use yii\widgets\ActiveForm;
use kartik\depdrop\DepDrop;
use yii\helpers\Url;
use kartik\select2\Select2;
use yii\helpers\ArrayHelper;
use app\models\Poa;
use app\models\Accion;
use app\models\Actividades;
use app\models\Especifico;
use app\models\Generico;
use app\models\Partida;
use kartik\grid\GridView;
use app\models\Basecalculo;
use yii\grid\ActionColumn;
use yii\widgets\Pjax;



/* @var $this yii\web\View */
/* @var $model app\models\Basecalculo */
/* @var $form yii\widgets\ActiveForm */
?>
<?php
$form = ActiveForm::begin(['id'=>'basecalculo-formulario','options' => ['data-pjax' => true ]]); ?>
<div class="basecalculo-form">
    <div class="row">
        <div class="col-md-12">
            <div class="card card-primary">
                <div class="card-header">
                    <h3><?= Html::encode($this->title) ?></h3>
                </div>
                <div class="card-body" >
                    <div class="row">
                        <div class="col-md-2">
                            <?= $form->field($model, 'id_tipo')->dropDownList($lista_tipo, [
                                'id'=>'id_tipo', 
                                'prompt' => 'Seleccionar',
                            ]); ?>
                        </div>
                        <div class="col-md-3">
                            <?= $form->field($model, 'id_poa')->widget(DepDrop::classname(), [
                            'type' => DepDrop::TYPE_SELECT2,
                            'data' => ArrayHelper::map(Poa::find()->where(['id_tipo' =>$model->id_tipo])->orderBy('idpoa')->all(), 'idpoa', 'descripcion'),
                            'options' => [
                                'id' => 'idpoa', 
                                'placeholder' => 'Seleccione...',
                                
                                ],
                            'select2Options' => ['pluginOptions' => ['allowClear' => true]],
                            'pluginOptions'=>[
                                'depends'=>['id_tipo'],
                                'url' => Url::to(['poas']),
                                'params' => ['input-type-1', 'input-type-2']
                                ]
                            ]) ?>
                        </div>
                        <div class="col-md-2">
                            <?= $form->field($model, 'id_accion')->widget(DepDrop::classname(), [
                            'type' => DepDrop::TYPE_SELECT2,
                            'data' => ArrayHelper::map(Accion::find()->where(['idpoa' =>$model->id_poa])->orderBy('id_accion')->all(), 'id_accion', 'descripcion'),
                            'options' => ['id' => 'idaccionespecifica', 'placeholder' => 'Seleccione...'],
                            'select2Options' => ['pluginOptions' => ['allowClear' => true]],
                            'pluginOptions'=>[
                                'depends'=>['idpoa'],
                                'url' => Url::to(['accionespecif']),
                                'params' => ['input-type-1', 'input-type-2']
                                ]
                            ]) ?>
                        </div>
                        <div class="col-md-2">
                            <?= $form->field($model, 'id_actividad')->widget(DepDrop::classname(), [
                            'type' => DepDrop::TYPE_SELECT2,
                            'data' => ArrayHelper::map(Actividades::find()->where(['idactividad' =>$model->id_actividad])->orderBy('idactividad')->all(), 'idactividad', 'descripcion'),
                            'options' => ['id' => 'idactividad', 'placeholder' => 'Seleccione...'],
                            'select2Options' => ['pluginOptions' => ['allowClear' => true]],
                            'pluginOptions'=>[
                                'depends'=>['idaccionespecifica'],
                                'url' => Url::to(['actividades']),
                                'params' => ['input-type-1', 'input-type-2']
                                ]
                            ]) ?>
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
                            ])->label("Producto/Bien/Servicio") ?>
                        </div>
                    </div>
                    <?php if($flag == 'create'): ?>
                    <div id="tabla-datos" style="display: none;">
                    <?php elseif($flag == 'update'):?>
                    <div id="tabla-datos" style="display: block;">
                    <?php endif ?>
                    <div class="row">
                        <div class="col-md-4">
                            <?= $form->field($model, 'id_partida')->widget(DepDrop::classname(), [
                            'type' => DepDrop::TYPE_SELECT2,
                            'data' => ArrayHelper::map(Partida::find()->where(['id' =>$model->id_partida])->orderBy('id')->all(), 'id', 'descripcion'),
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
                            'data' => ArrayHelper::map(Generico::find()->where(['id_generico' =>$model->id_generica])->orderBy('id_generico')->all(), 'id_generico', 'descripcion'),
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
                            'data' => ArrayHelper::map(Especifico::find()->where(['id_especifico' =>$model->id_especifico])->orderBy('id_especifico')->all(), 'id_especifico', 'descripcion'),
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
                            <?= $form->field($model, 'iva')->textInput(['readonly' => true])->label("Iva(%)") ?>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-4">
                            <?= $form->field($model, 'monto_total')->textInput(['readonly' => true])->label("Subtotal") ?>
                        </div>
                        <div class="col-md-4">
                            <?= $form->field($model, 'iva_monto')->textInput(['readonly'=> true])->label("Iva") ?>
                        </div>
                        <div class="col-md-4">
                            <?= $form->field($model, 'total_iva')->textInput(['readonly'=> true])->label("Total") ?>
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
                        <div class="col-md-4">
                            <?= Html::Button('Borrar', ['id'=>'basecalculo-borrar','class' => 'btn btn-secondary btn-sm']) ?>
                        </div>
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
                        <?= Html::Button('Guardar', ['id'=>'basecalculo-guardar','class' => 'btn btn-warning btn-send']) ?>
                    </div>

                    </div>
                </div>
            </div>
        </div>
    </div>    
</div>
<?php ActiveForm::end(); ?>


 <?= GridView::widget([
        'id' => 'base-gridview',
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            [
                'attribute' => 'id_poa',
                'group' => true,
                'filter' => Select2::widget([
                    'model' =>  $searchModel,
                    'attribute' => 'id_poa',
                    'data' => Basecalculo::Lista_poa(),
                    'theme' => Select2::THEME_BOOTSTRAP,
                    'options' => [
                        'placeholder' => 'Seleccione...'
                        
                    ],
                    'pluginOptions' => ['allowClear' => true],

                 ]),
                 'value' =>'poa.descripcion',
            ],
            [
                'attribute' => 'id_accion',
                'filter' => Select2::widget([
                    'model' =>  $searchModel,
                    'attribute' => 'id_accion',
                    'data' => Basecalculo::Lista_accion(),
                    'theme' => Select2::THEME_BOOTSTRAP,
                    'options' => [
                        'placeholder' => 'Seleccione...'
                    ],
                    'pluginOptions' => ['allowClear' => true],

                 ]),
                 'value' =>'accion.descripcion',
            ],
            [
                'attribute' => 'id_actividad',
                'filter' => Select2::widget([
                    'model' =>  $searchModel,
                    'attribute' => 'id_actividad',
                    'data' => Basecalculo::Lista_actividad(),
                    'theme' => Select2::THEME_BOOTSTRAP,
                    'options' => [
                        'placeholder' => 'Seleccione...'
                    ],
                    'pluginOptions' => ['allowClear' => true],

                 ]),
                 'value' =>'actividad.descripcion',
            ],
            [
                'attribute' => 'id_producto',
                'filter' => Select2::widget([
                    'model' =>  $searchModel,
                    'attribute' => 'id_producto',
                    'data' => Basecalculo::Lista_producto(),
                    'theme' => Select2::THEME_BOOTSTRAP,
                    'options' => [
                        'placeholder' => 'Seleccione...'
                    ],
                    'pluginOptions' => ['allowClear' => true],

                 ]),
                 'value' =>'producto.producto',
            ],
            [
                'class' => ActionColumn::className(),
                'header'=>"Acciones",
                'template' => '{view}{update}{delete}  {pdf}',
                'buttons' => [
                    'pdf' => function($url, $model){
                        return Html::a('', ['pdf', 'id_plan' => $model->id_plan],['class'=>'fa fa-print 
                        ']);
                    }
                ]
                
            ],
        ],
    ]); 
?>
