using OrderService as service from '../srv/order-service';


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
    ]

);
