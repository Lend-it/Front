import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:front/routes/app_routes.dart';
import 'package:front/theme/colors.dart';
import 'package:front/widgets/button.dart';
import 'package:front/widgets/input.dart';

Widget editProfile({
  @required TextEditingController nameController,
  @required TextEditingController emailController,
  @required TextEditingController whatsappController,
  @required TextEditingController passwordController,
  @required TextEditingController newPasswordController,
  @required BuildContext context,
}) {
  return Column(
    children: [
      GestureDetector(
        onTap: () {
          Navigator.pushNamed(
            context,
            AppRoutes.GEOLOCATION_PAGE,
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
              onPressedHandler: () {},
            ),
          ],
        ),
      )
    ],
  );
}

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isEdit = false;

  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _whatsappController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _newPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                  Container(
                    width: double.infinity,
                    height: 350,
                    child: Image(
                      fit: BoxFit.fitWidth,
                      image: NetworkImage(
                        'https://avatars.githubusercontent.com/u/42722634?v=4',
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: -22,
                    right: 30,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isEdit = !isEdit;
                        });
                      },
                      child: Container(
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
                      )
                    : null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
