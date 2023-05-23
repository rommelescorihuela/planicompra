<?php
use mdm\admin\components\MenuHelper;
$callback = function($menu){
    $data = eval($menu['data']);
    return [
        'label' => $menu['name'], 
        'url' => [$menu['route']],
        'icon' => $menu['icon'],
        'items' => $menu['children']
    ];
};

$items = MenuHelper::getAssignedMenu(Yii::$app->user->id,null,$callback);
?>
<aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a href="index3.html" class="brand-link">
        <img src="<?=$assetDir?>/img/AdminLTELogo.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3" style="opacity: .8">
        <span class="brand-text font-weight-light"><b>SFPOA</b></span>
    </a>
    <div class="sidebar">
        <!-- Sidebar user panel (optional) -->
        <div class="user-panel mt-3 pb-3 mb-3 d-flex">
            <div class="image">
                <img src="<?=$assetDir?>/img/user2-160x160.jpg" class="img-circle elevation-2" alt="User Image">
            </div>
            <div class="info">
                <a href="#" class="d-block"><?= $usuario= (Yii::$app->user->identity==null)?:Yii::$app->user->identity->nombre.' '.Yii::$app->user->identity->apellido;?></a>
            </div>
        </div>
        <nav class="mt2">
            <?php
                echo \hail812\adminlte\widgets\Menu::widget([
                    'items' => MenuHelper::getAssignedMenu(Yii::$app->user->id,null,$callback)
                ]);
            ?>
        </nav>
    </div>
</aside>