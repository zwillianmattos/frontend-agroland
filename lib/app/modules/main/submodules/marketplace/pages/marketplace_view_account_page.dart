import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:plant_care/app/core/consts/colors.dart';
import 'package:plant_care/app/core/consts/texts.dart';
import 'package:plant_care/app/modules/account/models/user.dart';
import 'package:plant_care/app/widgets/widgets.dart';

import '../models.dart';
import '../widgets.dart';

class MarketplaceViewAccountPage extends StatefulWidget {
  final Logista logista;

  const MarketplaceViewAccountPage({Key? key, required this.logista})
      : super(key: key);

  @override
  _MarketplaceViewAccountPageState createState() =>
      _MarketplaceViewAccountPageState();
}

class _MarketplaceViewAccountPageState
    extends State<MarketplaceViewAccountPage> {
  final List<MenuCategoriaClassificados> classificados = [
    MenuCategoriaClassificados(
      categoria: ClassificadoCategoria(description: 'Todos os Produtos'),
      classificados: [
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
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color_colorPrimary,
          // title: Text(widget.logista.marketName),
          ),
      body: ListView(
        children: [
          Container(
            height: 150,
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: color_colorPrimary,
              image: DecorationImage(
                image: NetworkImage(""),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          if (widget.logista.imgLogo != null)
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.network(
                                widget.logista.imgLogo!,
                                width: 60,
                              ),
                            ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                text("${widget.logista.marketName}",
                                    fontSize: textSizeNormal),
                                text("${widget.logista.phone}",
                                    fontSize: textSizeSmall),
                                text("${widget.logista.user.name}",
                                    fontSize: textSizeSmall),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: FlatButton(
                      onPressed: () {},
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 8.0, bottom: 8.0),
                            child: Icon(
                              FontAwesome.whatsapp,
                              color: color_white,
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 8.0, bottom: 8.0),
                            child: text("Whatsapp",
                                textColor: color_white,
                                fontSize: textSizeSMedium),
                          ),
                        ],
                      ),
                      color: color_colorPrimary,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: FlatButton(
                      onPressed: () {},
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 8.0, bottom: 8.0),
                            child: Icon(
                              FontAwesome.phone,
                              color: color_white,
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 8.0, bottom: 8.0),
                            child: text("Ligar",
                                textColor: color_white,
                                fontSize: textSizeSMedium),
                          ),
                        ],
                      ),
                      color: color_color_twitter,
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (classificados.isNotEmpty)
            Column(
                children: classificados
                    .map((classificadoSecao) => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child:
                                  text(classificadoSecao.categoria.description),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GridView.count(
                                crossAxisCount: 2,
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                children: List.generate(
                                  classificadoSecao.classificados.length,
                                  (index) {
                                    return CardAnuncio(
                                      classificado: classificadoSecao
                                          .classificados[index],
                                    );
                                  },
                                ),
                              ),
                            )
                          ],
                        ))
                    .toList()),
        ],
      ),
    );
  }
}
