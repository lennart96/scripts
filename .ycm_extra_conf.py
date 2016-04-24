flags = '''
-Wall
-Wextra
-Werror
-std=c99
-x
c
-I
.
-isystem
/usr/include
-isystem
/usr/lib/clang/3.5.1/include
-I/usr/include/libevdev-1.0/libevdev/
-I/usr/include/libbsd
-I/usr/include/qt/QtDBus
-I/usr/include/qt/QtQml
-I/usr/include/qt/QtXml
-I/usr/include/qt/QtSvg
-I/usr/include/qt/QtConcurrent
-I/usr/include/qt/QtQuick
-I/usr/include/qt/QtScript
-I/usr/include/qt/QtNetwork
-I/usr/include/qt/QtSensors
-I/usr/include/qt/QtDeclarative
-I/usr/include/qt/QtWebKit
-I/usr/include/qt/QtCore
-I/usr/include/qt/QtGui
-I/usr/include/qt/QtWidgets
'''.splitlines()

def FlagsForFile(filename, **kw):
    return {
            'flags' : flags,
            'do_cache': True
    }
