<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "tipo".
 *
 * @property int $id_tipo
 * @property string|null $tipo
 *
 * @property Poa[] $poas
 */
class Tipo extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'tipo';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id_tipo'], 'required'],
            [['id_tipo'], 'default', 'value' => null],
            [['id_tipo'], 'integer'],
            [['tipo'], 'string'],
            [['id_tipo'], 'unique'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id_tipo' => 'Id Tipo',
            'tipo' => 'Categoria',
        ];
    }

    /**
     * Gets query for [[Poas]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getPoas()
    {
        return $this->hasMany(Poa::className(), ['id_tipo' => 'id_tipo']);
    }
}
