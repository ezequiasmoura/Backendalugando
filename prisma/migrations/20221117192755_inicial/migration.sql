-- CreateTable
CREATE TABLE "usuarios" (
    "id" SERIAL NOT NULL,
    "nome" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "telefone" TEXT NOT NULL,
    "senha" TEXT NOT NULL,
    "dataNascimento" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "usuarios_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "inquilinos" (
    "id" SERIAL NOT NULL,
    "nome" TEXT NOT NULL,
    "datanascimento" TIMESTAMP(3) NOT NULL,
    "cidade" TEXT NOT NULL,
    "tipoMoradia" TEXT NOT NULL,
    "seTrabalha" TEXT NOT NULL,
    "seEstuda" TEXT NOT NULL,
    "quantPessoas" INTEGER NOT NULL,

    CONSTRAINT "inquilinos_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "imoveis" (
    "id" SERIAL NOT NULL,
    "nome" TEXT NOT NULL,
    "telefone" TEXT NOT NULL,
    "cidade" TEXT NOT NULL,
    "bairro" TEXT NOT NULL,
    "cep" TEXT NOT NULL,
    "rua" TEXT NOT NULL,
    "caractImovel" TEXT NOT NULL,
    "defPessoas" TEXT NOT NULL,
    "valor" INTEGER NOT NULL,

    CONSTRAINT "imoveis_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "usuario-inquilino" (
    "usuarioId" INTEGER NOT NULL,
    "inquilinoId" INTEGER NOT NULL,

    CONSTRAINT "usuario-inquilino_pkey" PRIMARY KEY ("usuarioId","inquilinoId")
);

-- CreateTable
CREATE TABLE "usuario-imoveis" (
    "usuarioId" INTEGER NOT NULL,
    "imovelId" INTEGER NOT NULL,

    CONSTRAINT "usuario-imovel_pkey" PRIMARY KEY ("usuarioId","imoveisId")
);

-- CreateIndex
CREATE UNIQUE INDEX "usuarios_email_key" ON "usuarios"("email");

-- CreateIndex
CREATE UNIQUE INDEX "usuarios_telefone_key" ON "usuarios"("telefone");

-- CreateIndex
CREATE UNIQUE INDEX "imoveis_telefone_key" ON "imoveis"("telefone");

-- AddForeignKey
ALTER TABLE "usuario-inquilino" ADD CONSTRAINT "usuario-inquilino_usuarioId_fkey" FOREIGN KEY ("usuarioId") REFERENCES "usuarios"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "usuario-inquilino" ADD CONSTRAINT "usuario-inquilino_inquilinoId_fkey" FOREIGN KEY ("inquilinoId") REFERENCES "inquilinos"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "usuario-imovel" ADD CONSTRAINT "usuario-imovel_usuarioId_fkey" FOREIGN KEY ("usuarioId") REFERENCES "usuarios"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "usuario-imovel" ADD CONSTRAINT "usuario-imovel_locadorId_fkey" FOREIGN KEY ("imovelId") REFERENCES "imoveis"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
