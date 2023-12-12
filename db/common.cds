using {sap,managed} from '@sap/cds/common';

extend sap.common.Currencies with {
  numcode  : Integer;
  exponent : Integer; //> e.g. 2 --> 1 Dollar = 10^2 Cent
  minor    : String; //> e.g. 'Cent'
}


aspect custom.managed {
  createdAt     : managed:createdAt;
  createdBy     : managed:createdBy;
  LastChangedAt : managed:modifiedAt;
  LastChangedBy : managed:modifiedBy;
}