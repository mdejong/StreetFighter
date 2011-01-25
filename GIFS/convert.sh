# convert 'RyuStance.gif' RyuStance.png
# convert ryu-cvs-highside.gif RyuHighKick/RyuHighKick.png
# convert RyuStance.gif -channel RGBA -alpha transparent RyuStance.png

convert RyuStance.gif -depth 32 RyuStance_FRAMES/RyuStance.png

convert ryu-cvs-highside.gif -depth 32 RyuHighKick_FRAMES/RyuHighKick.png

convert ryu-cvs-hadoken-a.gif -depth 32 RyuFireball_FRAMES/RyuFireball.png

# afconvert -d aac -f caff -q 32 sf2_blanka_theme_mono_22k.caf sf2_blanka_theme_mono_qlow_22k.caf

