part of 'screens.dart';

class AtletEditScreen extends StatelessWidget {
  final Atlet atlet;
  AtletEditScreen(
    this.atlet, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var atletProv = Provider.of<AtletProvider>(context, listen: false);
    atletProv.resetAll();
    atletProv.atlet = atlet;
    // if (atlet.kategori != null) {
    //   atletProv.onSelectCategory(atlet.kategori!);
    // }
    // if (atlet.kelas != null) {
    //   atletProv.onSelectClass(atlet.kelas!);
    // }
    Widget _header = Container(
      width: double.infinity,
      height: 280,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.centerLeft,
          colors: [
            primaryColor,
            secondaryColor,
          ],
        ),
      ),
      child: Stack(
        children: [
          Column(
            children: [
              SafeArea(
                child: Container(
                  padding: EdgeInsets.only(top: 10),
                  width: double.infinity,
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          atlet.user?.name ?? '-',
                          style: largeLight1,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              atlet.user?.urlFoto != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(60),
                      child: FancyShimmerImage(
                        imageUrl: Api.userBaseFoto + '/' + atlet.user!.urlFoto!,
                        height: 100,
                        width: 100,
                        boxFit: BoxFit.cover,
                      ),
                    )
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(60),
                      child: Image.asset(
                        'assets/images/user-default.jpeg',
                        height: 100,
                        width: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
            ),
          ),
        ],
      ),
    );
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(vertical: defaultMargin),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<AtletProvider>(builder: (context, prov, child) {
              if (prov.isLoading) {
                return CircularProgressIndicator();
              }
              return GradientRoundedButton(
                child: Text(
                  'Simpan Perubahan',
                  style: normalLight1,
                ),
                onPressed: () {
                  prov.updateAtlet(context);
                },
              );
            }),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _header,
            Consumer<AtletProvider>(builder: (context, prov, child) {
              if (atletProv.categories == null) {
                atletProv.initAthleteSettings(context);
              }
              if (atletProv.categories != null) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextFieldContainer(
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<Kategori>(
                          style: normalGrey1,
                          onTap: () {
                            FocusScope.of(context).unfocus();
                          },
                          icon: Icon(
                            Icons.keyboard_arrow_down,
                            color: primaryColor,
                          ),
                          items: prov.categories!
                              .map(
                                (value) => DropdownMenuItem(
                                  child: Text(
                                    value.nama!,
                                    style: normalDark1,
                                  ),
                                  value: value,
                                ),
                              )
                              .toList(),
                          onChanged: (val) {
                            prov.onSelectCategory(val!);
                          },
                          isExpanded: true,
                          value: prov.selectedKategori,
                          hint: Text(
                            'Pilih Kategori',
                            style: normalDark1.copyWith(color: Colors.grey),
                          ),
                        ),
                      ),
                    ),
                    TextFieldContainer(
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<Kelas>(
                          style: normalGrey1,
                          onTap: () {
                            FocusScope.of(context).unfocus();
                          },
                          icon: Icon(
                            Icons.keyboard_arrow_down,
                            color: primaryColor,
                          ),
                          items: prov.filteredClasses!
                              .map(
                                (value) => DropdownMenuItem(
                                  child: Text(
                                    value.nama!,
                                    style: normalDark1,
                                  ),
                                  value: value,
                                ),
                              )
                              .toList(),
                          onChanged: (val) {
                            prov.onSelectClass(val!);
                          },
                          isExpanded: true,
                          value: prov.selectedKelas,
                          hint: Text(
                            'Pilih Kategori',
                            style: normalDark1.copyWith(color: Colors.grey),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }
              return Center(child: CircularProgressIndicator());
            }),
            SizedBox(height: defaultMargin * 2),
          ],
        ),
      ),
    );
  }
}
