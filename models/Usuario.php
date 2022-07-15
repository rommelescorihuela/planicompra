<?php

namespace app\models;

use Yii;
use yii\web\IdentityInterface;
use yii\base\NotSupportedException;
use yii\helpers\ArrayHelper;

/**
 * This is the model class for table "usuario".
 *
 * @property int $id_usuario
 * @property string|null $username
 * @property string|null $password
 * @property int|null $id_perfil
 * @property int|null $id_gerencia
 * @property string|null $nombre
 * @property string|null $apellido
 * @property int|null $cedula
 * @property string|null $cargo
 * @property string|null $correo
 * @property int|null $estatu
 * @property string|null $auth_key
 *
 * @property Gerencia $gerencia
 * @property Perfil $perfil
 */
class Usuario extends \yii\db\ActiveRecord implements IdentityInterface
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
            [['id_perfil', 'id_gerencia', 'cedula', 'estatu'], 'default', 'value' => null],
            [['id_perfil', 'id_gerencia', 'cedula', 'estatu'], 'integer'],
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
            'id_usuario' => 'Id Usuario',
            'username' => 'Usuario',
            'password' => 'Contraseña',
            'id_perfil' => 'Perfil',
            'id_gerencia' => 'Dependencia',
            'nombre' => 'Nombre',
            'apellido' => 'Apellido',
            'cedula' => 'Cedula',
            'cargo' => 'Cargo',
            'correo' => 'Correo',
            'estatu' => 'Estatus',
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

    /*
      * Generate password hash
      */
      public function setPassword($password)
      {
          $this->password =
 Yii::$app->security->generatePasswordHash($password);
      }
 
      /*
       * Generate authentication key
       */
      public function generateAuthKey()
      {
          $this->auth_key = Yii::$app->security->generateRandomString();
      }
 
      /*
       * Finds an identity by the given ID
       */
      public static function findIdentity($id)
      {
          return static::findOne($id);
      }
 
      /*
       * Finds an identity by the given token
       */
      public static function findIdentityByAccessToken($token, $type = null)
      {
          throw new NotSupportedException();
      }
 
      /*
       * Returns an ID that can uniquely identify a user identity
       */
      public function getId()
      {
          return $this->id_usuario;
      }
 
      /*
       * Returns a key that can be used to check the validity of a given
 identity ID
       */
      public function getAuthKey()
      {
          return $this->auth_key;
      }
 
      /*
       * Validates the given auth key
       */
      public function validateAuthKey($authKey)
      {
          return $this->auth_key === $authKey;
      }
 
      /*
       * Finds user by username
       */
      public static function findByUsername($username)
      {
          return static::findOne(['username' => $username, 'estatu' =>
 1]);
      }
 
      /*
       * Validates password
       */
      public function validatePassword($password)
      {
          return Yii::$app->security->validatePassword($password,
    $this->password);
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
}
