namespace assignment.day10.db;

using { managed } from '@sap/cds/common';

define entity Items : managed {
    key itemid : UUID;
    name : String(35);
    description : String(75);
    price : Decimal(10, 2);
    // @UI.IsImageURL: true
    @Core.IsURL @Core.MediaType 
    imageurl : String ;
}
