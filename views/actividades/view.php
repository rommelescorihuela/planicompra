<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\models\Actividades */

$this->title = 'Actividad';
$this->params['breadcrumbs'][] = ['label' => 'Actividades', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
\yii\web\YiiAsset::register($this);
?>
<div class="actividades-view">
    <p>
        <?= Html::a('Editar', ['update', 'id' => $model->idactividad], ['class' => 'btn btn-primary']) ?>
    </p>
</div>
<div class="row">
    <div class="col-12">
        <div class="card">
            <div class="card-header">
                <h3 class="card-title"><b>Resumen</b></h3>
            </div>
            <!-- /.card-header -->
            <div class="card-body table-responsive p-0">
                <table class="table table-hover">
                    <tbody>
                        <tr>
                            <td ><b>Categoría Presupuestaria:</b> <?= $model->tipo->tipo?></td>
                            <td ><b>Proyecto y/o Acción Centralizada:</b> <?=$model->poa->descripcion?></td>
                        </tr>
                        <tr>
                            <td ><b>Accion Especifica:</b> <?=$model->descripcion?></td>
                            <td ><b>Unidad Ejecutora:</b> <?=$model->gerencia->gerencia?></td>
                        </tr>
                    </tbody>
                </table>
                <table class="table table-hover">
                    <tbody>
                        <?php foreach($unidadmedida as $unidad):?>
                        <tr>
                            <td colspan="6"><b>Unidad de Medida:</b> <?= $unidad['unidadmedida']?></td>
                        </tr>
                        <tr>
                            <td><b>Enero:</b> <?=$unidad['enero']?></td>
                            <td><b>Febrero:</b> <?=$unidad['febrero']?></td>
                            <td><b>Marzo:</b> <?=$unidad['marzo']?></td>
                        </tr>
                        <tr>
                            <td><b>Abril:</b> <?=$unidad['abril']?></td>
                            <td><b>Mayo:</b> <?=$unidad['mayo']?></td>
                            <td><b>Junio:</b> <?=$unidad['junio']?></td>
                        </tr>
                        <tr>
                            <td><b>Julio:</b> <?=$unidad['julio']?></td>
                            <td><b>Agosto:</b> <?=$unidad['agosto']?></td>
                            <td><b>Septiembre:</b> <?=$unidad['septiembre']?></td>
                        </tr>
                        <tr>
                            <td><b>Octubre:</b> <?=$unidad['octubre']?></td>
                            <td><b>Noviembre:</b> <?=$unidad['noviembre']?></td>
                            <td><b>Diciembre:</b> <?=$unidad['diciembre']?></td>
                        </tr>
                        <?php endforeach?>
                    </tbody>
                </table>
            </div>
            <!-- /.card-body -->
        </div>
            <!-- /.card -->
    </div>
</div>