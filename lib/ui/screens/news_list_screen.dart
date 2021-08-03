part of 'screens.dart';

class NewsListScreen extends StatelessWidget {
  const NewsListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GeneralScreen(
      title: 'Berita',
      subtitle: 'Berita Seputar Taekwondo',
      onBackButtonPressed: () {
        Get.back();
      },
      child: SingleChildScrollView(
        child: Container(
            margin: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Text(
                    'Berita Paling Baru',
                    style: largeDark1.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Consumer<NewsProvider>(builder: (context, prov, child) {
                  if (prov.berita == null) {
                    prov.loadBerita(context);
                  }
                  if (prov.berita != null) {
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: prov.berita?.length,
                      itemBuilder: (context, index) {
                        if (index == 0) return firstItemCard(size, index);
                        return itemCard(index);
                      },
                    );
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }),
              ],
            )),
      ),
    );
  }

  Widget itemCard(int index) {
    return GestureDetector(
      onTap: () {
        // Get.to(() => NewsDetailScreen());
      },
      child: Container(
          margin: EdgeInsets.symmetric(
            vertical: 10,
          ),
          padding: EdgeInsets.symmetric(vertical: 3),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Judul Berita Lorem Ipsum Dolor Sit Amet',
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: normalDark2.copyWith(color: Colors.blueGrey),
                    ),
                    Text(
                      'Senin, 26 Februari 2021',
                      style: smallDark1,
                    )
                  ],
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: Image.network(
                  'https://randomuser.me/api/portraits/women/72.jpg',
                  height: 80.0,
                  width: 80.0,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          )),
    );
  }

  Widget firstItemCard(Size size, int index) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      child: Stack(
        children: [
          Container(
            width: size.width * 0.95,
            height: 230,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                    image: NetworkImage('https://picsum.photos/200/300'),
                    fit: BoxFit.cover)),
          ),
          Container(
            width: size.width * 0.95,
            height: 230,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.black.withOpacity(0.3),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [primaryColor, midColor, secondaryColor]),
                  color: midColor.withOpacity(0.2),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Ini adalah berita pertama lur',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: normalLight1,
                    ),
                    Text(
                      'Senin, 28 Februari 2021',
                      style: smallLight1,
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
