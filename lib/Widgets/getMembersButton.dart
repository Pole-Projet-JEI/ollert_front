import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:ollert/Service/usersServices.dart';

class getMembersButton extends StatefulWidget {
  String name;

  void Function(List<int>) onConfirmed;
  getMembersButton({Key? key, this.name = "",required this.onConfirmed}) : super(key: key);

  @override
  State<getMembersButton> createState() => _getMembersButtonState();
}

class _getMembersButtonState extends State<getMembersButton> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<int> idMembers = [];
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 5, top: 20),
            child: Row(
              children: [
                Text(
                  widget.name,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const Padding(
                    padding: EdgeInsets.only(left: 10, right: 5, top: 18)),
                //Icon(Icons.mail),
              ],
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 5, right: 5, top: 5),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2.5),
          child: ElevatedButton(
              child: Text("Ajouter des membres".toUpperCase(),
                  style: const TextStyle(fontSize: 14)),
              style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(
                      Size(MediaQuery.of(context).size.width, 50)),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.white38),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                          side: const BorderSide(color: Colors.black87)))),
              onPressed: () async {
                List membres = await UsersServices().getMembers();

                for (int i = 0; i < membres.length; i++) {
                  membres[i]["checked"] = false;
                }
                showDialog(
                  context: context, // user must tap button!
                  builder: (BuildContext context) {
                    return AlertDialog(
                      contentPadding: const EdgeInsets.all(20),
                      actionsPadding: const EdgeInsets.only(bottom: 24),
                      shape: const RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(20.0))),
                      title: const Text(
                        "Membres",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      content: Container(
                        height: 300,
                        width: 300,
                        child: FutureBuilder(
                            future: UsersServices().getMembers(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState !=
                                  ConnectionState.done) {
                                return const SpinKitPouringHourGlassRefined(
                                  color: Colors.white60,
                                  size: 60.0,
                                );
                              }
                              if (snapshot.hasError) {
                                // return: show error widget
                              }
                              List members = (snapshot.data ?? []) as List;
                              for (int i = 0; i < members.length; i++) {
                                members[i]["checked"] = false;
                              }

                              return ListView.builder(
                                  itemCount: members.length,
                                  itemBuilder: (context, index) {
                                    var item = members[index];
                                    return StatefulBuilder(
                                      builder: (context, _setState) =>
                                          CheckboxListTile(
                                        title: Text(item["username"]),
                                        value: item["checked"],
                                        onChanged: (newValue) {
                                          _setState(() {
                                            item["checked"] = !item["checked"];
                                            if (item["checked"] == true) {
                                              idMembers.add(item["id"]);
                                            } else {
                                              idMembers.remove(item["id"]);
                                            }
                                          });
                                        },
                                      ),
                                    );
                                  });
                            }),
                      ),
                      actions: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height * 0.05,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                gradient: const LinearGradient(
                                  colors: [
                                    Color(0xff219138),
                                    Color(0xff1fc441)
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                              ),
                              child: FlatButton(
                                minWidth:
                                    MediaQuery.of(context).size.width * 0.33,
                                onPressed: () {
                                  widget.onConfirmed(idMembers);
                                  Navigator.of(context).pop();
                                },
                                textColor: Colors.black12,
                                child: const Center(
                                  child: Text(
                                    "Confirmer",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14.0,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    );
                  },
                );
              }),
        ),
      ],
    );
  }
}
