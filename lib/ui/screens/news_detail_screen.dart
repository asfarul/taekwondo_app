part of 'screens.dart';

class NewsDetailScreen extends StatelessWidget {
  final BeritaModel berita;
  const NewsDetailScreen(
    this.berita, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            color: bgColor,
          ),
          Stack(
            children: [
              Container(
                  width: double.infinity,
                  height: size.height * 0.4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                  ),
                  child: FancyShimmerImage(
                    imageUrl: Api.newsBaseFoto + '/' + berita.thumbnail!,
                    boxFit: BoxFit.cover,
                  )),
              SafeArea(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(40)),
                  margin: EdgeInsets.all(defaultMargin),
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ),
            ],
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.65,
            minChildSize: 0.65,
            maxChildSize: 0.86,
            builder: (context, scrollController) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                ),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      width: 50,
                      height: 5,
                      decoration: BoxDecoration(
                        color: grey,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        controller: scrollController,
                        physics: BouncingScrollPhysics(),
                        child: Container(
                          padding: EdgeInsets.all(defaultMargin),
                          margin: EdgeInsets.only(bottom: 30),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.access_time,
                                    color: grey,
                                    size: 20,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    formatCompleteDateToString(
                                        berita.createdAt!)!,
                                    style: normalGrey1,
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              SelectableText(
                                berita.judul ?? '',
                                style: largeDark2,
                              ),
                              SizedBox(height: 10),
                              //LabelInput(_selectLabel),
                              Padding(
                                padding: EdgeInsets.only(bottom: 30),
                                child: Html(
                                  data: berita.konten,
                                ),
                              ),
                              Wrap(spacing: 10.0, children: [
                                ...berita.lampiran!
                                    .map(
                                      (doc) => GestureDetector(
                                        onTap: () {},
                                        child: Chip(
                                          label: Text(
                                            doc.file!,
                                            style: normalLight1,
                                          ),
                                          avatar: Icon(
                                            Icons.download,
                                            color: Colors.white,
                                          ),
                                          backgroundColor: primaryColor,
                                        ),
                                      ),
                                    )
                                    .toList(),
                              ]),
                              //ImageInput(_selectImage),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
