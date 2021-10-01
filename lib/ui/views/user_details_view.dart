/** Cacaron para crear vistas*/

import 'package:admin_dashboard/models/usuario_model.dart';
import 'package:admin_dashboard/providers/users_provider.dart';
import 'package:admin_dashboard/ui/cards/white_card.dart';
import 'package:admin_dashboard/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserDetailsView extends StatefulWidget {
  final String uid;

  const UserDetailsView({Key? key, required this.uid}) : super(key: key);

  @override
  _UserDetailsViewState createState() => _UserDetailsViewState();
}

class _UserDetailsViewState extends State<UserDetailsView> {
  Usuario? user;
  @override
  void initState() {
    super.initState();
    final userProvider = Provider.of<UsersProvider>(context, listen: false);
    userProvider.getUsersById(widget.uid).then((userDB) => setState(() {
          this.user = userDB;
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          Text('User Detail View', style: CustomLabels.h1),
          SizedBox(height: 10),
          // si no tiene usuario
          if (user == null)
            WhitrCard(
              child: Container(
                alignment: Alignment.center,
                height: 300,
                child: CircularProgressIndicator(),
              ),
            ),
          WhitrCard(
            title: 'User Detail',
            child: Text('${user?.nombre}'),
          ),
        ],
      ),
    );
  }
}
