#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_CARROS 10 // máximo de carros que uma pessoa pode ter

// Definição da estrutura para armazenar os dados de uma pessoa
typedef struct {
    char nome[50];
    char cpf[12]; // Ajuste para 12 para incluir o caractere nulo
    char endereco[100];
    char telefone[20];
    int num_carros;
    char modelo_carro[MAX_CARROS][50];
    char cor_carro[MAX_CARROS][30];
    char placa_carro[MAX_CARROS][9]; // Ajuste para 9 para incluir o caractere nulo
} Pessoa;

// Função para cadastrar uma nova pessoa e seus carros
void cadastrar_pessoa(FILE *arquivo) {
    Pessoa pessoa;
    printf("Digite o nome da pessoa: ");
    fgets(pessoa.nome, 50, stdin);
    fprintf(arquivo, "%s", pessoa.nome);

    printf("Digite o CPF da pessoa: ");
    fgets(pessoa.cpf, 12, stdin);
    fprintf(arquivo, "%s \n", pessoa.cpf);

    printf("Digite o endereço da pessoa: ");
    fgets(pessoa.endereco, 100, stdin);
    fprintf(arquivo, "%s", pessoa.endereco);

    printf("Digite o telefone da pessoa: ");
    fgets(pessoa.telefone, 20, stdin);
    fprintf(arquivo, "%s", pessoa.telefone);

    printf("Quantos carros a pessoa possui (max %d)? ", MAX_CARROS);
    scanf("%d", &pessoa.num_carros);
    getchar(); //  limpa o buffer de entrada
    fprintf(arquivo, "%d\n", pessoa.num_carros);

    for (int i = 0; i < pessoa.num_carros; i++) {
        printf("Digite o modelo do carro %d: ", i + 1);
        fgets(pessoa.modelo_carro[i], 50, stdin);
        fprintf(arquivo, "%s", pessoa.modelo_carro[i]);

        printf("Digite a cor do carro %d: ", i + 1);
        fgets(pessoa.cor_carro[i], 30, stdin);
        fprintf(arquivo, "%s", pessoa.cor_carro[i]);

        printf("Digite a placa do carro %d: ", i + 1);
        fgets(pessoa.placa_carro[i], 9, stdin);
        fprintf(arquivo, "%s\n", pessoa.placa_carro[i]);
    }
}

// Função para listar todas as pessoas cadastradas
void listar_pessoas(FILE *arquivo) {
    Pessoa pessoa;
    int i;

    arquivo = fopen("usuarios.txt", "r"); // Modificado para leitura de texto

    if (arquivo == NULL) {
        printf("Erro ao abrir o arquivo.\n");
        exit(1);
    }

    while (fscanf(arquivo, "%[^\n]%*c", pessoa.nome) == 1) {
        fscanf(arquivo, "%[^\n]%*c", pessoa.cpf);
        fscanf(arquivo, "%[^\n]%*c", pessoa.endereco);
        fscanf(arquivo, "%[^\n]%*c", pessoa.telefone);
        fscanf(arquivo, "%d%*c", &pessoa.num_carros);
        printf("Nome: %s\n", pessoa.nome);
        printf("CPF: %s\n", pessoa.cpf);
        printf("Endereço: %s\n", pessoa.endereco);
        printf("Telefone: %s\n", pessoa.telefone);
        printf("Quantidade de carros: %d\n", pessoa.num_carros);

        for (i = 0; i < pessoa.num_carros; i++) {
            fscanf(arquivo, "%[^\n]%*c", pessoa.modelo_carro[i]);
            fscanf(arquivo, "%[^\n]%*c", pessoa.cor_carro[i]);
            fscanf(arquivo, "%[^\n]%*c", pessoa.placa_carro[i]);
            printf("Modelo do carro %d: %s\n", i + 1, pessoa.modelo_carro[i]);
            printf("Cor do carro %d: %s\n", i + 1, pessoa.cor_carro[i]);
            printf("Placa do carro %d: %s\n", i + 1, pessoa.placa_carro[i]);
        }
        printf("\n");
    }

    fclose(arquivo);
}

int main() {
    FILE *arquivo;
    int opcao;

    arquivo = fopen("usuarios.txt", "a+"); // Modificado para leitura e escrita de texto

    if (arquivo == NULL) {
        printf("Erro ao abrir o arquivo.\n");
        return 1;
    }

    do {
        printf("\n1 - Cadastrar nova pessoa\n");
        printf("2 - Listar todas as pessoas cadastradas\n");
        printf("3 - Sair do programa\n");
        printf("Escolha uma opção: ");
        scanf("%d", &opcao);
        getchar(); // consome o \n deixado pelo scanf

        switch (opcao) {
            case 1:
                system("cls");
                printf("(  Cadastrar Pessoa  )\n\n");
                cadastrar_pessoa(arquivo);
                printf("Pessoa cadastrada com sucesso!\n");
                getchar(); // Limpar o buffer de entrada
                break;
            case 2:
                system("cls");
                printf("(  Listagem de Pessoas  )\n\n");
                listar_pessoas(arquivo);
                break;
            case 3:
                printf("Encerrando o programa...\n");
                break;
            default:
                printf("Opção inválida!\n");
                break;
        }
    } while (opcao != 3);

    fclose(arquivo);

    return 0;
}
