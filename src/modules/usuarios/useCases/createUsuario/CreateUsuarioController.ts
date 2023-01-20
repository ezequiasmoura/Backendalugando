import { Request, Response } from "express";
import { usuarioRoutes } from "../../../../usuario";
import { CreateUsuarioUseCase } from "./CreateUsuarioUseCase";


export class CreateUsuarioController {
    async handle(req: Request, res: Response) {
        const {  nome, email, telefone, senha, dataNascimento } = req.body;

        const createUsuarioUseCase = new CreateUsuarioUseCase();

        const result = await createUsuarioUseCase.execute({ nome, email, telefone, senha, dataNascimento});

        return res.status(201).json(result);


    }

   
}