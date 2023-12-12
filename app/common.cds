using {Currency} from '../db/common';

annotate cds.UUID with  @Core.Computed  @odata.Type: 'Edm.String';
annotate Currency with @Common.UnitSpecificScale: 'Decimals';