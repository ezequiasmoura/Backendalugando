import { Router } from "express";
import { CreateImovelController } from "../modules/imoveis/useCases/cadastrarImovel/CreateImovelController";

const createImovelController = new CreateImovelController;
const imovelRoutes = Router();

imovelRoutes.post("/", createImovelController.handle);

export {imovelRoutes};