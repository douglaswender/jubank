## Design de widgets

Os widgets desenvolvidos devem possuir parâmetro Behaviour, que define qual o estado do widget (regular, loading, error, empty e disabled) além de possuírem uma extensão com *with* da classe Component para obter os métodos when, baseado em seu estado atual e o método delegate para definir quais possiveis estados o componente/widget deverá possuir.