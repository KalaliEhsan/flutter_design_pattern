/*
  In software engineering, the composite pattern is a partitioning design pattern.
  The composite pattern describes a group of objects that is treated the same way as a single instance of the same type of object.
  The intent of a composite is to "compose" objects into tree structures to represent part-whole hierarchies.
  Implementing the composite pattern lets clients treat individual objects and compositions uniformly.
*/

abstract class Thing {
  String name;
  void doSomething();
}

class CompositeThing implements Thing {
  String name;
  Set<Thing> _childThings = Set();

  CompositeThing(this.name);

  void addChild(Thing child) {
    _childThings.add(child);
  }

  void doSomething() {
    print('structural: composite =====> ** $name is doing something! **');
    _childThings.forEach((thing) => thing.doSomething());
    print('structural: composite =====> ** $name is all done. **');
  }
}

class LeafThing implements Thing {
  String name;

  LeafThing(this.name);

  void doSomething() {
    print('structural: composite =====> *  $name!');
  }
}

void compositePattern(){
  var compositeParent = CompositeThing("Cat in the Hat");
  var compositeChild1 = CompositeThing("Thing 1");
  var compositeChild2 = CompositeThing("Thing 2");

  var leaf1_1 = LeafThing("Frustrate fish");
  var leaf1_2 = LeafThing("Knock down vases");
  var leaf2_1 = LeafThing("Ruin mom's dress");
  var leaf2_2 = LeafThing("Clean up");

  compositeChild1.addChild(leaf1_1);
  compositeChild1.addChild(leaf1_2);

  compositeChild2.addChild(leaf2_1);
  compositeChild2.addChild(leaf2_2);

  compositeParent.addChild(compositeChild1);
  compositeParent.addChild(compositeChild2);

  compositeParent.doSomething();
  print('\r\n');
}