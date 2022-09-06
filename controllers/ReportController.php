<?php

namespace app\controllers;

use Yii;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\helpers\ArrayHelper;
use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;
use PhpOffice\PhpSpreadsheet\IOFactory;
use app\models\ReportForm;
use app\models\Gerencia;
use app\models\Poa;
use app\models\Accion;
use app\models\Actividades;

class ReportController extends Controller
{
    public function actionIndex()
    {
        return $this->render('index');
    }

    public function actionProfis()
    {
        $model = new ReportForm();
        $unidad = ArrayHelper::map(Gerencia::find()->Where(['mostrar' => true])->all(),'id_gerencia','gerencia');

        if ($model->load(Yii::$app->request->post())) {
            if ($model->validate()) {
                // form inputs are valid, do something here
                return;
            }
        }

        return $this->render('profis', [
            'model' => $model,
            'unidad'=> $unidad,
        ]);
    }

    public function actionProfipro($id)
    {
        $consulta = $rows = (new \yii\db\Query())
            ->select('accion.descripcion as accion_especifica,actividades.descripcion as actividades')
            ->from('poa')
            ->innerjoin('accion','accion.idpoa = poa.idpoa')
            ->leftjoin('actividades','actividades.idaccionespecifica = accion.id_accion')
            ->where(['poa.idpoa' => $id])
            ->all();
        echo '<pre>';
        var_dump($consulta);
        echo '</pre>';
        exit();
        $spreadsheet = new Spreadsheet();
        $spreadsheet->setActiveSheetIndex(0)
            ->setCellValue('A5', 'ACCION ESPECIFICA')
            ->setCellValue('B5', 'FECHA DE INICIO DE EJECUCION')
            ->setCellValue('C5', 'FECHA DE FIN DE EJECUCION');

        $i = 6;
        foreach ($consulta as $resultado) {
            $spreadsheet->setActiveSheetIndex(0)
                ->setCellValue('A' . $i, $resultado['descripcion'])
                ->setCellValue('B' . $i, $resultado['fechainicio'])
                ->setCellValue('C' . $i, $resultado['fechafin']);
            $i++;
        }
            

        // Rename worksheet
        $spreadsheet->getActiveSheet()->setTitle('plan operativo anual');
        // Set active sheet index to the first sheet, so Excel opens this as the first sheet
        $spreadsheet->setActiveSheetIndex(0);


        // Redirect output to a client’s web browser (Xlsx)
        header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
        header('Content-Disposition: attachment;filename="plan_operativo_anual.xlsx"');
        header('Cache-Control: max-age=0');
        // If you're serving to IE 9, then the following may be needed
        header('Cache-Control: max-age=1');
        // If you're serving to IE over SSL, then the following may be needed
        header('Expires: Mon, 26 Jul 1997 05:00:00 GMT'); // Date in the past
        header('Last-Modified: ' . gmdate('D, d M Y H:i:s') . ' GMT'); // always modified
        header('Cache-Control: cache, must-revalidate'); // HTTP/1.1
        header('Pragma: public'); // HTTP/1.0

        $writer = IOFactory::createWriter($spreadsheet, 'Xlsx');
        $writer->save('php://output');
        exit;
        //echo 'hola';
        //echo $id;
    }
}
