import QtQuick
import QtTest
import Lingmo.Controls

TestCase {
    name: "TabBarTest"

    function test_defaults() {
        var bar = createTemporaryObject(TabBar, parent, {})
        verify(bar !== null)
        compare(bar.currentIndex, -1)
    }

    function test_tabButtons() {
        var bar = createTemporaryObject(TabBar, parent, {})
        var btn1 = createTemporaryObject(TabButton, bar, {text: "Tab 1"})
        var btn2 = createTemporaryObject(TabButton, bar, {text: "Tab 2"})
        compare(bar.count, 2)
    }

    function test_tabButtonDefaults() {
        var btn = createTemporaryObject(TabButton, parent, {text: "Test"})
        verify(btn !== null)
        compare(btn.text, "Test")
        compare(btn.checked, false)
    }
}
