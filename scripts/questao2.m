clear -x conf_*
strings_all
strings_q2
clc;
disp (s_Introd);
disp (" ");
input (s_Enter_Continue);
clc;

##############################################################################
# Primeira matriz
##############################################################################
tol = 0.00001;
maxIter = 10000;

printf(s_Analysis_M, 1, s_First_Mat);
load (strcat(data_path, s_First_Mat, ".mat"));
A = Problem.A;

# Análise do Fatora
[MJ, MS, SOR] = fatora(A, 2);
[V lambda] = eig(MJ);
printf(s_Max_Lambda_Jacobi, max(abs(diag(lambda))))
[V lambda] = eig(MS);
printf(s_Max_Lambda_Seidel, max(abs(diag(lambda))))

[V lambda] = eig(SOR);
printf(s_Sol_Analysis_W, 2, max(abs(diag(lambda))))
disp(" ");

[MJ, MS, SOR] = fatora(A, 1);
[V lambda] = eig(SOR);
printf(s_Sol_Analysis_W, 1, max(abs(diag(lambda))))
disp(" ");

[MJ, MS, SOR] = fatora(A, 0);
[V lambda] = eig(SOR);
printf(s_Sol_Analysis_W, 0, max(abs(diag(lambda))))
disp(" ");

# Conclusões sobre a fatora
printf (s_Sol_First_Mat_Analysis);
disp("\n");
input (s_Enter_Continue);
clc

# Soluções
n = rows(A);
b = A * ones (n, 1);
clc;
printf (s_Sol_Jacobi, s_First_Mat);

if(conf_ShouldUseCache != 1)
    [xJacobi, iterJacobi, resJacobi] = jacobi (A, b, tol, maxIter)
else
    load (strcat(cache_path, s_First_Mat, "/xJacobi_", s_First_Mat, ".cache"));
    disp("\n\n")
    xJacobi
    load (strcat(cache_path, s_First_Mat, "/iterJacobi_", s_First_Mat, ".cache"));
    disp("\n\n")
    iterJacobi
    load (strcat(cache_path, s_First_Mat, "/resJacobi_", s_First_Mat, ".cache"));
    disp("\n\n")
    resJacobi
endif;
disp(" ");

input (s_Enter_Continue);
clc;

printf(s_Sol_GSeidel, s_First_Mat);
if(conf_ShouldUseCache != 1)
    # Gauss-Seidel -> SOR com w = 1
    [xSeidel, iterSeidel, resSeidel] = sor (A, b, tol, maxIter, 1) 
else
    load (strcat(cache_path, s_First_Mat, "/xSeidel_", s_First_Mat, ".cache"));
    disp("\n\n")
    xSeidel
    load (strcat(cache_path, s_First_Mat, "/iterSeidel_", s_First_Mat, ".cache"));
    disp("\n\n")
    iterSeidel
    load (strcat(cache_path, s_First_Mat, "/resSeidel_", s_First_Mat, ".cache"));
    disp("\n\n")
    resSeidel
endif;
disp (" ");
input (s_Enter_Continue);
clc;

printf(s_Sol_SOR, s_First_Mat);
if(conf_ShouldUseCache != 1)
    [xSor, iterSor, resSor] = sor (A, b, tol, maxIter, 1)
else
    load (strcat(cache_path, s_First_Mat, "/xSor_", s_First_Mat, ".cache"));
    disp("\n\n")
    xSor
    load (strcat(cache_path, s_First_Mat, "/iterSor_", s_First_Mat, ".cache"));
    disp("\n\n")
    iterSor
    load (strcat(cache_path, s_First_Mat, "/resSor_", s_First_Mat, ".cache"));
    disp("\n\n")
    resSor
endif;
disp (" ");

input (s_Enter_Continue);
clc;

# Desenho do gráfico

xj = linspace(1, iterJacobi, iterJacobi);
xg = linspace(1, iterSeidel, iterSeidel);
xs = linspace(1, iterSor, iterSor);
plot(xj, resJacobi, ";Jacobi;", xg, resSeidel, ";Seidel;", xs, resSor, ";SOR;")

title("Resíduo da solução em função das iterações");
xlabel("Iterações");
ylabel("Resíduo");

disp(s_Res_Graph_Leg);

disp(' ')
input(s_Enter_Continue);
close;

##############################################################################
# Segunda matriz
##############################################################################
clc;
clear -x conf_*
strings_all
strings_q2
printf(s_Analysis_M, 2, s_Second_Mat);

load (strcat(data_path, s_Second_Mat, ".mat"));
A = Problem.A;

# Análise do Fatora
[MJ, MS, SOR] = fatora(A, 2);
[V lambda] = eig(MJ);
printf(s_Max_Lambda_Jacobi, max(abs(diag(lambda))))
[V lambda] = eig(MS);
printf(s_Max_Lambda_Seidel, max(abs(diag(lambda))))

[V lambda] = eig(SOR);
printf(s_Sol_Analysis_W, 2, max(abs(diag(lambda))))
disp(" ");

[MJ, MS, SOR] = fatora(A, 1);
[V lambda] = eig(SOR);
printf(s_Sol_Analysis_W, 1, max(abs(diag(lambda))))
disp(" ");

[MJ, MS, SOR] = fatora(A, 0);
[V lambda] = eig(SOR);
printf(s_Sol_Analysis_W, 0, max(abs(diag(lambda))))
disp(" ");

# Conclusões sobre a fatora
printf (s_Sol_Second_Mat_Analysis, 1)
disp("\n");
input (s_Enter_Continue);
clc

# Soluções
n = rows(A);
b = A * ones (n, 1);
clc

printf(s_Sol_GSeidel, s_Second_Mat);
if(conf_ShouldUseCache != 1)
    # Gauss-Seidel -> SOR com w = 1
    [xSeidel, iterSeidel, resSeidel] = sor (A, b, tol, maxIter, 1) 
else
    load (strcat(cache_path, s_Second_Mat, "/xSeidel_", s_Second_Mat, ".cache"));
    disp("\n\n")
    xSeidel
    load (strcat(cache_path, s_Second_Mat, "/iterSeidel_", s_Second_Mat, ".cache"));
    disp("\n\n")
    iterSeidel
    load (strcat(cache_path, s_Second_Mat, "/resSeidel_", s_Second_Mat, ".cache"));
    disp("\n\n")
    resSeidel
endif;
disp (" ");
input (s_Enter_Continue);
clc;

printf(s_Sol_SOR, s_Second_Mat);
if(conf_ShouldUseCache != 1)
    [xSor, iterSor, resSor] = sor (A, b, tol, maxIter, 1)
else
    load (strcat(cache_path, s_Second_Mat, "/xSor_", s_Second_Mat, ".cache"));
    disp("\n\n")
    xSor
    load (strcat(cache_path, s_Second_Mat, "/iterSor_", s_Second_Mat, ".cache"));
    disp("\n\n")
    iterSor
    load (strcat(cache_path, s_Second_Mat, "/resSor_", s_Second_Mat, ".cache"));
    disp("\n\n")
    resSor
endif;

# Desenho do gráfico

xg = linspace(1, iterSeidel, iterSeidel);
xs = linspace(1, iterSor, iterSor);
plot(xg, resSeidel, ";Seidel;", xs, resSor, ";SOR;")

title("Resíduo da solução em função das iterações");
xlabel("Iterações");
ylabel("Resíduo");

disp(s_Res_Graph_Leg);

disp(' ')
input(s_Enter_Continue);
close;


##############################################################################
# Terceira matriz
##############################################################################
clear -x conf_*
strings_all
strings_q2
clc;
printf(s_Analysis_M, 3, s_Third_Mat);

load (strcat(data_path, s_Third_Mat, ".mat"));
A = Problem.A;

# Análise do Fatora
[MJ, MS, SOR] = fatora(A, 2);
[V lambda] = eig(MJ);
printf(s_Max_Lambda_Jacobi, max(abs(diag(lambda))))
[V lambda] = eig(MS);
printf(s_Max_Lambda_Seidel, max(abs(diag(lambda))))

[V lambda] = eig(SOR);
printf(s_Sol_Analysis_W, 2, max(abs(diag(lambda))))
disp(" ");

[MJ, MS, SOR] = fatora(A, 1);
[V lambda] = eig(SOR);
printf(s_Sol_Analysis_W, 1, max(abs(diag(lambda))))
disp(" ");

[MJ, MS, SOR] = fatora(A, 0);
[V lambda] = eig(SOR);
printf(s_Sol_Analysis_W, 0, max(abs(diag(lambda))))
disp(" ");

# Conclusões sobre a fatora
disp (s_Sol_Third_Mat_Analysis);
disp("\n");

input (s_Enter_Continue);
