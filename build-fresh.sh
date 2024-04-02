export ZMK_BUILD_DIR="/Users/thomasalban/Documents/Code/zmk/zmk"
export ZMK_CONFIG_DIR="/Users/thomasalban/Documents/Code/zmk/zmk-corne-config"
cd $ZMK_BUILD_DIR/app
west build --build-dir build/left --pristine --board nice_nano_v2 -s $ZMK_BUILD_DIR/app -- -DSHIELD="corne_left nice_view_adapter nice_view" -DZMK_CONFIG=$ZMK_CONFIG_DIR/config &
west build --build-dir build/right --pristine --board nice_nano_v2 -s $ZMK_BUILD_DIR/app -- -DSHIELD="corne_right nice_view_adapter nice_view" -DZMK_CONFIG=$ZMK_CONFIG_DIR/config
if [ $? -ne 0 ]; then
    exit 1
fi
wait

mkdir -p $ZMK_CONFIG_DIR/build
cp -rf $ZMK_BUILD_DIR/app/build/left/zephyr/zmk.uf2 $ZMK_CONFIG_DIR/build/zmk_left.uf2
cp -rf $ZMK_BUILD_DIR/app/build/right/zephyr/zmk.uf2 $ZMK_CONFIG_DIR/build/zmk_right.uf2
