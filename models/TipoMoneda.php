<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "tipo_moneda".
 *
 * @property int $id_moneda
 * @property string|null $descripcion
 *
 * @property Basecalculo[] $basecalculos
 */
class TipoMoneda extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'tipo_moneda';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['descripcion'], 'string'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id_moneda' => 'Id Moneda',
            'descripcion' => 'Descripcion',
        ];
    }

    /**
     * Gets query for [[Basecalculos]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getBasecalculos()
    {
        return $this->hasMany(Basecalculo::className(), ['id_moneda' => 'id_moneda']);
    }
}
