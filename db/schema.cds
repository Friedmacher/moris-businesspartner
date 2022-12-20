namespace com.moris.businesspartner;

using { cuid, managed, temporal, sap, Country } from '@sap/cds/common';
using { com.moris.businesspartner.Genders,
        com.moris.businesspartner.Types,
        com.moris.businesspartner.Roles} from './masterdata';


entity BusinessPartners : cuid, managed {
    companyname   : String;
    firstname     : String;
    middlename    : String;
    lastname      : String;
    nickname      : String;
    department    : String;
    jobtitle      : String;
    notes         : String;
    prefix        : String;
    suffix        : String;
    taxnumber     : String;
    birthday      : Date;
    gender        : Association to Genders;
    type          : Association to Types;
    assignedroles : Composition of many AssignedRoles on assignedroles.businesspartner = $self;    
}

entity AssignedRoles : cuid, managed, temporal {
    businesspartner : Association to BusinessPartners;
    role            : Association to Roles;
}
