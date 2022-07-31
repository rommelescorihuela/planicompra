<?php

use yii\helpers\Html;
//use yii\widgets\DetailView;
use kartik\detail\DetailView;

/* @var $tdis yii\web\View */
/* @var $model app\models\Accion */

$this->title = 'Accion Especifica';
$this->params['breadcrumbs'][] = ['label' => 'Accions', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
\yii\web\YiiAsset::register($this);
?>
<div class="accion-view">
    <p>
        <?= Html::a('Editar', ['update', 'id' => $model->id_accion], ['class' => 'btn btn-primary']) ?>
    </p>
</div>
<div class="row">
    <div class="col-12">
        <div class="card">
            <div class="card-header">
                <h3 class="card-title"><b>Resumen</b></h3>
                <div class="card-tools">
                    <div class="input-group input-group-sm" style="widtd: 150px;">
                        <div class="input-group-append">
                            <button type="submit" class="btn btn-default">
                                <i class="fas fa-search"></i>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /.card-header -->
            <div class="card-body table-responsive p-0">
                <table class="table table-hover text-nowrap">
                    <tbody>
                        <tr>
                            <td colspan="2"><b>Tipo:</b> <?= $model->tipo->tipo?></td>
                            <td colspan="2"><b>Accion Centralizada:</b> <?=$model->idpoa0->descripcion?></td>
                            <td colspan="2"><b>Accion Especifica:</b> <?=$model->descripcion?></td>
                        </tr>
                        <tr>
                            <td colspan="2"><b>Fecha de Inicio:</b> <?=$model->fechainicio?></td>
                            <td colspan="2"><b>Fecha de Fin:</b> <?=$model->fechafin?></td>
                            <td colspan="2"><b>Unidad de Medida:</b> <?=$model->unidadmedida?></td>
                        </tr>
                        <tr>
                            <td colspan="12" ><b>Programacion fisica de la meta</b></td>
                        </tr>
                        <tr>
                            <td><b>Enero:</b> <?=$model->enero?></td>
                            <td><b>Febrero:</b> <?=$model->febrero?></td>
                            <td><b>Marzo:</b> <?=$model->marzo?></td>
                            <td><b>Abril:</b> <?=$model->abril?></td>
                            <td><b>Mayo:</b> <?=$model->mayo?></td>
                            <td><b>Junio:</b> <?=$model->junio?></td>
                        </tr>
                        <tr>
                            <td><b>Julio:</b> <?=$model->julio?></td>
                            <td><b>Agosto:</b> <?=$model->agosto?></td>
                            <td><b>Septiembre:</b> <?=$model->septiembre?></td>
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