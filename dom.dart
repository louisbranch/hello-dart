library dom;

import 'dart:html';
import 'dart:json';

void main() {
  String user = 'luizbranco';
  query('h1').text = 'Hello, $user!';
  fetchUser(user);
}

void fetchUser(String user) {
  new HttpRequest.get('https://api.github.com/users/$user', onSuccess);
}

void onSuccess(HttpRequest req) {
  Map user = JSON.parse(req.responseText);
  displayUser(user);
}

void displayUser(Map user) {
  List<Element> orig_list = query('dl');
  List<Element> list = orig_list.clone(false);
  user.forEach((k,v) {
    Element dt = new Element.html('<dt></dt>');
    Element dd = new Element.html('<dd></dd>');
    dt.text = k;
    dd.text = v.toString();
    list.nodes.add(dt);
    list.nodes.add(dd);
  });
  orig_list.replaceWith(list);
}


