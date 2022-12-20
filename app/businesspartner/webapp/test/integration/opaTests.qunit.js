sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'com/moris/businesspartner/businesspartner/test/integration/FirstJourney',
		'com/moris/businesspartner/businesspartner/test/integration/pages/BusinessPartnersList',
		'com/moris/businesspartner/businesspartner/test/integration/pages/BusinessPartnersObjectPage'
    ],
    function(JourneyRunner, opaJourney, BusinessPartnersList, BusinessPartnersObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('com/moris/businesspartner/businesspartner') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheBusinessPartnersList: BusinessPartnersList,
					onTheBusinessPartnersObjectPage: BusinessPartnersObjectPage
                }
            },
            opaJourney.run
        );
    }
);