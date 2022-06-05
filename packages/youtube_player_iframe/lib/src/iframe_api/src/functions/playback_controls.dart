abstract class PlaybackControls {
  /// Plays the currently cued/loaded video.
  /// The final player state after this function executes will be playing (1).
  ///
  /// A playback only counts toward a video's official view count if it is initiated via a native play button in the player.
  void playVideo();

  /// Pauses the currently playing video.
  /// The final player state after this function executes will be paused (2)
  /// unless the player is in the ended (0) state when the function is called,
  /// in which case the player state will not change.
  void pauseVideo();

  /// Stops and cancels loading of the current video.
  /// This function should be reserved for rare situations when you know that
  /// the user will not be watching additional video in the player.
  /// If your intent is to pause the video, you should just call the [pauseVideo] function.
  /// If you want to change the video that the player is playing,
  /// you can call one of the queueing functions without calling [stopVideo] first.
  ///
  /// Unlike the [pauseVideo] function, which leaves the player in the paused (2) state,
  /// the stopVideo function could put the player into any not-playing state,
  /// including ended (0), paused (2), video cued (5) or unstarted (-1).
  void stopVideo();

  /// Seeks to a specified time in the video.
  /// If the player is paused when the function is called, it will remain paused.
  /// If the function is called from another state (playing, video cued, etc.), the player will play the video.
  ///
  /// [seconds] identifies the time to which the player should advance.
  /// The player will advance to the closest keyframe before that time unless
  /// the player has already downloaded the portion of the video to which the user is seeking.
  ///
  /// [allowSeekAhead] determines whether the player will make a new request to the server
  /// if the seconds parameter specifies a time outside of the currently buffered video data.
  ///
  /// We recommend that you set this parameter to false while the user drags the mouse
  /// along a video progress bar and then set it to true when the user releases the mouse.
  /// This approach lets a user scroll to different points of a video
  /// without requesting new video streams by scrolling past unbuffered points in the video.
  /// When the user releases the mouse button, the player advances to the desired point
  /// in the video and requests a new video stream if necessary.
  void seekTo({
    required double seconds,
    bool allowSeekAhead = false,
  });

  void nextVideo();

  void previousVideo();

  void playVideoAt(int index);

  void mute();

  void unMute();

  void setVolume(int volume);

  bool get isMuted;

  int get volume;
}
