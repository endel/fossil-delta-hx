package io.gamestd;

// Write writes an array.
class Writer {
    public var a: Array<Int>;

    public function new () {
        this.a = [];
    }

    public function toArray () {
        return this.a;
    }

    public function putByte (b) {
        this.a.push(b & 0xff);
    }

    // Write an ASCII character (s is a one-char string).
    public function putChar (s: String) {
        this.putByte(s.charCodeAt(0));
    }

    // Write a base64 unsigned integer.
    public function putInt (v){
        var i: Int = 0;
        var j: Int;
        var zBuf: Array<Int> = [];

        if (v == 0) {
            this.putChar('0');
            return;
        }

        while (v > 0) {
            zBuf.push(FossilDelta.zDigits[v&0x3f]);
            i++;
            v >>>= 6;
        }

        j = i-1;
        while (j >= 0) {
            this.putByte(zBuf[j]);
            j--;
        }
    }

    // Copy from array at start to end.
    public function putArray (a: Array<Int>, start: Int, end: Int) {
        var i: Int = start;
        while (i < end) {
            this.a.push(a[i]);
            i++;
        }
    }

}