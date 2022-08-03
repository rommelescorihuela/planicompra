<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\Basecalculo */

$this->title = 'Crear Base de calculo';
$this->params['breadcrumbs'][] = ['label' => 'Basecalculos', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="basecalculo-create">


    <?= $this->render('_form', [
        'model' => $model,
        'lista_tipo' =>$lista_tipo,
        'lista_producto' =>$lista_producto,
        'flag' => $flag,
        'searchModel' => $searchModel,
        'dataProvider' => $dataProvider,
    ]) ?>

</div>
