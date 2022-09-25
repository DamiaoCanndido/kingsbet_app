import 'package:flutter/material.dart';
import '../../../models/phase_model.dart';

class PhaseTile extends StatelessWidget {
  final PhaseModel phaseModel;
  const PhaseTile({super.key, required this.phaseModel});

  @override
  Widget build(BuildContext context) {
    return Text(phaseModel.order.toString());
  }
}
