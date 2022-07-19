<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "tbl_presupuesto".
 *
 * @property int $id_presupuesto
 * @property float|null $presupuesto
 * @property int|null $id_plan
 * @property string|null $fecha
 *
 * @property BaseCalculo[] $baseCalculos
 * @property Partida[] $partidas
 * @property BaseCalculo $plan
 */
class TblPresupuesto extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'tbl_presupuesto';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['presupuesto'], 'number'],
            [['id_plan'], 'default', 'value' => null],
            [['id_plan'], 'integer'],
            [['fecha'], 'safe'],
            [['id_plan'], 'exist', 'skipOnError' => true, 'targetClass' => BaseCalculo::className(), 'targetAttribute' => ['id_plan' => 'id_plan']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id_presupuesto' => 'Id Presupuesto',
            'presupuesto' => 'Presupuesto',
            'id_plan' => 'Id Plan',
            'fecha' => 'Fecha',
        ];
    }

    /**
     * Gets query for [[BaseCalculos]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getBaseCalculos()
    {
        return $this->hasMany(BaseCalculo::className(), ['id_presupuesto' => 'id_presupuesto']);
    }

    /**
     * Gets query for [[Partidas]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getPartidas()
    {
        return $this->hasMany(Partida::className(), ['id_presupuesto' => 'id_presupuesto']);
    }

    /**
     * Gets query for [[Plan]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getPlan()
    {
        return $this->hasOne(BaseCalculo::className(), ['id_plan' => 'id_plan']);
    }
}
