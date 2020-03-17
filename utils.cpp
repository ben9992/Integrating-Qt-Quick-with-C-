#include "utils.h"
#include <QString>
#include <QDebug>


static QString DESTRUCTOR_MSG = QStringLiteral("Running the %1 destructor.");
void Utils::DestructorMsg(const QString& val)
{
    qDebug() << DESTRUCTOR_MSG.arg(val);
}

void Utils::DestructorMsg(const QObject* const obj)
{
    DestructorMsg(obj->metaObject()->className());
}
