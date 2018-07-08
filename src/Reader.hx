package io.gamestd;

// Reader reads bytes, chars, ints from array.
class Reader {
    private var a: Array<Int>; // source array
    private var pos: Int; // current position in array

    private function new (array: Array<Int>) {
        this.a = array;
        this.pos = 0;
    }

    public function haveBytes () {
        return this.pos < this.a.length;
    }

    public function getByte () {
        var b = this.a[this.pos];
        this.pos++;
        if (this.pos > this.a.length) throw "out of bounds";
        return b;
    }

    public function getChar () {
        return String.fromCharCode(this.getByte());
    }

    public function getInt () {
        var v = 0, c;

        while(this.haveBytes() && (c = FossilDelta.zValue[0x7f & this.getByte()]) >= 0) {
            v = (v<<6) + c;
        }

        this.pos--;
        return v >>> 0;
    }

}

// Read base64-encoded unsigned integer.
Reader.prototype.getInt = function(){
};
