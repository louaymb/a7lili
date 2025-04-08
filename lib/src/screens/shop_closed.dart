import 'package:flutter/material.dart';
class SignIn extends StatefulWidget {
	const SignIn({super.key});
	@override
		SignInState createState() => SignInState();
	}
class SignInState extends State<SignIn> {
	@override
	Widget build(BuildContext context) {
		return Scaffold(
			body: SafeArea(
				child: Container(
					constraints: const BoxConstraints.expand(),
					color: const Color(0xFFFFFFFF),
					child: Column(
						crossAxisAlignment: CrossAxisAlignment.start,
						children: [
							Expanded(
								child: Container(
									color: const Color(0xFF09090A),
									width: double.infinity,
									height: double.infinity,
									child: SingleChildScrollView(
										child: Column(
											crossAxisAlignment: CrossAxisAlignment.start,
											children: [
												IntrinsicWidth(
													child: IntrinsicHeight(
														child: Container(
															padding: const EdgeInsets.only( top: 7, bottom: 61),
															margin: const EdgeInsets.only( bottom: 2, left: 16),
															child: Row(
																crossAxisAlignment: CrossAxisAlignment.start,
																children: [
																	IntrinsicWidth(
																		child: IntrinsicHeight(
																			child: Container(
																				margin: const EdgeInsets.only( right: 138),
																				child: Column(
																					crossAxisAlignment: CrossAxisAlignment.start,
																					children: [
																						IntrinsicWidth(
																							child: IntrinsicHeight(
																								child: Container(
																									padding: const EdgeInsets.only( top: 10, left: 8, right: 8),
																									margin: const EdgeInsets.only( bottom: 32),
																									child: const Column(
																										crossAxisAlignment: CrossAxisAlignment.start,
																										children: [
																											Text(
																												"23:10",
																												style: TextStyle(
																													color: Color(0xFFFFFFFF),
																													fontSize: 15,
																													fontWeight: FontWeight.bold,
																												),
																											),
																										]
																									),
																								),
																							),
																						),
																						IntrinsicWidth(
																							child: IntrinsicHeight(
																								child: Container(
																									margin: const EdgeInsets.only( left: 15),
																									child: Row(
																										children: [
																											IntrinsicWidth(
																												child: IntrinsicHeight(
																													child: Container(
																														decoration: BoxDecoration(
																															borderRadius: BorderRadius.circular(100),
																															color: const Color(0xFF232325),
																														),
																														padding: const EdgeInsets.all(8),
																														margin: const EdgeInsets.only( right: 9),
																														child: Column(
																															crossAxisAlignment: CrossAxisAlignment.start,
																															children: [
																																SizedBox(
																																	width: 24,
																																	height: 24,
																																	child: Image.network(
																																		"https://figma-alpha-api.s3.us-west-2.amazonaws.com/images/a66605ab-1e13-419a-978c-34b9d4b0545c",
																																		fit: BoxFit.fill,
																																	)
																																),
																															]
																														),
																													),
																												),
																											),
																											Container(
																												margin: const EdgeInsets.symmetric(vertical: 14),
																												child: const Text(
																													"Shop",
																													style: TextStyle(
																														color: Color(0xFFFFFFFF),
																														fontSize: 15,
																														fontWeight: FontWeight.bold,
																													),
																												),
																											),
																										]
																									),
																								),
																							),
																						),
																					]
																				),
																			),
																		),
																	),
																	SizedBox(
																		width: 161,
																		height: 161,
																		child: Image.network(
																			"https://figma-alpha-api.s3.us-west-2.amazonaws.com/images/1310ceaa-0fd2-4b8c-9d31-621d22ee6585",
																			fit: BoxFit.fill,
																		)
																	),
																]
															),
														),
													),
												),
												IntrinsicHeight(
													child: Container(
														margin: const EdgeInsets.only( bottom: 29),
														width: double.infinity,
														child: Column(
															children: [
																Container(
																	decoration: BoxDecoration(
																		borderRadius: BorderRadius.circular(10),
																		color: const Color(0xFFD9D9D9),
																	),
																	width: 194,
																	height: 225,
																	child: const SizedBox(),
																),
															]
														),
													),
												),
												IntrinsicHeight(
													child: Container(
														margin: const EdgeInsets.only( bottom: 11),
														width: double.infinity,
														child: Column(
															children: [
																IntrinsicWidth(
																	child: IntrinsicHeight(
																		child: Container(
																			padding: const EdgeInsets.only( top: 5, bottom: 5, left: 6, right: 6),
																			child: const Column(
																				crossAxisAlignment: CrossAxisAlignment.start,
																				children: [
																					Text(
																						"Registration is",
																						style: TextStyle(
																							color: Color(0xFFFFFFFF),
																							fontSize: 14,
																						),
																					),
																				]
																			),
																		),
																	),
																),
															]
														),
													),
												),
												IntrinsicWidth(
													child: IntrinsicHeight(
														child: Container(
															margin: const EdgeInsets.only( bottom: 99),
															child: Stack(
																clipBehavior: Clip.none,
																children: [
																	Padding(
																		padding: const EdgeInsets.only( top: 1, bottom: 1, right: 115),
																		child: Column(
																			crossAxisAlignment: CrossAxisAlignment.start,
																			children: [
																				IntrinsicWidth(
																					child: IntrinsicHeight(
																						child: Stack(
																							clipBehavior: Clip.none,
																							children: [
																								Column(
																									crossAxisAlignment: CrossAxisAlignment.start,
																									children: [
																										SizedBox(
																											width: 161,
																											height: 161,
																											child: Image.network(
																												"https://figma-alpha-api.s3.us-west-2.amazonaws.com/images/ccc632c4-7ccc-4368-8f4a-a79e7d74c133",
																												fit: BoxFit.fill,
																											)
																										),
																									]
																								),
																								const Positioned(
																									bottom: 67,
																									left: 69,
																									width: 231,
																									height: 10,
																									child: Text(
																										"lorem upsom lorem upsom lorem upsom lo",
																										style: TextStyle(
																											color: Color(0xFFFFFFFF),
																											fontSize: 10,
																										),
																									),
																								),
																								const Positioned(
																									bottom: 47,
																									left: 69,
																									width: 231,
																									height: 10,
																									child: Text(
																										"lorem upsom lorem upsom lorem upsom lo",
																										style: TextStyle(
																											color: Color(0xFFFFFFFF),
																											fontSize: 10,
																										),
																									),
																								),
																								const Positioned(
																									bottom: 22,
																									left: 71,
																									width: 231,
																									height: 10,
																									child: Text(
																										"lorem upsom lorem upsom lorem upsom lo",
																										style: TextStyle(
																											color: Color(0xFFFFFFFF),
																											fontSize: 10,
																										),
																									),
																								),
																							]
																						),
																					),
																				),
																			]
																		),
																	),
																	const Positioned(
																		top: 0,
																		right: 0,
																		width: 143,
																		height: 21,
																		child: Text(
																			"CLAWZED",
																			style: TextStyle(
																				color: Color(0xFFFFFFFF),
																				fontSize: 29,
																				fontWeight: FontWeight.bold,
																			),
																		),
																	),
																]
															),
														),
													),
												),
												IntrinsicWidth(
													child: IntrinsicHeight(
														child: Container(
															padding: const EdgeInsets.only( top: 14, bottom: 91),
															margin: const EdgeInsets.only( left: 150),
															child: Row(
																crossAxisAlignment: CrossAxisAlignment.start,
																children: [
																	IntrinsicWidth(
																		child: IntrinsicHeight(
																			child: Container(
																				padding: const EdgeInsets.only( top: 4, bottom: 4, left: 7, right: 7),
																				margin: const EdgeInsets.only( right: 26),
																				child: Column(
																					children: [
																						Container(
																							margin: const EdgeInsets.only( bottom: 7),
																							child: const Text(
																								"Hosted by :",
																								style: TextStyle(
																									color: Color(0xFFFFFFFF),
																									fontSize: 12,
																								),
																							),
																						),
																						SizedBox(
																							width: 46,
																							height: 34,
																							child: Image.network(
																								"https://figma-alpha-api.s3.us-west-2.amazonaws.com/images/0918e408-793a-4a6e-95e6-2317dd4f7ad8",
																								fit: BoxFit.fill,
																							)
																						),
																					]
																				),
																			),
																		),
																	),
																	SizedBox(
																		width: 161,
																		height: 161,
																		child: Image.network(
																			"https://figma-alpha-api.s3.us-west-2.amazonaws.com/images/f1480466-64f2-44c8-b277-08b1794328fa",
																			fit: BoxFit.fill,
																		)
																	),
																]
															),
														),
													),
												),
											],
										)
									),
								),
							),
						],
					),
				),
			),
		);
	}
}