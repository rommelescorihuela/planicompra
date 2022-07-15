<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\models\Usuario */

$this->title = 'Usuario';
$this->params['breadcrumbs'][] = ['label' => 'Usuarios', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
\yii\web\YiiAsset::register($this);
?>
<div class="usuario-view">

    <p>
        <?= Html::a('Editar', ['update', 'id' => $model->id_usuario], ['class' => 'btn btn-primary']) ?>
    </p>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            [
                'label' => 'Nombre y apellido',
                'value' => function($model){
                    return $model->nombre.' '.$model->apellido;
                }
            ],
            'cedula',
            'correo',
            'cargo',
            'gerencia.gerencia',
            //'id_usuario',
            'username',
            //'password',
            'perfil.descripcion',
            [
                'attribute' => 'estatu',
                'value' => function($model){
                   if ($model->estatu == 1){
                    return 'ACTIVO';
                   } else{
                    return 'INACTIVO';
                   }
                }
            ],
            //'auth_key',
        ],
    ]) ?>

</div>
