import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:rutter/data/models/user_model.dart';

class ProfileWidget extends StatelessWidget {
  UserModel user;
  ProfileWidget({Key? key, required this.user}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    initializeDateFormatting();
    DateFormat dateFormat = DateFormat.yMMMMd('en');
    var userAvatar = user.avatar ?? 'https://sun9-54.userapi.com/impg/Bbl_9qEgeAuTBcWQgM1cU_IlEOlrXxeuGc_Glw/cbqS5R2bdEw.jpg?size=1620x2160&quality=96&sign=9a455b5a5426ecb244323b76ff7e96aa&type=album';
    var userFirstName = user.firstName ?? '';
    var userLastName = user.lastName ?? user.username!;
    var userLastTimeVisit = user.lastTimeVisit ?? "last_time_visit";
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
              fontSize: 30,
              fontFamily: 'General Sans'
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 5,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(width: double.infinity, height: 100,),
            CircleAvatar(
              // minRadius: 60,
              radius: 80,
              backgroundImage: NetworkImage(userAvatar),),
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
                        Text("Last time visit: " + dateFormat.format(DateTime.parse(userLastTimeVisit)),
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
