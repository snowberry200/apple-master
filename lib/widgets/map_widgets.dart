import 'package:apple/widgets/apple_image.dart';
import 'package:apple/widgets/form_widget.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class MapWidgets extends Equatable {
  const MapWidgets();

  Map<String, Widget> get widgets => {
        'apple image': AppleImage(),
        'form widget': FormWidget(),
      };

  @override
  List<Object?> get props => [];
}
