
function dxdt = equations(t,x,C)
    dxdt = [((C(1).*(x(2)/(C(7)+x(2))))-C(6)).*x(1);
            (-1/C(2)).*((C(1).*(x(2)/(C(7)+x(2))))-C(6)).*x(1)+C(3);
            C(4).*((C(1).*(x(2)/(C(7)+x(2))))-C(6)).*x(1)+C(5).*x(1)];

    if (x(2) + dxdt(2)*0.1 < 0)
        dxdt(2) = -1*x(2)/0.1;
    end
    
    if (dxdt(2)>0)
        dxdt(2) = 0;
    end
   
    
end

%C(1)=umax, C(2)=yxs, C(3) = replacement rate (r), C(4) = a, C(5) = b,
%C(6)= kd, C(7) = ks
%x(1)=X, x(2)=S, x(3) = P

%dxdt(1) = bacterial growth equation
%dxdt(2) = substrate utilization equation
%dxdt(3) = product formation equation

%The first if statement prevents the substrate concentration from being
%negative
%The second if statement prevents the change in substrate concentration to
%increase in a batch model

