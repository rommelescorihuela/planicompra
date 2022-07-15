<?php

use app\models\Gerencia;
use app\models\Poa;
$this->title='pdf view';
?>

<style type="text/css">
.tg  {border-collapse:collapse;border-spacing:0;margin-left: 0px;margin-top: 100px;}
.margin {margin-left: 100px;}
.tg td{border-color:black;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;
  overflow:hidden;padding:50px 5px;word-break:normal;}
.tg th{border-color:black;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;
  font-weight:normal;overflow:hidden;padding:20px 20px;word-break:normal;}
.tg .tg-9wq8{border-color:inherit;text-align:center;vertical-align:middle}
.tg .tg-abx8{background-color:#c0c0c0;font-weight:bold;text-align:left;vertical-align:top}
.tg .tg-nltw{background-color:#c0c0c0;font-weight:bold;text-align:left;vertical-align:middle}
.tg .tg-y93n{background-color:#c0c0c0;text-align:left;vertical-align:middle}
.tg .tg-u1yq{background-color:#c0c0c0;font-weight:bold;text-align:center;vertical-align:top}
.tg .tg-v4j2{background-color:#c0c0c0;font-weight:bold;text-align:center;vertical-align:middle}
.tg .tg-0lax{text-align:left;vertical-align:top}
.tg .tg-amwm{font-weight:bold;text-align:center;vertical-align:top}
.tg .tg-9wq8{border-color:inherit;text-align:center;vertical-align:middle}
.tg .tg-jaco{background-color:#c0c0c0;border-color:inherit;text-align:left;vertical-align:middle}
.tg .tg-zlqz{background-color:#c0c0c0;border-color:inherit;font-weight:bold;text-align:center;vertical-align:top}
.tg .tg-efol{background-color:#c0c0c0;border-color:inherit;font-weight:bold;text-align:center;vertical-align:middle}
.tg .tg-pwmh{background-color:#c0c0c0;border-color:inherit;font-weight:bold;text-align:left;vertical-align:middle}
.tg .tg-6e8n{background-color:#c0c0c0;border-color:inherit;font-weight:bold;text-align:left;vertical-align:top}
.tg .tg-7btt{border-color:inherit;font-weight:bold;text-align:center;vertical-align:top}
.tg .tg-0pky{border-color:inherit;text-align:left;vertical-align:top}
</style>
<h3> Proyecto y/o Acción Centralizada: <?php foreach ($dataProvider->getModels() as $lista) { ?>
  <?php $poa = Poa::find()->where(['idpoa' => $lista->id_poa])->one();
        $gerencia = Gerencia::find()->where(['id_gerencia'=>$lista->id_gerencia])->one();
   ?>
<?php } ?>
<?php echo $poa->descripcion;?>
</h3>
<h3> Unidad Ejecutora: <?php echo $gerencia->gerencia ?></h3>
<table class="tg">
<thead>
  <tr>
    <th class="tg-jaco" rowspan="2"><span style="font-weight:bold">N°</span></th>
    <th class="tg-pwmh" rowspan="2">ACCIÓN ESPECIFICA</th>
    <th class="tg-6e8n" colspan="2">PLAZO DE EJECUCIÓN</th>
    <th class="tg-zlqz" colspan="2">META TOTAL</th>
    <th class="tg-zlqz" colspan="6">PARTIDAS PRESUPUESTARIAS (ESTIMACIONES)</th>
    <th class="tg-efol" rowspan="2">TOTAL</th>
  </tr>
  <tr>
    <th class="tg-zlqz">INICIO</th>
    <th class="tg-zlqz">FIN</th>
    <th class="tg-zlqz">UNIDAD DE MEDIDA</th>
    <th class="tg-zlqz">CANTIDAD ANUAL</th>
    <th class="tg-zlqz">402</th>
    <th class="tg-zlqz">403</th>
    <th class="tg-zlqz">404</th>
    <th class="tg-zlqz">407</th>
    <th class="tg-zlqz">408</th>
    <th class="tg-zlqz">4011</th>
  </tr>
</thead>
<tbody>
<?php
  $i = 1;
  $total402 = 0;
  $totales402 = 0;
  $total403 = 0;
  $total404 = 0;
  $total407 = 0;
  $total408 = 0;
  $total4011 = 0;
  $totales = 0;
  $suma402= 0;
  $suma403= 0;
  $suma404= 0;
  $suma407= 0;
  $suma408= 0;
  $suma4011= 0;

  foreach($dataProvider->getModels() as $lista) {
    if($lista->id_partida == 1){
      $total402 = $total402 + $lista->total_iva;
      $suma402 = $suma402 + $total402;
      }
    if($lista->id_partida == 2){
          $total403 =$total403 + $lista->total_iva;
          $suma403 = $suma403 + $total403;
        }
    if($lista->id_partida == 3){
          $total404 =  $total404 + $lista->total_iva;
          $suma404 = $suma404 + $total404;
          }
    if($lista->id_partida == 4){
            $total407 = $total407 + $lista->total_iva;
            $suma407 = $suma407 + $total407;
          }
    if($lista->id_partida == 5){
            $total408 = $total408 + $lista->total_iva;
            $suma408 = $suma408 + $total408;
          }
    if($lista->id_partida == 6){
            $total4011 = $total4011 + $lista->total_iva;
            $suma4011 = $suma4011 + $total4011;
          }
  }?>
<?php foreach($dataProvider->getModels() as $lista) {?>

  <tr>
    <th class="tg-9wq8"><?= $i++ ?></th>
    <th class="tg-9wq8"><?= $lista->accion->descripcion ?></th>
    <th class="tg-9wq8"><?= $lista->fecha_i ?></th>
    <th class="tg-9wq8"><?= $lista->fecha_f ?></th>
    <th class="tg-9wq8"><?= $lista->medida->medida ?></th>
    <th class="tg-9wq8"><?= Yii::$app->formatter->asDecimal($lista->total_iva) ?></th>
    <th class="tg-9wq8"><?= Yii::$app->formatter->asDecimal($lista->id_partida == 1 ? $total402 : 0 )?></th>
    <th class="tg-9wq8"><?= Yii::$app->formatter->asDecimal($lista->id_partida == 2 ? $total403 : 0)?></th>
    <th class="tg-9wq8"><?= Yii::$app->formatter->asDecimal($lista->id_partida == 3 ? $total404 : 0)?></th>
    <th class="tg-9wq8"><?= Yii::$app->formatter->asDecimal($lista->id_partida == 4 ? $total407 : 0 )?></th>
    <th class="tg-9wq8"><?= Yii::$app->formatter->asDecimal($lista->id_partida == 5 ? $total408 : 0 )?></th>
    <th class="tg-9wq8"><?= Yii::$app->formatter->asDecimal($lista->id_partida == 6 ? $total4011 : 0 )?></th>
    <th class="tg-9wq8"><?= Yii::$app->formatter->asDecimal($totales = $lista->id_partida == 1 ? $total402 : 0 + ($lista->id_partida == 2 ? $total403 : 0)  +  ($lista->id_partida == 3 ? $total404 : 0) + ($lista->id_partida == 4 ? $total407 : 0) + ($lista->id_partida == 5 ? $total408 : 0) + ($lista->id_partida == 6 ? $total4011 : 0) )?></th>

  </tr>
  <?php }?>
 
  <tr>
    <td class="tg-amwm" colspan="6">TOTALES</td>
    <td class="tg-9wq8"><?php echo Yii::$app->formatter->asDecimal($suma402) ?></td>
    <td class="tg-9wq8"><?php echo Yii::$app->formatter->asDecimal($suma403) ?></td>
    <td class="tg-9wq8"><?php echo Yii::$app->formatter->asDecimal($suma404) ?></td>
    <td class="tg-9wq8"><?php echo Yii::$app->formatter->asDecimal($suma407) ?></td>
    <td class="tg-9wq8"><?php echo Yii::$app->formatter->asDecimal($suma408) ?></td>
    <td class="tg-9wq8"><?php echo Yii::$app->formatter->asDecimal($suma4011) ?></td>
    <td class="tg-9wq8"><?php echo Yii::$app->formatter->asDecimal($totales = $suma402 + $suma403  + $suma404 + $suma407 + $suma408 + $suma4011) ?>
</td>
  </tr>
</tbody>
</table>

    <hr>
    <div class="timesdate">
        <?php echo date("Y-m-i");?>
    </div>
