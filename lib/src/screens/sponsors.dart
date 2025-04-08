import 'package:flutter/material.dart';
class Sponsors extends StatefulWidget {
	const Sponsors({super.key});
	@override
		SponsorsState createState() => SponsorsState();
	}
class SponsorsState extends State<Sponsors> {
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
															margin: const EdgeInsets.only( bottom: 16, left: 16),
															child: Column(
																crossAxisAlignment: CrossAxisAlignment.start,
																children: [
																	IntrinsicHeight(
																		child: Column(
																			crossAxisAlignment: CrossAxisAlignment.end,
																			children: [
																				SizedBox(
																					width: 161,
																					height: 161,
																					child: Image.network(
																						"https://figma-alpha-api.s3.us-west-2.amazonaws.com/images/76ff4da9-6a0a-4314-a8ea-545cba04eed0",
																						fit: BoxFit.fill,
																					)
																				),
																			]
																		),
																	),
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
																				margin: const EdgeInsets.only( bottom: 19, left: 15),
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
																													"https://figma-alpha-api.s3.us-west-2.amazonaws.com/images/02757592-258f-4b82-b144-67f17ef156d0",
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
																								"Our Sponsors",
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
																	Container(
																		decoration: BoxDecoration(
																			borderRadius: BorderRadius.circular(24),
																		),
																		margin: const EdgeInsets.only( left: 82),
																		width: 180,
																		height: 180,
																		child: ClipRRect(
																			borderRadius: BorderRadius.circular(24),
																			child: Image.network(
																				"https://figma-alpha-api.s3.us-west-2.amazonaws.com/images/b71ddcc4-df49-40f9-b8ea-1ca61508ac40",
																				fit: BoxFit.fill,
																			)
																		)
																	),
																]
															),
														),
													),
												),
												Container(
													margin: const EdgeInsets.only( bottom: 5, left: 106),
													child: const Text(
														"Sponsor Name",
														style: TextStyle(
															color: Color(0xFFFFFFFF),
															fontSize: 23,
															fontWeight: FontWeight.bold,
														),
													),
												),
												Container(
													margin: const EdgeInsets.only( bottom: 33, left: 157),
													child: const Text(
														"Hotel X , Tunisia",
														style: TextStyle(
															color: Color(0xFFFFFFFF),
															fontSize: 10,
															fontWeight: FontWeight.bold,
														),
													),
												),
												Container(
													margin: const EdgeInsets.only( bottom: 14, left: 38),
													child: const Text(
														"Description",
														style: TextStyle(
															color: Color(0xFFFFFFFF),
															fontSize: 11,
															fontWeight: FontWeight.bold,
														),
													),
												),
												IntrinsicHeight(
													child: Container(
														padding: const EdgeInsets.only( top: 41),
														width: double.infinity,
														child: Column(
															crossAxisAlignment: CrossAxisAlignment.start,
															children: [
																IntrinsicHeight(
																	child: SizedBox(
																		width: double.infinity,
																		child: Row(
																			children: [
																				Expanded(
																					child: IntrinsicHeight(
																						child: Container(
																							margin: const EdgeInsets.only( bottom: 91, right: 11),
																							width: double.infinity,
																							child: Column(
																								crossAxisAlignment: CrossAxisAlignment.start,
																								children: [
																									IntrinsicWidth(
																										child: IntrinsicHeight(
																											child: Container(
																												margin: const EdgeInsets.only( bottom: 24),
																												child: Stack(
																													clipBehavior: Clip.none,
																													children: [
																														Column(
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
																																						IntrinsicWidth(
																																							child: IntrinsicHeight(
																																								child: Container(
																																									padding: const EdgeInsets.only( top: 132, bottom: 21, left: 38, right: 38),
																																									decoration: const BoxDecoration(
																																										image: DecorationImage(
																																											image: NetworkImage("https://figma-alpha-api.s3.us-west-2.amazonaws.com/images/b26cac0f-5f8d-472e-97fd-3b3c6e5622ca"),
																																											fit: BoxFit.cover
																																										),
																																									),
																																									child: const Column(
																																										crossAxisAlignment: CrossAxisAlignment.start,
																																										children: [
																																											Text(
																																												"Services Needs",
																																												style: TextStyle(
																																													color: Color(0xFFFFFFFF),
																																													fontSize: 11,
																																													fontWeight: FontWeight.bold,
																																												),
																																											),
																																										]
																																									),
																																								),
																																							),
																																						),
																																					]
																																				),
																																				Positioned(
																																					bottom: 0,
																																					right: 35,
																																					width: 64,
																																					height: 64,
																																					child: Container(
																																						transform: Matrix4.translationValues(0, 59, 0),
																																						width: 64,
																																						height: 64,
																																						child: Image.network(
																																							"https://figma-alpha-api.s3.us-west-2.amazonaws.com/images/a45c44b2-6c10-4699-9070-f6a4220594a5",
																																							fit: BoxFit.fill,
																																						)
																																					),
																																				),
																																				Positioned(
																																					bottom: 0,
																																					right: 0,
																																					width: 64,
																																					height: 64,
																																					child: Container(
																																						transform: Matrix4.translationValues(62, 59, 0),
																																						width: 64,
																																						height: 64,
																																						child: Image.network(
																																							"https://figma-alpha-api.s3.us-west-2.amazonaws.com/images/6ceed8db-a000-48a4-9c9d-fbf723cbe98f",
																																							fit: BoxFit.fill,
																																						)
																																					),
																																				),
																																			]
																																		),
																																	),
																																),
																															]
																														),
																														Positioned(
																															top: 0,
																															left: 38,
																															width: 305,
																															height: 158,
																															child: Container(
																																transform: Matrix4.translationValues(0, -41, 0),
																																child: const SizedBox(
																																	width: 305,
																																	child: Text(
																																		"The Tunisian Leadership Development Seminar (Tu’LDS) is a national conference of  AIESEC in Tunisia, aimed at enhancing the personal and professional development of its members. Through leadership experiences and the acquisition of both soft and hard skills, the conference features sessions led by Tunisian and international Facilitators.",
																																		style: TextStyle(
																																			color: Color(0xFFFFFFFF),
																																			fontSize: 14,
																																			fontWeight: FontWeight.bold,
																																		),
																																	),
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
																												margin: const EdgeInsets.only( bottom: 11, left: 52),
																												child: Row(
																													crossAxisAlignment: CrossAxisAlignment.start,
																													children: [
																														Container(
																															margin: const EdgeInsets.only( right: 10),
																															width: 86,
																															height: 78,
																															child: Image.network(
																																"https://figma-alpha-api.s3.us-west-2.amazonaws.com/images/8a80cc51-33a5-413f-8ba9-152ebbf30b8e",
																																fit: BoxFit.fill,
																															)
																														),
																														SizedBox(
																															width: 86,
																															height: 78,
																															child: Image.network(
																																"https://figma-alpha-api.s3.us-west-2.amazonaws.com/images/daeebbd8-4fc6-45fc-ba2c-2590a0f497a5",
																																fit: BoxFit.fill,
																															)
																														),
																													]
																												),
																											),
																										),
																									),
																									IntrinsicHeight(
																										child: SizedBox(
																											width: double.infinity,
																											child: Column(
																												crossAxisAlignment: CrossAxisAlignment.end,
																												children: [
																													IntrinsicWidth(
																														child: IntrinsicHeight(
																															child: Container(
																																padding: const EdgeInsets.only( top: 4, bottom: 4, left: 7, right: 7),
																																margin: const EdgeInsets.only( right: 6),
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
																																				"https://figma-alpha-api.s3.us-west-2.amazonaws.com/images/daea9e3b-eb42-47dd-8eb3-113f40846819",
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
																								]
																							),
																						),
																					),
																				),
																				IntrinsicWidth(
																					child: IntrinsicHeight(
																						child: Container(
																							margin: const EdgeInsets.only( top: 156),
																							child: Column(
																								crossAxisAlignment: CrossAxisAlignment.start,
																								children: [
																									IntrinsicWidth(
																										child: IntrinsicHeight(
																											child: Column(
																												crossAxisAlignment: CrossAxisAlignment.start,
																												children: [
																													Container(
																														margin: const EdgeInsets.only( left: 10),
																														width: 64,
																														height: 64,
																														child: Image.network(
																															"https://figma-alpha-api.s3.us-west-2.amazonaws.com/images/1f7f59b4-e72f-43ec-8c63-f3714da3f480",
																															fit: BoxFit.fill,
																														)
																													),
																													SizedBox(
																														width: 86,
																														height: 78,
																														child: Image.network(
																															"https://figma-alpha-api.s3.us-west-2.amazonaws.com/images/d6e4d411-dc59-4bb9-a713-f28af1a76362",
																															fit: BoxFit.fill,
																														)
																													),
																													Container(
																														margin: const EdgeInsets.symmetric(horizontal: 9),
																														width: 161,
																														height: 161,
																														child: Image.network(
																															"https://figma-alpha-api.s3.us-west-2.amazonaws.com/images/e58f6434-4059-451d-945d-b2d350d79867",
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