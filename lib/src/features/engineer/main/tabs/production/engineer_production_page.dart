import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:het/generated/l10n.dart';
import 'package:het/src/config/components/text_field_components.dart';
import 'package:het/src/core/router/app_routes.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:het/src/features/engineer/main/tabs/production/widgets/master_item.dart';
import 'package:het/src/features/engineer/production/presentation/manager/engineer_production_bloc.dart';

class EngineerProductionPage extends StatefulWidget {
  const EngineerProductionPage({super.key});

  @override
  State<EngineerProductionPage> createState() => _EngineerProductionPageState();
}

class _EngineerProductionPageState extends State<EngineerProductionPage> {
  late final bloc = context.read<EngineerProductionBloc>();


  @override
  void initState() {
    super.initState();
    bloc.masters('');
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EngineerProductionBloc, EngineerProductionState>(
      builder: (context, state) {
        return Scaffold(
            body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  isDense: true,
                    fillColor: Colors.white,
                    filled: true,
                    hintText: S.of(context).search,
                    border: appTextFiledTransparentBorder(),
                    enabledBorder: appTextFiledTransparentBorder(),
                    disabledBorder: appTextFiledTransparentBorder(),
                    focusedBorder: appTextFiledTransparentBorder(),
                    errorBorder: appTextFiledErrorBorder(),
                    prefixIcon: Icon(Icons.search)),
                onChanged: (query) {
                  bloc.masters(query);
                },
              ),
            ),
            Expanded(
              child: LazyLoadScrollView(
                isLoading: state.isPagingMasters,
                scrollOffset: 300,
                onEndOfPage: () => bloc.pagingMasters(''),
                child: ListView.builder(
                  itemCount:
                      state.masters.length + (state.isPagingMasters ? 1 : 0),
                  itemBuilder: (context, index) => index == state.masters.length
                      ? const Center(child: CircularProgressIndicator())
                      : MasterItem(
                          model: state.masters[index],
                          onClick: () {
                            context.pushNamed(
                                AppRoutes.engineerMasterTasks.name,
                                pathParameters: {
                                  'name': state.masters[index].fullName ?? '-',
                                  'id': state.masters[index].id.toString()
                                });
                          }),
                ),
              ),
            ),
          ],
        ));
      },
    );
  }
}
