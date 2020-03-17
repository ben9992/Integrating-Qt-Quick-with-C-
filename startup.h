#pragma once
#include <QObject>

class QQmlApplicationEngine;
class MainViewMgr;
class Settings;
class Instrument;

class Startup : public QObject
{
    Q_OBJECT
public:
    explicit Startup(QObject *parent=0);

private:

    MainViewMgr& m_mainViewMgr;
    QQmlApplicationEngine& m_engine;
    Settings& m_settings;
    Instrument& m_inst;

    void WireMainViewMgrToInst();

    explicit Startup(const Startup& rhs) = delete;
    Startup& operator= (const Startup& rhs) = delete;
};


