import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:plant_care/app/modules/main/submodules/education/ebook/repositories/ebook_repository.dart';
import 'package:plant_care/app/modules/main/submodules/education/education_page.dart';
import 'package:plant_care/app/modules/main/submodules/education/education_search_page.dart';
import 'package:plant_care/app/modules/main/submodules/education/education_search_store.dart';
import 'package:plant_care/app/modules/main/submodules/education/education_store.dart';

import 'ebook/ebook_module.dart';

class EducationModule extends Module {
  @override
  final List<Bind> binds = [
    BindInject((i) => EbookRepository(i<Dio>())),
    BindInject((i) => EducationStore(i<EbookRepository>())),
    BindInject((i) => EducationSearchStore(i<EbookRepository>()))
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, __) => EducationPage()),
    ChildRoute('search', child: (_, __) => EducationSearchPage()),
    ModuleRoute('ebook', module: EbookModule())
  ];
}
