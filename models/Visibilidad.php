<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "visibilidad".
 *
 * @property int $id_visibilidad
 * @property string|null $descripción
 *
 * @property Poa[] $poas
 */
class Visibilidad extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'visibilidad';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id_visibilidad'], 'required'],
            [['id_visibilidad'], 'default', 'value' => null],
            [['id_visibilidad'], 'integer'],
            [['descripción'], 'string'],
            [['id_visibilidad'], 'unique'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id_visibilidad' => 'Id Visibilidad',
            'descripción' => 'Descripción',
        ];
    }

    /**
     * Gets query for [[Poas]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getPoas()
    {
        return $this->hasMany(Poa::className(), ['idvisibilidad' => 'id_visibilidad']);
    }
}
