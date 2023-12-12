using {sap.hybris.cap.order as schema} from '../db/maindata';

annotate schema.Orders with @title : '{i18n>Orders}'{
   // OrderUUID       @UI.Hidden;
  OrderCode       @title     : '{i18n>OrderCode}';
  OrderType       @title     : '{i18n>OrderType}';
  OrderStatu      @title     : '{i18n>OrderStatu}';
  Distributor     @title     : '{i18n>Distributor}';
  Dealer          @title     : '{i18n>Dealer}';
  CountryCode     @title     : '{i18n>Country}' @Common.Text:CountryCode.name;
  CurrencyCode    @title     : '{i18n>CurrencyUnit}'         ;
  TotalPrice      @title     : '{i18n>TotalPrice}' @Measures.ISOCurrency : CurrencyCode.symbol ;
  to_Customer     @title     : '{i18n>CustomerID}'  ;
} 

annotate schema.Customer with @title: '{i18n>Customer}' {
  CustomerID   @title                : '{i18n>CustomerID}' @Common.Text: LastName;
  FirstName    @title                : '{i18n>FirstName}';
  LastName     @title                : '{i18n>LastName}';
  Title        @title                : '{i18n>Title}';
  Street       @title                : '{i18n>Street}';
  PostalCode   @title                : '{i18n>PostalCode}';
  City         @title                : '{i18n>City}';
  CountryCode  @title                : '{i18n>Country}'     @Common.Text: CountryCode.name;
  PhoneNumber  @title                : '{i18n>PhoneNumber}';
  EMailAddress @title                : '{i18n>EMailAddress}';
}