import 'package:banner_carousel/banner_carousel.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plant_care/app/core/consts/colors.dart';
import 'package:plant_care/app/core/consts/texts.dart';
import 'package:plant_care/app/core/widgets/widgets.dart';
import 'package:plant_care/app/modules/main/submodules/education/education_store.dart';
import 'package:universal_io/io.dart' as IO;
import 'package:nb_utils/nb_utils.dart';

import 'package:url_launcher/url_launcher.dart';

import 'videos/models/video_model.dart';

class EducationPage extends StatefulWidget {
  const EducationPage({Key? key}) : super(key: key);

  @override
  _EducationPageState createState() => _EducationPageState();
}

class _EducationPageState extends ModularState<EducationPage, EducationStore> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    var popularMovieList = <Movie>[
      Movie(
          id: "QCRTaWIxwHo",
          title: "Aula 5 - Irrigação por Aspersão (Seleção dos Aspersores)",
          slideImage: "https://i.ytimg.com/vi/QCRTaWIxwHo/hqdefault.jpg",
          url: "https://www.youtube.com/watch?v=QCRTaWIxwHo"),
      Movie(
          id: "8FxzaTXu0Do",
          title: "Aula 6 - Irrigação por Aspersão (Dimensionamento)",
          slideImage: "https://i.ytimg.com/vi/8FxzaTXu0Do/hqdefault.jpg",
          url: "https://www.youtube.com/watch?v=8FxzaTXu0Do"),
      Movie(
        id: "hG9vVN6pLZQ",
        title: "Aula 7 - Irrigação por Aspersão (Dimensionamento)",
        slideImage: "https://i.ytimg.com/vi/hG9vVN6pLZQ/hqdefault.jpg",
        url: "https://www.youtube.com/watch?v=hG9vVN6pLZQ",
      ),
      Movie(
          id: "IR3cMz-RdZA",
          title: "Aula 2 - A IMPORTÂNCIA da QUÍMICA ANALÍTICA para o agrônomo",
          slideImage: "https://i.ytimg.com/vi/IR3cMz-RdZA/hqdefault.jpg",
          url: "https://www.youtube.com/watch?v=IR3cMz-RdZA"),
      Movie(
          id: "dos2AH_1D0U",
          title: "Aula 1 - Introdução ao Estudo do Solo",
          slideImage: "https://i.ytimg.com/vi/dos2AH_1D0U/hqdefault.jpg",
          url: "https://www.youtube.com/watch?v=dos2AH_1D0U",
          subtitle:
              "Aula sobre o tema Introdução ao Estudo do Solo, ministrada pelo Prof. Marcelo Ricardo de Lima na disciplina Formação e Caracterização dos Solos, do Departamento de Solos e Engenharia Agrícola da Universidade Federal do Paraná (UFPR).\nA apostila referente a este conteúdo está disponível no link: http://www.mrlima.agrarias.ufpr.br/FC..."),
    ];

    var playlists = <PlaylistMovie>[
      PlaylistMovie(
          id: "jhu8CVdzmVM",
          title: "Irrigação e Drenagem",
          author: "Professora Dra Alessandra Conceição de Oliveira",
          subtitle:
              "O curso visa capacitar o aluno a realizar o manejo da irrigação de forma racional, oferecendo subsídios para que se possa responder às três perguntas básicas do manejo, QUANDO, QUANTO e COMO IRRIGAR. Visando o nivelamento dos alunos, o curso abordará desde os aspectos mais básicos até as técnicas mais elaboradas, passando por assuntos práticos e teóricos. A carga horária será de 16 horas.",
          listMovies: <Movie>[
            Movie(
                id: "jhu8CVdzmVM",
                title: "Aula 1 - Manejo de irrigação",
                slideImage: "https://i.ytimg.com/vi/jhu8CVdzmVM/hqdefault.jpg",
                url: "https://www.youtube.com/watch?v=jhu8CVdzmVM"),
            Movie(
                id: "_xNTvlabJhg",
                title: "Aula 2 - Manejo de irrigação",
                slideImage: "https://i.ytimg.com/vi/_xNTvlabJhg/hqdefault.jpg",
                url: "https://www.youtube.com/watch?v=_xNTvlabJhg"),
            Movie(
                id: "UD5o77JUHkg",
                title: "Aula 3 - Inteira - Manejo de Irrigação",
                slideImage: "https://i.ytimg.com/vi/UD5o77JUHkg/hqdefault.jpg",
                url: "https://www.youtube.com/watch?v=UD5o77JUHkg"),
            Movie(
                id: "8uskm-0p06U",
                title:
                    "Aula 4 - Irrigação por Aspersão (Seleção dos Aspersores)",
                slideImage: "https://i.ytimg.com/vi/8uskm-0p06U/hqdefault.jpg",
                url: "https://www.youtube.com/watch?v=8uskm-0p06U"),
            Movie(
                id: "QCRTaWIxwHo",
                title:
                    "Aula 5 - Irrigação por Aspersão (Seleção dos Aspersores)",
                slideImage: "https://i.ytimg.com/vi/QCRTaWIxwHo/hqdefault.jpg",
                url: "https://www.youtube.com/watch?v=QCRTaWIxwHo"),
            Movie(
                id: "8FxzaTXu0Do",
                title: "Aula 6 - Irrigação por Aspersão (Dimensionamento)",
                slideImage: "https://i.ytimg.com/vi/8FxzaTXu0Do/hqdefault.jpg",
                url: "https://www.youtube.com/watch?v=8FxzaTXu0Do"),
            Movie(
                id: "hG9vVN6pLZQ",
                title: "Aula 7 - Irrigação por Aspersão (Dimensionamento)",
                slideImage: "https://i.ytimg.com/vi/hG9vVN6pLZQ/hqdefault.jpg",
                url: "https://www.youtube.com/watch?v=hG9vVN6pLZQ"),
          ],
          slideImage: "https://i.ytimg.com/vi/jhu8CVdzmVM/hqdefault.jpg"),
      PlaylistMovie(
          id: "VG2ySy8aD8I",
          title: "Irrigação e Drenagem",
          author: "Professora Dra Alessandra Conceição de Oliveira",
          subtitle:
              "A química analítica é importante em quase todos os aspectos das nossas vidas porque esta disciplina se preocupa com a caracterização da matéria, isto é, praticamente tudo o que nos rodeia. A química analítica pode identificar a identidade e a quantidade de uma infinidade de compostos. Conhecer alguns dos termos mais utilizados dentro desta disciplina também é importante para uma comunicação científica adequada.",
          listMovies: <Movie>[
            Movie(
                id: "VG2ySy8aD8I",
                title: "Aula 1 - QUÍMICA ANALÍTICA: conceitos importantes",
                slideImage: "https://i.ytimg.com/vi/VG2ySy8aD8I/hqdefault.jpg",
                url: "https://www.youtube.com/watch?v=VG2ySy8aD8I"),
            Movie(
                id: "IR3cMz-RdZA",
                title:
                    "Aula 2 - A IMPORTÂNCIA da QUÍMICA ANALÍTICA para o agrônomo",
                slideImage: "https://i.ytimg.com/vi/IR3cMz-RdZA/hqdefault.jpg",
                url: "https://www.youtube.com/watch?v=IR3cMz-RdZA"),
            Movie(
                id: "7FtvFnxNJsk",
                title: "Aula 3 - DIFERENÇA entre um ÁTOMO e um MOL de ÁTOMOS",
                slideImage: "https://i.ytimg.com/vi/7FtvFnxNJsk/hqdefault.jpg",
                url: "https://www.youtube.com/watch?v=7FtvFnxNJsk"),
          ],
          slideImage: "https://i.ytimg.com/vi/VG2ySy8aD8I/hqdefault.jpg"),
      PlaylistMovie(
          id: "dos2AH_1D0U",
          title: "Estudo do Solo",
          slideImage: "https://i.ytimg.com/vi/dos2AH_1D0U/hqdefault.jpg",
          subtitle: '',
          listMovies: [
            Movie(
                id: "dos2AH_1D0U",
                title: "Aula 1 - Introdução ao Estudo do Solo",
                slideImage: "https://i.ytimg.com/vi/dos2AH_1D0U/hqdefault.jpg",
                url: "https://www.youtube.com/watch?v=dos2AH_1D0U",
                subtitle:
                    "Aula sobre o tema Introdução ao Estudo do Solo, ministrada pelo Prof. Marcelo Ricardo de Lima na disciplina Formação e Caracterização dos Solos, do Departamento de Solos e Engenharia Agrícola da Universidade Federal do Paraná (UFPR).\nA apostila referente a este conteúdo está disponível no link: http://www.mrlima.agrarias.ufpr.br/FC..."),
            Movie(
                id: "teNjVSqzb8Y",
                title:
                    "Aula 2 - Fatores limitantes e potenciais ao uso do solo",
                slideImage: "https://i.ytimg.com/vi/teNjVSqzb8Y/hqdefault.jpg",
                url: "https://www.youtube.com/watch?v=teNjVSqzb8Y",
                subtitle:
                    "Aula sobre o tema Fatores Limitantes e Potenciais ao Uso do Solo, ministrada pelo Prof. Marcelo Ricardo de Lima na disciplina Formação e Caracterização dos Solos, do Departamento de Solos e Engenharia Agrícola da Universidade Federal do Paraná (UFPR).\nA apostila referente a este conteúdo está disponível no link: http://www.mrlima.agrarias.ufpr.br/FC..."),
          ])
    ];

    var mcontinueList = <Movie>[
      Movie(
          title: "Manejo de irrigação",
          slideImage: "https://i.ytimg.com/vi/jhu8CVdzmVM/hqdefault.jpg",
          isHD: true,
          percent: 0.5),
    ];

    var continueWatchingList = mcontinueList.isNotEmpty
        ? ItemProgressHorizontalList(
            mcontinueList,
          )
        : Container();
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          // backgroundColor: color_app_background,
          centerTitle: true,
          title: text("Educação",
              fontSize: 20.0, textColor: color_textColorPrimary),
          actions: <Widget>[
            IconButton(
                icon: SvgPicture.asset(
                  "images/search_broken.svg",
                ),
                onPressed: () {
                  Modular.to.pushNamed('/education/search',
                      forRoot: (IO.Platform.isAndroid || IO.Platform.isIOS)
                          ? true
                          : false);
                }),
          ],
          bottom: PreferredSize(
            preferredSize: Size(double.infinity, 45),
            child: Align(
              alignment: Alignment.topLeft,
              child: TabBar(
                indicatorPadding: EdgeInsets.only(left: 30, right: 30),
                indicatorWeight: 3.0,
                isScrollable: true,
                indicatorSize: TabBarIndicatorSize.tab,
                labelStyle: TextStyle(
                  fontFamily: fontMedium,
                  fontSize: textSizeNormal,
                ),
                indicatorColor: Theme.of(context).colorScheme.secondary,
                unselectedLabelColor: Theme.of(context).secondaryHeaderColor,
                labelColor: Theme.of(context).colorScheme.secondary,
                labelPadding:
                    EdgeInsets.only(left: spacing_large, right: spacing_large),
                tabs: [
                  Tab(child: text("Home")),
                  Tab(child: text("Ebooks")),
                  Tab(child: text("Videos")),
                ],
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            ListView(
              physics: BouncingScrollPhysics(),
              children: [
                SizedBox(
                  height: 20,
                ),
                Observer(builder: (_) {
                  if (controller.isLoading == true)
                    return Center(
                      child: CircularProgressIndicator(),
                    );

                  return Container(
                    child: BannerCarousel(
                      height: width <= 1000 ? 200 : (width * 0.28) * 6.8 / 6,
                      activeColor: Colors.green,
                      disableColor: Colors.grey,
                      animation: true,
                      indicatorBottom: true,
                      customizedBanners: [
                        "https://res.cloudinary.com/dxz4ivhm8/image/upload/v1628109980/plant-care/ebooks/vender-no-agro-990x550.png",
                        "https://res.cloudinary.com/dxz4ivhm8/image/upload/v1628345707/Capturar.png"
                      ]
                          .map(
                            (e) => InkWell(
                              onTap: () {
                                Modular.to.pushNamed(
                                    'ebook/view/${controller.ebookBanners.first.id}',
                                    arguments: controller.ebookBanners.first,
                                    forRoot: (IO.Platform.isAndroid ||
                                            IO.Platform.isIOS)
                                        ? true
                                        : false);
                              },
                              child: Container(
                                child: Image.network(e, fit: BoxFit.contain),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  );
                }),
                appLabelViewAll("Ebooks"),
                Observer(builder: (_) {
                  return Container(
                    child: (controller.isLoading == true)
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : Container(
                            margin: EdgeInsets.symmetric(vertical: 5),
                            height: width <= 1000
                                ? (width * 0.28) * 8.8 / 6
                                : (width * 0.28) * 2.8 / 6,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: controller.ebooks.length,
                              shrinkWrap: true,
                              padding: EdgeInsets.only(
                                  left: spacing_standard,
                                  right: spacing_standard_new),
                              itemBuilder: (context, index) {
                                return Container(
                                  margin:
                                      EdgeInsets.only(left: spacing_standard),
                                  width: width <= 1000
                                      ? (width * 0.28)
                                      : (width * 0.1),
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8)),
                                  ),
                                  child: InkWell(
                                    child: Stack(
                                      alignment: Alignment.bottomLeft,
                                      children: <Widget>[
                                        Container(
                                          decoration: BoxDecoration(
                                              // boxShadow: [
                                              //   BoxShadow(
                                              //     color: Colors.grey
                                              //         .withOpacity(0.15),
                                              //     spreadRadius: 0,
                                              //     blurRadius: 5,
                                              //     offset: Offset(0,
                                              //         0), // changes position of shadow
                                              //   ),
                                              // ],
                                              ),
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(8)),
                                            child: CachedNetworkImage(
                                              imageUrl: controller
                                                  .ebooks[index].file
                                                  .toString()
                                                  .replaceFirst('.pdf', '.jpg'),
                                              width: double.infinity,
                                              height: double.infinity,
                                              fit: BoxFit.fitHeight,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    onTap: () async {
                                      Modular.to.pushNamed(
                                          'ebook/view/${controller.ebooks[index].id}',
                                          arguments: controller.ebooks[index],
                                          forRoot: (IO.Platform.isAndroid ||
                                                  IO.Platform.isIOS)
                                              ? true
                                              : false);
                                    },
                                    radius: spacing_control,
                                  ),
                                );
                              },
                            ),
                          ),
                  );
                }),
                appLabelViewAll("Videos"),
                ItemHorizontalList(
                  popularMovieList,
                  isHorizontal: false,
                ),
                SizedBox(
                  height: spacing_standard_new,
                )
              ],
            ),
            Observer(builder: (_) {
              return ListView(
                physics: BouncingScrollPhysics(),
                controller: controller.ebooksController,
                children: controller.ebooksList
                    .map((element) => ListTile(
                          onTap: () {
                            Modular.to.pushNamed('ebook/view/${element.id}',
                                arguments: element,
                                forRoot:
                                    (IO.Platform.isAndroid || IO.Platform.isIOS)
                                        ? true
                                        : false);
                          },
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 10.0),
                          leading: AspectRatio(
                            aspectRatio: 1,
                            child: Container(
                              width: (width * 0.28),
                              height: ((width / 2) - 36) * (1.5 / 2),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  image: DecorationImage(
                                    fit: BoxFit.fitHeight,
                                    image: NetworkImage(
                                      element.file
                                          .toString()
                                          .replaceFirst('.pdf', '.jpg'),
                                    ),
                                  )),
                            ),
                          ),
                          title: text(element.name.toString(),
                              fontSize: 14.0, maxLine: 10),
                          subtitle: text(element.description.toString(),
                              fontSize: 12.0),
                        ))
                    .toList(),
              );
            }),
            Observer(builder: (_) {
              return ListView(
                physics: BouncingScrollPhysics(),
                controller: controller.ebooksController,
                children: <Widget>[
                  appLabelViewAll("Novidades da semana")
                      .paddingAll(spacing_standard_new),
                  ItemHorizontalList(
                    popularMovieList,
                    isHorizontal: true,
                  ),
                  appLabelViewAll("Continue assistindo").paddingOnly(
                      left: spacing_standard_new,
                      right: spacing_standard_new,
                      top: 12,
                      bottom: spacing_standard_new),
                  continueWatchingList,
                  appLabelViewAll("Cursos").paddingAll(spacing_standard_new),
                  ItemHorizontalList(
                    playlists,
                    isHorizontal: false,
                  ),
                  SizedBox(
                    height: spacing_standard_new,
                  )
                ],
              );
            }),
          ],
        ),
      ),
    );
  }
}
