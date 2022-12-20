namespace com.moris.businesspartner;

using { cuid, managed } from '@sap/cds/common';

aspect MasterData {}

entity Genders : MasterData, cuid, managed {
    name : localized String;
};

entity Types : MasterData, cuid, managed {
    name : localized String;
};

entity Roles : MasterData, cuid, managed {
    name        : localized String;
    description : localized String;
};
