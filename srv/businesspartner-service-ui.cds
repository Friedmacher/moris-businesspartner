using BupaService from './businesspartner-service';

annotate BupaService.BusinessPartners with {
    companyname @title : '{i18n>companyname}';
    firstname   @title : '{i18n>firstname}';
    middlename  @title : '{i18n>middlename}';
    lastname    @title : '{i18n>lastname}';
    nickname    @title : '{i18n>nickname}';
    fullname    @title : '{i18n>fullname}';
    department  @title : '{i18n>department}';
    jobtitle    @title : '{i18n>jobtitle}';
    notes       @title : '{i18n>notes}';
    prefix      @title : '{i18n>prefix}';
    suffix      @title : '{i18n>suffix}';
    taxnumber   @title : '{i18n>taxnumber}';
    birthday    @title : '{i18n>birthday}';
    gender      @title : '{i18n>gender}';
    type        @title : '{i18n>type}';
};

annotate BupaService.BusinessPartners with @(
    UI: {
        HeaderInfo: {
			TypeName: '{i18n>bupa}',
			TypeNamePlural: '{i18n>bupas}',
            ImageUrl: image,
			Title          : {
                $Type : 'UI.DataField',
                Value : fullname
            },
			Description : {
				$Type: 'UI.DataField',
				Value: companyname
			}
		},
        Identification: [
            {
                $Type : 'UI.DataFieldForAction',
                Label : 'Copy with new supplier',
                Action : 'doCopy',
                ![@UI.Importance] : #High
            }
        ],
        LineItem: [
            {Value: companyname},
            {Value: firstname},
            {Value: lastname},
        ],
        Facets: [
            {$Type: 'UI.ReferenceFacet', Label: '{i18n>persondata}', Target: '@UI.FieldGroup#PersonData'},
            {$Type: 'UI.ReferenceFacet', Label: '{i18n>companydata}', Target: '@UI.FieldGroup#CompanyData'},
            {$Type: 'UI.ReferenceFacet', Label: '{i18n>organization}', Target: '@UI.FieldGroup#Organization'},
            {$Type: 'UI.ReferenceFacet', Label: '{i18n>notes}', Target: '@UI.FieldGroup#Notes'},
        ],
        FieldGroup#PersonData: {
            Data: [
                {Value: firstname},
                {Value: middlename},
                {Value: lastname},
                {Value: nickname},
                {Value: prefix},
                {Value: suffix},
                {Value: gender_ID},
                {Value: birthday}
            ]
        },
        FieldGroup#CompanyData: {
            Data: [
                {Value: companyname},
                {Value: department},
                {Value: jobtitle},
                {Value: taxnumber}
            ]
        },
        FieldGroup#Organization: {
			Data: [
				{Value: type_ID}
			]
		},
        FieldGroup#Notes: {
            Data: [
                {Value: notes}
            ]
        }
    }
);

annotate BupaService.BusinessPartners with {
    gender @(
        Common: {
            Text: gender.name, TextArrangement : #TextOnly,
            ValueList: {
				Label: '{i18n>gender}',
				CollectionPath: 'Genders',
				Parameters: [
					{ $Type: 'Common.ValueListParameterInOut',
						LocalDataProperty: gender_ID,
						ValueListProperty: 'ID'
					},
					{ $Type: 'Common.ValueListParameterDisplayOnly',
						ValueListProperty: 'name'
					}
				]
			}
        }
    );
    type @(
        Common: {
            Text: type.name, TextArrangement : #TextOnly,
            ValueList: {
				Label: '{i18n>type}',
				CollectionPath: 'Types',
				Parameters: [
					{ $Type: 'Common.ValueListParameterInOut',
						LocalDataProperty: type_ID,
						ValueListProperty: 'ID'
					},
					{ $Type: 'Common.ValueListParameterDisplayOnly',
						ValueListProperty: 'name'
					}
				]
			}
        }
    )
}
