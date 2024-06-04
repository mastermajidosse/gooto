import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class AudioPlayerWidget extends StatefulWidget {
  final String audioUrl; // URL of the audio file

  const AudioPlayerWidget({super.key, required this.audioUrl});

  @override
  State<AudioPlayerWidget> createState() => _AudioPlayerWidgetState();
}

class _AudioPlayerWidgetState extends State<AudioPlayerWidget> {
  final AudioPlayer audioPlayer = AudioPlayer();
  PlayerState? playerState;
  Duration? _duration;
  Duration? _position;
  double _initialProgress = 0.0; // Initial progress for Slider

  StreamSubscription? _durationSubscription;
  StreamSubscription? _positionSubscription;

  @override
  void initState() {
    super.initState();
    audioPlayer.onPlayerStateChanged.listen((state) {
      setState(() {
        playerState = state;
      });
    });

    _durationSubscription = audioPlayer.onDurationChanged.listen((duration) {
      setState(() {
        _duration = duration;
        // Update initial progress based on actual duration
        _initialProgress = _position != null
            ? _position!.inMilliseconds / duration.inMilliseconds
            : 0.0;
      });
    });

    _positionSubscription = audioPlayer.onPositionChanged.listen(
      (p) => setState(() => _position = p),
    );
  }

  @override
  void dispose() {
    _durationSubscription?.cancel();
    _positionSubscription?.cancel();
    audioPlayer.dispose();
    super.dispose();
  }

 void playAudio() async {
  try {
    print('Audio path: assets/${widget.audioUrl}');
    if (playerState == PlayerState.playing) {
      return; // Already playing
    }
    await audioPlayer.play(AssetSource(widget.audioUrl));
    setState(() {
      playerState = PlayerState.playing;
    });
  } catch (error) {
    print('Error playing audio: $error');
  }
}

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: Icon(playerState == PlayerState.playing
              ? Icons.pause
              : Icons.play_arrow),
          onPressed: playAudio,
        ),
        Expanded(
          child: Slider(
            onChanged: (value) {
              final duration = _duration;
              if (duration == null) {
                return; // Handle case where duration is not yet available
              }
              final position = value * duration.inMilliseconds;
              audioPlayer.seek(Duration(milliseconds: position.round()));
            },
            value: (_position != null && _duration != null)
                ? _position!.inMilliseconds / _duration!.inMilliseconds
                : _initialProgress, // Use initial progress if duration is not available
          ),
        ),
      ],
    );
  }
}
