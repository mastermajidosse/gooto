import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AudioPlayerWidget extends StatefulWidget {
  final String audioUrl;

  const AudioPlayerWidget({super.key, required this.audioUrl});

  @override
  State<AudioPlayerWidget> createState() => _AudioPlayerWidgetState();
}

class _AudioPlayerWidgetState extends State<AudioPlayerWidget> {
  AudioPlayer? _audioPlayer;
  Duration? _duration;
  Duration? _position;
  bool _isPlaying = false;
  double _sliderValue = 0.0;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    _initAudioPlayer();
  }

  @override
  void dispose() {
    _audioPlayer!.dispose();
    super.dispose();
  }

  void _initAudioPlayer() async {
    await _audioPlayer!.setSourceAsset("${widget.audioUrl}");
    print('Audio source set: ${widget.audioUrl}');
    _audioPlayer!.onDurationChanged.listen((duration) {
      if (mounted) {
        setState(() {
          _duration = duration;
        });
      }
    });
    _audioPlayer!.onPositionChanged.listen((position) {
      if (mounted) {
        setState(() {
          _position = position;
          _sliderValue = _position!.inMilliseconds.toDouble() /
              _duration!.inMilliseconds.toDouble();
        });
      }
    });
    _audioPlayer?.onPlayerStateChanged.listen((state) {
      if (mounted) {
        setState(() {
          _isPlaying = state == PlayerState.playing;
        });
      }
    });
    _audioPlayer!.onPlayerComplete.listen((_) {
      _handlePlaybackCompletion();
    });
  }

  void _togglePlayback() {
    if (_isPlaying) {
      _audioPlayer!.pause();
    } else {
      _audioPlayer!.play(
        AssetSource(widget.audioUrl),
      );
    }
  }

  void _handlePlaybackCompletion() {
    setState(() {
      _position = Duration.zero;
    });
    _audioPlayer!.seek(Duration.zero).then((_) {
      _audioPlayer!.play(UrlSource(widget.audioUrl));
    });
  }

  void _seekTo(double value) {
    final newPosition =
        Duration(milliseconds: (value * _duration!.inMilliseconds).toInt());
    _audioPlayer!.seek(newPosition);
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }

  Widget _buildPlaybackTime() {
    String positionText =
        _position != null ? _formatDuration(_position!) : '00:00';
    String durationText =
        _duration != null ? _formatDuration(_duration!) : '00:00';
    return Padding(
      padding: const EdgeInsets.only(
        left: 16.0,
        right: 16.0,
        top: 5,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(positionText),
          Text(durationText),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Gap(20),
          Container(
            height: 5,
            child: Slider(
              value: _sliderValue,
              onChanged: (newValue) {
                setState(() {
                  _sliderValue = newValue;
                });
                _seekTo(newValue);
              },
              activeColor: Colors.orange,
              inactiveColor: Colors.grey,
              secondaryActiveColor: Colors.green,
              thumbColor: Colors.grey,
            ),
          ),
          _buildPlaybackTime(),
          Gap(5),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Positioned(
                    child: Image.asset('assets/images/circle.png'),
                  ),
                  _isPlaying
                      ? Positioned(
                          left: 16,
                          top: 16,
                          child: InkWell(
                            child: Image.asset(
                              'assets/images/play.png',
                              width: 35,
                              height: 35,
                            ),
                            onTap: _togglePlayback,
                          ),
                        )
                      : Positioned(
                          left: 25,
                          top: 20,
                          child: InkWell(
                            child: Image.asset('assets/images/pause.png'),
                            onTap: _togglePlayback,
                          ),
                        )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
