import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_db/widget/single_text.dart';
import 'package:stacked/stacked.dart';
import '../../commons/app_colors.dart';
import '../../controllers/movie_screen_controller/movie_screen_view_controller.dart';


class MovieScreenView extends StatefulWidget {
  const MovieScreenView({super.key});

  @override
  State<MovieScreenView> createState() => _MovieScreenViewState();
}

class _MovieScreenViewState extends State<MovieScreenView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MovieScreenViewController>.reactive(
      viewModelBuilder: () => MovieScreenViewController(context),
      onModelReady: (model) => model.initialise(),
      builder: (context, model, child) {
        return Scaffold(
          backgroundColor: AppColors.lightGrey,
          appBar: AppBar(
            backgroundColor: AppColors.primaryBlueColor,
            centerTitle: true,
            title: Text(
              "The MovieDb",
                style:  TextStyle(fontSize: 20.sp, color: Colors.white)
            ),
          ),
          body: _getBody(model),
        );
      },
    );
  }

  Widget _getBody(MovieScreenViewController model) {
    return Stack(
      children: <Widget>[
        _getBaseContainer(model),
      ],
    );
  }

  Widget _getBaseContainer(MovieScreenViewController model) {
    return Padding(
      padding: EdgeInsets.only(left: 10.w,top: 10.h,bottom: 10.h),
      child: ListView(
        children: [
          SingleText(text: 'Now Playing',fontWeight: FontWeight.bold,fontSize: 25.sp,),
          SizedBox(height: 10.h,),
          Container(
            height: 300.h,
            child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return ClipRRect(
                    // height: 90.h,
                    borderRadius: BorderRadius.circular(10.r),
                    child: Image.asset("assets/images/parasite.png",fit: BoxFit.fill,),
                  );
                },
                separatorBuilder: (context, index) => SizedBox(width: 15.w),
                itemCount: 5),
          ),
          // Container(
          //   height: 300.h,
          //   child: ListView.separated(
          //     physics: const BouncingScrollPhysics(),
          //       scrollDirection: Axis.horizontal,
          //       itemBuilder: (context, index) {
          //         return ClipRRect(
          //           // height: 90.h,
          //             borderRadius: BorderRadius.circular(10.r),
          //           child: Image.network("${model.nowPlayingResultList[index].posterPath}",fit: BoxFit.fill,),
          //         );
          //       },
          //       separatorBuilder: (context, index) => SizedBox(width: 15.w),
          //       itemCount: model.nowPlayingResultList.length),
          // ),
          SizedBox(height: 20.h,),
          SingleText(text: 'Upcoming',fontWeight: FontWeight.bold,fontSize: 25.sp,),
          SizedBox(height: 10.h,),
          Container(
            height: 126.h,
            child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 250.w,
                        height: 100.h,
                        child: ClipRRect(
                          // height: 90.h,
                          borderRadius: BorderRadius.circular(10.r),
                          child: Image.asset("assets/images/avengers.png",fit: BoxFit.fill,),
                        ),
                      ),
                      SizedBox(height: 5.h),
                      Container(
                        child:  SingleText(text: 'AVENGERS ENDGAME',fontSize: 15.sp,color: AppColors.primaryGreyColor,),
                      ),
                    ],
                  );
                },
                separatorBuilder: (context, index) => SizedBox(width: 15.w),
                itemCount: 5),
          ),
          SizedBox(height: 20.h,),
          SingleText(text: 'Top Rated',fontWeight: FontWeight.bold,fontSize: 25.sp,),
          SizedBox(height: 10.h,),
          Container(
            height: 126.h,
            child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 250.w,
                        height: 100.h,
                        child: ClipRRect(
                          // height: 90.h,
                          borderRadius: BorderRadius.circular(10.r),
                          child: Image.asset("assets/images/high-nota.png",fit: BoxFit.fill,),
                        ),
                      ),
                      SizedBox(height: 5.h),
                      Container(
                        child:  SingleText(text: 'THE HIGH NOTA',fontSize: 15.sp,color: AppColors.primaryGreyColor,),
                      ),
                    ],
                  );
                },
                separatorBuilder: (context, index) => SizedBox(width: 15.w),
                itemCount: 5),
          ),
        ],
      ),
    );
  }


}
