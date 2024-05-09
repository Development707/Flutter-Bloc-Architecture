import "package:bloc_architecture_pagination/bloc_architecture_pagination.dart";
import "package:bloc_architecture_widget/bloc_architecture_widget.dart";
import "package:flutter/material.dart";

import "../../../core/base/base.dart";
import "../bloc/pagination_bloc.dart";

/// Pagination screen
class PaginationScreen extends StatefulWidget {
  /// Create a instance of [PaginationScreen]
  const PaginationScreen({super.key});

  @override
  State<PaginationScreen> createState() => _PaginationScreenState();
}

class _PaginationScreenState extends AppPageState<PaginationScreen, PaginationBloc> {
  @override
  Widget buildPage(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(title: const Text("Pagination screen")),
      body: PagedListView<int, String>(
        pagingController: bloc.pagingController,
        builderDelegate: AppPagedChildBuilderDelegate<String>(
          itemBuilder: (BuildContext context, String item, int index) {
            return ListTile(
              selected: index.isEven,
              leading: Text(index.toString()),
              title: Text(item),
            );
          },
        ),
      ),
    );
  }
}
