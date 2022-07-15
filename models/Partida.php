<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "partida".
 *
 * @property int $id
 * @property string|null $codigo
 * @property string|null $descripcion
 *
 * @property Basecalculo[] $basecalculos
 * @property Generico[] $genericos
 */
class Partida extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'partida';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['descripcion'], 'string'],
            [['codigo'], 'string', 'max' => 15],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'codigo' => 'Codigo',
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
        return $this->hasMany(Basecalculo::className(), ['id_ramo' => 'id']);
    }

    /**
     * Gets query for [[Genericos]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getGenericos()
    {
        return $this->hasMany(Generico::className(), ['id_partida' => 'id']);
    }
}
