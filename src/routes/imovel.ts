import { PrismaClient } from "@prisma/client";
import { Request, Response, Router } from "express";
import { CreateImovelController } from "../modules/imoveis/useCases/cadastrarImovel/CreateImovelController";

const createImovelController = new CreateImovelController;
const imovelRoutes = Router();
const prisma = new PrismaClient();

imovelRoutes.post("/", createImovelController.handle);

imovelRoutes.get('/', async (req: Request, res: Response) => {
    const imoveis = await prisma.imovel.findMany({});
    res.json(imoveis);
  });

export {imovelRoutes};