use ecommerce;

-- Quantos pedidos foram feitos por cada cliente?
select  concat(c.FirstName, ' ', c.LastName) Fullname, count(o.OrderID) TotalOrders 
	from clients c 
	left join orders o on c.ClientID = o.ClientID
	group by c.ClientID
	having TotalOrders >= 1
	order by TotalOrders DESC;


-- Algum vendedor também é fornecedor?
select s.SocialName Seller, f.SocialName Supplier, s.CNPJ 
	from seller s 
	join supplier f using(CNPJ);

-- Relação de produtos fornecedores e estoques
select 
    p.ProductName, 
    sup.SocialName as Supplier, 
    ps.Quantity, 
    st.StorageLocation, 
    st.Quantity as StorageQuantity,
    sl.State
from product p 	
join productSupplier ps on p.ProductID = ps.PS_ProductID
join supplier sup on sup.SupplierID = ps.PS_SupplierID
left join storageLocation sl on sl.ProductID = p.ProductID
left join productStorage st on st.StorageID = sl.StorageLocationID;
	
-- Relação de nomes dos fornecedores e nomes dos produtos
select s.SocialName Supplier, p.ProductName Product 
	from Supplier s 
	join productSupplier ps on s.SupplierID = ps.PS_SupplierID
	join product p on p.ProductID = ps.PS_ProductID
	order by s.SocialName;

desc productOrder;

select * from productOrder;

-- Quem comprou o quê, com qual forma de pagamento e total gasto por cada cliente
select o.OrderID, concat(c.FirstName, ' ', c.LastName) Fullname, p.ProductName, po.PO_Quantity Quantity, pay.Typepayment
	from orders o
	join clients c on o.OrderID = c.ClientID
	join productOrder po on o.OrderID = po.PO_OrderID
	join product p on po.PO_ProductID = p.ProductID
	join orderPayments opay on o.OrderID = opay.OrderID
	join payments pay using(PaymentID);

-- Produtos mais vendidos
select p.ProductName, SUM(po.PO_Quantity) TotalSold
	from productOrder po
	join product p on po.PO_ProductID = p.ProductID
	group by p.ProductID
	order by TotalSold desc;


-- Quais são Pessoa Física ou Pessoa Jurídica
select 
	case 
		when CPF is not null then 'Pessoa Física'
		else 'Pessoa Jurídica'
	end as TypeClient,
	count(*) Quantity
	from clients c
	group by Typeclient;

-- Total gasto por cliente
select c.FirstName AS Client,round(sum(op.AmountPaid), 2) AS Total
	from clients c
	join orders o on o.ClientID = c.ClientID
	join orderPayments op on op.OrderID = o.OrderID
	group by c.ClientID, c.FirstName
	order by Total desc;
