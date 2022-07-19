<?php

namespace app\models;

use Yii;
use yii\web\IdentityInterface;
use yii\base\NotSupportedException;
use yii\helpers\ArrayHelper;

/**
 * This is the model class for table "usuario".
 *
 * @property int $id
 * @property string|null $username
 * @property string|null $password
 * @property int|null $id_perfil
 * @property int|null $id_gerencia
 * @property string|null $nombre
 * @property string|null $apellido
 * @property int|null $cedula
 * @property string|null $cargo
 * @property string|null $correo
 * @property int|null $status
 * @property string|null $auth_key
 *
 * @property Gerencia $gerencia
 * @property Perfil $perfil
 */
class Usuario extends \yii\db\ActiveRecord implements \yii\web\IdentityInterface
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'usuario';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id_perfil', 'id_gerencia', 'cedula', 'status'], 'default', 'value' => null],
            [['id_perfil', 'id_gerencia', 'cedula', 'status'], 'integer'],
            [['username', 'password', 'cargo', 'correo', 'auth_key'], 'string', 'max' => 100],
            [['nombre', 'apellido'], 'string', 'max' => 50],
            [['id_gerencia'], 'exist', 'skipOnError' => true, 'targetClass' => Gerencia::className(), 'targetAttribute' => ['id_gerencia' => 'id_gerencia']],
            [['id_perfil'], 'exist', 'skipOnError' => true, 'targetClass' => Perfil::className(), 'targetAttribute' => ['id_perfil' => 'id_perfil']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'Id',
            'username' => 'Usuario',
            'password' => 'Contraseña',
            'id_perfil' => 'Perfil',
            'id_gerencia' => 'Dependencia',
            'nombre' => 'Nombre',
            'apellido' => 'Apellido',
            'cedula' => 'Cedula',
            'cargo' => 'Cargo',
            'correo' => 'Correo',
            'status' => 'Estatus',
            'auth_key' => 'Auth Key',
        ];
    }

    /**
     * Gets query for [[Gerencia]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getGerencia()
    {
        return $this->hasOne(Gerencia::className(), ['id_gerencia' => 'id_gerencia']);
    }

    /**
     * Gets query for [[Perfil]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getPerfil()
    {
        return $this->hasOne(Perfil::className(), ['id_perfil' => 'id_perfil']);
    }
    public static function Lista_gerenci()
    {
        $gerencia=Gerencia::find()->orderBy('gerencia')->all();
        $listagerenci=ArrayHelper::map($gerencia, 'id_gerencia', 'gerencia');
        return $listagerenci;
    }
    public static function Lista_perfil()
    {
        $perfil=Perfil::find()->orderBy('descripcion')->all();
        $listaperfil=ArrayHelper::map($perfil, 'id_perfil', 'descripcion');
        return $listaperfil;
    }

    //Este lo pide pero lo dejamos como null por que no lo usamos por el momento
       public function getAuthKey() {
           return null;
          //return $this->auth_key;
       }    
       
       // interface
       public function validateAuthKey($authKey) {
           return $this->getAuthKey() == $authKey;
       }
       
       // interface
       public static function findIdentityByAccessToken($token, $type = null) {
           throw new \yii\base\NotSupportedException("'findIdentityByAccessToken' is not implemented");
       }
       
       /* Identity Interface */
       public function getId(){
           return $this->id;
       }
           
       public static function findIdentity($id) {
           return static::findOne(['id' => $id]);
       }
       
      // Utilizamos el mismo nombre de método que definimos como el nombre de usuario
       public static function findByUserName($username) {
           return static::findOne(['username' => $username]);
       }
       
       public function validatePassword($password) {
           return Yii::$app->security->validatePassword($password, $this->password);
       }

       
    
}
