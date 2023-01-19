import { Router } from "express";
import { CreateInquilinoController } from "../modules/inquilinos/useCases/cadastrarInquilino/CreateInquilinoController";

const createInquilinoController = new CreateInquilinoController;
const inquilinoRoutes = Router();

inquilinoRoutes.post("/", createInquilinoController.handle);

export { inquilinoRoutes };
