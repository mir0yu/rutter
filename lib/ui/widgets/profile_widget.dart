import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:rutter/constants/paths.dart';
import 'package:rutter/constants/storage.dart';
import 'package:rutter/data/models/user_model.dart';

class ProfileWidget extends StatelessWidget {
  UserModel user;
  bool me;
  ProfileWidget({Key? key, required this.user, required this.me}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    initializeDateFormatting();
    DateFormat dateFormat = DateFormat.yMMMMd('en');
    var userAvatar = user.avatar ?? 'https://socialistmodernism.com/wp-content/uploads/2017/07/placeholder-image.png?w=640';
    var userFirstName = user.firstName ?? '';
    var userLastName = user.lastName ?? user.username!;
    var userLastTimeVisit = user.lastTimeVisit ?? "undefined";
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,),
          onPressed: () => Navigator.pop(context),
        ),
        // bottomOpacity: 0.5,
        centerTitle: true,
        title: NeumorphicText(
          "Profile",
          style: const NeumorphicStyle(
            depth: 3,
            color: Colors.black,
          ),
          textStyle: NeumorphicTextStyle(
              fontSize: 25,
              fontFamily: 'General Sans'
          ),
        ), 
        actions: [
          me ? NeumorphicButton(
              child: NeumorphicIcon(
                Icons.exit_to_app_outlined,
                size: 40,
                style: const NeumorphicStyle(color: Colors.black),
              ),
              style: const NeumorphicStyle(
                disableDepth: true,
                color: Colors.transparent,
              ),
              onPressed: () async  {
                await storage.deleteAll();
                Navigator.pushNamedAndRemoveUntil(context, LOGIN, (r) => false);
              }) : const Text(''),
        ],
        backgroundColor: Colors.white,
        elevation: 5,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(width: double.infinity, height: 100,),
            CircleAvatar(
              minRadius: 60,
              maxRadius: 100,
              // radius: 80,
              backgroundColor: Colors.white,
              backgroundImage: NetworkImage(userAvatar),
            ),
            Text(user.username!,
              style: const TextStyle(
                fontSize: 30,
              ),
            ),
            const SizedBox(width: double.infinity, height: 70,),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Neumorphic(
                  style: NeumorphicStyle(
                    shape: NeumorphicShape.convex,
                    boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
                    depth: 10,
                    surfaceIntensity: 0.1,
                    lightSource: LightSource.topRight,
                    color: Colors.white,
                    intensity: 1,
                  ),
                  // elevation: 4.0,
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Name: " + userFirstName + " " + userLastName,
                        style: const TextStyle(
                          fontSize: 22,
                        ),),
                        Text("Joined us: " + dateFormat.format(DateTime.parse(userLastTimeVisit)),
                          style: const TextStyle(
                            fontSize: 22,
                          ),)
                      ],
                    ),
                  )
              ),
            )
          ],
        ),
      ),
    );
  }
}
