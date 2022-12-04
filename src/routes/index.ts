import { Router } from "express";
import { usuarioRoutes } from "./usuario";



const routes = Router();

routes.use("/usuarios", usuarioRoutes);


export { routes };