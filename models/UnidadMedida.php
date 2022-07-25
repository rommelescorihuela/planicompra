<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "unidad_medida".
 *
 * @property int $id
 * @property string|null $unidadmedida
 * @property int|null $total
 * @property int|null $enero
 * @property int|null $febrero
 * @property int|null $marzo
 * @property int|null $abril
 * @property int|null $mayo
 * @property int|null $junio
 * @property int|null $julio
 * @property int|null $agosto
 * @property int|null $septiembre
 * @property int|null $octubre
 * @property int|null $noviembre
 * @property int|null $diciembre
 * @property int|null $id_actividad
 *
 * @property Actividades $actividad
 */
class UnidadMedida extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'unidad_medida';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['unidadmedida'], 'string'],
            [['total', 'enero', 'febrero', 'marzo', 'abril', 'mayo', 'junio', 'julio', 'agosto', 'septiembre', 'octubre', 'noviembre', 'diciembre', 'id_actividad'], 'default', 'value' => null],
            [['total', 'enero', 'febrero', 'marzo', 'abril', 'mayo', 'junio', 'julio', 'agosto', 'septiembre', 'octubre', 'noviembre', 'diciembre', 'id_actividad'], 'integer'],
            [['id_actividad'], 'exist', 'skipOnError' => true, 'targetClass' => Actividades::className(), 'targetAttribute' => ['id_actividad' => 'idactividad']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'unidadmedida' => 'Unidadmedida',
            'total' => 'Total',
            'enero' => 'Enero',
            'febrero' => 'Febrero',
            'marzo' => 'Marzo',
            'abril' => 'Abril',
            'mayo' => 'Mayo',
            'junio' => 'Junio',
            'julio' => 'Julio',
            'agosto' => 'Agosto',
            'septiembre' => 'Septiembre',
            'octubre' => 'Octubre',
            'noviembre' => 'Noviembre',
            'diciembre' => 'Diciembre',
            'id_actividad' => 'Id Actividad',
        ];
    }

    /**
     * Gets query for [[Actividad]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getActividad()
    {
        return $this->hasOne(Actividades::className(), ['idactividad' => 'id_actividad']);
    }
}
