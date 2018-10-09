import QtQuick 2.1
import Sailfish.Silica 1.0
import org.nemomobile.configuration 1.0

Page {
    id: page

    ConfigurationGroup {
        id: xperiaclock
        path: "/desktop/lipstick/sailfishos-patch-xperia-clock"
        property bool ampm: false
        property real hsize: 3.5
        property real hmargin: 2
        property color hcolor: Theme.primaryColor
        property real msize: 3.5
        property real mmargin: 1
        property color mcolor: Theme.primaryColor
        property real datesize: 40
        property real datemargin: 1
        property color datecolor: Theme.primaryColor
        property bool weatherenabled: false
        property int weatherscale: 100
    }

    SilicaFlickable {
        id: flick
        anchors.fill: parent
        contentHeight: content.height

        Column {
            id: content
            width: parent.width
            spacing: Theme.paddingMedium

            PageHeader {
                title: qsTr("Xperia clock")
            }

            SectionHeader {
                text: qsTr("Hours")
            }

            IconTextSwitch {
                id: boolampm
                automaticCheck: true
                text: qsTr("AM/PM")
                checked: xperiaclock.ampm
                onClicked: {
                xperiaclock.ampm = checked
                }
            }

            BackgroundItem {
                id: cphcolor
                Row {
                    x: Theme.horizontalPageMargin
                    height: parent.height
                    spacing: Theme.paddingMedium
                    Rectangle {
                        id: hcolorIndicator
                        width: height
                        height: parent.height
                        color: xperiaclock.hcolor
                    }
                    Label {
                        text: qsTr("Color")
                        color: cphcolor.down ? Theme.highlightColor : Theme.primaryColor
                        anchors.verticalCenter: parent.verticalCenter
                    }
                }
                onClicked: {
                    var page = pageStack.push("Sailfish.Silica.ColorPickerPage", { color: hcolorIndicator.color })
                    page.colorClicked.connect(function(color) {
                        hcolorIndicator.color = color
                        xperiaclock.hcolor = color
                        pageStack.pop()
                    })
                }
                Component {
                    id: hcolorPickerPage
                    ColorPickerPage {}
                }
            }

              Button {
                  anchors.horizontalCenter: parent.horizontalCenter
                  text: qsTr("Restore")
                  onClicked: {
                    xperiaclock.hcolor = Theme.primaryColor
                    hcolorIndicator.color = xperiaclock.hcolor
                }
              }

            Slider {
                id: sldhsize
                width: parent.width
                label: qsTr("Size")
                maximumValue: 5
                minimumValue: 1
                stepSize: 0.5
                value: xperiaclock.hsize
                valueText: value
                onPressAndHold: cancel()

                onReleased: {
                    xperiaclock.hsize = value
                }
            }

              Button {
                  anchors.horizontalCenter: parent.horizontalCenter
                  text: qsTr("Restore")
                  onClicked: {
                    xperiaclock.hsize = 3.5
                    sldhsize.value = xperiaclock.hsize
                }
              }

            Slider {
                id: sldhmargin
                width: parent.width
                label: qsTr("Spacing")
                maximumValue: 4
                minimumValue: 0
                stepSize: 0.5
                value: xperiaclock.hmargin
                valueText: value
                onPressAndHold: cancel()

                onReleased: {
                    xperiaclock.hmargin = value
                }
            }

              Button {
                  anchors.horizontalCenter: parent.horizontalCenter
                  text: qsTr("Restore")
                  onClicked: {
                    xperiaclock.hmargin = 2
                    sldhmargin.value = xperiaclock.hmargin
                }
              }

            SectionHeader {
                text: qsTr("Minutes")
            }

            BackgroundItem {
                id: cpmcolor
                Row {
                    x: Theme.horizontalPageMargin
                    height: parent.height
                    spacing: Theme.paddingMedium
                    Rectangle {
                        id: mcolorIndicator
                        width: height
                        height: parent.height
                        color: xperiaclock.mcolor
                    }
                    Label {
                        text: qsTr("Color")
                        color: cpmcolor.down ? Theme.highlightColor : Theme.primaryColor
                        anchors.verticalCenter: parent.verticalCenter
                    }
                }
                onClicked: {
                    var page = pageStack.push("Sailfish.Silica.ColorPickerPage", { color: mcolorIndicator.color })
                    page.colorClicked.connect(function(color) {
                        mcolorIndicator.color = color
                        xperiaclock.mcolor = color
                        pageStack.pop()
                    })
                }
                Component {
                    id: mcolorPickerPage
                    ColorPickerPage {}
                }
            }

              Button {
                  anchors.horizontalCenter: parent.horizontalCenter
                  text: qsTr("Restore")
                  onClicked: {
                    xperiaclock.mcolor = Theme.primaryColor
                    mcolorIndicator.color = xperiaclock.mcolor
                }
              }


            Slider {
                id: sldmsize
                width: parent.width
                label: qsTr("Size")
                maximumValue: 5
                minimumValue: 1
                stepSize: 0.5
                value: xperiaclock.msize
                valueText: value
                onPressAndHold: cancel()

                onReleased: {
                    xperiaclock.msize = value
                }
            }

              Button {
                  anchors.horizontalCenter: parent.horizontalCenter
                  text: qsTr("Restore")
                  onClicked: {
                    xperiaclock.msize = 3.5
                    sldmsize.value = xperiaclock.msize
                }
              }

            Slider {
                id: sldmmargin
                width: parent.width
                label: qsTr("Spacing")
                maximumValue: 5
                minimumValue: -3
                stepSize: 0.5
                value: xperiaclock.mmargin
                valueText: value
                onPressAndHold: cancel()

                onReleased: {
                    xperiaclock.mmargin = value
                }
            }

              Button {
                  anchors.horizontalCenter: parent.horizontalCenter
                  text: qsTr("Restore")
                  onClicked: {
                    xperiaclock.mmargin = 1
                    sldmmargin.value = xperiaclock.mmargin
                }
              }

            SectionHeader {
                text: qsTr("Date")
            }

            BackgroundItem {
                id: cpdatecolor
                Row {
                    x: Theme.horizontalPageMargin
                    height: parent.height
                    spacing: Theme.paddingMedium
                    Rectangle {
                        id: datecolorIndicator
                        width: height
                        height: parent.height
                        color: xperiaclock.datecolor
                    }
                    Label {
                        text: qsTr("Color")
                        color: cpdatecolor.down ? Theme.highlightColor : Theme.primaryColor
                        anchors.verticalCenter: parent.verticalCenter
                    }
                }
                onClicked: {
                    var page = pageStack.push("Sailfish.Silica.ColorPickerPage", { color: datecolorIndicator.color })
                    page.colorClicked.connect(function(color) {
                        datecolorIndicator.color = color
                        xperiaclock.datecolor = color
                        pageStack.pop()
                    })
                }
                Component {
                    id: datecolorPickerPage
                    ColorPickerPage {}
                }
            }

              Button {
                  anchors.horizontalCenter: parent.horizontalCenter
                  text: qsTr("Restore")
                  onClicked: {
                    xperiaclock.datecolor = Theme.primaryColor
                    datecolorIndicator.color = xperiaclock.datecolor
                }
              }

            Slider {
                id: slddatesize
                width: parent.width
                label: qsTr("Size")
                maximumValue: 60
                minimumValue: 20
                stepSize: 5
                value: xperiaclock.datesize
                valueText: value
                onPressAndHold: cancel()

                onReleased: {
                    xperiaclock.datesize = value
                }
            }

              Button {
                  anchors.horizontalCenter: parent.horizontalCenter
                  text: qsTr("Restore")
                  onClicked: {
                    xperiaclock.datesize = 40
                    slddatesize.value = xperiaclock.datesize
                }
              }

            Slider {
                id: slddatemargin
                width: parent.width
                label: qsTr("Spacing")
                maximumValue: 5
                minimumValue: -3
                stepSize: 0.5
                value: xperiaclock.datemargin
                valueText: value
                onPressAndHold: cancel()

                onReleased: {
                    xperiaclock.datemargin = value
                }
            }

              Button {
                  anchors.horizontalCenter: parent.horizontalCenter
                  text: qsTr("Restore")
                  onClicked: {
                    xperiaclock.datemargin = 1
                    slddatemargin.value = xperiaclock.datemargin
                }
              }

            SectionHeader {
                text: qsTr("Weather")
            }

            IconTextSwitch {
                id: boolweather
                automaticCheck: true
                text: qsTr("Show weather")
                checked: xperiaclock.weatherenabled
                onClicked: {
                xperiaclock.weatherenabled = checked
                }
            }

            Slider {
                id: sldweather
                visible: boolweather.checked
                width: parent.width
                label: qsTr("Size")
                maximumValue: 100
                minimumValue: 10
                stepSize: 10
                value: xperiaclock.weatherscale
                valueText: value + "%"
                onPressAndHold: cancel()

                onReleased: {
                    xperiaclock.weatherscale = value
                }
            }

              SectionHeader { text: qsTr("Support") }

              Label {
                  x: Theme.paddingLarge
                  width: parent.width - (x * 2)
                  wrapMode: Text.Wrap
                  text: qsTr("If you like my work and want to buy me a beer, feel free to do it!")
              }

              Button {
                  anchors.horizontalCenter: parent.horizontalCenter
                  text: qsTr("Donate")
                  onClicked: Qt.openUrlExternally("https://www.paypal.me/fravaccaro")
              }

    }

        VerticalScrollDecorator {
            flickable: flick
        }
    }
}

