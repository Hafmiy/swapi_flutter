extension DartLet<T> on T? {

  J? let<J>(J Function(T value) callback) {
    final object = this;
    if (object == null) {
      return null;
    } else {
      return callback(object);
    }
  }
}
