include("${CMAKE_SOURCE_DIR}/cmake/Add3rdParty.cmake")

project(GPClient)

set(gpclient_GENERATED_SOURCES)
set(QT_DEFAULT_MAJOR_VERSION 6)

configure_file(com.yuezk.qt.gpclient.desktop.in com.yuezk.qt.gpclient.desktop)
configure_file(com.yuezk.qt.gpclient.metainfo.xml.in com.yuezk.qt.gpclient.metainfo.xml)

qt6_add_dbus_interface(
    gpclient_GENERATED_SOURCES
    ${CMAKE_BINARY_DIR}/com.yuezk.qt.GPService.xml
    gpserviceinterface
)

add_executable(gpclient
    cdpcommand.cpp
    cdpcommandmanager.cpp
    enhancedwebview.cpp
    gatewayauthenticator.cpp
    gatewayauthenticatorparams.cpp
    gpgateway.cpp
    gphelper.cpp
    loginparams.cpp
    main.cpp
    standardloginwindow.cpp
    portalauthenticator.cpp
    portalconfigresponse.cpp
    preloginresponse.cpp
    samlloginwindow.cpp
    gpclient.cpp
    settingsdialog.cpp
    gpclient.ui
    standardloginwindow.ui
    settingsdialog.ui
    challengedialog.h
    challengedialog.cpp
    challengedialog.ui
    vpn_dbus.cpp
    vpn_json.cpp
    resources.qrc
    ${gpclient_GENERATED_SOURCES}
)

set(QT_DEFAULT_MAJOR_VERSION 6 CACHE STRING "Qt version to use, defaults to 6")

add_3rdparty(
    SingleApplication
    GIT_REPOSITORY https://github.com/itay-grudev/SingleApplication.git
    GIT_TAG v3.5.3
    CMAKE_ARGS
        -DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}
        -DCMAKE_CXX_FLAGS_RELEASE=${CMAKE_CXX_FLAGS_RELEASE}
        -DCMAKE_FIND_ROOT_PATH=${CMAKE_FIND_ROOT_PATH}
        -DCMAKE_PREFIX_PATH=$ENV{CMAKE_PREFIX_PATH}
        -DQAPPLICATION_CLASS=QApplication
        -DQT_DEFAULT_MAJOR_VERSION=6
)

add_3rdparty(
    plog
    GIT_REPOSITORY https://github.com/SergiusTheBest/plog.git
    GIT_TAG 1.1.11
    CMAKE_ARGS
        -DPLOG_BUILD_SAMPLES=OFF
        -DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}
        -DCMAKE_CXX_FLAGS_RELEASE=${CMAKE_CXX_FLAGS_RELEASE}
)

ExternalProject_Get_Property(SingleApplication-${PROJECT_NAME} SOURCE_DIR BINARY_DIR)
set(SingleApplication_INCLUDE_DIR ${SOURCE_DIR})
set(SingleApplication_LIBRARY ${BINARY_DIR}/libSingleApplication.a)

ExternalProject_Get_Property(plog-${PROJECT_NAME} SOURCE_DIR)
set(plog_INCLUDE_DIR "${SOURCE_DIR}/include")

add_dependencies(gpclient
    SingleApplication-${PROJECT_NAME}
    plog-${PROJECT_NAME}
)

target_include_directories(gpclient PRIVATE
    ${CMAKE_BINARY_DIR}
    ${CMAKE_CURRENT_SOURCE_DIR}
    ${CMAKE_CURRENT_BINARY_DIR}
    ${SingleApplication_INCLUDE_DIR}
    ${plog_INCLUDE_DIR}
    ${QTKEYCHAIN_INCLUDE_DIRS}/qt6keychain
)

target_link_libraries(gpclient
    ${SingleApplication_LIBRARY}
    Qt6::Widgets
    Qt6::Network
    Qt6::WebSockets
    Qt6::WebEngineCore
    Qt6::WebEngineWidgets
    Qt6::DBus
    QtSignals
    ${QTKEYCHAIN_LIBRARIES}
)

if (CMAKE_CXX_COMPILER_VERSION VERSION_GREATER 8.0 AND CMAKE_BUILD_TYPE STREQUAL Release)
    target_compile_options(gpclient PUBLIC "-ffile-prefix-map=${CMAKE_SOURCE_DIR}=.")
endif()

target_compile_definitions(gpclient PUBLIC QAPPLICATION_CLASS=QApplication)

install(TARGETS gpclient DESTINATION bin)
install(FILES "${CMAKE_CURRENT_BINARY_DIR}/com.yuezk.qt.gpclient.metainfo.xml" DESTINATION share/metainfo)
install(FILES "${CMAKE_CURRENT_BINARY_DIR}/com.yuezk.qt.gpclient.desktop" DESTINATION share/applications)
install(FILES "com.yuezk.qt.gpclient.svg" DESTINATION share/icons/hicolor/scalable/apps)
