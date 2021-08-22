/*
  The visitor design pattern is a way of separating an algorithm from an object structure on which it operates.
  A practical result of this separation is the ability to add new operations to existent object structures without modifying the structures.
  It is one way to follow the open/closed principle.

  In essence, the visitor allows adding new virtual functions to a family of classes, without modifying the classes.
  Instead, a visitor class is created that implements all of the appropriate specializations of the virtual function.
  The visitor takes the instance reference as input, and implements the goal through double dispatch.
*/
abstract class BodyPart {
  String name;
  void accept(BodyPartVisitor visitor) => visitor.visit(this);
}

abstract class BodyPartVisitor {
  void visit(BodyPart bodyPart);
}

class Face extends BodyPart {
  String name = "Face";
}

class Finger extends BodyPart {
  String name = "Finger";
  Finger(this.name);
}

class Foot extends BodyPart {
  String name = "Foot";
  Foot(this.name);
}

class Body implements BodyPart {
  String name = "Body";
  List<BodyPart> bodyParts;

  Body() {
    bodyParts = List.from([
      Face(), Finger("Index Finger"), Finger("Thumb"),
      Foot("Left Foot"), Foot("Right Foot"), Foot("Third Foot?")
    ]);
  }

  @override
  void accept(BodyPartVisitor visitor) {
    for (var bodyPart in bodyParts) {
      bodyPart.accept(visitor);
    }
    visitor.visit(this);
  }
}

class BodyPartStitchVisitor implements BodyPartVisitor {
  void visit(BodyPart bodyPart) {
    if (bodyPart is Body) { print("behavioral: visitor =====> Reanimating my ${bodyPart.name}."); }
    if (bodyPart is Face) { print("behavioral: visitor =====> Stitching together my ${bodyPart.name}."); }
    if (bodyPart is Finger) { print("behavioral: visitor =====> Stitching together my ${bodyPart.name}."); }
    if (bodyPart is Foot) { print("behavioral: visitor =====> Gluing on my ${bodyPart.name}."); }
  }
}

class BodyPartProdVisitor implements BodyPartVisitor {
  void visit(BodyPart bodyPart) {
    if (bodyPart is Body) { print("behavioral: visitor =====> Poking my ${bodyPart.name} with an electrode."); }
    if (bodyPart is Face) { print("behavioral: visitor =====> Prodding ${bodyPart.name}."); }
    if (bodyPart is Finger) { print("behavioral: visitor =====> Pricking ${bodyPart.name}."); }
    if (bodyPart is Foot) { print("behavioral: visitor =====> Tickling ${bodyPart.name}."); }
  }
}

void visitorPattern(){
  var body = Body();
  body.accept(BodyPartStitchVisitor());
  body.accept(BodyPartProdVisitor());
}