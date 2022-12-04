import { CreateUsuarioDTO } from "../../dtos/CreateUserDTO";
import { prisma } from "../../../../prisma/client";


export class CreateUsuarioUseCase {
    async execute({ nome, email, telefone, senha, dataNascimento}: CreateUsuarioDTO){
        // verificar se usuario ja existe 
        const userAlreadyExists = await prisma.usuario.findUnique({
            where: {
                email
            }
        });

        if (userAlreadyExists) {
            //erro
        }

     


        // Criar usuario

        const usuario = await prisma.usuario.create({
            data: {
                nome,
                email,
                telefone,
                senha,
                dataNascimento,
            }
        });

         return usuario;
    }
}