import { Request , Response } from "express";
import { CreateInquilinoUseCase } from "./CreateInquilinoUseCase";

export class CreateInquilinoController {
    async handle(req: Request, res: Response) {
        const { nome, datanascimento, cidade, tipoMoradia, seTrabalha,seEstuda,quantPessoas } = req.body;

        const createInquilinoUseCase = new CreateInquilinoUseCase();

        const result = await createInquilinoUseCase.execute({ nome, datanascimento, cidade, tipoMoradia, seTrabalha,seEstuda,quantPessoas});

        return res.status(201).json(result);
    }
}