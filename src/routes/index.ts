import { Router } from "express";
import { imovelRoutes } from "./imovel";
import { inquilinoRoutes } from "./inquilino";
import { usuarioRoutes } from "./usuario";



const routes = Router();

routes.use("/usuarios", usuarioRoutes);
routes.use("/inquilinos", inquilinoRoutes);
routes.use("/imoveis", imovelRoutes);


export { routes };