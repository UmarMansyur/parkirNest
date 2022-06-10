import { Body, Controller, Delete, Get, Param, Post } from '@nestjs/common';
import { Pengguna as PenggunaModel} from '@prisma/client';
import { UsersService } from './users.service';

@Controller('users')
export class UsersController {
    constructor(private readonly usersServis: UsersService){};
    @Get(':id')
    getUser(@Param('id') id: string): Promise<PenggunaModel> {
        return this.usersServis.user({id_pengguna: Number(id)});
    }
    @Post()
    createUser(@Body() postData:{email: string; foto?: string}): Promise<PenggunaModel> {
        const {email, foto} = postData;
        return this.usersServis.createUser({
            email: String(email),
            foto: foto
        });
    }
    @Delete(':id')
    deleteUser(@Param('id') id: string): Promise<PenggunaModel> {
        return this.usersServis.deleteUser({id_pengguna: Number(id)});
    }

}
