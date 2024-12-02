import 'package:flutter/material.dart';
import 'package:newsapp/common/widgets/error_widget.dart';
import 'package:newsapp/common/widgets/loading_widget.dart';
import 'package:newsapp/providers/sources_provider.dart';
import 'package:newsapp/screens/categories/widgets/source_list.dart';
import 'package:provider/provider.dart';

class SourcesWidget extends StatefulWidget {
  final String id;
  final bool searching;
  const SourcesWidget({required this.id, required this.searching,super.key});

  @override
  State<SourcesWidget> createState() => _SourcesWidgetState();
}

class _SourcesWidgetState extends State<SourcesWidget> {
  late SourcesProvider sourcesProvider;

  @override
  void initState() {
    super.initState();
    sourcesProvider = SourcesProvider();
    sourcesProvider.getSources(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return ListView(children: [
        ChangeNotifierProvider(
          create: (BuildContext context) => sourcesProvider,
          child: Consumer<SourcesProvider>(builder: (context, value, child) {
            return value.waiting
                ? const LoadingWidget()
                : sourcesProvider.errorMessage != null
                    ? CustomErrorWidget(
                        errorMessange: sourcesProvider.errorMessage!,
                      )
                    : SourceList(sources: value.sources!.sources!,searching: widget.searching,);
          }),
        )
      ]);
    });
  }
}