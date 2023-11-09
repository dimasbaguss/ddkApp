import 'dart:ffi';

import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:ddk_app/services/firebaseservices.dart';
import 'package:ddk_app/models/model_sensor.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'logged_page_model.dart';
export 'logged_page_model.dart';

class LoggedPageWidget extends StatefulWidget {
  const LoggedPageWidget({Key? key}) : super(key: key);

  @override
  _LoggedPageWidgetState createState() => _LoggedPageWidgetState();
}

class _LoggedPageWidgetState extends State<LoggedPageWidget> {
  late LoggedPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  bool api = false;
  String kondisi_api = "";
  num gas = 0;
  String kondisi_gas = "";
  num suhu = 0;
  String kondisi_suhu = "";
  SensorKebakaran dataResult = SensorKebakaran();

  void readData() {
    try {
      DatabaseReference starCountRef = FirebaseDatabase.instance.ref('');
      starCountRef.onValue.listen((DatabaseEvent event) {
        final data = event.snapshot.value;
        dataResult = SensorKebakaran.fromJson(data as Map);
        setState(() {});
        print(dataResult.sensors?.sensorApi?.value);
        print(dataResult.sensors?.sensorApi?.kondisi);
        print(dataResult.sensors?.sensorGas?.value);
        print(dataResult.sensors?.sensorGas?.kondisi);
        print(dataResult.sensors?.sensorSuhu?.value);
        print(dataResult.sensors?.sensorSuhu?.kondisi);
      });
    } catch (e) {
      rethrow;
    }
  }

  @override
  void initState() {
    readData();
    super.initState();
    _model = createModel(context, () => LoggedPageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: SingleChildScrollView(
          child: SafeArea(
            top: true,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(-1.0, 0.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 1.0,
                        height: MediaQuery.of(context).size.height * 0.085,
                        decoration: BoxDecoration(
                          // color: Colors.black,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: Image.asset(
                              'assets/images/Frame-72-short.png',
                            ).image,
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 1.0,
                              height:
                                  MediaQuery.of(context).size.height * 0.085,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(116, 15, 17, 19),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          15.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        'Deteksi Dini Kebakaran',
                                        style: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              fontSize: 19.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(1.0, 0.0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        GoRouter.of(context).prepareAuthEvent();
                                        await authManager.signOut();
                                        GoRouter.of(context)
                                            .clearRedirectLocation();

                                        context.goNamedAuth(
                                            'Splashscreen', context.mounted);
                                      },
                                      text: '',
                                      icon: FaIcon(
                                        FontAwesomeIcons.signOutAlt,
                                        color: Color(0xFFFF0000),
                                        size: 26.0,
                                      ),
                                      options: FFButtonOptions(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            6.5, 0.0, 0.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: Colors.transparent,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              color: Colors.transparent,
                                            ),
                                        elevation: 0.0,
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 0.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 1.0,
                      height: 38.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                15.0, 0.0, 15.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Welcome  ',
                                  textAlign: TextAlign.center,
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                ),
                                Text(
                                  currentUserEmail,
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 1.0,
                      height: MediaQuery.of(context).size.height * 0.25,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            15.0, 0.0, 15.0, 0.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(0.0),
                          child: Image.asset(
                            dataResult.sensors?.sensorApi?.value ?? false
                                ? 'assets/images/ada_api.gif'
                                : 'assets/images/no_api.gif',
                            width: MediaQuery.of(context).size.width * 1.0,
                            height: MediaQuery.of(context).size.height * 0.3,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 1.0,
                        height: 106.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              15.0, 0.0, 15.0, 0.0),
                          child: Card(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            color:
                                (dataResult.sensors?.sensorApi?.value ?? false)
                                    ? Colors.red
                                    : FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                            elevation: 4.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          5.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        'Api',
                                        textAlign: TextAlign.start,
                                        style: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .copyWith(
                                                color: (dataResult
                                                            .sensors
                                                            ?.sensorApi
                                                            ?.value ??
                                                        false)
                                                    ? Colors.white
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText),
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Text(
                                      '${dataResult.sensors?.sensorApi?.kondisi ?? "-status-"}',
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: (dataResult.sensors
                                                        ?.sensorApi?.value ??
                                                    false)
                                                ? Colors.white
                                                : FlutterFlowTheme.of(context)
                                                    .primaryText,
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 10.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 1.0,
                        height: 100.0,
                        decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.45,
                              height: 100.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: Card(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                color: dataResult.sensors?.sensorGas?.value !=
                                            null &&
                                        dataResult.sensors!.sensorGas!.value! >=
                                            300
                                    ? Colors.yellow[700]
                                    : FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                elevation: 4.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  5.0, 0.0, 0.0, 0.0),
                                          child: Text(
                                            'Gas',
                                            textAlign: TextAlign.start,
                                            style: FlutterFlowTheme.of(context)
                                                .labelMedium
                                                .copyWith(
                                                  color: dataResult
                                                                  .sensors
                                                                  ?.sensorGas
                                                                  ?.value !=
                                                              null &&
                                                          dataResult
                                                                  .sensors!
                                                                  .sensorGas!
                                                                  .value! >=
                                                              300
                                                      ? Colors.white
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .primaryText,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        Text(
                                          '${dataResult.sensors?.sensorGas?.value ?? 0} PPM',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .titleLarge
                                              .override(
                                                fontFamily: 'Outfit',
                                                color: dataResult
                                                                .sensors
                                                                ?.sensorGas
                                                                ?.value !=
                                                            null &&
                                                        dataResult
                                                                .sensors!
                                                                .sensorGas!
                                                                .value! >=
                                                            300
                                                    ? Colors.white
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          '${dataResult.sensors?.sensorGas?.kondisi ?? "-status-"}',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                color: dataResult
                                                                .sensors
                                                                ?.sensorGas
                                                                ?.value !=
                                                            null &&
                                                        dataResult
                                                                .sensors!
                                                                .sensorGas!
                                                                .value! >=
                                                            300
                                                    ? Colors.white
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.45,
                              height: 100.0,
                              decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground),
                              child: Card(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                color: dataResult.sensors?.sensorSuhu?.value !=
                                            null &&
                                        dataResult
                                                .sensors!.sensorSuhu!.value! >=
                                            40
                                    ? Colors.yellow[700]
                                    : FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                elevation: 4.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  5.0, 0.0, 0.0, 0.0),
                                          child: Text(
                                            'Suhu',
                                            style: FlutterFlowTheme.of(context)
                                                .labelMedium
                                                .copyWith(
                                                  color: dataResult
                                                                  .sensors
                                                                  ?.sensorSuhu
                                                                  ?.value !=
                                                              null &&
                                                          dataResult
                                                                  .sensors!
                                                                  .sensorSuhu!
                                                                  .value! >=
                                                              40
                                                      ? Colors.white
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .primaryText,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        Text(
                                          '${dataResult.sensors?.sensorSuhu?.value ?? 0}℃',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .titleLarge
                                              .override(
                                                fontFamily: 'Outfit',
                                                color: dataResult
                                                                .sensors
                                                                ?.sensorSuhu
                                                                ?.value !=
                                                            null &&
                                                        dataResult
                                                                .sensors!
                                                                .sensorSuhu!
                                                                .value! >=
                                                            40
                                                    ? Colors.white
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          '${dataResult.sensors?.sensorSuhu?.kondisi ?? "-status-"}',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                color: dataResult
                                                                .sensors
                                                                ?.sensorSuhu
                                                                ?.value !=
                                                            null &&
                                                        dataResult
                                                                .sensors!
                                                                .sensorSuhu!
                                                                .value! >=
                                                            40
                                                    ? Colors.white
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
