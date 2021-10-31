import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:agro_tools/app/core/consts/texts.dart';
import 'package:agro_tools/app/core/widgets/widgets.dart';
import 'package:agro_tools/app/modules/main/submodules/education/ebook/models/ebook_model.dart';
import 'package:agro_tools/app/modules/main/submodules/education/ebook/models/rating.dart';
import 'package:agro_tools/app/modules/main/submodules/education/ebook/page/widgets/rating_store.dart';

class RateWidget extends StatefulWidget {
  const RateWidget({Key? key}) : super(key: key);

  @override
  _RateWidgetState createState() => _RateWidgetState();
}

class _RateWidgetState extends ModularState<RateWidget, RatingStore> {
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      if (controller.ebook == null) {
        return Center();
      }
      if (controller.isLoading) {
        return Center(child: CircularProgressIndicator());
      }

      return Padding(
        padding: EdgeInsets.only(top: 24, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Form(
              key: controller.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  text(
                    "Avalie este ebook",
                    fontSize: 18,
                  ),
                  SizedBox(
                    height: spacing_standard,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        RatingBar(
                            initialRating: controller.rating?.getRate,
                            direction: Axis.horizontal,
                            allowHalfRating: false,
                            itemCount: 5,
                            ratingWidget: RatingWidget(
                                full: Icon(Icons.star, color: Colors.orange),
                                half: Icon(
                                  Icons.star_half,
                                  color: Colors.orange,
                                ),
                                empty: Icon(
                                  Icons.star_outline,
                                  color: Colors.orange,
                                )),
                            onRatingUpdate: (value) {
                              controller.rating?.setRate(value);
                            }),
                        text(
                          "${controller.rating?.getRate}",
                          fontSize: 24,
                          fontFamily: fontBold,
                        ),
                      ]),
                  SizedBox(
                    height: spacing_standard,
                  ),
                  TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Comentário",
                      ),
                      maxLines: 2,
                      validator: (value) {
                        if (value == null) {
                          return "Comentário é obrigatório";
                        }
                        return null;
                      },
                      onSaved: (value) {
                        controller.rating?.comment = value;
                      }),
                  SizedBox(
                    height: spacing_standard,
                  ),
                  appButton(
                    textContent: "Avaliar",
                    onPressed: () async {
                      await controller.sendRate();
                    },
                  )
                ],
              ),
            ),
            SizedBox(
              height: spacing_standard,
            ),
            if (controller.ebook!.rating != null)
              Expanded(
                child: ListView.builder(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      Rating rating = controller.ebook!.rating![index];

                      return ListTile(
                        onTap: () {},
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            text(
                              "${rating.userObj?.name}",
                              maxLine: 2,
                              fontSize: 14,
                              fontFamily: fontBold,
                            ),
                            text("Avaliação: ${rating.comment}",
                                maxLine: 10, fontSize: 14),
                          ],
                        ),
                        leading: CircleAvatar(
                          radius: 20,
                          backgroundImage:
                              NetworkImage("${rating.userObj?.imgLogo}"),
                        ),
                        subtitle: RatingBar(
                            itemSize: 20,
                            ignoreGestures: true,
                            initialRating: rating.rating ?? 0,
                            direction: Axis.horizontal,
                            allowHalfRating: false,
                            itemCount: 5,
                            ratingWidget: RatingWidget(
                                full: Icon(Icons.star, color: Colors.orange),
                                half: Icon(
                                  Icons.star_half,
                                  color: Colors.orange,
                                ),
                                empty: Icon(
                                  Icons.star_outline,
                                  color: Colors.orange,
                                )),
                            onRatingUpdate: (value) {}),
                      );
                    },
                    itemCount: controller.ebook!.rating?.length),
              ),
          ],
        ),
      );
    });
  }
}
