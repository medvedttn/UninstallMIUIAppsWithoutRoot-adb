# UninstallMIUIAppsWithoutRoot-adb
## (Блокирование системных приложений на Xiaomi MIUI через ADB только для текущего пользователя без прав root)
Проверено на Xiaomi Redmi 3s Global stock 8.0.3.0 (6 андроид).

1. Получаем права разработчика и включам отладку по ADB
  1.1 Меню "Настройки" -> "О телефоне" -> 5 раз (или более) нажимаем на надпись  "Версия MIUI" до появления надписи "Вы стали разработчиком!"
  1.2 Меню "Настройки" -> "Дополнительно" -> "Для разработчиков" -> включаем "Режим разработчика", далее "Включить отладку по USB".

2. Устанавливаем драйвер для USB (обычно идет в комплекте с MiFlash/Mi PC Suite, или как пакет в Android SDK Tools,или качаем отдельно с 4pda например)
3. Подключаем телефон по USB в режиме отладки, разрешаем доступ с данного ПК (RSA хеш)
4. Качаем и распаковываем ADB Tools (идет как пакет в Android SDK или отдельно искать)
5. Запускаем в командной строке в текущей папке с ABD Tools `adb devices -l`. Должны быть сообщения о старте adb демона (если еще не запущен) и идентификатор подключенного телефона (c параметром -l больше инфы)
6. Для просмотра ВСЕХ установленных пакетов (используется shell и package manager) вводим `adb shell pm list packages [-f] [filter word]`, где параметр -f выводит ассоциированный файл пакета, filter word  - дополнительно выводит только пакеты с заданной строкой (например `adb shell pm list packages miui`). Для дальнейших действий нужно вводить полное имя пакета, т.е. например "com.miui.analytics".
7. Удаляем приложения для текущего пользователя командой `adb shell pm uninstall --user 0 <имя пакета>`, при успешном завершении должно быть сообщение "Success". Дополнительно есть параметр --k, с которым данные приложения сохраняются. 
Например:
```
adb shell pm uninstall --user 0 com.miui.analytics
adb shell pm uninstall --user 0 com.miui.systemAdSolution
adb shell pm uninstall --user 0 com.miui.whetstone
```
8. По завершении останавливаем adb `adb disconnect`, отсоединяем и перезагружаем телефон.


Примерный cmd файл "adb_uninstall_ads.cmd" в репозитории.
