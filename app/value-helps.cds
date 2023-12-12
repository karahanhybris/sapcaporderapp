using {sap.hybris.cap.order as schema} from '../db/maindata';

annotate schema.Orders{

    //to show as a combobox list
    OrderStatu @Common.ValueListWithFixedValues;

    OrderType @Common.ValueListWithFixedValues;

    CurrencyCode @Common.ValueList: {
        CollectionPath: 'Currencies',
        Label         : '',
        Parameters    : [
                            {
                                $Type            : 'Common.ValueListParameterInOut',
                                LocalDataProperty: CurrencyCode_code,
                                ValueListProperty: 'code'
                            },
                            {
                                $Type            : 'Common.ValueListParameterDisplayOnly',
                                ValueListProperty: 'name'
                            },
                            {
                                $Type            : 'Common.ValueListParameterDisplayOnly',
                                ValueListProperty: 'descr'
                            },
                            {
                                $Type            : 'Common.ValueListParameterDisplayOnly',
                                ValueListProperty: 'symbol'
                            },
                            {
                                $Type            : 'Common.ValueListParameterDisplayOnly',
                                ValueListProperty: 'minor'
                            }
        ]
    };

    CountryCode @Common.ValueList: {
        CollectionPath: 'Countries',
        Label         : '',
        Parameters    : [
                            {
                                $Type            : 'Common.ValueListParameterInOut',
                                LocalDataProperty: CountryCode_code,
                                ValueListProperty: 'code'
                            },
                            {
                                $Type            : 'Common.ValueListParameterDisplayOnly',
                                ValueListProperty: 'name'
                            },
                            {
                                $Type            : 'Common.ValueListParameterDisplayOnly',
                                ValueListProperty: 'descr'
                            }
        ]
    };
    
    //--customid value helps
    to_Customer  @Common.ValueList: {
        CollectionPath: 'Customer',
        Label         : 'Customer ID',
        Parameters    : [
                            {
                                $Type            : 'Common.ValueListParameterInOut',
                                LocalDataProperty: to_Customer_CustomerID,
                                ValueListProperty: 'CustomerID'
                            },
                            {
                                $Type            : 'Common.ValueListParameterDisplayOnly',
                                ValueListProperty: 'FirstName'
                            },
                            {
                                $Type            : 'Common.ValueListParameterDisplayOnly',
                                ValueListProperty: 'LastName'
                            },
                            {
                                $Type            : 'Common.ValueListParameterDisplayOnly',
                                ValueListProperty: 'Title'
                            },
                            {
                                $Type            : 'Common.ValueListParameterDisplayOnly',
                                ValueListProperty: 'Street'
                            },
                            {
                                $Type            : 'Common.ValueListParameterDisplayOnly',
                                ValueListProperty: 'PostalCode'
                            },
                            {
                                $Type            : 'Common.ValueListParameterDisplayOnly',
                                ValueListProperty: 'City'
                            },
                            {
                                $Type            : 'Common.ValueListParameterDisplayOnly',
                                ValueListProperty: 'CountryCode_code'
                            },
                            {
                                $Type            : 'Common.ValueListParameterDisplayOnly',
                                ValueListProperty: 'PhoneNumber'
                            },
                            {
                                $Type            : 'Common.ValueListParameterDisplayOnly',
                                ValueListProperty: 'EMailAddress'
                            }
                        ]
    };
}
