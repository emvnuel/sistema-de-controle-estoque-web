# Sistema de Controle de Estoque Web

## Descrição
Sistema de Controle de Estoque Web feito na disciplina de Linguagem Técnica I, no curso técnico de Tecnologia da Informação - IFBA

## Banco de Dados
```sql
CREATE DATABASE sistema_estoque;
use sistema_estoque;

CREATE TABLE mercadorias(
id_mercadoria INT(6) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
codigo VARCHAR(6) UNIQUE,
descricao VARCHAR(255),
preco_unitario DECIMAL(11, 2)
);

CREATE TABLE estoques(
id_estoque INT(6) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
id_mercadoria INT(6) UNSIGNED NOT NULL UNIQUE,
quantidade INT,
FOREIGN KEY(id_mercadoria) REFERENCES mercadorias(id_mercadoria)
);
```

## Screenshots
#### Screenshot 1
![Screenshot 1](https://raw.githubusercontent.com/emanuelcerqueira/sistema-de-controle-estoque-web/master/screenshots/screenshot1.jpg)

#### Screenshot 2
![Screenshot 2](https://raw.githubusercontent.com/emanuelcerqueira/sistema-de-controle-estoque-web/master/screenshots/screenshot2.jpg)

#### Screenshot 3
![Screenshot 3](https://raw.githubusercontent.com/emanuelcerqueira/sistema-de-controle-estoque-web/master/screenshots/screenshot3.jpg)

#### Screenshot 4
![Screenshot 4](https://raw.githubusercontent.com/emanuelcerqueira/sistema-de-controle-estoque-web/master/screenshots/screenshot4.jpg)

#### Screenshot 5
![Screenshot 5](https://raw.githubusercontent.com/emanuelcerqueira/sistema-de-controle-estoque-web/master/screenshots/screenshot5.jpg)

#### Screenshot 6
![Screenshot 6](https://raw.githubusercontent.com/emanuelcerqueira/sistema-de-controle-estoque-web/master/screenshots/screenshot6.jpg)

#### Screenshot 7
![Screenshot 7](https://raw.githubusercontent.com/emanuelcerqueira/sistema-de-controle-estoque-web/master/screenshots/screenshot7.jpg)

#### Screenshot 8
![Screenshot 8](https://raw.githubusercontent.com/emanuelcerqueira/sistema-de-controle-estoque-web/master/screenshots/screenshot8.jpg)
