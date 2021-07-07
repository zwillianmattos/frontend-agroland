import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttericon/typicons_icons.dart';
import 'package:geolocator/geolocator.dart';
import 'package:location/location.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:plant_care/app/core/consts/colors.dart';
import 'package:plant_care/app/core/consts/texts.dart';
import 'package:plant_care/app/core/widgets/widgets.dart';
import 'package:plant_care/app/modules/account/models/user.dart';
import 'package:plant_care/app/modules/main/submodules/marketplace/models.dart';
import 'package:relative_scale/relative_scale.dart';

import '../widgets.dart';

class MarketplaceHomePage extends StatefulWidget {
  const MarketplaceHomePage({Key? key}) : super(key: key);

  @override
  _MarketplaceHomePageState createState() => _MarketplaceHomePageState();
}

class _MarketplaceHomePageState
    extends ModularState<MarketplaceHomePage, MarketplaceHomeStore>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final List<String> categorias = [
      "Produtos/Coprodutos/Subprodutos",
      "Nutrição Animal",
      "Proteção e Nutrição de Cultivos",
      "Sementes e Mudas",
      "Limpeza e Desinfecção",
      "Acessórios e Cuidados Gerais",
      "Motores, Peças, Equipamentos e Maquinários"
    ];

    final List<MenuCategoriaClassificados> classificados = [
      MenuCategoriaClassificados(
        categoria: ClassificadoCategoria(description: 'Diversos'),
        classificados: [
          Classificado(
            title: "Carvão Vegetal Em Pó Adubo Fertilizante - Biochar Comprar",
            description:
                """<p class="ui-pdp-description__content">O Biochar é um produto de origem totalmente orgânica, seu objetivo é ajudar no crescimento e fortalecimento das plantas, com o intuito de reduzir drasticamente o uso de fertilizantes químicos no solo. Sua utilização é muito recomendada para o aumento do teor de matérias orgânicas, nitrogênio, fósforo, cálcio e potássio, ajudando também o pH do solo na capacidade de troca de cátions, seu uso também é de extrema importância na prevenção de pragas, promovendo assim um bom crescimento de microorganismos benéficos para as plantas e o solo.<br><br>Abaixo estão alguns dos componentes do Biochar, que são de extrema importância para um solo fértil. Como por exemplo Nitrogênio, Fósforo, Ferro e Potássio etc…<br><br>Nitrogênio (N)<br>Principais funções do Nitrogênio:<br>*É responsável pelo crescimento da planta<br>*Atua diretamente na fotossíntese<br>*É parte constituinte da clorofila, vitaminas, carboidratos e proteínas<br>*É responsável pela coloração verde-escura das folhas<br>*Atua no desenvolvimento do sistema radicular<br><br>Fósforo (P)<br>Principais funções do Fósforo:<br>*Controle hormonal para o crescimento das plantas<br>*Auxilia na síntese de ácidos nucléicos<br>*É responsável pela ativação e desativação de enzimas<br>*Atua na fixação de Nitrogênio<br>*Interfere na produção de frutos e sementes<br>*É determinante na composição de amido, proteína solúvel, sacarose e glicose.<br><br>Ferro (Fe)<br>Principais funções do Ferro:<br>*Ativador ou componente de enzimas<br>*Influencia na fixação do Nitrogênio<br>*Catalisador na biossíntese da clorofila<br>*Atua no desenvolvimento de troncos e raízes<br><br>Potássio (K)<br>Principais funções do Potássio:<br>*Responsável na manutenção do pH das céluas e tecidos entre 7 e 8<br>*Ativa sistemas enzimáticos e Atua na fotossíntese<br>*Interfere na constituição da firmeza das paredes celulares da planta (turgor)<br>*Promove a absorção de água<br>*Regula a translocação de nutrientes na planta<br>*Auxilia no transporte e armazenamento de carboidrato<br>*Incrementa a absorção de Nitrogênio e a síntese de proteínas<br><br>TABELA DE COMPONENTES<br> g kg-1 <br>4,1 N <br>0,27 P <br>1,00 K <br>2,6 Ca <br>0,7 Mg <br>0,5 S <br><br>mg kg-1<br>1098 Fe<br>2,8 Cu<br>12,0 Zn<br>168,0 Mn<br>13,6 B<br>56,67 Na<br><br>BENEFÍCIOS <br><br>Melhora propriedades do solo. <br><br>Melhora a desenvolvimento biológico no solo. <br><br>Retém humidade no solo por mais tempo. <br><br>Equilibra o PH do solo. <br><br>Reduz o aparecimento de algas. <br><br>Reduz o uso de turfas e vermiculitas. <br><br>Acelera o desenvolvimento dos vegetais. <br><br>O biochar tem uma densidade muito baixa. <br><br>Ajuda na redução de CO2 dá atmosfera. <br><br>Promover o equilíbrio biológico do solo; <br><br>Minimiza os riscos de erosão; <br><br>Diminui as perdas por lixiviação; <br><br>Promove maior disponibilização de micronutrientes tais como (Nitrogênio, Fósforo, Ferro, Cobre, Potássio, Cálcio, Zinco, Manganês, Magnésio, Enxofre, Boro, Sódio) <br><br>Aumento da resistência das plantas <br><br>Liberação de nutrientes em todas as etapas do desenvolvimento <br><br>Aumenta a matéria orgânica <br><br><br>COMO USAR <br><br> O Biochar pode ser utilizado de três formas, são elas: <br><br>1 – Pode ser aplicado em cima do solo ao redor da planta. <br><br>2 – Pode ser aplicado sendo misturado com o solo (Proporção: 500g de biochar para 2kg de terra). <br><br>3 – Pode ser diluído na água e aplicado direto no solo (Proporção: 500g de biochar para 3 Litros de água). <br><br><br>RECOMENDAÇÕES DE PLANTAS<br>Hortas/Hortaliças<br>Orquídeas<br>Flores<br>Suculentas<br>bromélia<br>Gramas<br><br><br>RECOMENDAÇÕES DE USO: <br><br>. Em vasos já plantados – 10% do volume do vaso a cada 20 dias <br><br>. Mistura em substratos – até 20% do volume final da mistura <br><br>. Canteiros de hortas e jardins – 2 kg / m² <br><br>. Covas de frutíferas e ornamentais – de 2 a 5 kg / cova, dependendo do tamanho da cova e da planta<br><br><br><br>EMBALAGENS DISPONÍVEIS:<br>500g - https://produto.mercadolivre.com.br/MLB-1589282750-biochar-500g-hortalicas-flores-gramados-e-frutiferas--_JM<br>1 Kg - https://produto.mercadolivre.com.br/MLB-1622363334-biochar-adubo-fertilizante-100-orgnico-carvo-em-po-_JM<br><br>Combo de 3Kg - https://produto.mercadolivre.com.br/MLB-1694933080-biochar-combo-3-unidades-1kg-_JM<br><br><br><br>QUAL A DIFERENÇA DO BIOCHAR PARA OS OUTROS FERTILIZANTES? <br><br> O Biochar possui micronutrientes concentrados, específicos para um bom desenvolvimento de qualquer vegetal, atua como um verdadeiro suplemento 100% orgânico.<br><br><br>DUVIDAS FREQUENTES <br><br>TEM CHEIRO FORTE? <br><br>R.: Não, o biochar não é derivado de fezes animais. <br><br>TEM ALGUM TRANSGENICO NA COMPOSIÇÃO? <br><br>R.: Não. <br><br>ALGUM COMPONENTE É TÓXICO PARA ANIMAIS DOMÉSTICOS? <br><br>R.: Não. <br><br>QUAL A VALIDADE? <br><br>R.: 1 ano, se mantido em temperatura ambiente. <br><br>ESSE ADUBO QUEIMA RAIZES DAS PLANTAS? <br><br>R.: Não. <br><br>POSSO USAR COM OUTROS FERTILIZANTES? <br><br>R.: Sim.<br></p> """,
            price: 35.00,
            logista: Logista(
                cnpj: '37.841.461/0001-05',
                description:
                    'Nossos produtos são 100% natural feitos de eucalipto reflorestado. Vendemos nossos produtos em unidades de 500g, 5kg e 10kg, agora caso você seja um agricultor médio ou de grande porte, entre em contato pelo chat, ou pelo whatsApp para negociarmos uma quantia que supra suas necessidades.',
                user: User(
                  name: 'Biochar Brasil',
                ),
                phone: "14 991935302",
                marketName: 'Biochar Brasil',
                imgLogo:
                    "https://http2.mlstatic.com/D_NQ_NP_834341-MLB44075965720_112020-O.webp"),
            category: ClassificadoCategoria(
              description: 'Adubos',
            ),
            classificadoFotos: [
              ClassificadoFotos(
                imgPath:
                    "https://http2.mlstatic.com/D_NQ_NP_834341-MLB44075965720_112020-O.webp",
              ),
              ClassificadoFotos(
                imgPath:
                    "https://http2.mlstatic.com/D_NQ_NP_818188-MLB42784958121_072020-O.webp",
              ),
            ],
          ),
          Classificado(
            title: "Alface Americano",
            description: "alfacinho americanoooo",
            price: 25.00,
            logista: Logista(
              cnpj: '70.044.310/0001-93',
              description: 'Hortifruit muito top do seu ze',
              user: User(
                name: 'Ze Neto',
              ),
              marketName: 'Hortifruit Do Ze',
            ),
            category: ClassificadoCategoria(
              description: 'Sementes e Mudas',
            ),
            classificadoFotos: [
              ClassificadoFotos(
                imgPath:
                    "https://flaviaarrudadf.com.br/wp-content/uploads/2018/07/Horta-Comunit%C3%A1ria-1024x768.jpg",
              ),
              ClassificadoFotos(
                imgPath:
                    "https://www.padariavianney.com.br/web/image/product.template/4006/image",
              ),
              ClassificadoFotos(
                imgPath:
                    "https://hortifrutijardins.com.br/wp-content/uploads/2020/05/alface-americana.jpg",
              ),
            ],
          ),
          Classificado(
            title: "AGRICULTURA SINTRÓPICA",
            description: """ 
☁️💚☁️Oi Querid@s‼️ Asa Orgânicos oferece, nesta sexta-feira 🤩(18/06)🤩, os produtos AGROECOLÓGICOS: 🐝🐜🐞 <br/>
🍀ALFACE CRESPA – R\$ 2,00, <br/>
🍀ALFACE LISA – R\$ 2,00; <br/>
🍀ALFACE MIMOSA – R\$ 2,00; <br/>
🍀ALMEIRÃO CATALONHA – R\$ 3,00; <br/>
🍀BABOSA (½ kg) – R\$ 2,00; <br/>
🍀BOLDO (medicinal) – R\$ 2,00; <br/>
🍀CAPIM CIDREIRA (medicinal) – R\$ 4,00; <br/>
🍀CHICÓRIA – R\$ 3,00; <br/>
🍀GUAPO (medicinal) – R\$ 2,00; <br/>
🍀HORTELÃ – R\$ 2,00; <br/>
🍀NIRÁ (alho japonês) – R\$ 3,00; <br/>
🍀OVO DE CODORNA (15 ovos) – R\$ 7,00; <br/>
🍀PARIPAROBA (medicinal) – R\$ 2,00; <br/>
🍀PEIXINHO DA HORTA (30 folhas) – R\$ 4,00; <br/>
🍀STÉVIA (substitui o açúcar) – R\$ 4,00; <br/>
🍀SALSINHA (50 g) – R\$ 3,00; <br/>
🍀TAIOBA – R\$ 2,00 e <br/>
🌺MIX DE FLORES COMESTÍVEIS (enfeite seus pratos) – R\$ 3,00. <br/>
 <br/>
⚠️TEMPERO ASA ORGÂNICOS (alho, manjericão, alfavaca, alecrim, salsinha, cebolinha e sal) – pote com 300 g – R\$ 7,00⚠️ <br/>
 <br/>
🌱Rizoma de TAIOBA – R\$ 2,00🌱 <br/>
🌱Muda de PEIXINHO DA HORTA – R\$ 10,00🌱 <br/>
🌱Muda de ORA-PRO-NÓBIS – R\$ 15,00🌱 <br/>
 <br/>
🚀Delivery: WhatsApp [hidden information], Messenger ou Direct🚀 <br/>
 <br/>
🌾Agricultura no Ritmo da Natureza🌾 <br/>
 <br/>
"Um pássaro a voar: é ir com os olhos a voar com ele; ir sobre os montes, sobre os rios, sobre os mares; dar a volta ao mundo e continuar; é ter um motivo de viver — é não ter chegado ainda." <br/>
✒️Branquinho da Fonseca, escritor✒️ <br/>
 <br/>
🌳🌾🌳ASA - Agricultura Sintrópica e Agroflorestal🌳🌾🌳 <br/>
. <br/>
. <br/>
. <br/>
👩‍🌾👨‍🌾
#itatingasp #agrofloresta #agriculturasintropica #agroecologia #viacampesina #ernstgotsch #anaprimavesi #sisteminhaembrapa #sextou <br/>
            """,
            price: 2.00,
            logista: Logista(
              cnpj: '70.044.310/0001-93',
              description: 'Hortifruit muito top do seu ze',
              phone: '(14) 991935302',
              user: User(
                name: 'Diego',
              ),
              marketName: 'Hortifruit Do Ze',
            ),
            category: ClassificadoCategoria(
              description: 'Sementes e Mudas',
            ),
            classificadoFotos: [
              ClassificadoFotos(
                imgPath:
                    "https://static.cestasmichelli.com.br/images/product/19580gg.jpg?_nc_cat=105&ccb=1-3&_nc_sid=843cd7&_nc_ohc=53XMfQEr5-EAX9Ootd5&_nc_oc=AQmpHMPS3hteZq5Mc6OWJdsaxa1fx6m_NKosztiW0jJi7IDvFpw_bP4turU_EYi9KUmDCL4RO4PHh27td5QkNDAb&_nc_ht=scontent.fbau4-1.fna&tp=7&oh=9fefb79b753abcb9764c30794f57bf23&oe=60D341B2",
              ),
            ],
          ),
          Classificado(
            title: "Horta na cesta",
            description: """ 
Horta na cesta de: <br/>
Abobrinha <br/>
Tomate <br/>
Chuchu <br/>
Beterraba <br/>
Quiabo <br/>
Cenoura <br/>
Repolho <br/>
Pimentão vermelho e amarelo <br/>
Alho <br/>
Banana  <br/>
Maracujá <br/>
Alface crespa lisa ou americana <br/>
<br/><br/>
Valor da cesta 45.00 <br/>
Entrega grátis  <br/>
988186705 <br/>
988094299 <br/>
WhatsApp <br/>
            """,
            price: 45.00,
            logista: Logista(
              cnpj: '70.044.310/0001-93',
              description: 'Hortifruit muito top do seu ze',
              phone: '(14) 991935302',
              user: User(
                name: 'João Vitorino',
              ),
              marketName: 'João Vitorino',
            ),
            category: ClassificadoCategoria(
              description: 'Diversos',
            ),
            classificadoFotos: [
              ClassificadoFotos(
                imgPath:
                    "https://static.cestasmichelli.com.br/images/product/19580gg.jpg",
              ),
            ],
          ),
        ],
      ),
      MenuCategoriaClassificados(
          categoria: ClassificadoCategoria(
            description: "Sementes e Mudas",
          ),
          classificados: [
            Classificado(
              title: "Mudas BRS Kurumi Kit 500 Estacas Com 2 Gemas",
              description: """ 
INFORMAÇÕES IMPORTANTES <br/>
<br/>
ESTAMOS ENTREGANDO NORMALMENTE, COM ESTOQUE PERMANENTE <br/>
NÃO COMPRE MAIS DE 2 UNIDADES POIS EXCEDE O PESO LIMITE DOS CORREIOS <br/>
O plantio deve ser feito em sucos com 25 a 30 cm de profundidade, com adubação (30g Map/metro linear) no fundo do sulco, coberto por uma camada fina de terra, depois a muda e outra camada de terra fina 5cm e sem torrões. Irrigar durante o período de nascimento.Em 7 dias já emergem ao solo. O espaçamento entre linhas varia entre 0,75 a 1,5 metro. O espaçamento entre mudas 0,20 cm. O plantio também pode ser feito no saquinho ou copo descartável, usando substrato para o plantio e depois transplante para a área desejada.
OBS: A MUDA DEVE ESTÁ TODA COBERTA. <br/>
________________________________<br/>
É OBRIGATÓRIO A IRRIGAÇÃO DIÁRIA<br/>
----------------------------------------------------------<br/>
AS MUDAS CHEGAM ESCURAS, DEVIDO A OXIDAÇÃO E USO DE ENRAIZADOR<br/>
_______________________________<br/>
TODAS AS MUDAS SÃO CORTADAS NO DIA DE ENVIO E SÃO DESPACHADAS ATÉ 12:00 DO MESMO.<br/>
<br/>
<br/>

Desenvolvida pelo Programa de Melhoramento Genético de Capim-elefante da Embrapa, a cultivar BRS Kurumi possui alto teor nutritivo e elevada produção de forragem, o que permite ao produtor intensificar a produção de leite a pasto com menor uso de concentrado, altas taxas de lotação e excelente desempenho por animal. A cultivar caracteriza-se por apresentar touceiras de formato semiaberto; folha e colmo de cor verde e internódio curto. A BRS Kurumi tem crescimento vegetativo vigoroso com rápida expansão foliar, intenso perfilhamento e porte baixo. Chama a atenção a elevada relação folha/colmo e facilidade de manejo devido seu porte. A cultivar possui propagação vegetativa por meio de estacas, e é indicada para uso forrageiro nos Biomas Mata Atlântica, Amazônia e Cerrado.
O MELHOR CAPIM PARA PASTEJO<br/>

• Alta produção de forragem;<br/>
• Elevada proporção de folhas;<br/>
• NÃO NECESSITA DE ROÇADAS FREQUENTES;<br/>
• Taxa de acúmulo de forragem entre 120 e 170 kg MS/ha/dia;<br/>
• PROTEÍNA BRUTA DE 20%;<br/>
• COEFICIENTE DE DIGESTIBILIDADE DE 78%;<br/>
GANHO DE ATÉ 1KG/DIA DE PESO<br/>
<br/>
https://www.youtube.com/watch?v=-ld_EG99kHo
              """,
              price: 450.00,
              logista: Logista(
                cnpj: '70.044.310/0001-93',
                description: 'Super sementes',
                phone: '(14) 991935302',
                user: User(
                  name: 'Ze Neto',
                ),
                marketName: 'Super sementes',
              ),
              category: ClassificadoCategoria(
                description: 'Sementes e Mudas',
              ),
              classificadoFotos: [
                ClassificadoFotos(
                  imgPath:
                      "https://res.cloudinary.com/dxz4ivhm8/image/upload/v1624119588/plant-care/marketplace_mock/Foto_1.jpg",
                ),
                ClassificadoFotos(
                  imgPath:
                      "https://res.cloudinary.com/dxz4ivhm8/image/upload/v1624119589/plant-care/marketplace_mock/Foto_4_Kurumi_x_Capia%C3%A7u.jpg",
                ),
              ],
            ),
            Classificado(
              title:
                  "Sementes Milheto Adr500 Muito Mais Leite E Carne 25kg Kit 2 Unid",
              description: """ 
Descrição do produto<br/>
Sementes de Milheto Adr500 Muito Mais Leite E Carne 25kg Kit 2 Unidades<br/>

Observações e Condições<br/>
Antes de efetuar a compra tire todas suas dúvidas no campo perguntas.<br/>
Confirme a aplicação com seu técnico antes de efetuar a compra.<br/>
Verifique o modo de recebimento da compra (retira o produto no local do fornecedor ou receba o produto no endereço escolhido pelo comprador).<br/>
Efetue a compra com CPF ou CNPJ para a emissão da Nota Fiscal. Os impostos estarão inclusos no valor total da venda fornecido por conta do fornecedor.<br/>
Mantenha seus dados e endereços atualizados no site Agro2Business.<br/>
Suporte e Horários de Atendimento<br/>
Temos Equipe de Atendimento e Suporte Técnico Especializado à Disposição.<br/>
Atendimento via plataforma Agro2Business de Seg. a Sex. das 8:30 às 17:30.<br/>
Perguntas Frequentes<br/>
Quanto fica o frete para o meu endereço?<br/>
Acesse no seu menu endereços e clique em novos endereços. Após cadastrar o seu endereço, você já poderá orçar e comprar o que você precisa já com o prazo de entrega estimado, tudo de forma online.<br/>
Como eu faço para orçar e comprar uma quantidade maior do que está no anúncio?<br/>
O lote é a quantidade mínima para compra do anúncio. você pode aumentar a quantidade, para isso, quando estiver no detalhe do anúncio, clique em adicionar no carrinho e edite a quantidade de lotes. a quantidade total será múltipla do lote. exemplo lote de 900kg, se inserir 3 lotes, a quantidade total será de 2.700kg.
Como eu faço para comprar?<br/>
Após adicionar o anúncio no carrinho, você deve escolher o tipo de transporte e clicar em avançar. Pronto, basta selecionar a forma de pagamento, cartão ou boleto e clicar em finalizar compra. Você recebera um e-mail confirmando a sua operação.
Como funciona a compra protegida?<br/>
Após a realização da compra, nós do marketplace Agro2Business.com monitoramos a entrega e a satisfação do comprador com o recebimento do produto. Somente após a confirmação do comprador o pagamento é transferido para o vendedor. O comprador tem até 14 dias após a confirmação do pagamento para demonstrar se algo não foi entregue conforme o esperado.
Quero devolver a compra que realizei, o que eu faço?<br/>
É bem simples, você deve acessar na plataforma suas compras, selecionar a compra desejada e clicar em ações. Clique em abrir reclamação. Pronto! Nosso time fará a mediação e o entendimento da ação desejada.<br/>
              """,
              price: 405.84,
              logista: Logista(
                cnpj: '70.044.310/0001-93',
                description: 'Super sementes',
                phone: '(14) 991935302',
                user: User(
                  name: 'Ze Neto',
                ),
                marketName: 'Super sementes',
              ),
              category: ClassificadoCategoria(
                description: 'Sementes e Mudas',
              ),
              classificadoFotos: [
                ClassificadoFotos(
                  imgPath:
                      "https://res.cloudinary.com/dxz4ivhm8/image/upload/v1624119588/plant-care/marketplace_mock/6.jpg",
                ),
              ],
            ),
          ]),
      MenuCategoriaClassificados(
          categoria: ClassificadoCategoria(
            description: "Motores, Peças, Equipamentos e Maquinários",
          ),
          classificados: [
            Classificado(
              title: "Ensacadora De Silagem Do Campo Agrícola",
              description: """ 
              Docampoagricola em todas redes. Tire todas dúvidas antes da compra. <br/>
Maquina enfardadeira empacotadeira compactadora embutidora embaladora de silagem, silo, e outros 100 materiais. <br/>
Disponível em 19 modelos para 19 necessidades! <br/>
Modelos de 2 a 11 toneladas por hora. <br/>
Fabricada com opção de motores diesel, elétrica e gasolina. <br/>
Suporte gratuito sobre silagem; desde a escolha da semente até o momento de armazenar e servir. <br/>
100 % de clientes satisfeitos.<br/>
Disponível em 18 países.<br/>
A 15 anos no mercado de máquinas.<br/>
Todas peças de reposição a pronta entrega.<br/>
Produto diretamente da fábrica, com assistência total.<br/>
Maquina original é garantia de tecnologia em evolução, peças de qualidade, alta durabilidade, suporte técnico e satisfação.<br/>
Cuidado com cópias!!!! Trazem baixíssima qualidade, abandono após a venda e eterna dor de cabeça. Investigue, procure Docampoagricola e encontre as mais confiáveis informações.<br/>
** Para saber valor de frete insira o nome da cidade no box de pergunta e o mesmo será calculado.<br/>
              """,
              price: 4500.00,
              logista: Logista(
                cnpj: '70.044.310/0001-93',
                description: 'Super maquinas',
                phone: '(14) 991935302',
                user: User(
                  name: 'Ze Neto',
                ),
                marketName: 'Super maquinas',
              ),
              category: ClassificadoCategoria(
                description: 'Motores, Peças, Equipamentos e Maquinários',
              ),
              classificadoFotos: [
                ClassificadoFotos(
                  imgPath:
                      "https://res.cloudinary.com/dxz4ivhm8/image/upload/v1624119588/plant-care/marketplace_mock/WhatsApp_Image_2020-07-10_at_10.55.52.jpg",
                ),
                ClassificadoFotos(
                  imgPath:
                      "https://res.cloudinary.com/dxz4ivhm8/image/upload/v1624119589/plant-care/marketplace_mock/5.png",
                ),
                ClassificadoFotos(
                  imgPath:
                      "https://res.cloudinary.com/dxz4ivhm8/image/upload/v1624119588/plant-care/marketplace_mock/IMG-20200403-WA0043-1.jpg",
                ),
              ],
            ),
            Classificado(
              title: "Injetora De Temperos",
              description: """ 
              Injetora de temperos marca Metalbud , modelo MHM 21/84, em aço inox, para injeção de temperos em produtos carneos com e sem ossos.<br/>
Com 21 agulhas e extensão para até 24 agulhas.<br/>
Com 03 velocidades, velocidade variavel do cabeçote e ajuste de pressão.<br/>
Produto novo com garantia de 1 ano.<br/>
              """,
              price: 118000.00,
              logista: Logista(
                cnpj: '70.044.310/0001-93',
                description: 'Super maquinas',
                phone: '(14) 991935302',
                user: User(
                  name: 'Ze Neto',
                ),
                marketName: 'Super maquinas',
              ),
              category: ClassificadoCategoria(
                description: 'Motores, Peças, Equipamentos e Maquinários',
              ),
              classificadoFotos: [
                ClassificadoFotos(
                  imgPath:
                      "https://res.cloudinary.com/dxz4ivhm8/image/upload/v1624119589/plant-care/marketplace_mock/Capture.png",
                ),
              ],
            ),
            Classificado(
              title: "KIT ACESSORIOS PARA COMPRESSOR 5 PECAS",
              description: """ 
Modelo: Kit Compressor VULCAN
<br/>
Pistola de Pintura: Pistola para pintura por gravidade, com caneca Plástica de 600ml
<br/>
Pistola de Pulverização: Pistola de pulverização, bico de aço 20cm com reservatório de 900ml
<br/>
Calibrador com manômetro:
<br/>
Calibrador de pneus com manômetro
<br/>
Pistola de ar: Pistola de ar Mangueira: mangueira de ar espiral com 5 metros
<br/>
Peso do produto: 1,400Kg
<br/>
Peso com embalagem: 1,700Kg
<br/>
Dimensões do produto: [A x L x P] cm: 20X11X31
<br/>
Dimensões da Embalagem: [A x L x P] cm: 20X11X31
              """,
              price: 134,
              logista: Logista(
                cnpj: '70.044.310/0001-93',
                phone: '(14) 991935302',
                description: 'Super maquinas',
                user: User(
                  name: 'Ze Neto',
                ),
                marketName: 'Super maquinas',
              ),
              category: ClassificadoCategoria(
                description: 'Motores, Peças, Equipamentos e Maquinários',
              ),
              classificadoFotos: [
                ClassificadoFotos(
                  imgPath:
                      "https://res.cloudinary.com/dxz4ivhm8/image/upload/v1624119589/plant-care/marketplace_mock/op-o-4.jpg",
                ),
              ],
            ),
          ])
    ];

    final List<Tab> tabs = [
      "Produtos",
      "Nutrição Animal",
      "Proteção",
      "Nutrição de Cultivos",
      "Sementes",
      "Mudas",
      "Limpeza",
      "Desinfecção",
      "Acessórios",
      "Cuidados Gerais",
      "Motores",
      "Peças",
      "Equipamentos",
      "Maquinários"
    ]
        .map((e) => Tab(
              text: e,
            ))
        .toList();

    @protected
    @mustCallSuper
    void initState() {
      super.initState();
    }

    return DefaultTabController(
      length: tabs.length,
      // The Builder widget is used to have a different BuildContext to access
      // closest DefaultTabController.
      child: Builder(builder: (BuildContext context) {
        final TabController tabController = DefaultTabController.of(context)!;

        tabController.addListener(() {
          if (!tabController.indexIsChanging) {
            // Your code goes here.
            // To get index of current tab use tabController.index
          }
        });
        return Observer(builder: (_) {
          return Scaffold(
            drawer: new Drawer(
              child: ListView(
                // Important: Remove any padding from the ListView.
                padding: EdgeInsets.zero,
                children: <Widget>[
                  UserAccountsDrawerHeader(
                    decoration: BoxDecoration(
                      color: color_colorPrimary,
                    ),
                    accountName: Text("Willian Mattos"),
                    accountEmail: Text("willian_mattos@hotmail.com"),
                    currentAccountPicture: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Text(
                        "W",
                        style: TextStyle(fontSize: 40.0),
                      ),
                    ),
                  ),
                  ListTile(
                      leading: Icon(Icons.home),
                      title: Text("Inicio"),
                      onTap: () {
                        debugPrint('toquei no drawer');
                      }),
                  ListTile(
                      leading: Icon(Icons.search),
                      title: Text("Buscar"),
                      onTap: () {
                        debugPrint('toquei no drawer');
                      }),
                  ListTile(
                      leading: Icon(Icons.notifications),
                      title: Text("Notificacoes"),
                      onTap: () {
                        debugPrint('toquei no drawer');
                      }),
                  ListTile(
                      leading: Icon(Icons.favorite),
                      title: Text("Favoritos"),
                      onTap: () {
                        debugPrint('toquei no drawer');
                      }),
                  ListTile(
                      leading: Icon(Icons.person),
                      title: Text("Minha conta"),
                      onTap: () {
                        debugPrint('toquei no drawer');
                      }),
                  ListTile(
                      leading: Icon(Icons.money),
                      title: Text("Vender"),
                      onTap: () {
                        debugPrint('toquei no drawer');
                      }),
                ],
              ),
            ),
            appBar: AppBar(
              backgroundColor: color_colorPrimary,
              title: Text("Marketplace"),
              bottom: TabBar(
                isScrollable: true,
                controller: tabController,
                tabs: tabs,
              ),
              actions: [
                IconButton(
                    icon: SvgPicture.asset(
                      "images/buy_bulk.svg",
                      color: color_white,
                    ),
                    onPressed: () {})
              ],
            ),
            body: TabBarView(
              children: tabs.map((Tab tab) {
                return ListView(
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Container(
                              width: 300,
                              height: 160,
                              margin: EdgeInsets.only(
                                  left: 13, right: 13, bottom: 16, top: 16),
                              padding: EdgeInsets.only(
                                  left: 16, right: 16, bottom: 16, top: 16),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                color: color_white,
                                image: DecorationImage(
                                  image: NetworkImage(
                                      "https://cdn.awsli.com.br/400x400/1751/1751727/banner/4e8586365b.png"),
                                  fit: BoxFit.fitWidth,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0xff000000).withOpacity(0.15),
                                    spreadRadius: 1,
                                    blurRadius: 5,
                                    offset: Offset(
                                        0, 0), // changes position of shadow
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: 300,
                              height: 160,
                              margin: EdgeInsets.only(
                                  left: 13, right: 13, bottom: 16, top: 16),
                              padding: EdgeInsets.only(
                                  left: 16, right: 16, bottom: 16, top: 16),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                color: color_white,
                                image: DecorationImage(
                                  image: NetworkImage(
                                      "https://cdn.awsli.com.br/400x400/1751/1751727/banner/78628d4761.png"),
                                  fit: BoxFit.fitWidth,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0xff000000).withOpacity(0.15),
                                    spreadRadius: 1,
                                    blurRadius: 5,
                                    offset: Offset(
                                        0, 0), // changes position of shadow
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: 300,
                              height: 160,
                              margin: EdgeInsets.only(
                                  left: 13, right: 13, bottom: 16, top: 16),
                              padding: EdgeInsets.only(
                                  left: 16, right: 16, bottom: 16, top: 16),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                color: color_white,
                                image: DecorationImage(
                                  image: NetworkImage(
                                      "https://cdn.awsli.com.br/400x400/1751/1751727/banner/bdfdd8dd71.png"),
                                  fit: BoxFit.fitWidth,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0xff000000).withOpacity(0.15),
                                    spreadRadius: 1,
                                    blurRadius: 5,
                                    offset: Offset(
                                        0, 0), // changes position of shadow
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: 300,
                              height: 160,
                              margin: EdgeInsets.only(
                                  left: 13, right: 13, bottom: 16, top: 16),
                              padding: EdgeInsets.only(
                                  left: 16, right: 16, bottom: 16, top: 16),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                color: color_white,
                                image: DecorationImage(
                                  image: NetworkImage(
                                      "https://http2.mlstatic.com/D_NQ_NP_801971-MLA46483020534_062021-C.webp"),
                                  fit: BoxFit.fitWidth,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0xff000000).withOpacity(0.15),
                                    spreadRadius: 1,
                                    blurRadius: 5,
                                    offset: Offset(
                                        0, 0), // changes position of shadow
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: 300,
                              height: 160,
                              margin: EdgeInsets.only(
                                  left: 13, right: 13, bottom: 16, top: 16),
                              padding: EdgeInsets.only(
                                  left: 16, right: 16, bottom: 16, top: 16),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                color: color_white,
                                image: DecorationImage(
                                  image: NetworkImage(
                                      "https://http2.mlstatic.com/D_NQ_NP_663015-MLA46468719096_062021-B.webp"),
                                  fit: BoxFit.fitHeight,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0xff000000).withOpacity(0.15),
                                    spreadRadius: 1,
                                    blurRadius: 5,
                                    offset: Offset(
                                        0, 0), // changes position of shadow
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (classificados.isNotEmpty)
                        Column(
                            children: classificados
                                .map((classificadoSecao) => Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(16.0),
                                          child: text(
                                              classificadoSecao
                                                  .categoria.description,
                                              maxLine: 2,
                                              fontFamily: fontBold),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: GridView.count(
                                            crossAxisCount: 2,
                                            physics:
                                                NeverScrollableScrollPhysics(),
                                            shrinkWrap: true,
                                            children: List.generate(
                                              classificadoSecao
                                                  .classificados.length,
                                              (index) {
                                                return CardAnuncio(
                                                  classificado:
                                                      classificadoSecao
                                                          .classificados[index],
                                                );
                                              },
                                            ),
                                          ),
                                        )
                                      ],
                                    ))
                                .toList()),
                    ]);
              }).toList(),
            ),
          );
        });
      }),
    );
  }
}
