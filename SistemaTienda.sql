create table Usuarios(
	idUsuario int not null auto_increment,
    Nombre varchar(45) not null,
    Usuario varchar(45) not null,
    Clave varchar(45) not null,
    Perfil varchar(45) not null,
    primary key(idUsuario)
);

 create table Lineas(
	idLineas int not null auto_increment,
    Nombre varchar(45) not null,
    primary key(idLineas)
);

 create table Proveedores(
    idProveedores int not null auto_increment,
    Nombre varchar(45) not null,
    Telefono varchar(45) not null,
    Domicilio varchar(45) not null,
    primary key(IdProveedores)
);
 create table Almacen(
    idAlmacen int not null auto_increment,
    idLineas int not null,
    Descripcion varchar(45) not null,
    Stock int not null,
    UMedida varchar(45) not null,
    PUnitario decimal(10,2) not null,
    primary key(idAlmacen),
    foreign key(idLineas) references Lineas(idLineas)
);

 create table Facturas(
    idFacturas int not null auto_increment,
    idLineas int not null,
    idProveedores int not null,
    fechaEntrada date not null,
    primary key(idFacturas),
    foreign key(idLineas) references Lineas(idLineas),
    foreign key(idProveedores) references Proveedores(idProveedores)
);
create table DetalleFactura(
    idDetalleFact int not null auto_increment,
    idFacturas int not null,
    idMateriales int not null,
    cantidad int not null,
    total decimal(10,2) not null,
    primary key(idDetalleFact),
    foreign key(idFacturas) references Facturas(idFacturas),
    foreign key(idMateriales) references Almacen(idAlmacen)
);

 create table Areas(
    idArea int not null auto_increment,
    nombre varchar(45) not null,
    primary key(idArea)
);
    
create table Recibo(
    idRecibo int not null auto_increment,
    idArea int not null,
    FechaSalida date not null,
    PersonaRecibe varchar(45) not null,
    PersonaSalida varchar(45) not null,
    primary key(idRecibo),
    foreign key(idArea) references Areas(idArea)
);
    
create table DetalleRecibos(
    idDetalleRecibo int not null auto_increment,
    idRecibo int not null,
    idAlmacen int not null,
    Cantidad int not null,
    primary key(idDetalleRecibo),
    foreign key(idRecibo) references Recibo(idRecibo),
    foreign key(idAlmacen) references Almacen(idAlmacen)
);





