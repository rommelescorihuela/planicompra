<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\Actividades */

$this->title = 'Crear Actividades';
$this->params['breadcrumbs'][] = ['label' => 'Actividades', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="actividades-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
        'lista_tipo' => $lista_tipo,

    ]) ?>

</div>
