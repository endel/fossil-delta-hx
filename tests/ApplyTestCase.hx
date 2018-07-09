import io.gamestd.FossilDelta;

class ApplyTestCase extends haxe.unit.TestCase {

    override public function setup() {
        // value = "foo";
    }

    public function testBasic() {
        var source: Array<Int> = [ 129, 165, 104, 101, 108, 108, 111, 166, 119, 111, 114, 108, 100, 33 ];
        var delta: Array<Int> = [ 79, 10, 79, 58, 129, 165, 104, 101, 108, 108, 111, 176, 98, 101, 97, 117, 116, 105, 102, 117, 108, 32, 119, 111, 114, 108, 100, 33, 50, 90, 82, 78, 106, 70, 59 ];
        var result: Array<Int> = [ 129, 165, 104, 101, 108, 108, 111, 176, 98, 101, 97, 117, 116, 105, 102, 117, 108, 32, 119, 111, 114, 108, 100, 33 ];

        var computedResult = FossilDelta.Apply(source, delta);

        assertEquals(Std.string(result), Std.string(computedResult));
    }

}
