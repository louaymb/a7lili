import 'package:flutter/material.dart';
class Login extends StatefulWidget {
	const Login({super.key});
	@override
		LoginState createState() => LoginState();
	}
class LoginState extends State<Login> {
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
									color: const Color(0xFF090909),
									width: double.infinity,
									height: double.infinity,
									child: SingleChildScrollView(
										child: Column(
											crossAxisAlignment: CrossAxisAlignment.start,
											children: [
												IntrinsicWidth(
													child: IntrinsicHeight(
														child: Stack(
															clipBehavior: Clip.none,
															children: [
																Row(
																	mainAxisAlignment: MainAxisAlignment.spaceAround,
																	children: [
																		IntrinsicWidth(
																			child: IntrinsicHeight(
																				child: Container(
																					margin: const EdgeInsets.only( right: 14),
																					child: Stack(
																						clipBehavior: Clip.none,
																						children: [
																							Column(
																								crossAxisAlignment: CrossAxisAlignment.start,
																								children: [
																									IntrinsicWidth(
																										child: IntrinsicHeight(
																											child: Container(
																												decoration: BoxDecoration(
																													borderRadius: BorderRadius.circular(30),
																													color: const Color(0xDE09090A),
																												),
																												padding: const EdgeInsets.only( top: 7, bottom: 392),
																												child: Column(
																													crossAxisAlignment: CrossAxisAlignment.start,
																													children: [
																														IntrinsicWidth(
																															child: IntrinsicHeight(
																																child: Container(
																																	padding: const EdgeInsets.only( top: 10, left: 8, right: 8),
																																	margin: const EdgeInsets.only( bottom: 65, left: 16),
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
																																	margin: const EdgeInsets.only( bottom: 32, left: 29),
																																	child: Row(
																																		children: [
																																			Container(
																																				margin: const EdgeInsets.only( right: 6),
																																				width: 60,
																																				height: 60,
																																				child: Image.network(
																																					"https://figma-alpha-api.s3.us-west-2.amazonaws.com/images/fb80db61-742c-40a5-b4aa-875723406f75",
																																					fit: BoxFit.fill,
																																				)
																																			),
																																			IntrinsicWidth(
																																				child: IntrinsicHeight(
																																					child: Container(
																																						margin: const EdgeInsets.symmetric(vertical: 7),
																																						child: Column(
																																							crossAxisAlignment: CrossAxisAlignment.start,
																																							children: [
																																								IntrinsicWidth(
																																									child: IntrinsicHeight(
																																										child: Container(
																																											padding: const EdgeInsets.only( top: 5, bottom: 5, left: 8, right: 8),
																																											margin: const EdgeInsets.only( bottom: 1),
																																											child: const Column(
																																												crossAxisAlignment: CrossAxisAlignment.start,
																																												children: [
																																													Text(
																																														"Ghada Jbeli",
																																														style: TextStyle(
																																															color: Color(0xFFFFFFFF),
																																															fontSize: 18,
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
																																											padding: const EdgeInsets.only( top: 4, bottom: 4, left: 9, right: 35),
																																											child: const Column(
																																												crossAxisAlignment: CrossAxisAlignment.start,
																																												children: [
																																													Text(
																																														"MKT manager",
																																														style: TextStyle(
																																															color: Color(0xFFFFFFFF),
																																															fontSize: 12,
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
																																		]
																																	),
																																),
																															),
																														),
																														Container(
																															margin: const EdgeInsets.only( bottom: 198, left: 29),
																															child: const Text(
																																"MENU",
																																style: TextStyle(
																																	color: Color(0xFFFFFFFF),
																																	fontSize: 12,
																																	fontWeight: FontWeight.bold,
																																),
																															),
																														),
																														Container(
																															margin: const EdgeInsets.only( left: 41),
																															width: 24,
																															height: 24,
																															child: Image.network(
																																"https://figma-alpha-api.s3.us-west-2.amazonaws.com/images/fb9e3fd7-da8f-4449-ab29-334eab22165c",
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
																							Positioned(
																								top: 17,
																								right: 0,
																								width: 17,
																								height: 10,
																								child: Container(
																									transform: Matrix4.translationValues(9, 0, 0),
																									width: 17,
																									height: 10,
																									child: Image.network(
																										"https://figma-alpha-api.s3.us-west-2.amazonaws.com/images/5d7665fa-d34b-42f0-adc4-5b0407340827",
																										fit: BoxFit.fill,
																									)
																								),
																							),
																							Positioned(
																								top: 145,
																								left: 34,
																								width: 312,
																								child: IntrinsicHeight(
																									child: Container(
																										decoration: BoxDecoration(
																											border: Border.all(
																												color: const Color(0x33FFFFFF),
																												width: 1,
																											),
																											borderRadius: BorderRadius.circular(8),
																											color: const Color(0x1AFF958E),
																										),
																										width: 312,
																										child: Column(
																											crossAxisAlignment: CrossAxisAlignment.start,
																											children: [
																												IntrinsicWidth(
																													child: IntrinsicHeight(
																														child: Container(
																															margin: const EdgeInsets.only( top: 8, bottom: 8, left: 15),
																															child: Row(
																																children: [
																																	Container(
																																		margin: const EdgeInsets.only( right: 13),
																																		width: 22,
																																		height: 24,
																																		child: Image.network(
																																			"https://figma-alpha-api.s3.us-west-2.amazonaws.com/images/8c59f787-160d-4c26-b195-2fd24934cde2",
																																			fit: BoxFit.fill,
																																		)
																																	),
																																	Container(
																																		margin: const EdgeInsets.symmetric(vertical: 5),
																																		child: const Text(
																																			"Search",
																																			style: TextStyle(
																																				color: Color(0xFFFFFFFF),
																																				fontSize: 16,
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
																							Positioned(
																								bottom: 57,
																								left: 36,
																								width: 307,
																								child: IntrinsicHeight(
																									child: Container(
																										decoration: BoxDecoration(
																											border: Border.all(
																												color: const Color(0xFFDFE1E4),
																												width: 1,
																											),
																											borderRadius: BorderRadius.circular(10),
																											color: const Color(0x12FFFFFF),
																										),
																										width: 307,
																										child: Column(
																											crossAxisAlignment: CrossAxisAlignment.start,
																											children: [
																												Container(
																													decoration: BoxDecoration(
																														borderRadius: BorderRadius.circular(7),
																														color: const Color(0xFFD5B5B3),
																													),
																													margin: const EdgeInsets.only( top: 7, bottom: 13, left: 7, right: 7),
																													height: 156,
																													width: double.infinity,
																													child: const SizedBox(),
																												),
																												Container(
																													margin: const EdgeInsets.only( bottom: 8, left: 14),
																													child: const Text(
																														"Begin your new journey and register now",
																														style: TextStyle(
																															color: Color(0xFFFFFFFF),
																															fontSize: 14,
																															fontWeight: FontWeight.bold,
																														),
																													),
																												),
																												Container(
																													color: const Color(0xFFDFE1E4),
																													margin: const EdgeInsets.only( bottom: 6, left: 14, right: 14),
																													height: 1,
																													width: double.infinity,
																													child: const SizedBox(),
																												),
																												IntrinsicWidth(
																													child: IntrinsicHeight(
																														child: Container(
																															margin: const EdgeInsets.only( bottom: 8, left: 14),
																															child: Row(
																																children: [
																																	IntrinsicWidth(
																																		child: IntrinsicHeight(
																																			child: Container(
																																				decoration: BoxDecoration(
																																					borderRadius: BorderRadius.circular(7),
																																					color: const Color(0x24F5F5F5),
																																				),
																																				padding: const EdgeInsets.all(7),
																																				margin: const EdgeInsets.only( right: 11),
																																				child: Column(
																																					crossAxisAlignment: CrossAxisAlignment.start,
																																					children: [
																																						SizedBox(
																																							width: 21,
																																							height: 21,
																																							child: Image.network(
																																								"https://figma-alpha-api.s3.us-west-2.amazonaws.com/images/349a1ae1-4244-4bab-9398-c9c92fefcfc4",
																																								fit: BoxFit.fill,
																																							)
																																						),
																																					]
																																				),
																																			),
																																		),
																																	),
																																	IntrinsicWidth(
																																		child: IntrinsicHeight(
																																			child: Container(
																																				margin: const EdgeInsets.symmetric(vertical: 6),
																																				child: Column(
																																					crossAxisAlignment: CrossAxisAlignment.start,
																																					children: [
																																						Container(
																																							margin: const EdgeInsets.only( bottom: 9),
																																							child: const Text(
																																								"Date & Time",
																																								style: TextStyle(
																																									color: Color(0xFFFFFFFF),
																																									fontSize: 9,
																																								),
																																							),
																																						),
																																						const Text(
																																							"19/20/21/22 April, 2025. 10:00 PM",
																																							style: TextStyle(
																																								color: Color(0xFFFFFFFF),
																																								fontSize: 10,
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
																														),
																													),
																												),
																												Container(
																													color: const Color(0xFFDFE1E4),
																													margin: const EdgeInsets.only( bottom: 6, left: 14, right: 14),
																													height: 1,
																													width: double.infinity,
																													child: const SizedBox(),
																												),
																												IntrinsicWidth(
																													child: IntrinsicHeight(
																														child: Container(
																															margin: const EdgeInsets.only( bottom: 15, left: 14),
																															child: Row(
																																children: [
																																	IntrinsicWidth(
																																		child: IntrinsicHeight(
																																			child: Container(
																																				decoration: BoxDecoration(
																																					borderRadius: BorderRadius.circular(7),
																																					color: const Color(0x24F5F5F5),
																																				),
																																				padding: const EdgeInsets.all(7),
																																				margin: const EdgeInsets.only( right: 11),
																																				child: Column(
																																					crossAxisAlignment: CrossAxisAlignment.start,
																																					children: [
																																						SizedBox(
																																							width: 21,
																																							height: 21,
																																							child: Image.network(
																																								"https://figma-alpha-api.s3.us-west-2.amazonaws.com/images/a0690f95-94a6-46cf-a7ee-b7443e2b50e7",
																																								fit: BoxFit.fill,
																																							)
																																						),
																																					]
																																				),
																																			),
																																		),
																																	),
																																	IntrinsicWidth(
																																		child: IntrinsicHeight(
																																			child: Container(
																																				margin: const EdgeInsets.symmetric(vertical: 6),
																																				child: Column(
																																					crossAxisAlignment: CrossAxisAlignment.start,
																																					children: [
																																						Container(
																																							margin: const EdgeInsets.only( bottom: 9),
																																							child: const Text(
																																								"Location",
																																								style: TextStyle(
																																									color: Color(0xFFFFFFFF),
																																									fontSize: 9,
																																								),
																																							),
																																						),
																																						const Text(
																																							"Hotel X , Tunisia",
																																							style: TextStyle(
																																								color: Color(0xFFFFFFFF),
																																								fontSize: 10,
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
																														),
																													),
																												),
																												InkWell(
																													onTap: () { print('Pressed'); },
																													child: IntrinsicHeight(
																														child: Container(
																															decoration: BoxDecoration(
																																borderRadius: BorderRadius.circular(11),
																																boxShadow: const [
																																	BoxShadow(
																																		color: Color(0x26F4564C),
																																		blurRadius: 24,
																																		offset: Offset(0, 16),
																																	),
																																],
																																gradient: const LinearGradient(
																																	begin: Alignment(-1, 1),
																																	end: Alignment(1, -1),
																																	colors: [
																																		Color(0xFF8E322C),
																																		Color(0xFFF4564C),
																																	],
																																),
																															),
																															padding: const EdgeInsets.symmetric(vertical: 15),
																															margin: const EdgeInsets.only( bottom: 9, left: 14, right: 14),
																															width: double.infinity,
																															child: const Column(
																																children: [
																																	Text(
																																		"Register Now",
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
																												),
																											]
																										),
																									),
																								),
																							),
																							Positioned(
																								bottom: 0,
																								left: 36,
																								width: 307,
																								height: 250,
																								child: Container(
																									transform: Matrix4.translationValues(0, 243, 0),
																									width: 307,
																									height: 250,
																									child: Image.network(
																										"https://figma-alpha-api.s3.us-west-2.amazonaws.com/images/9e7b6a52-5d73-47e4-b844-adece294763b",
																										fit: BoxFit.fill,
																									)
																								),
																							),
																						]
																					),
																				),
																			),
																		),
																		Container(
																			margin: const EdgeInsets.only( top: 17, bottom: 779, right: 5),
																			width: 15,
																			height: 11,
																			child: Image.network(
																				"https://figma-alpha-api.s3.us-west-2.amazonaws.com/images/1c6dd494-8c8e-4d58-b971-476a69f9ac59",
																				fit: BoxFit.fill,
																			)
																		),
																		Container(
																			margin: const EdgeInsets.only( top: 17, bottom: 779),
																			width: 24,
																			height: 11,
																			child: Image.network(
																				"https://figma-alpha-api.s3.us-west-2.amazonaws.com/images/66ccdc22-b33e-4de7-8e80-8611eaff0a48",
																				fit: BoxFit.fill,
																			)
																		),
																	]
																),
																Positioned(
																	top: 199,
																	right: 16,
																	width: 312,
																	child: IntrinsicHeight(
																		child: Container(
																			width: 312,
																			decoration: const BoxDecoration(
																				image: DecorationImage(
																					image: NetworkImage("https://figma-alpha-api.s3.us-west-2.amazonaws.com/images/65e7e4e0-e263-4076-8451-4f400d78c33b"),
																					fit: BoxFit.cover
																				),
																			),
																			child: Column(
																				crossAxisAlignment: CrossAxisAlignment.start,
																				children: [
																					Container(
																						margin: const EdgeInsets.only( top: 24, bottom: 4, left: 39),
																						child: const Text(
																							"Home",
																							style: TextStyle(
																								color: Color(0xFFFFFFFF),
																								fontSize: 15,
																								fontWeight: FontWeight.bold,
																							),
																						),
																					),
																					IntrinsicWidth(
																						child: IntrinsicHeight(
																							child: Container(
																								margin: const EdgeInsets.only( bottom: 9, left: 20),
																								child: Column(
																									crossAxisAlignment: CrossAxisAlignment.start,
																									children: [
																										const SizedBox(
																											width: 154,
																											child: Text(
																												"Welcome To\nTul’ds 2K25",
																												style: TextStyle(
																													color: Color(0xFFFFFFFF),
																													fontSize: 25,
																													fontWeight: FontWeight.bold,
																												),
																											),
																										),
																										Container(
																											margin: const EdgeInsets.only( left: 19),
																											child: const Text(
																												"Account",
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
																						margin: const EdgeInsets.only( bottom: 10, left: 23, right: 23),
																						width: double.infinity,
																						child: const Text(
																							"Discover more information about the conference",
																							style: TextStyle(
																								color: Color(0xFFFFFFFF),
																								fontSize: 12,
																							),
																						),
																					),
																					Container(
																						margin: const EdgeInsets.only( bottom: 9, left: 43),
																						child: const Text(
																							"Room",
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
																Positioned(
																	top: 171,
																	right: 12,
																	width: 151,
																	height: 203,
																	child: SizedBox(
																		width: 151,
																		height: 203,
																		child: Image.network(
																			"https://figma-alpha-api.s3.us-west-2.amazonaws.com/images/ac4d0d0c-390c-4db8-b848-5644d74f03fc",
																			fit: BoxFit.fill,
																		)
																	),
																),
																Positioned(
																	top: 258,
																	right: 9,
																	width: 125,
																	child: IntrinsicHeight(
																		child: Container(
																			width: 125,
																			decoration: const BoxDecoration(
																				image: DecorationImage(
																					image: NetworkImage("https://figma-alpha-api.s3.us-west-2.amazonaws.com/images/fb991b6d-f84c-4c66-851a-e940e7de7037"),
																					fit: BoxFit.cover
																				),
																			),
																			child: Column(
																				crossAxisAlignment: CrossAxisAlignment.start,
																				children: [
																					InkWell(
																						onTap: () { print('Pressed'); },
																						child: IntrinsicWidth(
																							child: IntrinsicHeight(
																								child: Container(
																									decoration: BoxDecoration(
																										borderRadius: BorderRadius.circular(7),
																										color: const Color(0x00000000),
																										boxShadow: const [
																											BoxShadow(
																												color: Color(0x80292D32),
																												blurRadius: 29,
																												offset: Offset(0, 8),
																											),
																										],
																									),
																									padding: const EdgeInsets.only( top: 9, bottom: 9, left: 23, right: 23),
																									margin: const EdgeInsets.only( top: 61, bottom: 35, left: 6),
																									child: const Column(
																										crossAxisAlignment: CrossAxisAlignment.start,
																										children: [
																											Text(
																												"Discover",
																												style: TextStyle(
																													color: Color(0xFF8E322C),
																													fontSize: 13,
																													fontWeight: FontWeight.bold,
																												),
																											),
																										]
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