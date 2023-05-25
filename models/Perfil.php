<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "perfil".
 *
 * @property int $id_perfil
 * @property string|null $descripcion
 *
 * @property Usuario[] $usuarios
 */
class Perfil extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'perfil';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id_perfil'], 'required'],
            [['id_perfil'], 'default', 'value' => null],
            [['id_perfil'], 'integer'],
            [['descripcion'], 'string'],
            [['id_perfil'], 'unique'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id_perfil' => 'Id Perfil',
            'descripcion' => 'Perfil',
        ];
    }

    /**
     * Gets query for [[Usuarios]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getUsuarios()
    {
        return $this->hasMany(Usuario::className(), ['id_perfil' => 'id_perfil']);
    }
}
