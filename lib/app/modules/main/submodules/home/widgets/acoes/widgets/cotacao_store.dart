import 'package:mobx/mobx.dart';
import 'package:agro_tools/app/modules/main/submodules/home/widgets/acoes/models/cotacao_model.dart';
import 'package:agro_tools/app/modules/main/submodules/home/widgets/acoes/repositories/cotacao_repository.dart';

part 'cotacao_store.g.dart';

class CotacaoStore = _CotacaoStoreBase with _$CotacaoStore;

abstract class _CotacaoStoreBase with Store {
  final CotacaoRepository respository;

  @observable
  CotacaoModel? cotacao;

  @observable
  bool loading = false;

  @observable
  String slugSelected = "algodao";

  _CotacaoStoreBase(this.respository) {
    loadCotacao();
  }

  @action
  loadCotacao() async {
    loading = true;
    cotacao = await respository.get(slugSelected);
    loading = false;
  }

  @action
  selectCotacao(String slug) async {
    slugSelected = slug;
    loadCotacao();
  }
}
