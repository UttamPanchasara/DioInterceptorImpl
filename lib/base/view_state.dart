class ViewState<T> {
  Status status;

  T? data;

  String? message;

  ViewState.loading() : status = Status.kLoading;

  ViewState.completed(this.data) : status = Status.kCompleted;

  ViewState.error(this.message) : status = Status.kError;

  @override
  String toString() {
    return "Status : $status \n Message : $message \n Data : $data";
  }
}

enum Status { kLoading, kCompleted, kError }
