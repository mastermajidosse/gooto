import '../../models/card_model.dart';


abstract class BlogsTwoState {
  const BlogsTwoState();

}

class BlogsInitial extends BlogsTwoState {}

class BlogsLoading extends BlogsTwoState {}
class LikesBlogsLoaded extends BlogsTwoState {
  final List<CardModule> likedBlogs;

  const LikesBlogsLoaded({required this.likedBlogs});

}
class BlogsLoaded extends BlogsTwoState {
  final List<CardModule> cardsList;

  const BlogsLoaded(this.cardsList);

}

class BlogsError extends BlogsTwoState {
  final String message;

  const BlogsError(this.message);


}
