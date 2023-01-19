

import { prisma } from "../../../../prisma/client";
import { CreateAnuncioDTO } from "../../dtos/CreateAnuncioDTO";


export class CreateAnuncioUseCase {
    async execute({  nome, telefone, cidade, bairro, cep, rua, caractImovel, defPessoas, valor }: CreateAnuncioDTO){
       
        const anuncio = await prisma.imovel.create({
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

         return anuncio;
    }
}