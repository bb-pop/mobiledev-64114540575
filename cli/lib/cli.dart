import 'package:pocketbase/pocketbase.dart';
import 'package:requests/requests.dart';

void main() async {
  const url = "https://randomuser.me/api/?results=20";
  var r = await Requests.get(url);
  var memberData = r.json()['results'];
  final pb = PocketBase('http://127.0.0.1:8090/');
  final admin = 'thanat.ti.64@ubu.ac.th';
  final password = 'Sxur878888';
  // var authData= await pb.admins.authWithPassword(admin,password);

  final e = 'anna@ubu.ac.th';
  final p = 'anna878888';
  var authData = await pb.collection('users').authWithPassword(e,p);
  print('isvalid: ${pb.authStore.isValid}');
  print('token: ${pb.authStore.token}');
  print('user.id: ${pb.authStore.model.id}');

  for (int i = 0; i < 20; i++) {
    var data = memberData[i];
    pb.collection('members').create(body: {
      'username': data['login']['username'],
      'email': data['email'],
      'picture': data['picture']['large'],
      'first': data['name']['last'],
    });
  }
}
