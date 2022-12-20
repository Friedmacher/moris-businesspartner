using { com.moris.businesspartner as my } from '../db/schema';

@path: 'service/bupa'
service BupaService {
    entity BusinessPartners as projection on my.BusinessPartners;

    annotate my.MasterData with @cds.autoexpose @readonly;
    annotate BusinessPartners with @odata.draft.enabled;

        
}
