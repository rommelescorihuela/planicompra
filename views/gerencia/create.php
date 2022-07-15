<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\Gerencia */

$this->title = 'Crear Gerencia';
$this->params['breadcrumbs'][] = ['label' => 'Gerencias', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="gerencia-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
