namespace assignment.day10.db;

using { managed } from '@sap/cds/common';
using { assignment.day10.db as db } from './Orders';
using { assignment.day10.db as db1 } from './Items';

define entity OrderItems : managed {
    key orditmid : UUID;
    quantity : Decimal(4,2);
    totalprice: Decimal(10,2);
    orders: Association to db.Orders;
    item: Association to db1.Items
}

