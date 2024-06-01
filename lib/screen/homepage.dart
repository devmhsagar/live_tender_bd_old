import 'package:flutter/material.dart';
import 'package:live_tender_bd/screen/tenderDetails.dart';

class TenderListScreen extends StatelessWidget {
  final List<Tender> tenders = [
    Tender(
      id: '555555',
      type: 'OTM',
      description:
          'Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem >See More',
      department: 'LGED',
      location: 'Bhola',
      lastDate: '25/06/22',
      docPrice: 1000,
      tenderSecurity: 50000,
      liquid: 20000,
      similar: 300000,
      turnover: 5000000,
      tenderCapacity: 2000000,
      others: '',
    ),
    Tender(
      id: '555556',
      type: 'LTM',
      description: 'Lorem Ipsum Lorem Ipsum Lorem Ipsum',
      department: 'LGED',
      location: 'Bhola',
      lastDate: '25/06/22',
      docPrice: 1000,
      tenderSecurity: 50000,
      liquid: 20000,
      similar: 300000,
      turnover: 5000000,
      tenderCapacity: 2000000,
      others: '',
    ),
    Tender(
      id: '555557',
      type: 'OSTETM',
      description: 'Lorem Ipsum Lorem Ipsum Lorem Ipsum',
      department: 'LGED',
      location: 'Bhola',
      lastDate: '25/06/22',
      docPrice: 1000,
      tenderSecurity: 50000,
      liquid: 20000,
      similar: 300000,
      turnover: 5000000,
      tenderCapacity: 2000000,
      others: '',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              'assets/images/splash_logo.png',
              height: 40,
              width: 40,
            ),
            const SizedBox(width: 8),
            const Text('Live Tender BD'),
            const Spacer(),
            IconButton(
              icon: const Icon(Icons.notifications),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.account_circle),
              onPressed: () {},
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search),
                      hintText: 'Search',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.grey[200],
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  icon: const Icon(Icons.filter_list),
                  onPressed: () {},
                ),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: tenders.length,
                itemBuilder: (context, index) {
                  return TenderCard(
                    tender: tenders[index],
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              TenderDetailScreen(tender: tenders[index]),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Tender {
  final String id;
  final String type;
  final String description;
  final String department;
  final String location;
  final String lastDate;
  final int docPrice;
  final int tenderSecurity;
  final int liquid;
  final int similar;
  final int turnover;
  final int tenderCapacity;
  final String others;

  Tender({
    required this.id,
    required this.type,
    required this.description,
    required this.department,
    required this.location,
    required this.lastDate,
    required this.docPrice,
    required this.tenderSecurity,
    required this.liquid,
    required this.similar,
    required this.turnover,
    required this.tenderCapacity,
    required this.others,
  });
}

class TenderCard extends StatelessWidget {
  final Tender tender;
  final VoidCallback onTap;

  const TenderCard({Key? key, required this.tender, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.black,
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Tender ID-${tender.id}',
                      style: const TextStyle(color: Colors.white)),
                  Text(tender.type,
                      style: const TextStyle(color: Colors.white)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Description: ${tender.description}'),
                  const SizedBox(height: 8),
                  Text('Department: ${tender.department}'),
                  const SizedBox(height: 8),
                  Text('Location: ${tender.location}'),
                  const SizedBox(height: 8),
                  Text('LastDate: ${tender.lastDate}'),
                  const SizedBox(height: 8),
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: onTap,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                child: const Text('Click Details',
                    style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
