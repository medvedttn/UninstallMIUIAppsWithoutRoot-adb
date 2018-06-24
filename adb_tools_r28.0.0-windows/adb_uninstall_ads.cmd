@echo off
echo "Uninstall system apps for current user only without root! Press ANY key..."
adb devices
pause
echo "Uninstall MIUI system apps..."
echo on
adb shell pm uninstall --user 0 com.miui.analytics
adb shell pm uninstall --user 0 com.miui.systemAdSolution
adb shell pm uninstall --user 0 com.miui.bugreport
adb shell pm uninstall --user 0 com.miui.whetstone
adb shell pm uninstall --user 0 com.miui.yellowpage
adb shell pm uninstall --user 0 com.miui.milivetalk
@echo "Uninstall Android standart apps...Press ANY key..."
pause
adb shell pm uninstall --user 0 com.android.wallpaper.livepicker
adb shell pm uninstall --user 0 com.android.phasebeam
adb shell pm uninstall --user 0 com.google.android.youtube
adb shell pm uninstall --user 0 com.google.android.music
echo "Done!"
adb disconnect
