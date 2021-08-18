import 'package:wizard/app/ui/utils/helpers.dart';

import 'login_to_admin.dart';

class MainDrawer extends GetView<AppController> {
  const MainDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
            // color: Colors.grey[800],
            ),
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
                accountName: Text('#Seu Nome aqui'),
                accountEmail: Text('#seu Email aqui')),
            ListTile(
              isThreeLine: true,
              leading: Icon(Icons.security, color: Colors.redAccent),
              onTap: () {
                Get.defaultDialog(
                    title: 'Membro',
                    backgroundColor: Colors.grey[300],
                    content: AdminLogin(),
                    cancel: TextButton(
                      child: Text(
                        'cancelar',
                        style: TextStyle(color: Colors.red),
                      ),
                      onPressed: Get.back,
                    ),
                    confirm: TextButton(
                      onPressed: () {
                        controller.admin_login();
                      },
                      child: Text('Entrar'),
                    ));

                // Get.toNamed(Routes.ADMIN);
              },
              title:
                  Text('Administration', style: TextStyle(color: Colors.white)),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Faca uploads e veja os files que fizeste uploads',
                    style: TextStyle(
                      color: Colors.white30,
                    ),
                  ),
                  Wrap(
                    spacing: 5.0,
                    children: [
                      Icon(
                        Icons.admin_panel_settings,
                        color: Colors.amber,
                      ),
                      Text(
                        'somente os permitidos',
                        style: TextStyle(
                          color: Colors.amber,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            ListTile(
              isThreeLine: true,
              leading: Icon(Icons.logout_rounded, color: Colors.white),
              title: Text(
                'Logout',
                style: TextStyle(color: Colors.greenAccent),
              ),
              subtitle: Text(
                'sair do app, removendo sua subscricao',
                style: TextStyle(
                  color: Colors.white30,
                ),
              ),
            ),
            ListTile(
              isThreeLine: true,
              leading: Icon(Icons.info, color: Colors.green),
              title: Text(
                'The Programmer',
                style: TextStyle(color: Colors.greenAccent),
              ),
              subtitle: Text(
                'acerca do programador deste app? voce quer encomendar seu app ? veja o perfil do gajo #saidino',
                style: TextStyle(
                  color: Colors.amberAccent.withOpacity(0.7),
                ),
              ),
            ),
            ListTile(
                isThreeLine: true,
                leading: Icon(Icons.copyright, color: Colors.green),
                title: Text(
                  'Envie message',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                subtitle: Text(
                  'Alguma critica  ou sei la uma recomendacoa, messagem pra nos?',
                  style: TextStyle(
                    color: Colors.amberAccent.withOpacity(0.7),
                  ),
                ),
                onTap: () {
                  Get.defaultDialog(
                    barrierDismissible: false,
                    title: 'Envie sua critica',
                    content: Container(
                      // decoration: BoxDecoration(color: Colors.green),
                      child: ListTile(
                        isThreeLine: true,
                        title: SizedBox(
                          child: TextField(
                            maxLines: 5,
                            decoration: InputDecoration(
                                // filled: true,
                                labelText: 'Escreva a tua critica'),
                            // style: TextStyle(color: Colors.greenAccent),
                          ),
                        ),
                        subtitle: Text(' . .  . '),
                      ),
                    ),
                    confirm: TextButton(
                      // color: Colors.blueAccent,
                      onPressed: () {
                        Get.back();
                        Get.snackbar('Enviado',
                            'Obrigado pela sua feedback consulte nos comentarios a resposta da sua critica ! ',
                            backgroundColor: Colors.greenAccent);
                      },
                      child: Text('Enviar critica'),
                    ),
                    cancel: TextButton(
                      // color: Colors.blueAccent,
                      onPressed: () {
                        Get.back();
                      },
                      child:
                          Text('cancelar', style: TextStyle(color: Colors.red)),
                    ),
                  );
                }),
            SizedBox(height: 70),
            ListTile(
              isThreeLine: true,
              leading: Icon(Icons.info, color: Colors.green),
              title: Text(
                'Wiizard App version (0.1)',
                style: TextStyle(color: Colors.greenAccent),
              ),
              subtitle: Text(
                'O app wizzard voce foi criado Em cariaco ,cidade de Pemba em Cabo Delgado, com este app voce pode escutar baixar as musicas do rapper wiizard , no puto voltado o rap a mais de xxanos, voce vai curtir ',
                style: TextStyle(
                  color: Colors.white30,
                ),
              ),
            ),
            Obx(
              () => SwitchListTile(
                value: controller.is_dark,
                onChanged: (e) {
                  controller.changeThme();
                },

                isThreeLine: true,
                // leading: Icon(Icons.info, color: Colors.green),
                title: Text(
                  'Troque o Tema',
                  style: TextStyle(color: Colors.greenAccent),
                ),
                subtitle: Text(
                  'Troque o tema para ${controller.is_dark ? 'light' : 'dark'}',
                  style: TextStyle(
                    color: Colors.white30,
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                controller.show_simpleNotify();
              },
              child: Text('open notification'),
            ),
          ],
        ),
      ),
    );
  }
}
