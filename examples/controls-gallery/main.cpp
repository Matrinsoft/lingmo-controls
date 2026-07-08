#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QtQml>
#include <LingmoControls/LingmoControls.h>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    app.setApplicationName("Lingmo Controls Gallery");
    app.setApplicationVersion("1.0.0");

    LingmoControls::initialize();

    QQmlApplicationEngine engine;
    engine.addImportPath("qrc:/");
    engine.load(QUrl("qrc:/qml/main.qml"));

    return app.exec();
}
