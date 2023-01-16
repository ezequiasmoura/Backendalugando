

import { prisma } from "../../../../prisma/client";
import { CreateImovelDTO } from "../../dtos/CreateImovelDTO";

export class CreateImovelUseCase {
    async execute({  nome, telefone, cidade, bairro, cep, rua, caractImovel, defPessoas, valor }: CreateImovelDTO){
       
        const imovel = await prisma.locador.create({ 
           data:{
            nome, 
            telefone, 
            cidade,
            bairro, 
            cep, 
            rua, 
            caractImovel, 
            defPessoas, 
            valor
           }
           
            
        });

         return imovel;
    }
}