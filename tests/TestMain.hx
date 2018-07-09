
class TestMain {

  static function main() {
    var r = new haxe.unit.TestRunner();
    r.add(new ApplyTestCase());
    r.run();
  }

}
