sudo sed -i "s/<U0021> IGNORE;/<U0021> <RES-1>;/" -e "s/<U005F> IGNORE;/<U005F> <RES-1>;/" /usr/share/i18n/locales/iso14651_t1_common
sudo locale-gen