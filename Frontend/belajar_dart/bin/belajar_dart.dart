import 'variables.dart' as variables;
import 'null_safety.dart' as null_safety;
import 'operator.dart' as operators;
import 'conditional.dart' as conditionals;
import 'loop.dart' as loops;
import 'functions.dart' as functions;
import 'classes/Inheritance/Toyota.dart';

void main(List<String> arguments) {
  print("Variables");
  variables.variables();

  print("Null safety");
  null_safety.nullSafety();

  print("Operator");
  operators.operator();

  print("Conditional");
  conditionals.condition();
  print("Looping");

  print("Loop");
  loops.loop();

  print("Functions");
  print(functions.jumlah([1, 2, 3, 4, 5, 6]));
  functions.greetings('John Does');
  print(functions.isEven(10));

  Toyota toyota_type_a = Toyota('City Car', "Black", "Type A", 100);
  toyota_type_a.display();
}
