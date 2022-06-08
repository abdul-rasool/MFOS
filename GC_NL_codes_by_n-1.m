outputfolder:="C:/mic/.../GC_NL/"; 
n:=10;       
d:=7;
nn:=n-1;

Z := IntegerRing();
F<x> := FiniteField(2^2);
P<X>:= PolynomialRing(F);
GC := PolynomialRing(Z, 2);
NL := PolynomialRing(Z, 4);

// storage for best codes
Mindistances:=[1..n+1];                      
DD:= [0: x in Mindistances ];           // define zero sequence of code sizes
Gens1:=[P| 0: x in Mindistances ]; 		// define zero sequence in population  P 
CC:=[ ZeroCode(F,n): x in Mindistances ];          // define zero sequence for GC
NL:=[ ZeroCode(F,n): x in Mindistances ];   // define zero sequence for NL
C0C0:=[ ZeroCode(F,n+1): x in Mindistances ]; 
DDD:=[ ZeroCode(F,n+1): x in Mindistances ];
GCC:=[ GC| 0: x in Mindistances ]; 		
NLL:=[ NL| 0: x in Mindistances ];

Zeroseq:=[F| 0: x in [1..n+1]];         //Zeroseq;
fseq:=Zeroseq;fseq[1]:=3;fseq[n+1]:=1;// fseq;
f:=elt< P | fseq >;
"f= ";f;
L:=CartesianPower(F,nn+1);
count:=0;
for u in L do 
    g:=u[1]*X^0;
         for i:=2 to nn+1 do                            // number of variables is n d 2 -1
               g:= g +(u[i])*X^(i-1);
         end for;
coefftot:=0;
for i:= 0 to n do
//"i,coefftot= ",i,coefftot; 
coefftot:=coefftot+Coefficient(g,i);
end for;
         if not IsZero(g) and IsMonic(g) and (Degree(g) ne (n-1, d-1) or Coefficient(g,0) eq 1) then 
               x, y:=IsDivisibleBy(f, g); 
               if not IsZero(g) and IsMonic(g) and (Degree(g) ne (n-1, d-1) or Coefficient(g,0) eq 1) and x eq true and coefftot eq 0 then
                                  count:=count+1;count; "g=";g; 
if (Degree(g) ne 0) and (Degree(g) ne 1) and (Degree(g) ne n) then   // Avoid empty or distance 1 codes
C:=Code(n, g);
M:=contentDistribution(C)[2][1];                                 // Note: MinimumDistance(C) does not seem to work over Z4							
if M gt 2 then
cw<d,l,v,w>:= CompletecontentEnumerator(C);
AssignNames(~GC, ["z1", "z2"]);
AssignNames(~NL, ["z3", "z4"]);
z1:= GC.1; z2:= GC.2; z3:= NL.1; z4:= NL.2;
GCCEelement:=0;
NLLEelement:=0;
h:=Monomials(cw);
hh:=Coefficients(cw);
i:=0;
for  q in h  do 
s:=Degree(q,d)+Degree(q,w);
ss:=Degree(q,l)+Degree(q,v);
i:=i+1;
GCCEelement:=GCCEelement+hh[i]*(z1^s)*(z2^ss);
NLLEelement:=NLLEelement+hh[i]*(z3^s)*(z4^ss);
end for;
for d in CC[iii] do
sssum:=0;
for iiii in [1..n+1] do 
if ((d[iiii] eq 0) or (d[iiii] eq x^2)) then 
sssum:=sssum+1; 
end if;
end for;
if d in C0C0[iii] then j:=j+1;"j=",j;end if;
if not d in C0C0[iii] and sssum eq gcc2[iii] then i:=i+1;E[i]:=Vector(d); end if;
end for;
"\n GC_NL_enumerator=",GCCEelement + NLLEelement;
D:=MaxNorm(GCCEelement);
str0:=IntegerToString(n);
strD:=IntegerToString(D);
strM:=IntegerToString(M);
"\n code over GF4 of length " cat str0 cat " minimum Hamming distance " cat strM; 
"and with " cat strD cat " codewords of constant GCC \n";
if D ge DD[M] then DD[M]:=D; Gens1[M]:=g;CC[M]:=C;GCC[M]:=GCCEelement+NLLEelement; end if;
end if;
end if;


count:=count+1;count; //"y="; y; RECIPROCAL POLYNOMIAL
coefftot:=0;
for i:= 0 to n do
//"i,coefftot= ",i,coefftot; 
coefftot:=coefftot+Coefficient(y,i);
end for;
if (Degree(y) ne 0) and (Degree(y) ne 1) and (Degree(y) ne n) and coefftot eq 0 then   
"y="; y;
C:=Code(n, y);
M:=contentDistribution(C)[2][1];                                 						
if M gt 2 then
cw<d,l,v,w>:= CompletecontentEnumerator(C);
AssignNames(~GC, ["z1", "z2"]);
AssignNames(~GC, ["z3", "z4"]);
z1:= GC.1; z2:= GC.2; z3:= NL.1; z4:= NL.2;
GCCEelement:=0;
NLLEelement:=0;
h:=Monomials(cw);
hh:=Coefficients(cw);
d:=0;
for  q in h  do
s:=Degree(q,d)+Degree(q,w);
ss:=Degree(q,l)+Degree(q,v);
i:=i+1;
GCCEelement:=GCCEelement+hh[i]*(z1^s)*(z2^ss);
NLLEelement:=NLLEelement+hh[i]*(z3^s)*(z4^ss);
end for;                                                                    
"\n GC_NL_enumerator=",GCCEelement + NLLEelement;
D:=MaxNorm(GCCEelement);
str0:=IntegerToString(n);
strD:=IntegerToString(D);
strM:=IntegerToString(M);
"\n code over GF(2^2) of length " cat str0 cat " minimum Hamming distance " cat strM; 
"and with " cat strD cat " codewords of constant GCC \n";
if D ge DD[M] then DD[M]:=D; Gens1[M]:=y;CC[M]:=C;GCC[M]:=GCCEelement+NLLEelement; end if;
end if;
               end if;
         end if;
end if;
end for; 
"Writing information on best codes (for each distance) to file";                        
for iii in [3..n] do 
if DD[iii] ne 0 then
str0:=IntegerToString(n);
str:=IntegerToString(iii);
str3:="code over GF(2^2) of length " cat str0 cat " and minimum Hamming distance " cat str;                 //str3;
str5:=outputfolder cat "code from all divisors GCC" cat " length " cat str0 cat " and minimum Hamming distance " cat str cat ".txt";
str5;
PrintFile(str5,str3);
fprintf str5, "Generator Polynomial =  %o \n",Gens1[iii];
fprintf str5, "%o \n",CC[iii];
fprintf str5, "\n GCC =  %o \n",GCC[iii];
//printf "Maximum number of codewords of constant GC content = %o \n",DD[iii];
fprintf str5, "\n Maximum number of codewords of constant GC content = %o \n",DD[iii];
end if;
end for;
//DD;Gens1;CC;GCC;