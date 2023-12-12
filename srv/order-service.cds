using {sap.hybris.cap.order as srv } from '../db/maindata';

service OrderService @(path:'/orders'){
    entity Orders as projection on srv.Orders;
    entity Customer as projection on srv.Customer;
}