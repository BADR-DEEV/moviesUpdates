import 'package:flutter/material.dart';
import 'package:movieapp/ui/widgets/stateless/drawer/upper_userViewmodel.dart';

import '../../../views/edit_user/edit_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:stacked/stacked.dart';

import '/ui/views/startup/start_up_view_model.dart';
import '/ui/widgets/stateless/app_logo.dart';

class UpperUserInfo extends StatefulWidget {
  const UpperUserInfo({
    Key? key,
  }) : super(key: key);

  @override
  State<UpperUserInfo> createState() => _UpperUserInfoState();
}

class _UpperUserInfoState extends State<UpperUserInfo> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<UpperUserViewModel>.reactive(
        viewModelBuilder: () => UpperUserViewModel(),
        onModelReady: (model) async {
          await model.init(context);
        },
        builder: (context, model, child) => AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            height: 150,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(0),
            ),
            child: Center(
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Expanded(
                      flex: 2,
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(80),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(80),
                          child: Image.network(
                            'https://laiacc.com/wp-content/uploads/2019/03/blank-profile-picture-973460_1280-1030x1030.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: InkWell(
                      onTap: (() {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EditProfilePage()),
                        );
                      }),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 1),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  '${model.email ?? ""}',
                                  style: TextStyle(
                                    color: Color(0xFF2E2F5B),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.clip,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )));
  }
}
