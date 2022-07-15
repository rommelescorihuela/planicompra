<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "costo".
 *
 * @property int $idcosto
 * @property float|null $costo
 * @property int|null $idproducto
 * @property int|null $idmedida
 *
 * @property Medida $idmedida0
 * @property Requerimiento $idproducto0
 */
class Costo extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'costo';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['costo'], 'number'],
            [['idproducto', 'idmedida'], 'default', 'value' => null],
            [['idproducto', 'idmedida'], 'integer'],
            [['idmedida'], 'exist', 'skipOnError' => true, 'targetClass' => Medida::className(), 'targetAttribute' => ['idmedida' => 'idmedida']],
            [['idproducto'], 'exist', 'skipOnError' => true, 'targetClass' => Requerimiento::className(), 'targetAttribute' => ['idproducto' => 'idproducto']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'idcosto' => 'Idcosto',
            'costo' => 'Costo',
            'idproducto' => 'Idproducto',
            'idmedida' => 'Idmedida',
        ];
    }

    /**
     * Gets query for [[Idmedida0]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getIdmedida0()
    {
        return $this->hasOne(Medida::className(), ['idmedida' => 'idmedida']);
    }

    /**
     * Gets query for [[Idproducto0]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getIdproducto0()
    {
        return $this->hasOne(Requerimiento::className(), ['idproducto' => 'idproducto']);
    }
}
