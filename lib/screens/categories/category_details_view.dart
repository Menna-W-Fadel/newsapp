import 'package:flutter/material.dart';

import 'package:newsapp/api/api_services.dart';
import 'package:newsapp/common/widgets/error_widget.dart';
import 'package:newsapp/common/widgets/loading_widget.dart';

import 'package:newsapp/screens/categories/models/sources_model.dart';

import 'package:newsapp/screens/categories/widgets/source_list.dart';

class CategoryDetailsView extends StatelessWidget {
  const CategoryDetailsView({required this.id, super.key});
  final String id;

  @override
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        FutureBuilder(
            future: ApiServices.getSources(id),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const LoadingWidget();
              } else if (snapshot.hasError) {
                return CustomErrorWidget(errorMessange:snapshot.error.toString());
              }
              Sources? sourcesModel = snapshot.data;
              List<Sources1> sources = sourcesModel?.sources ?? [];
              return SourceList(sources: sources);
            }),
      ],
    );
  }
}
