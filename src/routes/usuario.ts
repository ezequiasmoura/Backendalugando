import { PrismaClient } from "@prisma/client";
import { Request, Response, Router } from "express";
import { CreateUsuarioController } from "../modules/usuarios/useCases/createUsuario/CreateUsuarioController";

const createUsuarioController = new CreateUsuarioController
const usuarioRoutes = Router();
const prisma = new PrismaClient();


usuarioRoutes.put("/", async (req, res) => {
  const updateUser = await prisma.usuario.update({
    where: {
      id: 2
    },
    data: {
      nome: "pedro",
    },
  })
});

usuarioRoutes.delete("/", async (req, res) => {
  const deleteUser = await prisma.usuario.delete({
    where: {
      id: 3
    },
  })
});

usuarioRoutes.get('/', async (req: Request, res: Response) => {
  const usuarios = await prisma.usuario.findMany({});
  res.json(usuarios);
});

usuarioRoutes.post("/", createUsuarioController.handle);

export { usuarioRoutes };