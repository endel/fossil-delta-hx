import io.gamestd.FossilDelta;

import haxe.io.Bytes;
import haxe.io.BytesBuffer;

class ApplyTestCase extends haxe.unit.TestCase {

    override public function setup() {
    }

    public function testBasic() {
        var source = getBytes([ 129, 165, 104, 101, 108, 108, 111, 166, 119, 111, 114, 108, 100, 33 ]);
        var delta = getBytes([ 79, 10, 79, 58, 129, 165, 104, 101, 108, 108, 111, 176, 98, 101, 97, 117, 116, 105, 102, 117, 108, 32, 119, 111, 114, 108, 100, 33, 50, 90, 82, 78, 106, 70, 59 ]);
        var result = getBytes([ 129, 165, 104, 101, 108, 108, 111, 176, 98, 101, 97, 117, 116, 105, 102, 117, 108, 32, 119, 111, 114, 108, 100, 33 ]);

        var computedResult = FossilDelta.Apply(source, delta);

        assertEquals(Std.string(result), Std.string(computedResult));
    }

    private function getBytes (arr: Array<Int>) {
        var buffer = new BytesBuffer();
        for (i in arr) {
            buffer.addByte(i);
        }
        return buffer.getBytes();
    }


}
