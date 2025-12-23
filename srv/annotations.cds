using {assignment.day10.db as db} from './mainService';
// using {assignment.day10.db.Orders as Orders} from './mainService';
// annotate db.Items.imageurl with @UI.IsImageURL: true;

annotate db.Customer with @(UI: {
    HeaderInfo: {
        $Type         : 'UI.HeaderInfoType',
        TypeName      : 'Customer',
        TypeNamePlural: 'Orders',
        Title         : {Value: name},
        Description   : {Value: custid}
    },

    LineItem  : [
        {
            $Type: 'UI.DataField',
            Label : '{i18n>CustomerId}',
            Value: custid,
        },
        {
            $Type: 'UI.DataField',
            Label : 'Customer Name',
            Value: name,
        },
        {
            $Type: 'UI.DataField',
            Label : 'City',
            Value: city,
        },
    ],

    Facets    : [{
        $Type : 'UI.ReferenceFacet',
        Label : 'Orders',
        Target: 'orders/@UI.LineItem',
    }, ],
});


annotate db.Orders with @(UI: {
    HeaderInfo          : {
        $Type         : 'UI.HeaderInfoType',
        TypeName      : 'Order',
        TypeNamePlural: 'Orders',
        Title         : {Value: orderid},
        Description   : {Value: status}
    },

    LineItem: [
        {
            $Type: 'UI.DataField',
            Label: 'OrderId',
            Value: orderid,
        },
        {
            $Type: 'UI.DataField',
            Label: 'Status',
            Value: status,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Ordered Time',
            Value : createdAt,
        },
    ],

    Facets              : [{
        $Type : 'UI.ReferenceFacet',
        Label : 'Order Items',
        Target: 'orderitems/@UI.LineItem',
    }, ],
});


annotate db.OrderItems with @(UI: {
    HeaderInfo         : {
        $Type         : 'UI.HeaderInfoType',
        TypeName      : 'Ordered Item',
        TypeNamePlural: 'Ordered Items',
        Title         : {Value: orditmid},
        Description   : {Value: createdAt}
    },
    LineItem : [
        {
            $Type: 'UI.DataField',
            Label : 'ID',
            Value: orditmid,
        },
                {
            $Type : 'UI.DataField',
            Label : 'Image',
            Value : item.imageurl,
        },
        {
            $Type: 'UI.DataField',
            Label : 'Quantity',
            Value: quantity,
        },
        {
            $Type: 'UI.DataField',
            Label : 'TotalPrice',
            Value: totalprice,
        }
    ],

    Facets             : [{
        $Type : 'UI.ReferenceFacet',
        Target: 'item/@UI.FieldGroup#details'
    }]

});

annotate db.Items with @(UI: {
    HeaderInfo: {
        $Type         : 'UI.HeaderInfoType',
        TypeName      : 'Item Details',
        TypeNamePlural: 'Item Details',
        Title         : {Value: name},
        Description   : {Value: description}
    },

    Facets    : [{
        $Type : 'UI.ReferenceFacet',
        Label : 'Item Details',
        Target: '@UI.FieldGroup#details'
    }],

    FieldGroup: {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: itemid
            },
            {
                $Type: 'UI.DataField',
                Value: name
            },
            {
                $Type: 'UI.DataField',
                Value: price
            },
            {
                $Type: 'UI.DataField',
                Value: modifiedBy
            }
        ]
    }
});
