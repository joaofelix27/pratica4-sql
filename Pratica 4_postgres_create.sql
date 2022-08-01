CREATE TABLE "public.usuários" (
	"Id" serial NOT NULL,
	"nome" TEXT NOT NULL,
	"email" TEXT NOT NULL UNIQUE,
	"senha" TEXT NOT NULL,
	CONSTRAINT "usuários_pk" PRIMARY KEY ("Id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.produtos" (
	"Id" serial NOT NULL,
	"nome" TEXT NOT NULL UNIQUE,
	"preço" numeric NOT NULL,
	"foto" TEXT NOT NULL,
	"IdCategoria" integer NOT NULL,
	"IdTamanho" integer NOT NULL,
	CONSTRAINT "produtos_pk" PRIMARY KEY ("Id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.categoria" (
	"Id" serial NOT NULL,
	"nome" TEXT NOT NULL UNIQUE,
	CONSTRAINT "categoria_pk" PRIMARY KEY ("Id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.tamanho" (
	"Id" serial NOT NULL,
	"nome" TEXT NOT NULL UNIQUE,
	CONSTRAINT "tamanho_pk" PRIMARY KEY ("Id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.compras" (
	"Id" serial NOT NULL,
	"userId" integer NOT NULL,
	"statusId" integer NOT NULL,
	"data" DATE NOT NULL,
	"endereço" TEXT NOT NULL,
	CONSTRAINT "compras_pk" PRIMARY KEY ("Id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.status" (
	"Id" serial NOT NULL,
	"nome" integer NOT NULL UNIQUE,
	CONSTRAINT "status_pk" PRIMARY KEY ("Id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.produtosVendidos" (
	"Id" serial NOT NULL,
	"produtosId" integer NOT NULL,
	"quantidade" integer NOT NULL,
	"comprasId" integer NOT NULL,
	CONSTRAINT "produtosVendidos_pk" PRIMARY KEY ("Id")
) WITH (
  OIDS=FALSE
);




ALTER TABLE "produtos" ADD CONSTRAINT "produtos_fk0" FOREIGN KEY ("IdCategoria") REFERENCES "categoria"("Id");
ALTER TABLE "produtos" ADD CONSTRAINT "produtos_fk1" FOREIGN KEY ("IdTamanho") REFERENCES "tamanho"("Id");



ALTER TABLE "compras" ADD CONSTRAINT "compras_fk0" FOREIGN KEY ("userId") REFERENCES "usuários"("Id");
ALTER TABLE "compras" ADD CONSTRAINT "compras_fk1" FOREIGN KEY ("statusId") REFERENCES "status"("Id");


ALTER TABLE "produtosVendidos" ADD CONSTRAINT "produtosVendidos_fk0" FOREIGN KEY ("produtosId") REFERENCES "produtos"("Id");
ALTER TABLE "produtosVendidos" ADD CONSTRAINT "produtosVendidos_fk1" FOREIGN KEY ("comprasId") REFERENCES "compras"("Id");








