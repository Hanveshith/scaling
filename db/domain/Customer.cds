namespace assignment.day10.db;

using { managed } from '@sap/cds/common';
using {assignment.day10.db as db } from './OrderItems';

define entity Customer : managed {
    key custid : UUID;
    name : String(40);

    // @assert.format : '/^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/'
    @assert.format : '^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$'
    @assert.format.message: 'Provide valid email'
    email : String(40);
    phone : String(10);
    city : String(30);
    // orders: Association to many db.Orders on orders.customer = $self;
}