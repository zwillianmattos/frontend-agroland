import 'package:flutter_modular/flutter_modular.dart';

import 'ebook/ebook_module.dart';

class EducationModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute('ebook', module: EbookModule())
  ];
}
