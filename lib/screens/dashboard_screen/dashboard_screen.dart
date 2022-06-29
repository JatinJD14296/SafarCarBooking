
import '../../common/widgets/icon_and_images.dart';
import '../../common/widgets/padding_margin.dart';
import '../../common/widgets/space_and_dividers.dart';
import '../../common/widgets/text_and_styles.dart';
import '../../models/vendor_model.dart';
import '../../network/firestore_instance.dart';
import '../../utils/colors.dart';
import '../../utils/navigator_route.dart';
import '../../utils/screen_utils.dart';
import '../../utils/strings.dart';
import 'dashboard_screen_bloc.dart';
import 'dashboard_screen_widget.dart';

class DashBoardScreen extends StatefulWidget {
  @override
  _DashBoardScreenState createState() => _DashBoardScreenState();
}



class _DashBoardScreenState extends State<DashBoardScreen> {
  List<VendorDataModel> vendors = [];

  VendorListBloc bloc = VendorListBloc();

  @override
  void initState() {
    FireBaseDatabaseInstance.vendorDatabase.once().then((value) {
      value.value.forEach((k, v) {
        vendors.add(VendorDataModel(
          firmName: v['Firm Name'],
          vendorName: v['VendorName'],
          address: v['Address'],
          email: v['Email'],
          gst: v['GST'],
          key: v['Key'],
          mobileNumber: v['MobileNumber'],
          password: v['Password'],
        ));
      });
      print(vendors);
      bloc.setVendorData(data: vendors);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: paddingAll(10.0),
          child: Column(
            children: [
              dashboardAppBar(context),
              Expanded(
                child: StreamBuilder(
                  stream: bloc.vendorListStream,
                  builder: (context, snapshot) {
                    return (snapshot.hasData)
                        ? ListView.builder(
                            itemCount: vendors.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CarListScreen(
                                      vendors[index],
                                    ),
                                  ),
                                ),
                                child: Padding(
                                  padding: paddingAll(8.0),
                                  child: Card(
                                    elevation: 20.0,
                                    child: ListTile(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      title: labels(
                                        text: "$firm_name: " +
                                            vendors[index].firmName,
                                        textAlign: TextAlign.start,
                                        size: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      subtitle: labels(
                                        text: "$vendor_name : " +
                                            vendors[index].vendorName,
                                        textAlign: TextAlign.start,
                                        size: 16,
                                      ),
                                      trailing: icons(
                                        icon: Icons.arrow_forward_ios,
                                        color: iconTextColor,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          )
                        : Center(child: CircularProgressIndicator());
                  },
                ),
              ),
              verticalSpace(10.0),
              submitButton(
                bgColor: primaryYellow,
                text: add_vendor,
                margin: paddingSymmetric(horizontal: Screen.screenWidth * 0.2),
                onPressed: () =>
                    Navigator.pushNamed(context, vendorRegistration),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
