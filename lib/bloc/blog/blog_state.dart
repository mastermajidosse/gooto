part of 'blog_cubit.dart';

class BlogState {
  const BlogState({
    this.errorMessage,
    this.stories,
    this.loading,
    this.paginationfrom,
    this.total,
  });

  final String? errorMessage;
  final List<BlogModel>? stories;
  final bool? loading;
  final int? paginationfrom;
  final int? total;

  BlogState copyWith(
      {String? errorMessage,
      List<BlogModel>? stories,
      int? total,
      bool? loading,
      int? paginationfrom}) {
    return BlogState(
      errorMessage: errorMessage ?? this.errorMessage,
      stories: stories ?? this.stories,
      loading: loading ?? this.loading,
      total: total ?? this.total,
      paginationfrom: paginationfrom ?? this.paginationfrom,
    );
  }
}
