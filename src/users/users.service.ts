import { Injectable } from "@nestjs/common";
import { Pengguna, Prisma } from "@prisma/client";
import { PrismaService } from "src/prisma.service";

@Injectable()
export class UsersService {
  constructor(private readonly prisma: PrismaService){}
  async user(id: Prisma.PenggunaWhereUniqueInput): Promise<Pengguna | null> {
    return this.prisma.pengguna.findUnique({where: id});
  }
  async createUser(data: Prisma.PenggunaCreateInput): Promise<Pengguna> {
    return this.prisma.pengguna.create({
      data
    });
  }
  async deleteUser(id: Prisma.PenggunaWhereUniqueInput): Promise<Pengguna> {
    return this.prisma.pengguna.delete({where: id})
  }
}