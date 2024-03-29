<?php

namespace app\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\Actividades;

/**
 * ActividadesSearch represents the model behind the search form of `app\models\Actividades`.
 */
class ActividadesSearch extends Actividades
{
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['idactividad', 'idaccionespecifica', 'id_poa', 'id_tipo', 'id_gerencia'], 'integer'],
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
        $query = Actividades::find()
        ->innerjoin('poa','poa.idpoa = actividades.id_poa')
        ->orderBy(['idaccionespecifica' => SORT_DESC]);
        
        

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
            'actividades.idactividad' => $this->idactividad,
            'actividades.idaccionespecifica' => $this->idaccionespecifica,
            'actividades.id_poa' => $this->id_poa,
            'actividades.id_tipo' => $this->id_tipo,
            'actividades.id_gerencia' => $this->id_gerencia,

        ]);

        $query->andFilterWhere(['ilike', 'actividades.descripcion', $this->descripcion]);

        $query->andWhere(['poa.idvisibilidad' => null]);

        return $dataProvider;
    }
}
