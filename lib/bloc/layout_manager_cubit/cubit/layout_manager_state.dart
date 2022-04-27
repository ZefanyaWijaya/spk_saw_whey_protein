part of 'layout_manager_cubit.dart';

enum LayoutType {
  Phone,
  Tablet,
  Desktop,
  Unknown,
}

class LayoutManagerState extends Equatable {
  const LayoutManagerState._({
    this.layoutType = LayoutType.Unknown,
    this.windowSize,
  });

  const LayoutManagerState.unknown() : this._();

  const LayoutManagerState.desktop({Size? windowSize})
      : this._(
          layoutType: LayoutType.Desktop,
          windowSize: windowSize,
        );

  const LayoutManagerState.tablet({Size? windowSize})
      : this._(
          layoutType: LayoutType.Tablet,
          windowSize: windowSize,
        );

  const LayoutManagerState.phone({Size? windowSize})
      : this._(
          layoutType: LayoutType.Phone,
          windowSize: windowSize,
        );

  final LayoutType layoutType;
  final Size? windowSize;

  @override
  List<Object?> get props => [
        layoutType,
        windowSize,
      ];
}