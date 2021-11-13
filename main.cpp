#include <QtGui/QGuiApplication>
#include <QQuickView>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQuickView view;
    view.setTitle("Messenger");
    view.setSource(QUrl(QStringLiteral("qrc:/qml/qmlwebsocketclient/main.qml")));
    view.show();


    return app.exec();
}
