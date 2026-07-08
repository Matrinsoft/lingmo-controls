import QtQuick
import QtTest
import Lingmo.Controls

TestCase {
    name: "ComboBoxTest"

    function test_defaults() {
        var cb = createTemporaryObject(ComboBox, parent, {})
        verify(cb !== null)
        compare(cb.currentIndex, -1)
    }

    function test_model() {
        var cb = createTemporaryObject(ComboBox, parent, {model: ["A", "B", "C"]})
        compare(cb.count, 3)
        compare(cb.currentIndex, -1)
    }

    function test_selection() {
        var cb = createTemporaryObject(ComboBox, parent, {model: ["A", "B", "C"]})
        cb.currentIndex = 1
        compare(cb.currentIndex, 1)
        compare(cb.currentText, "B")
    }

    function test_disabled() {
        var cb = createTemporaryObject(ComboBox, parent, {enabled: false})
        compare(cb.enabled, false)
    }
}
