<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\models\Basecalculo */

$this->title = 'Base de Calculo';
$this->params['breadcrumbs'][] = ['label' => 'Basecalculos', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
\yii\web\YiiAsset::register($this);
?>
<div class="basecalculo-view">

    <p>
        <?= Html::a('Editar', ['update', 'id' => $model->id_plan], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('Eliminar', ['delete', 'id' => $model->id_plan], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => '¿Estas seguro de eliminar este registro?',
                'method' => 'post',
            ],
        ]) ?>
    </p>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'poa.descripcion',
            'accion.descripcion',
            'actividad.descripcion',
            'producto.producto',
            'medida.medida',
            'cantidad',
            'monto_total',
            'gerencia.gerencia',
            'fecha_i',
            'fecha_f',
            'ponderacion',
            'partida.descripcion',
            'generica.descripcion',
            'especifico.descripcion',
            'costo',
            'id_usuario',
            'iva',
            'total_iva',
            'iva_monto',
            'estatus:boolean',
            'enero',
            'febrero',
            'marzo',
            'abril',
            'mayo',
            'junio',
            'julio',
            'agosto',
            'septiembre',
            'octubre',
            'noviembre',
            'diciembre',
        ],
    ]) ?>

</div>
