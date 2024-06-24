import 'package:image_picker/image_picker.dart';

abstract class IBaseModel<T> {
  int get id;
  String get title;
  String get description;
  String get dueDate;
  XFile get image;
}
