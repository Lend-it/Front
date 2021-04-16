import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:front/controller/user.controller.dart';
import 'package:front/dtos/locationPageDTO.dart';
import 'package:front/model/lend.model.dart';
import 'package:front/model/session.model.dart';
import 'package:front/model/user.model.dart';
import 'package:front/routes/app_routes.dart';
import 'package:front/theme/colors.dart';
import 'package:front/theme/custom_icons.dart';
import 'package:front/widgets/button.dart';
import 'package:front/widgets/input.dart';
import 'package:provider/provider.dart';

Widget infoUser({
  @required String value,
  @required String text,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        value,
        style: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.w500,
          color: darkColor,
        ),
      ),
      Text(
        text,
        style: TextStyle(
          fontSize: 16,
          color: darkColor,
        ),
      ),
    ],
  );
}

Widget lendInfo({
  @required String username,
  @required String product,
  String rateDescription,
  int rate,
  @required bool isLender,
}) {
  final stars = List<Icon>.generate(
    rate == null ? 0 : rate,
    (i) => Icon(
      Icons.star_outlined,
      color: secondaryColor,
      size: 20,
    ),
  ).toList();

  return Column(
    children: [
      Container(
        padding: EdgeInsets.only(
          bottom: 15,
          top: 15,
          left: 23,
          right: 23,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                right: 16,
              ),
              child: Icon(
                CustomIcons.heart,
                size: 30,
                color: grayColor,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  isLender == true
                      ? 'Emprestou para $username'
                      : 'Pegou emprestado de $username',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                Text(
                  product,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                rate == null
                    ? null
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          rateDescription == '' || rateDescription == null
                              ? null
                              : Container(
                                  width: 280,
                                  padding: EdgeInsets.only(
                                    bottom: 5,
                                  ),
                                  child: Text(
                                    rateDescription,
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                    textAlign: TextAlign.justify,
                                  ),
                                ),
                          Row(
                            children: [...stars],
                          ),
                        ].where((element) => element != null).toList(),
                      ),
              ].where((element) => element != null).toList(),
            ),
          ],
        ),
      ),
      Divider(
        thickness: 1,
        color: whiteDarkColor,
      ),
    ],
  );
}

Widget editProfile({
  @required TextEditingController nameController,
  @required TextEditingController emailController,
  @required TextEditingController whatsappController,
  @required TextEditingController passwordController,
  @required TextEditingController newPasswordController,
  @required BuildContext context,
  @required Function onPressed,
}) {
  return Column(
    children: [
      GestureDetector(
        onTap: () {
          final LocationPageDTO data = LocationPageDTO(
            route: AppRoutes.PROFILE_PAGE,
            useremail: emailController.text,
          );

          Navigator.pushNamed(
            context,
            AppRoutes.GEOLOCATION_PAGE,
            arguments: data,
          );
        },
        child: Container(
          padding: EdgeInsets.only(
            bottom: 5,
            top: 12,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.location_pin,
                color: secondaryColor,
                size: 18,
              ),
              Text(
                'Editar localização',
                style: Theme.of(context).textTheme.subtitle2.copyWith(
                      color: secondaryColor,
                    ),
              ),
            ],
          ),
        ),
      ),
      Divider(
        thickness: 1,
        color: whiteDarkColor,
      ),
      Container(
        padding: EdgeInsets.only(
          top: 15,
          left: 20,
          right: 20,
          bottom: 100,
        ),
        child: Column(
          children: [
            Input(
              type: TextInputType.name,
              controller: nameController,
              placeholder: 'Nome',
              prefix: Icons.person_outlined,
            ),
            Input(
              type: TextInputType.emailAddress,
              controller: emailController,
              placeholder: 'E-mail',
              prefix: Icons.mail_outline,
            ),
            Input(
              type: TextInputType.phone,
              controller: whatsappController,
              placeholder: 'WhatsApp',
              prefix: Icons.phone,
            ),
            Input(
              type: TextInputType.visiblePassword,
              controller: passwordController,
              placeholder: 'Senha atual',
              prefix: Icons.lock_outline,
              isPassword: true,
            ),
            Input(
              type: TextInputType.visiblePassword,
              controller: newPasswordController,
              placeholder: 'Nova Senha',
              prefix: Icons.lock_outline,
              isPassword: true,
            ),
            Button(
              title: 'Salvar',
              onPressedHandler: onPressed,
            ),
          ],
        ),
      )
    ],
  );
}

Widget showProfile({
  @required UserModel user,
}) {
  UserController _userController = new UserController();

  return FutureBuilder(
    future: _userController.getUserLends(
      useremail: user.email,
    ),
    builder: (BuildContext context, AsyncSnapshot snapshot) {
      if (snapshot.hasData) {
        List<LendModel> userRequests = snapshot.data["userRequests"];
        List<LendModel> userLends = snapshot.data["userLends"];

        double rateSum = 0;
        int reportCount = 0;
        List<LendModel> allLends = new List.from(userRequests)
          ..addAll((userLends));
        for (int i = 0; i < userRequests.length; i++) {
          rateSum += userRequests[i].rate.stars;

          if (userRequests[i].rate.report == true) {
            reportCount++;
          }
        }
        if (rateSum != 0) {
          rateSum /= userRequests.length;
        }

        return Column(
          children: [
            Container(
              padding: EdgeInsets.only(
                bottom: 20,
                top: 20,
                left: 23,
                right: 23,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        user.name,
                        style: TextStyle(
                            fontSize: 28, fontWeight: FontWeight.w700),
                      ),
                      Row(
                        children: <Widget>[
                          Icon(Icons.star, color: secondaryLightColor),
                          Text(
                            rateSum.toString(),
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                              color: grayColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      infoUser(
                        text: 'Pedidos',
                        value: userRequests.length.toString(),
                      ),
                      infoUser(
                        text: 'Empréstimos',
                        value: userLends.length.toString(),
                      ),
                      infoUser(
                        text: 'Denúncias',
                        value: reportCount.toString(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 1,
              color: whiteDarkColor,
            ),
            Column(
              children: allLends
                  .map(
                    (lend) => lendInfo(
                      username: lend.requester.name,
                      product: lend.title,
                      rate: lend.rate.stars,
                      rateDescription: lend.rate.review,
                      isLender: user.email == lend.lender.email ? true : false,
                    ),
                  )
                  .toList(),
            ),
          ],
        );
      } else if (snapshot.hasError) {
        // TODO: Fazer uma tela de Retry bonita(lembrar da retry policy na gateway)
        return Center(
          child: Text(snapshot.error),
        );
      }
      // TODO: Shimmer effect com LendCard dummy
      return Center(child: CircularProgressIndicator());
    },
  );
}

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isEdit = false;

  TextEditingController _nameController;
  TextEditingController _emailController;
  TextEditingController _whatsappController;
  TextEditingController _passwordController;
  TextEditingController _newPasswordController;

  UserController _userController = new UserController();
  UserModel _sessionUser;

  List<LendModel> _userRequests;
  List<LendModel> _userLends;

  Future<void> handleUpdateProfile() async {
    await _userController.updateUser(
      context: context,
      name: _nameController.text,
      useremail: _emailController.text,
      whatsappnumber: _whatsappController.text,
    );
  }

  @override
  void initState() {
    super.initState();
    final session = Provider.of<SessionModel>(context, listen: false);
    _sessionUser = session.user;

    _emailController = TextEditingController(text: _sessionUser.email);
    _nameController = TextEditingController(text: _sessionUser.name);
    _whatsappController = TextEditingController(text: _sessionUser.whatsapp);
    _passwordController = TextEditingController();
    _newPasswordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    Duration animationDuration = Duration(milliseconds: 300);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 350,
                        child: Image(
                          color: isEdit ? Color.fromRGBO(0, 0, 0, 0.5) : null,
                          colorBlendMode: BlendMode.darken,
                          fit: BoxFit.fitWidth,
                          image: NetworkImage(
                            'https://avatars.githubusercontent.com/u/42722634?v=4',
                          ),
                        ),
                      ),
                      Positioned.fill(
                        child: Align(
                          alignment: Alignment.center,
                          child: isEdit
                              ? InkWell(
                                  onTap: () {
                                    setState(() {
                                      isEdit = !isEdit;
                                    });
                                  },
                                  child: AnimatedContainer(
                                    duration: animationDuration,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      color: secondaryTransparentColor,
                                    ),
                                    height: 90,
                                    width: 90,
                                    child: Icon(
                                      Icons.image_search_rounded,
                                      color: secondaryColor,
                                      size: 45,
                                    ),
                                  ),
                                )
                              : null,
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: -22,
                    right: 30,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          isEdit = !isEdit;
                        });
                      },
                      child: AnimatedContainer(
                        duration: animationDuration,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: isEdit ? dangerColor : secondaryColor,
                        ),
                        height: 54,
                        width: 54,
                        child: Icon(
                          isEdit ? Icons.close : Icons.edit_outlined,
                          color: lightColor,
                          size: 30,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Container(
                child: isEdit
                    ? editProfile(
                        nameController: _nameController,
                        emailController: _emailController,
                        passwordController: _passwordController,
                        newPasswordController: _newPasswordController,
                        whatsappController: _whatsappController,
                        context: context,
                        onPressed: handleUpdateProfile,
                      )
                    : showProfile(
                        user: _sessionUser,
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
