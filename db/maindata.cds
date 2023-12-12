using {Currency,Country,custom.managed,sap} from './common';

namespace sap.hybris.cap.order;

entity Orders : managed { 
  key OrderCode    : String(12) @Core.Computed;
      OrderType    : Association to  OrderTypes;
      OrderStatu   : Association to OrderStatus;
      Distributor  : String(20);
      Dealer       : String(20);
      CountryCode  : Country;
      CurrencyCode : Currency;
      TotalPrice   : Decimal(16, 3);
      to_Customer  : Association to Customer;
};

entity Customer : managed {
  key CustomerID   : String(10) @Core.Computed;
      FirstName    : String(40);
      LastName     : String(40);
      Title        : String(10);
      Street       : String(60);
      PostalCode   : String(10);
      City         : String(40);
      CountryCode  : Country;
      PhoneNumber  : String(30);
      EMailAddress : String(256);
      linkToOrders:Association to many Orders on linkToOrders.to_Customer=$self;
};

entity OrderStatus : sap.common.CodeList {
  key code : String enum {
        Created         = 'CD';
        Ready           = 'RY';
        OnHold          = 'OH';
        FraudChecked    = 'FC';
      };
}

entity OrderTypes : sap.common.CodeList {
  key code : String enum {
        Normal        = 'NL';
        BulkOrder     = 'BO';
        DropShipment  = 'DS';
        NoStock       = 'NS';
      };
}