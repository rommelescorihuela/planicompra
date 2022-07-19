<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "gerencia".
 *
 * @property int $id_gerencia
 * @property string|null $gerencia
 * @property bool|null $mostrar
 *
 * @property Accion[] $accions
 * @property BaseCalculo[] $baseCalculos
 */
class Gerencia extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'gerencia';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['gerencia'], 'string'],
            [['mostrar'], 'boolean'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id_gerencia' => 'Id Gerencia',
            'gerencia' => 'Dependencia',
            'mostrar' => 'Mostrar',
        ];
    }

    /**
     * Gets query for [[Accions]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getAccions()
    {
        return $this->hasMany(Accion::className(), ['idgerencia' => 'id_gerencia']);
    }

    /**
     * Gets query for [[BaseCalculos]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getBaseCalculos()
    {
        return $this->hasMany(BaseCalculo::className(), ['id_gerencia' => 'id_gerencia']);
    }
}
