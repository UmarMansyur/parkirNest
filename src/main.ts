import { NestFactory } from '@nestjs/core';
import { DocumentBuilder, SwaggerDocumentOptions, SwaggerModule } from '@nestjs/swagger';
import { AppModule } from './app.module';
declare const module: any;
async function bootstrap() {
  const app = await NestFactory.create(AppModule);
  const options: SwaggerDocumentOptions = {
    operationIdFactory: (
      controllerKey: string,
      methodKey: string
    ) => methodKey
  };
  const config = new DocumentBuilder()
  .setTitle('ParQran')
  .setDescription('The ParQran API description')
  .setVersion('1.0')
  .addTag('ParQran')
  .build();
  const document = SwaggerModule.createDocument(app, config, options);
  SwaggerModule.setup('api', app, document)
  await app.listen(3000);
  if(module.hot) {
    module.hot.accept();
    module.hot.dispose(() => app.close());
  }
}
bootstrap();
