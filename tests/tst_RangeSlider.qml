import QtQuick
import QtTest
import Lingmo.Controls

TestCase {
    name: "RangeSliderTest"

    function test_defaults() {
        var rs = createTemporaryObject(RangeSlider, parent, {from: 0, to: 100})
        verify(rs !== null)
        compare(rs.from, 0)
        compare(rs.to, 100)
    }

    function test_values() {
        var rs = createTemporaryObject(RangeSlider, parent, {from: 0, to: 100, first: {value: 25}, second: {value: 75}})
        compare(rs.first.value, 25)
        compare(rs.second.value, 75)
    }
}
