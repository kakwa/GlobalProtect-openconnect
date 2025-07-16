#ifndef ENHANCEDWEBPAGE_H
#define ENHANCEDWEBPAGE_H

#include <QtWebEngineCore/qwebenginepage.h>

class EnhancedWebPage : public QWebEnginePage
{
protected:
    bool certificateError(const QWebEngineCertificateError &certificateError);
};

#endif // !ECHANCEDWEBPAG
