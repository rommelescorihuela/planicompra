<?php

namespace app\models;

use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\Accion;

/**
 * AccionSearch represents the model behind the search form of `app\models\Accion`.
 */
class AccionSearch extends Accion
{
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id_accion', 'idpoa', 'idgerencia', 'id_tipo'], 'integer'],
            [['descripcion'], 'safe'],
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
        $query = Accion::find()
        ->innerjoin('poa','poa.idpoa = accion.idpoa')
        ->orderBy(['id_accion' => SORT_DESC]);


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
            'id_accion' => $this->id_accion,
            'accion.idpoa' => $this->idpoa,
            'accion.idgerencia' => $this->idgerencia,
            'accion.id_tipo' => $this->id_tipo,

        ]);

        $query->andFilterWhere(['ilike', 'accion.descripcion', $this->descripcion]);

        $query->andWhere(['poa.idvisibilidad' => null]);

        return $dataProvider;
    }
}
