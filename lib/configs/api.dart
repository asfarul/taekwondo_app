class Api {
  static final base = 'http://10.10.50.99:8000/';
  // static final base = 'http://192.168.18.90:8000/';
  // static final base = 'http://localhost:8000/';

  static final version = 'api/';

  // FOTO URL
  static final userBaseFoto = base + 'images/users';
  static final clubBaseFoto = base + 'images/clubs';
  static final newsBaseFoto = base + 'images/posts';

  static final login = base + version + "login";
  static final register = base + version + "register";
  static final club = base + version + 'club';
  static final user = base + version + 'user';
  static final settings = base + version + 'user/settings';
  static final berita = base + version + 'berita';
}
