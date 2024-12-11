import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_issues/Components/app_loader.dart';
import 'package:flutter_issues/Components/app_text.dart';
import 'package:flutter_issues/Components/cache_network_image.dart';
import 'package:flutter_issues/Module/CommentCubit/comment_cubit.dart';
import 'package:flutter_issues/Module/CommentCubit/comment_state.dart';
import 'package:sizer_pro/sizer.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class CommentView extends StatelessWidget {
  const CommentView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CommentCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: appText(context: context, title: "Comments"),
        ),
        body: BlocBuilder<CommentCubit, CommentState>(
          builder: (context, state) {
            if (state is DataLoadingState) {
              return loader(context: context);
            }
            if (state is GetApiListState) {
              return ListView.builder(
                itemCount: state.getListData.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
                    margin:
                        EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.2.h),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.w),
                        border: Border.all(color: Colors.grey)),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              maxRadius: 6.w,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(6.w),
                                child: networkImageLoader(
                                    url: state.getListData[index]['user']
                                        ['avatar_url']),
                              ),
                            ),
                            SizedBox(width: 3.w),
                            appText(
                              textAlign: TextAlign.start,
                              maxLines: 10,
                              fontSize: 1.8.h,
                              context: context,
                              fontWeight: FontWeight.w900,
                              title: state.getListData[index]['user']['login'],
                            ),
                          ],
                        ),
                        Markdown(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          data: state.getListData[index]['body'] ?? '',
                        ),
                      ],
                    ),
                  );
                },
              );
            }
            if (state is ErrorState) {
              return Center(
                child: appText(
                  fontSize: 2.h,
                  context: context,
                  title: state.errorMsg,
                ),
              );
            }
            return Center(
              child: Container(height: 10, width: 10, color: Colors.red),
            );
          },
        ),
      ),
    );
  }
}
