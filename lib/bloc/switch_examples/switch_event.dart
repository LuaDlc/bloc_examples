// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

abstract class SwitchEvents extends Equatable {
  const SwitchEvents();
  @override
  List<Object> get props => [];
}

class EnableOrDisableNotifications extends SwitchEvents {}

class SliderEvent extends SwitchEvents {
  final double slider;
  const SliderEvent({
    required this.slider,
  });

  @override
  List<Object> get props => [slider];
}
