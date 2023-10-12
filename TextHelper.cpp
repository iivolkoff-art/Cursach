#include "TextHelper.h"
#include <QProcess>
#include <qDebug>

TextHelper::TextHelper()
{

}

QString TextHelper::getDataFromScript() {
    QProcess process;
    process.start("python", QStringList() << "Script.py");
    process.readAllStandardError();
    process.waitForFinished();
    QString output = process.readAllStandardOutput();
    qDebug() << output;
    return output;
}
