#include "mainwindow.h"

#include <QApplication>
#include <QTimer>

int main(int argc, char *argv[]) {
  QApplication a(argc, argv);
  MainWindow w;
  w.show();

  if (auto quit = getenv("SHOULD_QUIT");
      quit && quit[0] != 0 && quit[0] != '0') {
    QTimer::singleShot(100, [] { qApp->quit(); });
  }

  return a.exec();
}
