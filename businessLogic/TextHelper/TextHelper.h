#ifndef TEXTHELPER_H
#define TEXTHELPER_H

#include <QObject>
#include <QHostAddress>
#include "../Structs/ServerStruct.h"
#include "GetterPyScriptData.h"

class TextHelper : public QObject
{
    Q_OBJECT
private:
    GetterPyScriptData* getterPyScriptData;

public:
    TextHelper();
    Q_INVOKABLE QString getDataFromScripFroServer();
};

#endif // TEXTHELPER_H
