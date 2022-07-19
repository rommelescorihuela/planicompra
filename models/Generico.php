<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "generico".
 *
 * @property int $id_generico
 * @property string|null $codigo
 * @property string|null $descripcion
 * @property int|null $id_partida
 *
 * @property Basecalculo[] $basecalculos
 * @property Especifico[] $especificos
 * @property Partida $partida
 */
class Generico extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'generico';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['descripcion'], 'string'],
            [['id_partida'], 'default', 'value' => null],
            [['id_partida'], 'integer'],
            [['codigo'], 'string', 'max' => 15],
            [['id_partida'], 'exist', 'skipOnError' => true, 'targetClass' => Partida::className(), 'targetAttribute' => ['id_partida' => 'id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id_generico' => 'Id Generico',
            'codigo' => 'Codigo',
            'descripcion' => 'Descripcion',
            'id_partida' => 'Id Partida',
        ];
    }

    /**
     * Gets query for [[Basecalculos]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getBasecalculos()
    {
        return $this->hasMany(Basecalculo::className(), ['id_sub_ramo' => 'id_generico']);
    }

    /**
     * Gets query for [[Especificos]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getEspecificos()
    {
        return $this->hasMany(Especifico::className(), ['id_subramo' => 'id_generico']);
    }

    /**
     * Gets query for [[Partida]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getPartida()
    {
        return $this->hasOne(Partida::className(), ['id' => 'id_partida']);
    }
}
