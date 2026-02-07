% Disciplina: Inteligência Artificial
% Trabalho: Sistema Fuzzy - Classificador de Café
% Equipe: Jonathan Tadei, Matheus Bueno e Matheus Lopes

clear; clc;

% carregando arquivo do sistema fuzzy (pra executar, o .m (esse arquivo) e
% o .fis (arquivo com inputs, outputs e regras) devem estar na mesma pasta)
% se mudar o nome do .fis, só alterar essa linha de baixo
sistema = readfis('classificacao_cafe.fis');

fprintf('--- Classificador de Qualidade de Café ---\n\n');

% entrada de dados (inputs)
% todos os valores devem estar entre 0 e 10, conforme modelo no .fis
acidez = input('Digite a nota para Acidez (0-10): ');
corpo = input('Digite a nota para Corpo (0-10): ');
docura = input('Digite a nota para Doçura (0-10): ');

% executando sistema fuzzy
% o comando 'evalfis' processa as entradas com base nas regras do arquivo .fis
resultado = evalfis(sistema, [acidez corpo docura]);

% exibindo resultado
% aqui, o output (Qualidade) vai de 0 a 100. no nosso caso, como é uma
% simplficação do sistema SCA, temos apenas 3 outputs possíveis: especial,
% premium e comercial. no sistema ABIC, poderíamos ter um ranking a mais

% a ideia é tentar parametrizar e "automatizar" um processo muito
% subjetivo, afinal, esse tipo de avaliação na vida real é feita por
% pessoas técnicas e com cursos específicos para a degustação do café
fprintf('\n========================================\n');
fprintf('Pontuação Final: %.2f pontos\n', resultado);

if resultado >= 80
    fprintf('Classificação: CAFÉ ESPECIAL\n');
elseif resultado >= 60
    fprintf('Classificação: CAFÉ PREMIUM\n');
else
    fprintf('Classificação: CAFÉ COMERCIAL\n');
end
fprintf('========================================\n');