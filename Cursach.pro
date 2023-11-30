QT += quick
QT += network gui
# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
        businessLogic/LoginManager/LoginManager.cpp \
        businessLogic/NetworkChecker/NetworkChecker.cpp\
        businessLogic/SettingsManager/SettingsManager.cpp \
        businessLogic/TextHelper/TextHelper.cpp \
        main.cpp \
        businessLogic/TestsCreater/testscreater.cpp

RESOURCES += qml.qrc

#android: QT_ANDROID_APP_ICON = res:assets/images/test.PNG

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

#INCLUDEPATH += C:\Users\Volkov\AppData\Local\Programs\Python\Python311\include
#INCLUDEPATH += C:\Users\Volkov\AppData\Local\Programs\Python\Python310\include
#INCLUDEPATH += C:\Users\Volkov\AppData\Local\Programs\Python\Python39\include

DISTFILES += \
    android/AndroidManifest.xml \
    android/build.gradle \
    android/gradle.properties \
    android/gradle/wrapper/gradle-wrapper.jar \
    android/gradle/wrapper/gradle-wrapper.properties \
    android/gradlew \
    android/gradlew.bat \
    android/res/values/libs.xml \
    assets/files/Script.py \
    assets/files/output1.json

contains(ANDROID_TARGET_ARCH,armeabi-v7a) {
    ANDROID_PACKAGE_SOURCE_DIR = \
        $$PWD/android
}



HEADERS += \
    businessLogic/LoginManager/LoginManager.h \
    businessLogic/NetworkChecker/NetworkChecker.h \
    businessLogic/SettingsManager/SettingsManager.h \
    businessLogic/TextHelper/TextHelper.h \
    businessLogic/TestsCreater/testscreater.h
