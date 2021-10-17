function dxdt = equations(t,x,C)
    dxdt = [((C(1).*(x(2)/(C(7)+x(2))))-C(6)).*x(1)-(C(3)/x(4)).*x(1);
            (-1/C(2)).*((C(1).*(x(2)/(C(7)+x(2))))-C(6)).*x(1)+C(3)*C(8)/x(4);
            C(4).*((C(1).*(x(2)/(C(7)+x(2))))-C(6)).*x(1)+C(5).*x(1)-(C(3)/x(4)).*x(3);
            C(3)];

    if (x(2) + dxdt(2)*0.1 < 0)
        dxdt(2) = -1*x(2)/0.001;
    end
   
    
end

%C(1)=umax, C(2)=yxs, C(3) = flow rate (f), C(4) = a, C(5) = b,
%C(6)= kd, C(7) = ks, C(8) = concentration of substrate added (c)
%x(1)=X, x(2)=S, x(3) = P, x(4) = V

%dxdt(1) = bacterial growth equation
%dxdt(2) = substrate utilization equation
%dxdt(3) = product formation equation
%dxdt(4) = volume equation

%The if statement prevents the substrate concentration from being
%negative
