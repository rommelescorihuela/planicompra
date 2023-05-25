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
        $consulta = (new \yii\db\Query())
            ->select([
                'accion.descripcion as accion_especifica',
                'accion.fechainicio as fecha_inicio',
                'accion.fechafin as fecha_fin',
                'accion.unidadmedida as unidad_medida_accion',
                'accion.enero','accion.febrero','accion.marzo','accion.abril','accion.mayo','accion.junio',
                'accion.julio','accion.agosto','accion.septiembre','accion.octubre','accion.noviembre','accion.diciembre',
                '(accion.enero+accion.febrero+accion.marzo+accion.abril+accion.mayo+accion.junio+accion.julio+accion.agosto+accion.septiembre+accion.octubre+accion.noviembre+accion.diciembre) as totalmes_accion',
                '(accion.enero+accion.febrero+accion.marzo) as t1',
                '(accion.abril+accion.mayo+accion.junio) as t2',
                '(accion.julio+accion.agosto+accion.septiembre) as t3',
                '(accion.octubre+accion.noviembre+accion.diciembre) as t4',
                'actividades.descripcion as actividades',
                'unidad_medida.unidadmedida as unidadmedida_actividad',
                'unidad_medida.enero as enero_act','unidad_medida.febrero as febrero_act','unidad_medida.marzo as marzo_act','unidad_medida.abril as abril_act',
                'unidad_medida.mayo as mayo_act','unidad_medida.junio as junio_act','unidad_medida.julio as julio_act','unidad_medida.agosto as agosto_act',
                'unidad_medida.septiembre as septiembre_act','unidad_medida.octubre as octubre_act','unidad_medida.noviembre as noviembre_act','unidad_medida.diciembre as diciembre_act',
                '(unidad_medida.enero+unidad_medida.febrero+unidad_medida.marzo+unidad_medida.abril+unidad_medida.mayo+unidad_medida.junio+unidad_medida.julio+unidad_medida.agosto+unidad_medida.septiembre+unidad_medida.octubre+unidad_medida.noviembre+unidad_medida.diciembre) as total_actividades',
                '(unidad_medida.enero+unidad_medida.febrero+unidad_medida.marzo) as t1_act',
                '(unidad_medida.abril+unidad_medida.mayo+unidad_medida.junio) as t2_act',
                '(unidad_medida.julio+unidad_medida.agosto+unidad_medida.septiembre) as t3_act',
                '(unidad_medida.octubre+unidad_medida.noviembre+unidad_medida.diciembre) as t4_act',
            ])
            ->from('poa')
            ->innerjoin('accion','accion.idpoa = poa.idpoa')
            ->leftjoin('actividades','actividades.idaccionespecifica = accion.id_accion')
            ->leftjoin('unidad_medida','unidad_medida.id_actividad = actividades.idactividad')
            ->where(['poa.idpoa' => $id])
            ->all();
        $consulta1 = (new \yii\db\Query())
            ->select([
                'poa.descripcion',
                'poa.objetivo',
                'gerencia.gerencia',
            ])
            ->from('poa')
            ->innerjoin('gerencia','gerencia.id_gerencia = poa.id_gerencia')
            ->where(['poa.idpoa' => $id])
            ->one();
        /*echo '<pre>';
        var_dump($consulta1['descripcion']);
        echo '</pre>';
        exit();*/
        $spreadsheet = new Spreadsheet();
        $spreadsheet->setActiveSheetIndex(0)
            ->setCellValue('A9',  '1. PROYECTO: '.$consulta1['descripcion'])
            ->setCellValue('A10', '2. OBJETIVO DEL PROYECTO: '.$consulta1['objetivo'])
            ->setCellValue('A11', '3. UNIDAD EJECUTORA: '.$consulta1['gerencia'])
            ->setCellValue('A13', 'ACCION ESPECIFICA')
            ->setCellValue('B13', 'FECHA DE INICIO DE EJECUCION')
            ->setCellValue('C13', 'FECHA DE FIN DE EJECUCION')
            ->setCellValue('D13', 'UNIDAD DE MEDIDA')
            ->setCellValue('E13', 'CANTIDAD ANUAL')
            ->setCellValue('F13', 'E')
            ->setCellValue('G13', 'F')
            ->setCellValue('H13', 'M')
            ->setCellValue('I13', 'I T')
            ->setCellValue('J13', 'A')
            ->setCellValue('K13', 'M')
            ->setCellValue('L13', 'J')
            ->setCellValue('M13', 'II T')
            ->setCellValue('N13', 'J')
            ->setCellValue('O13', 'A')
            ->setCellValue('P13', 'S')
            ->setCellValue('Q13', 'III T')
            ->setCellValue('R13', 'O')
            ->setCellValue('S13', 'N')
            ->setCellValue('T13', 'D')
            ->setCellValue('U13', 'IV T')
            ->setCellValue('V13', 'ACTIVIDADES')
            ->setCellValue('W13', 'UNIDAD DE MEDIDA')
            ->setCellValue('X13', 'CANTIDAD ANUAL')
            ->setCellValue('Y13', 'E')
            ->setCellValue('Z13', 'F')
            ->setCellValue('AA13', 'M')
            ->setCellValue('AB13', 'I T')
            ->setCellValue('AC13', 'A')
            ->setCellValue('AD13', 'M')
            ->setCellValue('AF13', 'J')
            ->setCellValue('AG13', 'II T')
            ->setCellValue('AH13', 'J')
            ->setCellValue('AI13', 'A')
            ->setCellValue('AJ13', 'S')
            ->setCellValue('AK13', 'III T')
            ->setCellValue('AL13', 'O')
            ->setCellValue('AM13', 'N')
            ->setCellValue('AN13', 'D')
            ->setCellValue('AP13', 'IV T');

        $i = 14;
        foreach ($consulta as $resultado) {
            $spreadsheet->setActiveSheetIndex(0)
                ->setCellValue('A'.$i, $resultado['accion_especifica'])
                ->setCellValue('B'.$i, $resultado['fecha_inicio'])
                ->setCellValue('C'.$i, $resultado['fecha_fin'])
                ->setCellValue('D'.$i, $resultado['unidad_medida_accion'])
                ->setCellValue('E'.$i, $resultado['totalmes_accion'])
                ->setCellValue('F'.$i, $resultado['enero'])
                ->setCellValue('G'.$i, $resultado['febrero'])
                ->setCellValue('H'.$i, $resultado['marzo'])
                ->setCellValue('I'.$i, $resultado['t1'])
                ->setCellValue('J'.$i, $resultado['abril'])
                ->setCellValue('K'.$i, $resultado['mayo'])
                ->setCellValue('L'.$i, $resultado['junio'])
                ->setCellValue('M'.$i, $resultado['t2'])
                ->setCellValue('N'.$i, $resultado['julio'])
                ->setCellValue('O'.$i, $resultado['agosto'])
                ->setCellValue('P'.$i, $resultado['septiembre'])
                ->setCellValue('Q'.$i, $resultado['t3'])
                ->setCellValue('R'.$i, $resultado['octubre'])
                ->setCellValue('S'.$i, $resultado['noviembre'])
                ->setCellValue('T'.$i, $resultado['diciembre'])
                ->setCellValue('U'.$i, $resultado['t4'])
                ->setCellValue('V'.$i, $resultado['actividades'])
                ->setCellValue('W'.$i, $resultado['unidadmedida_actividad'])
                ->setCellValue('X'.$i, $resultado['total_actividades'])
                ->setCellValue('Y'.$i, $resultado['enero_act'])
                ->setCellValue('Z'.$i, $resultado['febrero_act'])
                ->setCellValue('AA'.$i, $resultado['marzo_act'])
                ->setCellValue('AB'.$i, $resultado['t1_act'])
                ->setCellValue('AC'.$i, $resultado['abril_act'])
                ->setCellValue('AD'.$i, $resultado['mayo_act'])
                ->setCellValue('AF'.$i, $resultado['junio_act'])
                ->setCellValue('AG'.$i, $resultado['t2_act'])
                ->setCellValue('AH'.$i, $resultado['julio_act'])
                ->setCellValue('AI'.$i, $resultado['agosto_act'])
                ->setCellValue('AJ'.$i, $resultado['septiembre_act'])
                ->setCellValue('AK'.$i, $resultado['t3_act'])
                ->setCellValue('AL'.$i, $resultado['octubre_act'])
                ->setCellValue('AM'.$i, $resultado['noviembre_act'])
                ->setCellValue('AN'.$i, $resultado['diciembre_act'])
                ->setCellValue('AP'.$i, $resultado['t4_act']);
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
