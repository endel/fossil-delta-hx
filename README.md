# Delta compression algorithm for Haxe

An efficient delta compression algorithm for Haxe.

> This is a port from the original C implementation. See references below.

Fossil achieves efficient storage and low-bandwidth synchronization through the
use of delta-compression. Instead of storing or transmitting the complete
content of an artifact, fossil stores or transmits only the changes relative to
a related artifact.

* [Format](http://www.fossil-scm.org/index.html/doc/tip/www/delta_format.wiki)
* [Algorithm](http://www.fossil-scm.org/index.html/doc/tip/www/delta_encoder_algorithm.wiki)
* [Original implementation](http://www.fossil-scm.org/index.html/artifact/f3002e96cc35f37b)

Other implementations:

- [C#](https://github.com/endel/FossilDelta/)
- [JavaScript](https://github.com/dchest/fossil-delta-js) ([Online demo](https://dchest.github.io/fossil-delta-js/))

## LIMITATIONS

This port currently only supports the `Apply` method. The `Create` method hasn't been implemented yet.

## License

See LICENSE file.