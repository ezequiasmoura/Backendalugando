import { PrismaClient } from "@prisma/client";
import { Request, Response, Router } from "express";
import { CreateInquilinoController } from "../modules/inquilinos/useCases/cadastrarInquilino/CreateInquilinoController";

const createInquilinoController = new CreateInquilinoController;
const inquilinoRoutes = Router();
const prisma = new PrismaClient();

inquilinoRoutes.post("/", createInquilinoController.handle);

inquilinoRoutes.get('/', async (req: Request, res: Response) => {
    const inquilinos = await prisma.inquilino.findMany({});
    res.json(inquilinos);
  });

export { inquilinoRoutes };
