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
												IntrinsicHeight(
													child: SizedBox(
														width: double.infinity,
														child: Column(
															crossAxisAlignment: CrossAxisAlignment.start,
															children: [
																IntrinsicHeight(
																	child: SizedBox(
																		width: double.infinity,
																		child: Column(
																			crossAxisAlignment: CrossAxisAlignment.end,
																			children: [
																				SizedBox(
																					width: 161,
																					height: 161,
																					child: Image.network(
																						"https://figma-alpha-api.s3.us-west-2.amazonaws.com/images/68f4c668-ca15-44bd-b855-58bbf1ab5518",
																						fit: BoxFit.fill,
																					)
																				),
																			]
																		),
																	),
																),
																IntrinsicWidth(
																	child: IntrinsicHeight(
																		child: Container(
																			color: const Color(0xAD000000),
																			padding: const EdgeInsets.only( top: 244, bottom: 285, left: 59, right: 59),
																			margin: const EdgeInsets.only( left: 4),
																			child: Column(
																				crossAxisAlignment: CrossAxisAlignment.start,
																				children: [
																					IntrinsicWidth(
																						child: IntrinsicHeight(
																							child: Container(
																								decoration: BoxDecoration(
																									border: Border.all(
																										color: const Color(0xFFF4564C),
																										width: 1,
																									),
																									borderRadius: BorderRadius.circular(43),
																									color: const Color(0xE8171717),
																									boxShadow: const [
																										BoxShadow(
																											color: Color(0x40000000),
																											blurRadius: 3,
																											offset: Offset(0, 3.170868396759033),
																										),
																									],
																								),
																								padding: const EdgeInsets.symmetric(vertical: 15),
																								child: Column(
																									crossAxisAlignment: CrossAxisAlignment.start,
																									children: [
																										IntrinsicHeight(
																											child: Container(
																												margin: const EdgeInsets.only( bottom: 9),
																												child: const Column(
																													children: [
																														Text(
																															"QR Profile",
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
																										Container(
																											color: const Color(0xFFF4564C),
																											margin: const EdgeInsets.only( bottom: 46, left: 29, right: 29),
																											width: 194,
																											height: 1,
																											child: const SizedBox(),
																										),
																										IntrinsicHeight(
																											child: Container(
																												margin: const EdgeInsets.only( bottom: 22),
																												child: Column(
																													children: [
																														SizedBox(
																															width: 133,
																															height: 133,
																															child: Image.network(
																																"https://figma-alpha-api.s3.us-west-2.amazonaws.com/images/ee5b8109-d628-4b6c-94d9-d70f5e63cec5",
																																fit: BoxFit.fill,
																															)
																														),
																													]
																												),
																											),
																										),
																										Container(
																											margin: const EdgeInsets.only( left: 26),
																											width: 26,
																											height: 26,
																											child: Image.network(
																												"https://figma-alpha-api.s3.us-west-2.amazonaws.com/images/827431c6-7009-4266-a7d4-d870b1f3d13c",
																												fit: BoxFit.fill,
																											)
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
																Container(
																	margin: const EdgeInsets.only( bottom: 99),
																	width: 161,
																	height: 161,
																	child: Image.network(
																		"https://figma-alpha-api.s3.us-west-2.amazonaws.com/images/cf0e3121-d179-4d65-b1c4-71cb55ca0447",
																		fit: BoxFit.fill,
																	)
																),
																IntrinsicHeight(
																	child: SizedBox(
																		width: double.infinity,
																		child: Column(
																			crossAxisAlignment: CrossAxisAlignment.end,
																			children: [
																				Container(
																					margin: const EdgeInsets.only( right: 12),
																					width: 161,
																					height: 161,
																					child: Image.network(
																						"https://figma-alpha-api.s3.us-west-2.amazonaws.com/images/dd3626f2-0143-4107-b16b-11d5f6e55a04",
																						fit: BoxFit.fill,
																					)
																				),
																			]
																		),
																	),
																),
															]
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