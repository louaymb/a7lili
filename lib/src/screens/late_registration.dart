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
													child: Container(
														color: const Color(0xD9000000),
														padding: const EdgeInsets.only( top: 58, bottom: 244),
														width: double.infinity,
														child: Column(
															crossAxisAlignment: CrossAxisAlignment.start,
															children: [
																IntrinsicWidth(
																	child: IntrinsicHeight(
																		child: Container(
																			decoration: BoxDecoration(
																				borderRadius: BorderRadius.circular(100),
																				color: const Color(0xFF232325),
																			),
																			padding: const EdgeInsets.all(8),
																			margin: const EdgeInsets.only( bottom: 121, left: 33),
																			child: Column(
																				crossAxisAlignment: CrossAxisAlignment.start,
																				children: [
																					SizedBox(
																						width: 24,
																						height: 24,
																						child: Image.network(
																							"https://figma-alpha-api.s3.us-west-2.amazonaws.com/images/418013af-4b50-4c06-a95a-4121c02f98d8",
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
																		margin: const EdgeInsets.symmetric(horizontal: 48),
																		width: double.infinity,
																		child: Column(
																			children: [
																				SizedBox(
																					width: 60,
																					height: 61,
																					child: Image.network(
																						"https://figma-alpha-api.s3.us-west-2.amazonaws.com/images/bc48162b-43b3-4237-bfe3-a38bef719c35",
																						fit: BoxFit.fill,
																					)
																				),
																				IntrinsicHeight(
																					child: Container(
																						decoration: BoxDecoration(
																							border: Border.all(
																								color: const Color(0xFFF4564C),
																								width: 1,
																							),
																							borderRadius: BorderRadius.circular(20),
																							color: const Color(0xE8171717),
																							boxShadow: const [
																								BoxShadow(
																									color: Color(0x40000000),
																									blurRadius: 3,
																									offset: Offset(0, 3.170868396759033),
																								),
																							],
																						),
																						padding: const EdgeInsets.symmetric(vertical: 58),
																						width: double.infinity,
																						child: Column(
																							crossAxisAlignment: CrossAxisAlignment.start,
																							children: [
																								IntrinsicHeight(
																									child: Container(
																										margin: const EdgeInsets.symmetric(horizontal: 19),
																										width: double.infinity,
																										child: Column(
																											children: [
																												Container(
																													decoration: BoxDecoration(
																														borderRadius: BorderRadius.circular(23),
																													),
																													margin: const EdgeInsets.only( bottom: 16),
																													width: 117,
																													height: 112,
																													child: ClipRRect(
																														borderRadius: BorderRadius.circular(23),
																														child: Image.network(
																															"https://figma-alpha-api.s3.us-west-2.amazonaws.com/images/7f23df34-b7f4-4d57-b874-83c7b41bdd1f",
																															fit: BoxFit.fill,
																														)
																													)
																												),
																												IntrinsicHeight(
																													child: Container(
																														padding: const EdgeInsets.only( top: 3, bottom: 3, left: 43, right: 43),
																														width: double.infinity,
																														child: Column(
																															children: [
																																Container(
																																	margin: const EdgeInsets.only( bottom: 12),
																																	width: double.infinity,
																																	child: const Text(
																																		"You're in! \nThe clock is ticking…",
																																		style: TextStyle(
																																			color: Color(0xFFFFFFFF),
																																			fontSize: 24,
																																			fontWeight: FontWeight.bold,
																																		),
																																		textAlign: TextAlign.center,
																																	),
																																),
																																const Text(
																																	"will you make it out in time?",
																																	style: TextStyle(
																																		color: Color(0xFFFFFFFF),
																																		fontSize: 14,
																																		fontWeight: FontWeight.bold,
																																	),
																																),
																															]
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