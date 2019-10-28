# Para compilar o funtor que será utilizado
ozc -c DigitalLogicFunctor.oz

# Para compilar o funtor que será executado
ozc -c MainFunctor.oz -o MainFunctor.oza

# Para executar o funtor usando a engine:
ozengine MainFunctor.oza --in http://www.mozart-oz.org/LICENSE --out LICENSE