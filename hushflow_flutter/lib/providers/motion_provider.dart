import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'dart:async';
import 'dart:math';

class MotionState {
  final bool isMovingFast;
  final double speed;
  final DateTime? lastHighSpeedDetected;

  const MotionState({
    this.isMovingFast = false,
    this.speed = 0.0,
    this.lastHighSpeedDetected,
  });

  MotionState copyWith({bool? isMovingFast, double? speed, DateTime? lastHighSpeedDetected}) {
    return MotionState(
      isMovingFast: isMovingFast ?? this.isMovingFast,
      speed: speed ?? this.speed,
      lastHighSpeedDetected: lastHighSpeedDetected ?? this.lastHighSpeedDetected,
    );
  }
}

final motionProvider = StateNotifierProvider<MotionNotifier, MotionState>((ref) {
  return MotionNotifier();
});

class MotionNotifier extends StateNotifier<MotionState> {
  StreamSubscription<AccelerometerEvent>? _subscription;
  final List<double> _samples = [];
  static const _sampleSize = 10;
  static const _threshold = 5.0;
  
  MotionNotifier() : super(const MotionState()) {
    _startListening();
  }

  void _startListening() {
    _subscription = accelerometerEvents.listen((event) {
      final acceleration = sqrt(event.x * event.x + event.y * event.y + event.z * event.z) - 9.8;
      _samples.add(acceleration.abs());
      if (_samples.length > _sampleSize) _samples.removeAt(0);
      
      final avg = _samples.reduce((a, b) => a + b) / _samples.length;
      final isMoving = avg > _threshold;
      
      if (isMoving != state.isMovingFast) {
        state = state.copyWith(
          isMovingFast: isMoving,
          speed: avg,
          lastHighSpeedDetected: isMoving ? DateTime.now() : null,
        );
      } else {
        state = state.copyWith(speed: avg);
      }
    });
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }
}

final shouldPromptAudioBriefingProvider = Provider<bool>((ref) {
  final motion = ref.watch(motionProvider);
  if (!motion.isMovingFast) return false;
  final last = motion.lastHighSpeedDetected;
  if (last == null) return false;
  return DateTime.now().difference(last).inMinutes >= 5;
});
