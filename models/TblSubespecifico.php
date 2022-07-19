<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "tbl_subespecifico".
 *
 * @property int $id
 * @property int|null $id_especifico
 * @property string|null $codigo
 * @property string|null $descripcion
 */
class TblSubespecifico extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'tbl_subespecifico';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id_especifico'], 'default', 'value' => null],
            [['id_especifico'], 'integer'],
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
            'id_especifico' => 'Id Especifico',
            'codigo' => 'Codigo',
            'descripcion' => 'Descripcion',
        ];
    }
}
