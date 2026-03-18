import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school_management/authentication/Fees/fees_provider.dart';
import 'package:school_management/constant/colors.dart';
import 'package:school_management/constant/themes/text_themes.dart';

import '../../common_widgets/common_top_appbar.dart';
import '../../constant/sizes.dart';
import '../manu/profile_menu_screen.dart';
import 'PaymentOptionsScreen.dart';


class FeesScreen extends StatefulWidget {
  const FeesScreen({super.key});

  @override
  State<FeesScreen> createState() => _FeesScreenState();
}

class _FeesScreenState extends State<FeesScreen>
    with SingleTickerProviderStateMixin {

  late TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 2, vsync: this);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<FeesProvider>(context, listen: false);
      provider.fetchHistory();
      provider.fetchUnpaid();
    });
  }

  @override
  Widget build(BuildContext context) {

    final textTheme = TTextTheme.lightTextTheme;

    return Scaffold(
      drawer: const ProfileDrawer(),   // Drawer yaha add hota hai

      backgroundColor: whiteColor,
      appBar: CommonTopAppBar(
        title: "Fees",
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Container(
         //   margin: const EdgeInsets.all(12),
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(16),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: TabBar(
              controller: _tabController,
              indicator: BoxDecoration(
                color: appColor,
                borderRadius: BorderRadius.circular(12),
              ),
              labelColor: whiteColor,
              unselectedLabelColor: appColor,
              dividerColor: Colors.transparent,
              indicatorSize: TabBarIndicatorSize.tab,
              tabs: const [
                Tab(text: 'Payment History'),
                Tab(text: 'Unpaid Invoice'),
              ],
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [

          /// Payment History
          Consumer<FeesProvider>(
            builder: (context, provider, _) {

              final history = provider.historyData?.payments?.data ?? [];

              if (provider.isLoading && history.isEmpty) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (history.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.receipt_long,
                          size: HRSizes.iconLg,
                          color: greyColor),
                      const SizedBox(height: HRSizes.sm),
                      Text(
                        'No Payment History',
                        style: textTheme.bodyMedium,
                      ),
                    ],
                  ),
                );
              }

              return ListView.builder(
                padding: const EdgeInsets.all(HRSizes.md),
                itemCount: history.length,
                itemBuilder: (context, index) {

                  final item = history[index];

                  return Card(
                    elevation: HRSizes.cardElevation,
                    margin: const EdgeInsets.only(
                        bottom: HRSizes.spaceBtwItems),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          HRSizes.cardRadiusMd),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(HRSizes.md),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Text(
                            'Payment ID: ${item.id ?? '-'}',
                            style: textTheme.titleMedium,
                          ),

                          const SizedBox(height: HRSizes.sm),

                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [

                              Text(
                                'Amount: ${item.amount ?? '-'}',
                                style: textTheme.bodyMedium,
                              ),

                              Text(
                                'Date: ${item.date ?? '-'}',
                                style: textTheme.bodySmall,
                              ),

                              Text(
                                'Method: ${item.method ?? '-'}',
                                style: textTheme.bodySmall,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),

          /// Unpaid Invoice
          Consumer<FeesProvider>(
            builder: (context, provider, _) {

              final invoices = provider.unpaidData?.invoices?.data ?? [];

              if (provider.isLoading && invoices.isEmpty) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (invoices.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.receipt_long,
                          size: HRSizes.iconLg,
                          color: greyColor),
                      const SizedBox(height: HRSizes.sm),
                      Text(
                        'No Unpaid Invoices',
                        style: textTheme.bodyMedium,
                      ),
                    ],
                  ),
                );
              }

              return ListView.builder(
                padding: const EdgeInsets.all(HRSizes.md),
                itemCount: invoices.length,
                itemBuilder: (context, index) {

                  final item = invoices[index];

                  return Card(
                    elevation: HRSizes.cardElevation,
                    margin: const EdgeInsets.only(
                        bottom: HRSizes.spaceBtwItems),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          HRSizes.cardRadiusMd),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(HRSizes.md),
                      child: Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: [

                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [

                              Text(
                                'Issued: ${item.dateIssued ?? '-'}',
                                style: textTheme.labelMedium
                                    ?.copyWith(color: appColor),
                              ),

                              Text(
                                'Due: ${item.dueDate ?? '-'}',
                                style: textTheme.labelMedium
                                    ?.copyWith(color: appColor),
                              ),
                            ],
                          ),

                          const SizedBox(height: HRSizes.sm),

                          Text(
                            item.invoiceTitle ?? '',
                            style: textTheme.titleMedium,
                          ),

                          Text(
                            'Invoice No: ${item.invoiceNumber ?? '-'}',
                            style: textTheme.bodySmall,
                          ),

                          const SizedBox(height: HRSizes.sm),

                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [

                              Text(
                                'Payable: ${item.payable ?? '-'}',
                                style: textTheme.bodyMedium
                                    ?.copyWith(color: redColor),
                              ),

                              Text(
                                'Paid: ${item.paid ?? '-'}',
                                style: textTheme.bodyMedium
                                    ?.copyWith(color: greenColor),
                              ),

                              Text(
                                'Status: ${item.statusText ?? '-'}',
                                style: textTheme.bodySmall,
                              ),
                            ],
                          ),

                          const SizedBox(height: HRSizes.sm),

                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [

                              Text(
                                'Due: ${item.due ?? '-'}',
                                style: textTheme.titleMedium
                                    ?.copyWith(color: appColor),
                              ),

                              if (item.showPayNow == true)
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: appColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(HRSizes.buttonRadius),
                                    ),
                                  ),
                                  onPressed: () {
                                    // Navigate to Payment Options
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => PaymentOptionsScreen(
                                          invoiceId: item.invoiceNumber ?? '-',
                                          amount: item.payable ?? '0',
                                        ),
                                      ),
                                    );
                                  },
                                  child: const Text(
                                    'Pay Now',
                                    style: TextStyle(
                                      color: whiteColor,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}