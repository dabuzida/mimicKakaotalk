import 'package:flutter/material.dart';
import '../media_query/media_query_layout.dart';
import '../ui/web_desktop_back_scaffold.dart';
import '../ui/web_mobile_back_scaffold.dart';
import '../widget/app_state.dart';
import 'home_care_services_desktop_view.dart' deferred as home_care_services_desktop_view;
import 'home_care_services_mobile_view.dart' deferred as home_care_services_mobile_view;

class Header extends StatefulWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  Widget? _homeCareServicesMobileView;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ();
  }

  

  Widget _desktopView() {
    if (_homeCareServicesDesktopView == null) {
      return WebDesktopBackScaffold(
        child: FutureBuilder<void>(
          //future: Future.wait(<Future<void>>[home_care_services_view.loadLibrary()]),
          // future: deferredLoad(),
          future: home_care_services_desktop_view.loadLibrary(),
          builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return const SizedBox.shrink();
            }

            _homeCareServicesDesktopView = home_care_services_desktop_view.HomeCareServicesDesktopView();

            return _homeCareServicesDesktopView!;
          },
        ),
      );
    }

    return WebDesktopBackScaffold(
      child: _homeCareServicesDesktopView,
    );
  
  }
}
