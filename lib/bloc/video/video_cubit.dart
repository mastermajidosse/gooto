import 'package:bloc/bloc.dart';
import 'package:gooto/models/video_model.dart';
import 'package:gooto/services/service/posts_repo.dart';

part 'video_state.dart';

class VideoCubit extends Cubit<VideoState> {
  VideoCubit() : super(VideoState());

  PostsRepo videoService = PostsRepo();

  late List<VideoModel> videos;

  get5Videos() async {
    emit(VideoState(loading: true));
    try {
      videos = await videoService.getVideos();
      emit(VideoState(loading: false, videos: videos));
    } catch (e) {
      print(e);
      emit(VideoState(loading: false, errorMessage: e.toString()));
    }
  }
}
