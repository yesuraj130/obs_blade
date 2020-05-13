import 'package:obs_station/types/enums/event_type.dart';

class BaseEvent {
  Map<String, dynamic> json;

  BaseEvent(this.json);

  /// The type of the event
  EventType get updateType => this.instance(this.json['update-type']);

  /// (Optional): time elapsed between now and stream start (only present if OBS Studio is streaming)
  String get streamTimecode => this.json['stream-timecode'];

  /// (Optional): time elapsed between now and recording start (only present if OBS Studio is recording)
  String get recTimecode => this.json['rec-timecode'];

  EventType instance(String text) {
    if (text == 'ScenesChanged') {
      return EventType.ScenesChanged;
    }
    return null;
  }
}