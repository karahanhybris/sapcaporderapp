using OrderService as service from '../srv/order-service';

annotate OrderService.Orders with @odata.draft.enabled;
annotate OrderService.Orders with @Common.SemanticKey: [OrderCode];
annotate OrderService.Orders with @Capabilities.Deletable: false;

annotate service.Orders with @(
    UI.LineItem:[
        {
            $Type: 'UI.DataField',
            Value: OrderCode,
            Label: '{i18n>OrderCode}'
        },
        {
            $Type: 'UI.DataField',
            Value: to_Customer.CustomerID,
            Label: '{i18n>CustomerID}'
        },
        {
            $Type: 'UI.DataField',
            Value: CountryCode.name,
            Label: '{i18n>Country}',
        },
        {
            $Type: 'UI.DataField',
            Value: OrderStatu.name,
            Label: '{i18n>OrderStatu}',
        },
        {
            $Type: 'UI.DataField',
            Value: OrderType.name,
            Label: '{i18n>OrderType}',
        },
        {
            $Type: 'UI.DataField',
            Value: TotalPrice,
            Label: '{i18n>TotalPrice}'
        }
    ],
    UI.FieldGroup #General: {
        Label: 'General',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: OrderCode,
                Label: '{i18n>OrderCode}'
            },
            {
                $Type: 'UI.DataField',
                Value: Distributor,
                Label:'{i18n>Distributor}'
            },
            {
                $Type: 'UI.DataField',
                Value: Dealer
            },
            {
                $Type: 'UI.DataField',
                Value: CountryCode.name,
                Label: '{i18n>Country}',
            }
        ]
    },
    UI.FieldGroup #WizardGeneral: {
        Label: 'General',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: OrderCode,
                Label: '{i18n>OrderCode}'
            },
            {
                $Type: 'UI.DataField',
                Value: Distributor
            },
            {
                $Type: 'UI.DataField',
                Value: Dealer
            },
            {
                $Type: 'UI.DataField',
                Value: CountryCode_code
            }
        ]
    },
    UI.FieldGroup #TotalPriceDetail: {
        Label: 'TotalPriceDetail',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: OrderType.name,
                Label:'{i18n>OrderType}'
            },
            {
                $Type: 'UI.DataField',
                Value: OrderStatu.name,
                Label:'{i18n>OrderStatu}'
            },
            {
                $Type: 'UI.DataField',
                Value: CurrencyCode.name,
                Label:'{i18n>CurrencyUnit}'
            },
            {
                $Type: 'UI.DataField',
                Value: TotalPrice,
                Label:'{i18n>TotalPrice}'
            }
        ]
    },
    UI.FieldGroup #WizardTotalPriceDetail: {
        Label: 'TotalPriceDetail',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: OrderType_code
            },
            {
                $Type: 'UI.DataField',
                Value: OrderStatu_code
            },
            {
                $Type: 'UI.DataField',
                Value: CurrencyCode_code,
                Label:'{i18n>CurrencyUnit}'
            },
            {
                $Type: 'UI.DataField',
                Value: TotalPrice
            }
        ]
    },
    UI.FieldGroup #CustomerDetail: {
        Label: 'CustomerDetail',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: to_Customer.Title
            },
            {
                $Type: 'UI.DataField',
                Value: to_Customer.FirstName
            },
            {
                $Type: 'UI.DataField',
                Value: to_Customer.LastName
            },
            {
                $Type: 'UI.DataField',
                Value: to_Customer.City
            },
            {
                $Type: 'UI.DataField',
                Value: to_Customer.CountryCode.name,
                Label:'{i18n>Country}'
            }
        ]
    },
    UI.FieldGroup #WizardCustomerDetail: {
        Label: 'CustomerDetail',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: to_Customer_CustomerID
            }
        ]
    }

);

annotate service.Orders with @(UI.SelectionFields: [to_Customer_CustomerID,OrderStatu_code,OrderType_code,CurrencyCode_code]);
