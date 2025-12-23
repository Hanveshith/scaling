namespace assignment.day10.db;

using { managed } from '@sap/cds/common';
using { assignment.day10.db as db } from './Customer';

define type Status : String enum { Active; Pending; Confirmed; Cancelled };

define entity Orders : managed {
    Key orderid : UUID;
    status : Status;
    customer: Association to db.Customer;
    orderitems : Composition of  many db.OrderItems on orderitems.orders = $self;
}