@echo off
chcp 65001 >nul
title تثبيت لانشر ميدو للشاشة - خطوة واحدة
setlocal EnableDelayedExpansion

echo.
echo  ============================================================
echo   لانشر ميدو للشاشة  -  تثبيت بضغطة واحدة
echo   نفس شاشة ميدو بالظبط، بس بحساباتك انت
echo  ============================================================
echo.
echo  قبل ما تبدأ، اعمل الخطوتين دول على الشاشة:
echo   1) الاعدادات ^> تفضيلات الجهاز ^> حول ^> دوس على "الاصدار" 7 مرات
echo      لحد ما يقولك "انت دلوقتي مطور"
echo   2) الاعدادات ^> تفضيلات الجهاز ^> خيارات المطور ^> شغّل
echo      "تصحيح USB" و "تصحيح لاسلكي" - وهيظهر لك عنوان IP
echo      مثال: 192.168.1.50:5555
echo.
set /p TVIP=اكتب عنوان IP بتاع الشاشة (مثال 192.168.1.50:5555):
if "%TVIP%"=="" (
  echo  مكتبتش عنوان. شغّل الملف تاني بعد ما تجيب العنوان من الشاشة.
  pause
  exit /b 1
)

set ADB=%~dp0tools\adb\adb.exe
if not exist "%ADB%" (
  echo  ملف adb مش موجود. تأكد ان مجلد tools\adb موجود جنب الملف ده.
  pause
  exit /b 1
)

echo.
echo  [1/7] بتصل بالشاشة...
"%ADB%" connect %TVIP%
"%ADB%" -s %TVIP% shell echo ok >nul 2>&1
if errorlevel 1 (
  echo  مش قادر اوصل للشاشة. تأكد ان:
  echo   - الشاشة والكمبيوتر على نفس الواي فاي
  echo   - "تصحيح لاسلكي" شغال على الشاشة
  echo   - العنوان صح (IP:port)
  echo  ولو الشاشة سألتك "السماح بتصحيح USB؟" دوس "السماح" وعلم "دايماً".
  pause
  exit /b 1
)
echo  متصل بالشاشة.

echo.
echo  [2/7] بثبّت اللانشر...
"%ADB%" -s %TVIP% install -r "%~dp0launcher.apk"
if errorlevel 1 (
  echo  التثبيت فشل. جرّب تاني بعد ما تتأكد ان الشاشة متصلة.
  pause
  exit /b 1
)

echo.
echo  [3/7] بنزّل SmartTube و Oscar TV (من المصادر الرسمية)...
powershell -NoProfile -Command "Invoke-WebRequest -Uri 'https://github.com/yuliskov/SmartTube/releases/latest/download/SmartTube_stable.apk' -OutFile '%TEMP%\SmartTube.apk' -UseBasicParsing"
if exist "%TEMP%\SmartTube.apk" (
  "%ADB%" -s %TVIP% install -r "%TEMP%\SmartTube.apk"
) else (
  echo  مقدرتش انزّل SmartTube. نزّله من المتجر بعدين.
)
powershell -NoProfile -Command "Invoke-WebRequest -Uri 'https://github.com/Oscar-TV/apk/releases/latest/download/OscarTV.apk' -OutFile '%TEMP%\OscarTV.apk' -UseBasicParsing"
if exist "%TEMP%\OscarTV.apk" (
  "%ADB%" -s %TVIP% install -r "%TEMP%\OscarTV.apk"
) else (
  echo  مقدرتش انزّل Oscar TV. نزّله من المتجر بعدين.
)

echo.
echo  [4/7] بفتح المتجر للتطبيقات الباقية (دوس "تثبيت" على كل واحد)...
for %%P in (com.tdm.manager org.videolan.vlc com.lonelycatgames.Xplore app.sofabrowser com.google.android.videos com.amazon.amazonvideo.livingroom com.google.android.inputmethod.latin) do (
  "%ADB%" -s %TVIP% shell am start -a android.intent.action.VIEW -d "market://details?id=%%P" >nul 2>&1
  timeout /t 2 /nobreak >nul
)
echo  ثبّت من المتجر: TDM و VLC و X-plore و SofaBrowser و Google TV و Prime Video و Gboard.

echo.
echo  [5/7] بنضّف التطبيقات اللي ملهاش لازمة (بتتفعّل تاني من الاعدادات لو حبيت)...
for %%P in (com.haier.tvhousekeeper com.haier.emanual com.haier.apps fusion.android.tv.demo com.android.adservices.api com.android.ondevicepersonalization.services com.android.federatedcompute.services) do (
  "%ADB%" -s %TVIP% shell pm disable-user --user 0 %%P >nul 2>&1
)
echo  وبخفي يوتيوب الاصلي عشان SmartTube يبقى هو يوتيوب:
"%ADB%" -s %TVIP% shell pm disable-user --user 0 com.google.android.youtube.tv >nul 2>&1

echo.
echo  [6/7] بظبط اللانشر كرئيسي وبفعّل الصلاحيات...
"%ADB%" -s %TVIP% shell cmd package set-home-activity com.gathin.tvhome/.MainActivity >nul 2>&1
"%ADB%" -s %TVIP% shell pm grant com.gathin.tvhome android.permission.WRITE_SECURE_SETTINGS >nul 2>&1
"%ADB%" -s %TVIP% shell pm grant com.gathin.tvhome android.permission.RECORD_AUDIO >nul 2>&1
"%ADB%" -s %TVIP% shell pm grant com.gathin.tvhome android.permission.WRITE_SETTINGS >nul 2>&1
"%ADB%" -s %TVIP% shell settings put secure assistant com.gathin.tvhome/.AssistantService >nul 2>&1
"%ADB%" -s %TVIP% shell settings put secure voice_interaction_service com.gathin.tvhome/.AssistantService >nul 2>&1

echo.
echo  [7/7] خلصت! دوس زر Home على الريموت واختار "Home" لو سألك.
echo.
echo  ============================================================
echo   فاضل خطوة واحدة بس - حساباتك انت:
echo   1) افتح SmartTube ^> سجّل دخول بحساب جوجل بتاعك
echo      (من المتصفح: yt.be/activate)
echo   2) افتح Prime Video ^> سجّل دخول بحساب امازون بتاعك
echo      (من المتصفح: amazon.com/mytv)
echo   3) من اللانشر ^> الاعدادات ^> "موقع الصلاة" ^> اختار مدينتك
echo      (الافتراضي: أجا / نوسا الغيط)
echo   4) من اللانشر ^> الاعدادات ^> "زرار الاعدادات والمايك"
echo      لو الريموت بتاعك زرار الاعدادات والمايك مش شغالين
echo  ============================================================
echo.
echo  لو حصلت مشكلة، افتح issue على جيت هاب او ابعت لميدو.
pause
