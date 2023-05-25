<?php

use yii\helpers\Html;
//use yii\widgets\DetailView;
use kartik\detail\DetailView;

/* @var $tdis yii\web\View */
/* @var $model app\models\Accion */

$this->title = 'Accion Especifica';
//$this->params['breadcrumbs'][] = ['label' => 'Accions', 'url' => ['index']];
//$this->params['breadcrumbs'][] = $this->title;
\yii\web\YiiAsset::register($this);
?>

<div class="row">
    <div class="col-12">
        <div class="card">
            <div class="card-header">
                <div><h3 class="card-title"><b>Resumen</b></h3></div>
                <div class="float-right"><?= Html::a('Editar', ['update', 'id' => $model->id_accion], ['class' => 'btn btn-primary']) ?></div>
            </div>
            <!-- /.card-header -->
            <div class="card-body table-responsive p-0">
                <table class="table table-hover">
                    <tbody>
                        <tr>
                            <td ><b>Categoría Presupuestaria:</b> <br><?= $model->tipo->tipo?></td>
                            <td ><b>Denominación del Proyecto y/o Acción Centralizada:</b><br> <?=$model->idpoa0->descripcion?></td>
                        </tr>
                        <tr>
                            <td ><b>Accion Especifica:</b> <br><?=$model->descripcion?></td>
                            <td ><b>Unidad Ejecutora:</b> <br><?=$model->idgerencia0->gerencia?></td>
                        </tr>
                        <tr>
                            <td>
                                <b>Fecha de Inicio:</b> <?= date_format(date_create($model->fechainicio),"d-m-Y");?>&nbsp;&nbsp;&nbsp;
                                <b>Fecha de Fin:</b> <?= date_format(date_create($model->fechafin),"d-m-Y")?>
                            </td>
                            <td ><b>Unidad de Medida:</b> <?=$model->unidadmedida?></td>
                        </tr>
                    </tbody>
                </table>
                <table class="table table-hover text-nowrap">
                    <tbody>        
                        <tr>
                            <td colspan="3" ><b>Programacion fisica de la meta</b></td>
                        </tr>
                        <tr>
                            <td><b>Enero:</b> <?=$model->enero?></td>
                            <td><b>Febrero:</b> <?=$model->febrero?></td>
                            <td><b>Marzo:</b> <?=$model->marzo?></td>
                        </tr>
                        <tr>
                        </tr>
                        <tr>
                            <td><b>Abril:</b> <?=$model->abril?></td>
                            <td><b>Mayo:</b> <?=$model->mayo?></td>
                            <td><b>Junio:</b> <?=$model->junio?></td>
                        </tr>
                        <tr>
                            <td><b>Julio:</b> <?=$model->julio?></td>
                            <td><b>Agosto:</b> <?=$model->agosto?></td>
                            <td><b>Septiembre:</b> <?=$model->septiembre?></td>
                        </tr>
                        <tr>
                        </tr>
                        <tr>
                            <td><b>Octubre:</b> <?=$model->octubre?></td>
                            <td><b>Noviembre:</b> <?=$model->noviembre?></td>
                            <td><b>Diciembre:</b> <?=$model->diciembre?></td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <!-- /.card-body -->
        </div>
            <!-- /.card -->
    </div>
</div>