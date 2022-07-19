<?php

namespace app\models;

use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\Poa;

/**
 * PoaSearch represents the model behind the search form of `app\models\Poa`.
 */
class PoaSearch extends Poa
{
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['idpoa', 'id_tipo', 'idvisibilidad', 'id_gerencia'], 'integer'],
            [['descripcion', 'objetivo', 'nombre_apellido'], 'safe'],
            [['monto_asignado'], 'number'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function scenarios()
    {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    /**
     * Creates data provider instance with search query applied
     *
     * @param array $params
     *
     * @return ActiveDataProvider
     */
    public function search($params)
    {
        $query = Poa::find()->orderBy(['idpoa' => SORT_DESC]);

        // add conditions that should always apply here

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
            'sort' => false,
            'pagination' => [
            'pageSize' => 10,
            ],

        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        // grid filtering conditions
        $query->andFilterWhere([
            'idpoa' => $this->idpoa,
            'monto_asignado' => $this->monto_asignado,
            'id_tipo' => $this->id_tipo,
            'idvisibilidad' => $this->idvisibilidad,
            'id_gerencia' => $this->id_gerencia,
        ]);

        $query->andFilterWhere(['ilike', 'descripcion', $this->descripcion])
            ->andFilterWhere(['ilike', 'objetivo', $this->objetivo])
            ->andFilterWhere(['ilike', 'nombre_apellido', $this->nombre_apellido]);

        return $dataProvider;
    }
}