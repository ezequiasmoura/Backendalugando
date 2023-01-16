import { prisma } from "../../../../prisma/client";
import { CreateInquilinoDTO } from "../../dtos/CreateInquilinoDTO";



export class CreateInquilinoUseCase {
    async execute({ nome, datanascimento, cidade, tipoMoradia, seTrabalha,seEstuda,quantPessoas}: CreateInquilinoDTO){
       
        const inquilino = await prisma.inquilino.create({
            data: {
                nome,
                datanascimento,
                cidade,
                tipoMoradia,
                seTrabalha,
                seEstuda,
                quantPessoas,
            }
        });

         return inquilino;
    }
}