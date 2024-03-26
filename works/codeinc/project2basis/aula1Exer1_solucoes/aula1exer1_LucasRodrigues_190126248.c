#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <ctype.h>

typedef struct {
    char placa[8];
    char modelo[50];
    char cor[20];
    int ano;
}Carro;

typedef struct {
    char nome[100];
    int cpf;
    int rg;
    int qtdCarros;
    Carro carros[10];
}Pessoa;


int main() {
    FILE *arquivo;
    Pessoa pessoa;
    Pessoa leituraPessoa;
    char resposta;
    arquivo = fopen("registros.bin", "ab");
    do {
        printf("Nome do proprietario: ");
        scanf("%[^\n]", pessoa.nome);
        fflush(stdin);
        printf("CPF do proprietario: ");
        scanf("%d", &pessoa.cpf);
        fflush(stdin);
        printf("RG do proprietario: ");
        scanf("%d", &pessoa.rg);
        fflush(stdin);
        printf("Quantos veiculos esse proprietario possui?\n");
        scanf("%d", &pessoa.qtdCarros);
        fflush(stdin);
        for (int i = 0; i < pessoa.qtdCarros; i++) {
            printf("Placa do veiculo %d: ", i+1);
            scanf("%[^\n]", pessoa.carros[i].placa);
            fflush(stdin);
            printf("Modelo do veiculo %d: ", i+1);
            scanf("%[^\n]", pessoa.carros[i].modelo);
            fflush(stdin);
            printf("Cor do veiculo %d: ", i+1);
            scanf("%[^\n]", pessoa.carros[i].cor);
            fflush(stdin);
            printf("Ano do veiculo %d: ", i+1);
            scanf("%d", &pessoa.carros[i].ano);
            fflush(stdin);
        }

        printf("Gostaria de registrar outro proprietario de veiculo? s/n: ");
        scanf("%c", &resposta);
        fflush(stdin);
        resposta = tolower(resposta);
        fwrite(&pessoa, sizeof(Pessoa), 1, arquivo);
    } while (resposta == 's');
    fclose(arquivo);
    system("cls");
    arquivo = fopen("registros.bin", "rb");
    while (!feof(arquivo)) {
        
        if(fread(&leituraPessoa, sizeof(Pessoa), 1, arquivo) == 1) {

            printf("Proprietario:\n");
            printf("Nome: %s\n", leituraPessoa.nome);
            printf("CPF: %d\n", leituraPessoa.cpf);
            printf("RG: %d\n", leituraPessoa.rg);
            for (int j = 0; j < leituraPessoa.qtdCarros; j++) {
                printf("Veiculo %d do proprietario\n", j+1);
                printf("\tPlaca: %s\n", leituraPessoa.carros[j].placa);
                printf("\tModelo: %s\n", leituraPessoa.carros[j].modelo);
                printf("\tCor: %s\n", leituraPessoa.carros[j].cor);
                printf("\tAno: %d\n", leituraPessoa.carros[j].ano);
                printf("\n");
            }
            printf("\n");
        }
    }
    
    return 0;
}