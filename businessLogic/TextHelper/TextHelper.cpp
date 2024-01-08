#include "TextHelper.h"
#include <QProcess>
#include <qDebug>
#include <QTcpSocket>
#include <thread>
#include "../ServerDataProccesor/ServerDataProccesor.h"

TextHelper::TextHelper()
{
    getterPyScriptData = new ServerDataProccesor();
}

QString TextHelper::getDataFromScripFroServer() {
    return getterPyScriptData->getPyFromServer();
}

