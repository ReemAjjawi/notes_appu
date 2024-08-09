// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class Success{}

class DataSuccess extends Success{}
class DataSuccessList<T> extends Success {
  List <T> data;
  DataSuccessList({
    required this.data,
  });
}
class DataSuccessObject<T> extends Success {
  T data;
  DataSuccessObject({
    required this.data,
  });
}
