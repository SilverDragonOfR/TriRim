import 'package:hive/hive.dart';

part 'flashcardmodel.g.dart';

@HiveType(typeId: 1)
class FlashcardModel {

  FlashcardModel({required this.flashcard});

  @HiveField(0)
  List<String> flashcard;
}
