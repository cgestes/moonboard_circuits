import 'package:hive_flutter/hive_flutter.dart';
import 'package:uuid/uuid.dart';

part 'circuit.g.dart';

const uuid = Uuid();

// @HiveType(typeId: 1)
// enum MoonboardVersion {
//   @HiveField(0)
//   standard2016,

//   @HiveField(1)
//   standard2017,

//   @HiveField(2)
//   standard2019,

//   @HiveField(3)
//   mini2020,
// }

@HiveType(typeId: 0)
class Circuit {
  Circuit(
      {required this.boardVersion,
      required this.circuit,
      required this.name,
      required this.uid});

  factory Circuit.create({boardVersion, uid, name, circuit}) {
    return Circuit(
        boardVersion: boardVersion,
        name: name,
        circuit: circuit,
        uid: uuid.v4());
  }

  @HiveField(0)
  final String uid;

  @HiveField(1)
  final String boardVersion;

  @HiveField(2)
  final String name;

  @HiveField(3)
  final List<int> circuit;
}
