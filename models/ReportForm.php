<?php

namespace app\models;

use Yii;
use yii\base\Model;


class ReportForm extends Model
{
    public $project;
    public $unity;
    public $year;


    /**
     * @return array the validation rules.
     */
    public function rules()
    {
        return [
            [['project', 'unity','year'], 'safe'],
        ];
    }

    public function attributeLabels()
    {
        return [
            'project' => 'Proyecto / Accion Centralizada',
            'unity' => 'Unidad Ejecutora',
            'year' => 'Periodo',
        ];
    }
}
