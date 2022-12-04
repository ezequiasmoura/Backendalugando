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
CREATE TABLE "locadores" (
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

    CONSTRAINT "locadores_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "usuario-inquilino" (
    "usuarioId" INTEGER NOT NULL,
    "inquilinoId" INTEGER NOT NULL,

    CONSTRAINT "usuario-inquilino_pkey" PRIMARY KEY ("usuarioId","inquilinoId")
);

-- CreateTable
CREATE TABLE "usuario-locador" (
    "usuarioId" INTEGER NOT NULL,
    "locadorId" INTEGER NOT NULL,

    CONSTRAINT "usuario-locador_pkey" PRIMARY KEY ("usuarioId","locadorId")
);

-- CreateIndex
CREATE UNIQUE INDEX "usuarios_email_key" ON "usuarios"("email");

-- CreateIndex
CREATE UNIQUE INDEX "usuarios_telefone_key" ON "usuarios"("telefone");

-- CreateIndex
CREATE UNIQUE INDEX "locadores_telefone_key" ON "locadores"("telefone");

-- AddForeignKey
ALTER TABLE "usuario-inquilino" ADD CONSTRAINT "usuario-inquilino_usuarioId_fkey" FOREIGN KEY ("usuarioId") REFERENCES "usuarios"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "usuario-inquilino" ADD CONSTRAINT "usuario-inquilino_inquilinoId_fkey" FOREIGN KEY ("inquilinoId") REFERENCES "inquilinos"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "usuario-locador" ADD CONSTRAINT "usuario-locador_usuarioId_fkey" FOREIGN KEY ("usuarioId") REFERENCES "usuarios"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "usuario-locador" ADD CONSTRAINT "usuario-locador_locadorId_fkey" FOREIGN KEY ("locadorId") REFERENCES "locadores"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
