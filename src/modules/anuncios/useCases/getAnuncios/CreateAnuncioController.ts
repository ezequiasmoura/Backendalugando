import { Request , Response } from "express";
import { CreateAnuncioUseCase } from "./CreateAnuncioUseCase";


export class CreateAnuncioController {
    async handle(req: Request, res: Response) {
        const {nome, telefone, cidade, bairro, cep, rua, caractImovel, defPessoas, valor } = req.body;

        const createImovelUseCase = new CreateAnuncioUseCase();

        const result = await createImovelUseCase.execute({nome, telefone, cidade, bairro, cep, rua, caractImovel, defPessoas, valor});

        return res.status(201).json(result);

    }

}
