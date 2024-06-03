part of 'feed_cubit.dart';

class FeedState {
  const FeedState({
    this.errorMessage,
    // this.posts,
    this.loading,
    this.paginationfrom,
    this.total,
  });

  final String? errorMessage;
  // final List<posts>? posts;
  final bool? loading;
  final int? paginationfrom;
  final int? total;

  FeedState copyWith(
      {String? errorMessage,
      // List<posts>? posts,
      int? total,
      bool? loading,
      int? paginationfrom}) {
    return FeedState(
      errorMessage: errorMessage ?? this.errorMessage,
      // posts: posts ?? this.posts,
      loading: loading ?? this.loading,
      total: total ?? this.total,
      paginationfrom: paginationfrom ?? this.paginationfrom,
    );
  }
}
