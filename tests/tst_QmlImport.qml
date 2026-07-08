import QtQuick
import QtTest
import Lingmo.Controls

TestCase {
    name: "QmlImport"

    function test_import() {
        var btn = createTemporaryObject(Button, parent, {})
        verify(btn !== null, "Button should be creatable")
    }

    function test_buttonProperties() {
        var btn = createTemporaryObject(Button, parent, {text: "Hello"})
        verify(btn !== null)
        compare(btn.text, "Hello")
        compare(btn.accent, false)
    }

    function test_textField() {
        var tf = createTemporaryObject(TextField, parent, {placeholderText: "Type..."})
        verify(tf !== null)
        compare(tf.placeholderText, "Type...")
    }

    function test_checkBox() {
        var cb = createTemporaryObject(CheckBox, parent, {text: "Option", checked: true})
        verify(cb !== null)
        compare(cb.text, "Option")
        compare(cb.checked, true)
    }

    function test_slider() {
        var sl = createTemporaryObject(Slider, parent, {from: 0, to: 100, value: 50})
        verify(sl !== null)
        compare(sl.from, 0)
        compare(sl.to, 100)
        compare(sl.value, 50)
    }

    function test_textArea() {
        var ta = createTemporaryObject(TextArea, parent, {placeholderText: "Multi..."})
        verify(ta !== null)
        compare(ta.placeholderText, "Multi...")
    }

    function test_spinBox() {
        var sb = createTemporaryObject(SpinBox, parent, {from: 0, to: 10, value: 5})
        verify(sb !== null)
        compare(sb.from, 0)
        compare(sb.to, 10)
        compare(sb.value, 5)
    }

    function test_dial() {
        var d = createTemporaryObject(Dial, parent, {from: 0, to: 100, value: 42})
        verify(d !== null)
        compare(d.value, 42)
    }

    function test_groupBox() {
        var gb = createTemporaryObject(GroupBox, parent, {title: "Settings"})
        verify(gb !== null)
        compare(gb.title, "Settings")
    }

    function test_pageIndicator() {
        var pi = createTemporaryObject(PageIndicator, parent, {count: 3, currentIndex: 1})
        verify(pi !== null)
        compare(pi.count, 3)
        compare(pi.currentIndex, 1)
    }

    function test_busyIndicator() {
        var bi = createTemporaryObject(BusyIndicator, parent, {running: true})
        verify(bi !== null)
        compare(bi.running, true)
    }

    function test_tumbler() {
        var tu = createTemporaryObject(Tumbler, parent, {model: ["A", "B", "C"]})
        verify(tu !== null)
        compare(tu.model.length, 3)
    }

    function test_delayButton() {
        var db = createTemporaryObject(DelayButton, parent, {text: "Hold"})
        verify(db !== null)
        compare(db.text, "Hold")
    }
}
