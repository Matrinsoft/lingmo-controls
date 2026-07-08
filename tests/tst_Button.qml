import QtQuick
import QtTest
import Lingmo.Controls

TestCase {
    name: "ButtonTest"

    function test_defaults() {
        var btn = createTemporaryObject(Button, parent, {})
        verify(btn !== null)
        compare(btn.accent, false)
        compare(btn.flat, false)
        compare(btn.enabled, true)
    }

    function test_text() {
        var btn = createTemporaryObject(Button, parent, {text: "Install"})
        compare(btn.text, "Install")
    }

    function test_accent() {
        var btn = createTemporaryObject(Button, parent, {accent: true})
        compare(btn.accent, true)
    }

    function test_disabled() {
        var btn = createTemporaryObject(Button, parent, {enabled: false})
        compare(btn.enabled, false)
    }

    function test_click() {
        var btn = createTemporaryObject(Button, parent, {})
        var clicked = false
        btn.clicked.connect(function() { clicked = true })
        btn.clicked()
        verify(clicked, "Button clicked signal should fire")
    }
}
