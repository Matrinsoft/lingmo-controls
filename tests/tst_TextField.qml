import QtQuick
import QtTest
import Lingmo.Controls

TestCase {
    name: "TextFieldTest"

    function test_defaults() {
        var tf = createTemporaryObject(TextField, parent, {})
        verify(tf !== null)
        compare(tf.text, "")
    }

    function test_placeholder() {
        var tf = createTemporaryObject(TextField, parent, {placeholderText: "Enter name"})
        compare(tf.placeholderText, "Enter name")
    }

    function test_textInput() {
        var tf = createTemporaryObject(TextField, parent, {text: "hello"})
        compare(tf.text, "hello")
    }

    function test_disabled() {
        var tf = createTemporaryObject(TextField, parent, {enabled: false})
        compare(tf.enabled, false)
    }
}
