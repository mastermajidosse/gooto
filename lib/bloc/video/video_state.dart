part of 'video_cubit.dart';

class VideoState {
  const VideoState({
    this.errorMessage,
    this.videos,
    this.loading,
    this.paginationfrom,
    this.total,
  });

  final String? errorMessage;
  final List<VideoModel>? videos;
  final bool? loading;
  final int? paginationfrom;
  final int? total;

  VideoState copyWith(
      {String? errorMessage,
      List<VideoModel>? videos,
      int? total,
      bool? loading,
      int? paginationfrom}) {
    return VideoState(
      errorMessage: errorMessage ?? this.errorMessage,
      videos: videos ?? this.videos,
      loading: loading ?? this.loading,
      total: total ?? this.total,
      paginationfrom: paginationfrom ?? this.paginationfrom,
    );
  }
}
