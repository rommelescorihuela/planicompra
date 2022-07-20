<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
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

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [ 
            'tipo.tipo',
            'idpoa0.descripcion',
            'descripcion:ntext',            
			'idgerencia0.gerencia',
            'poderacion',
           'fechainicio',
           'fechafin',
           'servicio',
           'unidadmedida',
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
