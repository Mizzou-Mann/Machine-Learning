% a
display(Mu_x);
display(Sigma_x);

% b
display(Mu_x_given_setosa);
display(Sigma_x_given_setosa);
display(Mu_x_given_versicolor);
display(Sigma_x_given_versicolor);
display(Mu_x_given_virginica);
display(Sigma_x_given_virginica);

% c
Theta_1 = [Mu_x_given_setosa Sigma_x_given_setosa];
Theta_2 = [Mu_x_given_versicolor Sigma_x_given_versicolor];
Theta_3 = [Mu_x_given_virginica Sigma_x_given_virginica];

c_1 = classify(X_given_setosa_test, Theta_1, Theta_2, Theta_3);
c_2 = classify(X_given_versicolor_test, Theta_1, Theta_2, Theta_3);
c_3 = classify(X_given_virginica_test, Theta_1, Theta_2, Theta_3);
confusion_table(1, :) = [sum(c_1==1) sum(c_1==2) sum(c_1==3)];
confusion_table(2, :) = [sum(c_2==1) sum(c_2==2) sum(c_2==3)];
confusion_table(3, :) = [sum(c_3==1) sum(c_3==2) sum(c_3==3)];

display(confusion_table);