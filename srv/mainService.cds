using { assignment.day10.db as db } from '../db/domain/OrderItems';

define service mainService{

    entity Customer as projection on db.Customer;
    @Capabilities : { 
        Readable,
        Updatable,
     }
    entity Items as projection on db.Items;
    @restrict:[
        {grant: ['READ','WRITE'], to : 'ADMIN'}
    ]
    entity Orders as projection on db.Orders;
    entity OrderItems as projection on db.OrderItems;
}

