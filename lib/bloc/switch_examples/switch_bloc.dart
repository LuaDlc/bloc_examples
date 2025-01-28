import 'package:bloc/bloc.dart';
import 'package:bloc_multiple_states/bloc/switch_examples/switch_event.dart';
import 'package:bloc_multiple_states/bloc/switch_examples/switch_state.dart';

class SwitchBloc extends Bloc<SwitchEvents, SwitchStates> {
  SwitchBloc() : super(SwitchStates()) {
    on<EnableOrDisableNotifications>(_enableOrDisableNotifications);
    on<SliderEvent>(_sliderEvent);
  }

  void _enableOrDisableNotifications(
      EnableOrDisableNotifications events, Emitter<SwitchStates> emit) {
    emit(state.copyWith(isSwitch: !state.isSwitch));
  }

  void _sliderEvent(SliderEvent events, Emitter<SwitchStates> emit) {
    emit(state.copyWith(slider: events.slider));
  }
}
