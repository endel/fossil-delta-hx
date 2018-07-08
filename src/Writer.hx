package io.gamestd;

// Write writes an array.
class Writer {
    private var a: Array<Int>;

    private function new () {
        this.a = [];
    }

    public function toArray () {
        return this.a;
    }

    public function putByte (b) {
        this.a.push(b & 0xff);
    }

    // Write an ASCII character (s is a one-char string).
    public function putChar (s) {
        this.putByte(s.charCodeAt(0));
    }

    // Write a base64 unsigned integer.
    public function putInt (v){
        var i: Int, j: Int, zBuf: Array<Int> = [];

        if (v === 0) {
            this.putChar('0');
            return;
        }

        for (i = 0; v > 0; i++, v >>>= 6)
            zBuf.push(zDigits[v&0x3f]);

        for (j = i-1; j >= 0; j--)
            this.putByte(zBuf[j]);
    }

    // Copy from array at start to end.
    public function putArray (a: Array<Int>, start: Int, end: Int) {
        for (var i = start; i < end; i++) this.a.push(a[i]);
    }

}