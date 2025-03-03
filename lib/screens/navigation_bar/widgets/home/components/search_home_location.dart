import 'package:driver/core/assets/images/images.dart';
import 'package:driver/core/colors/app_colors.dart';
import 'package:driver/core/constants/constants.dart';
import 'package:driver/core/screen%20size/screen_size.dart';
import 'package:driver/screens/navigation_bar/widgets/home/components/url.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_places_flutter/google_places_flutter.dart';
import 'package:google_places_flutter/model/place_type.dart';
import 'package:google_places_flutter/model/prediction.dart';
import '../cubit/home_cubit.dart';

class SearchHomeLocation extends StatelessWidget {
  const SearchHomeLocation({super.key});

  @override
  Widget build(BuildContext context) {

    // void placeAutocomplete(String query) async {
    //   Uri uri = Uri.https("maps.googleapis.com",
    //       "maps/api/place/autocomplete/json", // unencoder path
    //       {
    //         "input": query, // query parameter
    //         'key': "AIzaSyDQA0U9_qwD0UDXRFnjo-RP6cljgU7486c",
    //       });
    //   String? response = await NetworkUtiliti.fetchUrl(uri);
    //   if(response != null){
    //     PlacesAutocompleteResponse result = PlacesAutocompleteResponse.parse;
    //     print(response);
    //   }
    // }


    final outlineInputBorder = OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: AppColors.neutralgray100));
    const hintStyle = TextStyle(
        color: AppColors.neutralgray400,
        fontSize: 14,
        fontFamily: fontPoppins,
        fontWeight: FontWeight.w500);
    final cubit = context.read<HomeCubit>();

    return Positioned(
      bottom: height(context) / 7,
      width: width(context),
      child: Container(
        height: height(context) / 5,
        margin: const EdgeInsets.only(left: 20, right: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.primary100,
          border: Border.all(color: AppColors.primary300),
        ),
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: GooglePlaceAutoCompleteTextField(
              textStyle: hintStyle,
              boxDecoration: BoxDecoration(
                  color: AppColors.neutralgray100,
                  borderRadius: BorderRadius.circular(10)),
              // style: hintStyle,
              // cursorColor: AppColors.primary400,
              textEditingController: cubit.searchController,
              googleAPIKey: "AIzaSyDQA0U9_qwD0UDXRFnjo-RP6cljgU7486c",
              inputDecoration: InputDecoration(
                hintText: " Where would you go?",
                hintStyle: hintStyle,
                enabledBorder: outlineInputBorder,
                border: outlineInputBorder,
                focusedBorder: outlineInputBorder,
                disabledBorder: outlineInputBorder,
                prefix: const Icon(
                  CupertinoIcons.search,
                  color: AppColors.neutralgray400,
                  size: 18,
                ),
                suffixIcon: GestureDetector(
                  onTap: () {},
                  child: Image.asset(
                    Images.favourite,
                    scale: 3,
                  ),
                ),
              ),
              debounceTime: 800,
              countries: const ["in", "fr", "ar"],
              // optional by default null is set
              isLatLngRequired: true,
              // if you required coordinates from place detail
              getPlaceDetailWithLatLng: (Prediction prediction) {
                // this method will return latlng with place detail
                print("placeDetails" + prediction.lng.toString());
              },
              // this callback is called when isLatLngRequired is true
              itemClick: (Prediction prediction) {
                // controller.text=prediction.description;
                // controller.selection = TextSelection.fromPosition(TextPosition(offset: prediction.description.length));
              },
              itemBuilder: (context, index, Prediction prediction) {
                return Container(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      const Icon(Icons.location_on),
                      const SizedBox(width: 7,),
                      Expanded(child: Text(prediction.description ?? "")),
                    ],
                  ),
                );
              },
              seperatedBuilder: const Divider(),
              isCrossBtnShown: true,
              containerHorizontalPadding: 10,
              placeType: PlaceType.geocode,
            ),
          ),
          BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () => cubit.onTapSearchButton("transport"),
                    child: Container(
                      height: 50,
                      width: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: cubit.transport
                            ? AppColors.primary700
                            : AppColors.primary50,
                      ),
                      child: Center(
                          child: Text(
                        "Transport",
                        style: TextStyle(
                            color:
                                cubit.transport ? Colors.white : Colors.black87,
                            fontFamily: fontPoppins),
                      )),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => cubit.onTapSearchButton("delivery"),
                    child: Container(
                      height: 50,
                      width: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: cubit.delivery
                            ? AppColors.primary700
                            : AppColors.primary50,
                      ),
                      child: Center(
                          child: Text(
                        "Delivery",
                        style: TextStyle(
                            color:
                                cubit.delivery ? Colors.white : Colors.black87,
                            fontFamily: fontPoppins),
                      )),
                    ),
                  ),
                ],
              );
            },
          ),
        ]),
      ),
    );
  }
}
