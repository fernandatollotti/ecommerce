insert into clients (FirstName, MiddleInitial, LastName, CPF, CNPJ, Address, State) values
('Ana', 'M.', 'Silva', '11111111101', NULL, 'Rua das Flores, 123', 'SP'),
('Carlos', 'A.', 'Souza', '22222222202', NULL, 'Av. Central, 456', 'RJ'),
('Beatriz', 'R.', 'Oliveira', '33333333303', NULL, 'Rua das Acácias, 789', 'MG'),
('Fernando', 'G.', 'Lima', '44444444404', NULL, 'Praça da Paz, 12', 'PR'),
('Juliana', 'F.', 'Mendes', '55555555505', NULL, 'Rua Nova, 34', 'RS'),
('Rodrigo', 'T.', 'Martins', '66666666606', NULL, 'Av. Brasil, 22', 'SP'),
('Camila', 'P.', 'Freitas', '77777777707', NULL, 'Rua Azul, 8', 'BA'),
('Paulo', 'C.', 'Nascimento', '88888888808', NULL, 'Rua da Esperança, 5', 'PE'),
('Larissa', 'B.', 'Costa', '99999999909', NULL, 'Av. das Flores, 77', 'GO'),
('Eduardo', 'J.', 'Ribeiro', '10101010101', NULL, 'Rua das Árvores, 99', 'DF')
('Carlos', NULL, 'Souza', NULL, '77777777000107', 'Rua do Comércio, 99', 'SP'),
('Fernanda', NULL, 'Lima', NULL, '99999999000109', 'Av. das Nações, 303', 'RJ'),
('Rafael', NULL, 'Mendes', NULL, '88888888000155', 'Rua das Indústrias, 11', 'MG'),
('Mariana', NULL, 'Torres', NULL, '66666666000122', 'Av. dos Estilos, 45', 'RS'),
('João', NULL, 'Almeida', NULL, '55555555000133', 'Rua dos Sabores, 22', 'BA');

insert into seller (SocialName, AbstName, CNPJ, CPF, Location, Contact) values
('TechStore LTDA', 'TechStore', '12345678000101', NULL, 'São Paulo', '11999999999'),
('KidsWorld SA', 'KidsWorld', '98765432000102', NULL, 'Rio de Janeiro', '21988888888'),
('FashionHouse LTDA', 'FashionH', '45678912000103', NULL, 'Curitiba', '41977777777'),
('GamesOnline SA', 'GamesO', '65432109000104', NULL, 'Belo Horizonte', '31966666666'),
('MegaMarket LTDA', 'MegaM', '32165487000105', NULL, 'Salvador', '71955555555');

insert into supplier (SocialName, CNPJ, Contact) values
('Distribuidora Alpha', '11111000111', '11911111111'),
('Fornecedora Beta', '22222000122', '21922222222'),
('Indústria Gama', '33333000133', '31933333333'),
('Comercial Delta', '44444000144', '41944444444'),
('Fábrica Épsilon', '55555000155', '51955555555');

insert into productStorage (StorageLocation, State, Quantity) values
('Centro de Distribuição SP - Guarulhos', 'SP', 500),
('Depósito RJ - Duque de Caxias', 'RJ', 350),
('Galpão MG - Contagem', 'MG', 420),
('CD Sul RS - Porto Alegre', 'RS', 300),
('CD Nordeste PE - Recife', 'PE', 280),
('CD Norte AM - Manaus', 'AM', 200),
('CD Centro-Oeste GO - Goiânia', 'GO', 310),
('CD Leste ES - Vitória', 'ES', 260);

insert into product (ProductName, IsKidsClassification, Category, Rating, Size) values
('Smartphone X100', false, 'Eletrônico', 4.5, 'Médio'),
('Camiseta Polo', false, 'Vestimenta', 4.2, 'M'),
('Boneca Fashion', true, 'Brinquedo', 4.8, 'Único'),
('Chocolate Premium', false, 'Alimentos', 4.9, '200g'),
('Notebook Ultra', false, 'Eletrônico', 4.7, '15"'),
('Calça Jeans', false, 'Vestimenta', 4.4, 'G'),
('Carrinho Elétrico', true, 'Brinquedo', 4.6, 'Grande'),
('Biscoito Integral', false, 'Alimentos', 4.3, '300g'),
('Fone de Ouvido', false, 'Eletrônico', 4.1, 'Pequeno'),
('Vestido Floral', false, 'Vestimenta', 4.5, 'M');

insert into payments (ClientID, TypePayment, LimitAvailable) values
(1, 'Cartão de Crédito', 3000),
(2, 'PIX', 0),
(3, 'Boleto', 0),
(4, 'Cartão de Crédito', 5000),
(5, 'PIX', 0),
(6, 'Cartão de Crédito', 1500);

insert into creditCards (PaymentID, CardNumber, CardHolderName, ExpirationDate, CVV) values
(1, '4111111111111111', 'Ana M Silva', '12/28', '123'),
(1, '5500000000000004', 'Ana M Silva', '05/29', '456'),
(4, '4111222233334444', 'Fernando G Lima', '11/27', '789'),
(6, '4000123412341234', 'Rodrigo T Martins', '07/28', '321');

insert into orders (ClientID, OrderStatus, Description, ShippingCost, IsPaidInCash, DeliveryID) values
(1, 'Confirmado', 'Compra de eletrônicos', 25, false, NULL),
(2, 'Em processamento', 'Pedido de roupas', 10, false, NULL),
(3, 'Cancelado', 'Brinquedos variados', 15, false, NULL),
(4, 'Confirmado', 'Alimentos e bebidas', 12, false, NULL),
(5, 'Confirmado', 'Eletrônicos e acessórios', 20, false, NULL);

insert into orderPayments (OrderID, PaymentID, AmountPaid) values
(1, 1, 2550.00),
(2, 2, 320.00),
(3, 3, 0.00),
(4, 4, 180.50),
(5, 6, 950.90);

insert into delivery (Status, TrackingCode) values
('Concluído', 'BR123456789SP'),
('Pendente', 'BR987654321RJ'),
('Em processamento', 'BR555555555MG'),
('Cancelado', 'BR444444444RS'),
('Concluído', 'BR333333333BA');

insert into productSeller (PS_SellerID, PS_ProductID, ProdQuantity) values
(1, 1, 50),
(1, 5, 40),
(2, 3, 80),
(2, 7, 30),
(3, 2, 60),
(3, 6, 45),
(4, 9, 70),
(5, 4, 90),
(5, 8, 55),
(5, 10, 25);

insert into productSupplier (PS_SupplierID, PS_ProductID, Quantity) values
(1, 1, 100),
(2, 2, 120),
(3, 3, 150),
(4, 4, 200),
(5, 5, 80),
(1, 9, 90),
(2, 10, 75);

insert into productOrder (PO_ProductID, PO_OrderID, PO_Quantity, PO_Status) values
(1, 1, 1, 'Disponível'),
(5, 1, 1, 'Disponível'),
(2, 2, 2, 'Disponível'),
(3, 3, 1, 'Sem estoque'),
(4, 4, 3, 'Disponível'),
(9, 5, 2, 'Disponível');

insert into storageLocation (ProductID, StorageLocationID, Location, State) values
(1, 1, 'Centro de Distribuição São Paulo', 'SP'),
(2, 2, 'Depósito Rio de Janeiro', 'RJ'),
(3, 3, 'Galpão Minas Gerais', 'MG'),
(4, 4, 'Centro Logístico Sul', 'RS'),
(5, 1, 'Centro de Distribuição São Paulo', 'SP'),
(6, 2, 'Depósito Rio de Janeiro', 'RJ'),
(7, 3, 'Galpão Minas Gerais', 'MG'),
(8, 4, 'Centro Logístico Sul', 'RS'),
(9, 1, 'Centro de Distribuição São Paulo', 'SP'),
(10, 2, 'Depósito Rio de Janeiro', 'RJ'),
(11, 3, 'Galpão Minas Gerais', 'MG'),
(12, 4, 'Centro Logístico Sul', 'RS'),
(13, 1, 'Centro de Distribuição São Paulo', 'SP'),
(14, 2, 'Depósito Rio de Janeiro', 'RJ'),
(15, 3, 'Galpão Minas Gerais', 'MG'),
(16, 4, 'Centro Logístico Sul', 'RS');


insert into orders (ClientID, OrderStatus, Description, ShippingCost, IsPaidInCash, DeliveryID) values
(1, 'Confirmado', 'Compra de acessórios', 18, false, NULL),
(2, 'Confirmado', 'Pedido de calçados', 15, false, NULL),
(3, 'Em processamento', 'Brinquedos educativos', 20, false, NULL),
(4, 'Confirmado', 'Alimentos saudáveis', 10, false, NULL),
(5, 'Em processamento', 'Eletrônicos pequenos', 22, false, NULL),
(1, 'Cancelado', 'Compra de eletrônicos extras', 30, false, NULL),
(2, 'Confirmado', 'Pedido de roupas adicionais', 12, false, NULL),
(6, 'Confirmado', 'Produtos de higiene', 25, false, NULL),
(7, 'Confirmado', 'Roupas infantis', 18, false, NULL),
(8, 'Confirmado', 'Eletrônicos e acessórios', 20, false, NULL),
(9, 'Confirmado', 'Alimentos e bebidas variadas', 15, false, NULL),
(10, 'Em processamento', 'Brinquedos e acessórios', 18, false, NULL),
(11, 'Confirmado', 'Pedido misto de produtos', 22, false, NULL),
(3, 'Confirmado', 'Brinquedos e jogos educativos', 20, false, NULL),
(4, 'Cancelado', 'Alimentos e bebidas adicionais', 12, false, NULL);

insert into supplier (SocialName, CNPJ, Contact) values
('TechStore LTDA', '12345678000101', '11999999999'),
('KidsWorld SA', '98765432000102', '21988888888'),
('FashionHouse LTDA', '45678912000103', '41977777777'),
('GamesOnline SA', '65432109000104', '31966666666'),
('MegaMarket LTDA', '32165487000105', '71955555555');

insert into storageLocation (ProductID, StorageLocationID, Location, State) values
(1, 1, 'Centro de Distribuição SP', 'SP'),
(2, 2, 'Depósito RJ', 'RJ'),
(3, 3, 'Galpão MG', 'MG'),
(4, 4, 'CD Sul RS', 'RS'),
(5, 5, 'CD Nordeste PE', 'PE'),
(6, 6, 'CD Norte AM', 'AM'),
(7, 7, 'CD Centro-Oeste GO', 'GO'),
(8, 8, 'CD Leste ES', 'ES'),
(9, 1, 'Centro de Distribuição SP', 'SP'),
(10, 2, 'Depósito RJ', 'RJ');
