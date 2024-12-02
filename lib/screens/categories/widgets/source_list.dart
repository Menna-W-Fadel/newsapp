import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp/common/app_colors.dart';
import 'package:newsapp/screens/categories/models/sources_model.dart';
import 'package:newsapp/screens/categories/widgets/news_list.dart';

class SourceList extends StatefulWidget {
  const SourceList({required this.sources, required this.searching, super.key});
  final List<Sources1> sources;
  final bool searching;
  @override
  State<SourceList> createState() => _SourceListState();
}

class _SourceListState extends State<SourceList> {
  String? selectedSourcesId;
  @override
  void initState() {
    super.initState();
    selectedSourcesId = widget.sources.isNotEmpty ? widget.sources[0].id : null;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 85.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.sources.length,
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
              child: ChoiceChip(
                onSelected: (value) {
                  selectedSourcesId = widget.sources[index].id;
                  setState(() {});
                },
                label: Text(widget.sources[index].name ?? ""),
                labelStyle: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    color: widget.sources[index].id == selectedSourcesId
                        ? AppColors.secondaryColor
                        : AppColors.primaryColor),
                selected: widget.sources[index].id == selectedSourcesId,
                showCheckmark: false,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.r),
                ),
                side: BorderSide(color: AppColors.primaryColor),
                selectedColor: AppColors.primaryColor,
              ),
            ),
          ),
        ),
        if (selectedSourcesId != null && !widget.searching)
          NewsList(sourceId: selectedSourcesId!)
        else if (selectedSourcesId != null && widget.searching)
          NewsList(sourceId: selectedSourcesId!),
      ],
    );
  }
}
