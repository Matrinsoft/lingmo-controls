#include <QtQml/qqmlextensionplugin.h>

class LingmoControlsPlugin : public QQmlEngineExtensionPlugin
{
    Q_OBJECT
    Q_PLUGIN_METADATA(IID QQmlEngineExtensionInterface_iid)
};

#include "LingmoControlsPlugin.moc"
