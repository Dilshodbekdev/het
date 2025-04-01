import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:het/generated/l10n.dart';
import 'package:het/src/config/components/app_container.dart';
import 'package:het/src/features/engineer/transport/presentation/manager/engineer_transport_bloc.dart';
import 'package:het/src/features/master/main/tabs/tasks/widgets/row_texts.dart';

class EngineerTransportApplicationDetailsPage extends StatelessWidget {
  const EngineerTransportApplicationDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).details),
      ),
      body: BlocBuilder<EngineerTransportBloc, EngineerTransportState>(
  builder: (context, state) {
    return SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 16.0,
          children: [
            Text(
              S.of(context).basicData,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            AppContainer(
              margin: EdgeInsets.zero,
              padding: EdgeInsets.all(8.0),
              child: Column(
                spacing: 8.0,
                children: [
                  RowTexts(text1: S.of(context).address, text2: state.applicationDetailsModel?.address??'-'),
                  RowTexts(text1: S.of(context).object, text2: state.applicationDetailsModel?.creatorHetObjectName??'-'),
                  RowTexts(text1: S.of(context).typeApplication, text2: state.applicationDetailsModel?.type?.id.toString()??'-'),
                  RowTexts(text1: S.of(context).description, text2: state.applicationDetailsModel?.description??'-'),
                ],
              ),
            ),
          ],
        ),
      );
  },
),
    );
  }
}
