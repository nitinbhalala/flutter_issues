import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_issues/Components/app_loader.dart';
import 'package:flutter_issues/Components/app_text.dart';
import 'package:flutter_issues/Global/preference.dart';
import 'package:flutter_issues/Module/HomeCubit/home_cubit.dart';
import 'package:flutter_issues/Module/HomeCubit/home_state.dart';
import 'package:flutter_issues/Routes/routes_name.dart';
import 'package:get/get.dart';
import 'package:sizer_pro/sizer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appText(context: context, title: 'Flutter Issues'),
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is DataLoadingState) {
            return loader(context: context);
          } else if (state is GetApiListState) {
            return ListView.builder(
              itemCount: state.getListData.length,
              itemBuilder: (context, index) {
                String truncatedText = state.getListData[index]['body'].length >
                        200
                    ? "${state.getListData[index]['body'].substring(0, 200)}..."
                    : state.getListData[index]['body'];
                int itemId =
                    state.getListData[index]['id']; // Assuming unique 'id'
                return Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 1.w, vertical: 1.2.h),
                  child: ListTile(
                    key: ValueKey(itemId), // Add unique key
                    dense: true,
                    onTap: () {
                      Get.toNamed(
                        RoutesName.commentView,
                        arguments: {
                          'comment': state.getListData[index]["comments"],
                          'title': state.getListData[index]["title"],
                          'comments_url': state.getListData[index]
                              ["comments_url"],
                        },
                      );
                    },
                    contentPadding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.w),
                      side: const BorderSide(color: Colors.grey),
                    ),
                    leading: IconButton(
                      onPressed: () {},
                      color: Colors.green,
                      icon: const Icon(CupertinoIcons.smallcircle_circle),
                    ),
                    title: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        appText(
                          maxLines: 10,
                          fontSize: 1.8.h,
                          context: context,
                          fontWeight: FontWeight.w900,
                          title: state.getListData[index]['title'],
                        ),
                        SizedBox(height: 0.5.h),
                        appText(
                            fontSize: 1.3.h,
                            fontWeight: FontWeight.w700,
                            context: context,
                            title: formatDate(
                                (state.getListData[index]['updated_at']))),
                        SizedBox(height: 1.h),
                      ],
                    ),
                    subtitle: appText(
                      maxLines: 200,
                      fontSize: 1.5.h,
                      context: context,
                      title: truncatedText,
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        setState(
                          () {
                            context
                                .read<HomeCubit>()
                                .toggleFavorite(itemId, state.getListData);
                          },
                        );
                      },
                      icon: Icon(
                        state.favorites.contains(itemId)
                            ? CupertinoIcons.star_fill
                            : CupertinoIcons.star,
                        color: state.favorites.contains(itemId)
                            ? Colors.yellow
                            : Colors.black,
                      ),
                    ),
                  ),
                );
              },
            );
          } else if (state is ErrorState) {
            return Center(
              child: appText(context: context, title: state.errorMsg),
            );
          }
          return Center(
            child: Container(height: 10, width: 10, color: Colors.red),
          );
        },
      ),
    );
  }
}
