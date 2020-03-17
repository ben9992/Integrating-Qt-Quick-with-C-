#include "startup.h"
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QThread>
#include "MainViewMgr.h"
#include "provider.h"
#include "settings.h"
#include "instrument.h"

Startup::Startup(QObject *parent) :
    QObject(parent),
    m_mainViewMgr(*new MainViewMgr()),
    m_engine(*new QQmlApplicationEngine()),
    m_settings(Provider::GetSettingsAsSingelton()),
    m_inst(*new Instrument(this, m_settings, Provider::GetConnectorAsSingelton(), *new QThread()))
{

    m_settings.ParseJsonData();
    m_mainViewMgr.Initialize(m_settings);
    auto root_context = m_engine.rootContext();

    root_context->setContextProperty("MainViewMgr", &m_mainViewMgr);

    m_engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    WireMainViewMgrToInst();
}

void Startup::WireMainViewMgrToInst()
{
    connect(&m_mainViewMgr, &MainViewMgr::powerOnChanged, &m_inst, &Instrument::onPowerChanged);
    connect(&m_mainViewMgr, &MainViewMgr::velocityChanged, &m_inst, &Instrument::onVelocityChanged);
    connect(&m_mainViewMgr, &MainViewMgr::distanceChanged, &m_inst, &Instrument::onDistanceChanged);
}
