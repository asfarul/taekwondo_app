part of 'providers.dart';

class NewsProvider extends ChangeNotifier {
  List<BeritaModel>? _berita;
  List<BeritaModel>? get berita => _berita;

  NewsServices _newsServices = NewsServices();

  void loadBerita(BuildContext context) async {
    var response = await _newsServices.getAllNews(context);
    if (response != null) {
      if (response['data'] != null) {
        _berita = [];
        print(response['data']['berita']);
        _berita = List<BeritaModel>.from(
            response['data']['berita'].map((x) => BeritaModel.fromJson(x)));
      }
    }
    notifyListeners();
  }
}
