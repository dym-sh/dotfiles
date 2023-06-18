# wordpress
SITE_NAME='wp'
cd /home
wget -c http://wordpress.org/latest.tar.gz
tar -xzvf latest.tar.gz
rm latest.tar.gz
mv './wordpress'  "/var/www/$SITE_NAME"
cd "/var/www/$SITE_NAME"
chown -R www-data:www-data .
chmod g+s .
nano './wp-config.php'
```php
<?php
define( 'DB_NAME', 'wp' );
define( 'DB_USER', 'db_admin' );
define( 'DB_PASSWORD', 'BjMPUpXtlUBHSr=l-TWYKHwCI7DPjF1YJMo2qpjW8LQI3Rk=EVKevexq6r3b+c6Ggf-cpk65nB-m8w=2' );
define( 'DB_HOST', 'localhost' );
define( 'DB_CHARSET', 'utf8mb4' );
define( 'DB_COLLATE', 'utf8mb4_0900_ai_ci' );
define('AUTH_KEY',         'Fh2@[~+@# RcE?B*=s-VQ(tRWQ/+TT|G!?G|ar9X:Rff5ZD.wVJ=N}K#UgW211z0');
define('SECURE_AUTH_KEY',  'pbQ3HD8e+cx7{-$n7V!zSdnB+O6ORFVrgMU>sP8fmC 2,b-faoNgaZ:pVDj~Ju;!');
define('LOGGED_IN_KEY',    '3/5|X%xvFRu-yNpM+|@5]Y%sLK8{u>pCO|=HTU8E[-pgHVO.GCPnIN{tlz!+6_8:');
define('NONCE_KEY',        'oBY%}nbf|^w;U? >a)t8,F{gFP= 4op0BLC(UuH|8!w{w/pqVN<!N./1~,GYWiw]');
define('AUTH_SALT',        'K=oKS4Xmlgp|XaC%=W4Ua5JXW 2]!c[cmqmVP1I$-^&L`<$=`wTzfWBWOnnRcHqr');
define('SECURE_AUTH_SALT', 'Nm+Ww8`vxjC iV0KAI-R$SXh:Uxl=$^Nrw-gnj2!F`zWXiUs$8>q2ElPCq2/hQt}');
define('LOGGED_IN_SALT',   '-%F-7uro6G?|?1feAvZV-4$Pr4fy2>>1RKbVo:RM?37jIr8CS^*^HUUADc2zN+~P');
define('NONCE_SALT',       '{8SLQOY+WpiHur0/C3G|))-m%F+!6;0+Dd-nPEBYa2!51Z=#+-M@j3Ip(#y3*dAY');
$table_prefix = 'wp_';
define( 'WP_DEBUG', false );
if ( ! defined( 'ABSPATH' ) ) {
        define( 'ABSPATH', __DIR__ . '/' );
}
require_once ABSPATH . 'wp-settings.php';
```
