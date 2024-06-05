class CleanupSolution {
  final String id;
  final String name;
  final String description;
  final String image;
  final String since;
  final CleanupStatus status;
  final String statusDescription;
  final int totalTrashCollected;
  final List<String> imagesGallery;

  CleanupSolution({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.since,
    required this.status,
    required this.statusDescription,
    required this.imagesGallery,
    this.totalTrashCollected = 0,
  });

  static List<CleanupSolution> getList() {
    return [
      CleanupSolution(
          id: '1',
          name: 'Kingston Harbour, Kingston, Jamaica',
          description: """
        We are deploying Interceptor Barriers at the mouth of the gullies and Interceptor Tenders to collect the waste.
        We now have barriers in 7 gullies, with the plan to expand to 11 in total. This is our first project using Interceptor Barriers and Tenders. 
        We are glad to be receiving such great support and momentum from our local partners and we look forward to advancing from pilot to full coverage soon.
    """,
          image: 'image_1.png',
          since: 'February 15, 2022',
          status: CleanupStatus.inOperation,
          statusDescription: 'In Operation',
          imagesGallery: [
            'image_1_gallery_1.jpg',
            'image_1_gallery_2.jpg',
            'image_1_gallery_3.jpg',
            'image_1_gallery_4.jpg',
            'image_1_gallery_5.jpg',
          ]),
      CleanupSolution(
          id: '2',
          name: 'System 03',
          description: """ 
          System 03 is 2.2 km (~1.4 miles) and was deployed for the first time in August 2023.
           We have been gradually extending and improving to reach this stage, transitioning from System 002 since July 2022.
           Operating at this length requires its learning process for the crew offshore and onshore.
        """,
          image: 'image_2.png',
          since: 'May 26, 2024',
          status: CleanupStatus.harvesting,
          statusDescription: 'Harvesting',
          totalTrashCollected: 389,
          imagesGallery: [
            'image_2_gallery_1.jpg',
            'image_2_gallery_2.jpg',
            'image_2_gallery_3.jpg',
            'image_2_gallery_4.jpg',
          ]),
      CleanupSolution(
          id: '3',
          name: 'Interceptor 007',
          description: """ 
           Ballona Creek is situated in Los Angeles County, flowing out into the Pacific Ocean next to Venice Beach. 
           Although this creek is just outside the list of the 1000 most polluting rivers globally, it is still a river with a significant amount of trash flowing into the ocean
        """,
          image: 'image_3.png',
          since: ' October 5, 2022',
          status: CleanupStatus.inOperation,
          statusDescription: 'In Operation',
          imagesGallery: [
            'image_3_gallery_1.jpg',
            'image_3_gallery_2.jpg',
          ]),
      CleanupSolution(
          id: '4',
          name: 'Interceptor 004',
          description: """ 
          Interceptor 004 was built in the Netherlands so we could efficiently test the design near our HQ;
          it is also the same system used to unveil our river technology to the world in October 2019. 
          Its intended destination was much further away, namely the Dominican Republic’s Rio Ozama.
        """,
          image: 'image_4.png',
          since: 'February 21, 2024',
          status: CleanupStatus.inMaintenance,
          statusDescription: 'In Maintenance',
          imagesGallery: [
            'image_4_gallery_1.jpg',
            'image_4_gallery_2.jpg',
            'image_4_gallery_3.jpg',
            'image_4_gallery_4.jpg',
          ]),
    ];
  }
}

enum CleanupStatus { inOperation, harvesting, inMaintenance }
