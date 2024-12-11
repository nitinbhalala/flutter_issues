import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_issues/Components/app_loader.dart';
import 'package:flutter_issues/Global/preference.dart';
import 'package:flutter_issues/Module/FavoriteCubit/favorite_cubit.dart';
import 'package:flutter_issues/Module/FavoriteCubit/favorite_state.dart';
import 'package:flutter_issues/Components/app_text.dart';
import 'package:flutter_issues/Module/HomeCubit/home_cubit.dart';
import 'package:flutter_issues/Routes/routes_name.dart';
import 'package:get/get.dart';
import 'package:sizer_pro/sizer.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => FavoriteScreenState();
}

class FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavoriteCubit(),
      child: PopScope(
        canPop: true,
        onPopInvoked: (didPop) {
          if (isUpdate == true) context.read<HomeCubit>().loadFavorites();
          Get.back();
          isUpdate = false;
        },
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
                onPressed: () {
                  if (isUpdate == true) {
                    context.read<HomeCubit>().loadFavorites();
                  }
                  Get.back();
                  isUpdate = false;
                },
                icon: const Icon(Icons.arrow_back)),
            title: appText(context: context, title: 'Favorite Issues'),
          ),
          body: BlocBuilder<FavoriteCubit, FavoriteState>(
            builder: (context, state) {
              if (state is DataLoadingState) {
                return loader(context: context);
              } else if (state is GetFavoriteListState) {
                final favoriteList = state.favorites;
                return favoriteList.isNotEmpty
                    ? SingleChildScrollView(
                        child: ListView.builder(
                          itemCount: favoriteList.length,
                          reverse: true,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.symmetric(horizontal: 4.w),
                          itemBuilder: (context, index) {
                            String truncatedText = favoriteList[index]['body']
                                        .length >
                                    200
                                ? "${favoriteList[index]['body'].substring(0, 200)}..."
                                : favoriteList[index]['body'];

                            return Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 1.w, vertical: 1.2.h),
                              child: ListTile(
                                titleAlignment: ListTileTitleAlignment.top,
                                dense: true,
                                onTap: () {
                                  Navigator.pushNamed(
                                    context,
                                    RoutesName.commentView,
                                    arguments: {
                                      'title': favoriteList[index]["title"],
                                      'comment': favoriteList[index]
                                          ["comments"],
                                      'issueNumber':
                                          favoriteList[index]["number"] ?? '',
                                      'comments_url': favoriteList[index]
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
                                  icon: const Icon(
                                      CupertinoIcons.smallcircle_circle),
                                ),
                                title: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    appText(
                                      maxLines: 10,
                                      fontSize: 1.8.h,
                                      context: context,
                                      fontWeight: FontWeight.w900,
                                      title: favoriteList[index]['title'] ?? '',
                                    ),
                                    SizedBox(height: 0.5.h),
                                    Row(
                                      children: [
                                        appText(
                                          fontSize: 1.3.h,
                                          fontWeight: FontWeight.w700,
                                          context: context,
                                          title:
                                              "Updated On ${formatDate(favoriteList[index]['updated_at'] ?? '')}",
                                        ),
                                        SizedBox(width: 2.w),
                                        CircleAvatar(
                                          radius: 0.25.h,
                                          backgroundColor: Colors.grey,
                                        ),
                                        SizedBox(width: 1.w),
                                        appText(
                                          fontSize: 1.3.h,
                                          fontWeight: FontWeight.w700,
                                          context: context,
                                          title: 'Comments',
                                        ),
                                        SizedBox(width: 0.5.w),
                                        appText(
                                          fontSize: 1.3.h,
                                          fontWeight: FontWeight.w900,
                                          context: context,
                                          title: favoriteList[index]['comments']
                                              .toString(),
                                        ),
                                      ],
                                    ),
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
                                      setState(() {
                                        context
                                            .read<FavoriteCubit>()
                                            .deleteFavorite(index);
                                      });
                                    },
                                    icon: const Icon(CupertinoIcons.delete)),
                              ),
                            );
                          },
                        ),
                      )
                    : Center(
                        child: appText(
                            context: context,
                            title: 'No Favorites',
                            color: Colors.grey,
                            fontSize: 2.h));
              } else if (state is ErrorState) {
                return Center(
                  child: appText(context: context, title: state.errorMsg),
                );
              }
              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }
}
