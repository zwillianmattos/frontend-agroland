import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:plant_care/app/core/consts/colors.dart';
import 'package:plant_care/app/core/models/account.dart';
import 'package:plant_care/app/core/utils/user_preferences_store.dart';
import 'package:plant_care/app/core/widgets/widgets.dart';
import 'package:plant_care/app/modules/account/models/user.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final User account = Modular.get<UserPreferencesStore>().getUser!;

  bool silenciarNotificacoes = false;

  bool disponivelOffiline = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: BackButton(),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(CupertinoIcons.moon_stars),
            onPressed: () {},
          )
        ],
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          ProfileWidget(
              imagePath: account.imgProfile ??
                  "https://freepikpsd.com/media/2019/10/default-profile-image-png-1-Transparent-Images.png",
              onClicked: () async {}),
          SizedBox(height: 24),
          buildName(account),
          SizedBox(height: 24),
          NumberWidget(),
          SizedBox(height: 24),

          Container(
            margin: EdgeInsets.symmetric(horizontal: 24),
            decoration: BoxDecoration(
              color: color_white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(8.0),
                bottomRight: const Radius.circular(8.0),
                topLeft: Radius.circular(8.0),
                topRight: const Radius.circular(8.0),
              ),
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: color_ShadowColor,
                    blurRadius: 20.0,
                    offset: Offset(0.0, 0.9)),
              ],
            ),
            child: Column(children: [
              ListTile(
                contentPadding: EdgeInsets.all(5.0),
                title: Container(
                    padding: EdgeInsets.symmetric(horizontal: 32),
                    child: text("Silenciar notificacoes", fontSize: 14.0)),
                trailing: Switch(
                  value: silenciarNotificacoes,
                  onChanged: (value) {
                    setState(() {
                      silenciarNotificacoes = value;
                    });
                  },
                ),
              ),
              ListTile(
                contentPadding: EdgeInsets.all(5.0),
                title: Container(
                    padding: EdgeInsets.symmetric(horizontal: 32),
                    child: text("Disponivel offline", fontSize: 14.0)),
                trailing: Switch(
                  value: disponivelOffiline,
                  onChanged: (value) {
                    setState(() {
                      disponivelOffiline = value;
                    });
                  },
                ),
              ),
              ListTile(
                contentPadding: EdgeInsets.all(5.0),
                title: Container(
                    padding: EdgeInsets.symmetric(horizontal: 32),
                    child: text("Limpar cache", fontSize: 14.0)),
                onTap: () {},
              ),
              ListTile(
                contentPadding: EdgeInsets.all(5.0),
                title: Container(
                    padding: EdgeInsets.symmetric(horizontal: 32),
                    child: text("Sair", fontSize: 14.0)),
                onTap: () async {
                  await Modular.get<UserPreferencesStore>().logOff();
                  Modular.to.pop();
                },
              ),
            ]),
          ),

          SizedBox(height: 24),
          // buildAbout(account),
          // SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget buildAbout(User user) => Container(
        padding: EdgeInsets.symmetric(horizontal: 48),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          text("Sobre", fontSize: 24.0),
          SizedBox(height: 16),
          text("", maxLine: 120, fontSize: 12.0, justifyText: true)
        ]),
      );

  Widget buildName(User user) => Column(
        children: [
          text(user.name!),
          SizedBox(height: 4),
          text(user.email!, fontSize: 14.0),
        ],
      );
}

class ProfileWidget extends StatelessWidget {
  final String imagePath;
  final VoidCallback onClicked;

  const ProfileWidget(
      {Key? key, required this.imagePath, required this.onClicked})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(children: [
        buildImage(),
        Positioned(
          child: buildEditIcon(),
          bottom: 0,
          right: 4,
        ),
      ]),
    );
  }

  Widget buildCircle({
    required Widget child,
    required double all,
    required Color color,
  }) =>
      ClipOval(
        child: Container(
          color: color,
          child: child,
          padding: EdgeInsets.all(all),
        ),
      );

  Widget buildEditIcon() => buildCircle(
        color: Colors.white,
        all: 3,
        child: buildCircle(
          color: color_colorPrimary,
          all: 8,
          child: Icon(
            Icons.edit,
            color: Colors.white,
            size: 20,
          ),
        ),
      );

  Widget buildImage() {
    final image = NetworkImage(imagePath);

    return ClipOval(
      child: Material(
        color: Colors.transparent,
        child: Ink.image(
          image: image,
          fit: BoxFit.cover,
          width: 128,
          height: 128,
          child: InkWell(
            onTap: onClicked,
          ),
        ),
      ),
    );
  }
}

class NumberWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => IntrinsicHeight(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 24),
          padding: EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            color: color_white,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(8.0),
              bottomRight: const Radius.circular(8.0),
              topLeft: Radius.circular(8.0),
              topRight: const Radius.circular(8.0),
            ),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: color_ShadowColor,
                  blurRadius: 20.0,
                  offset: Offset(0.0, 0.9)),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              buildButton(context, '0', 'Perguntas'),
              buildDivider(),
              buildButton(context, '0', 'Comentarios'),
              buildDivider(),
              buildButton(context, '0', 'Avaliacoes')
            ],
          ),
        ),
      );

  Widget buildButton(BuildContext context, String value, String textContent) =>
      MaterialButton(
        padding: EdgeInsets.symmetric(vertical: 4),
        onPressed: () {},
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            text(value, fontSize: 14.0),
            SizedBox(height: 2),
            text(textContent, fontSize: 12.0),
          ],
        ),
      );
  Widget buildDivider() => Container(
        child: VerticalDivider(),
        height: 24,
      );
}
