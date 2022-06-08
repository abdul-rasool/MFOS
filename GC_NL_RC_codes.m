outputfolder:="C:/mic/.../GC_NL_RC_codes/"; 
F<x> := FiniteField(2^2);
d:=4;
n:=9;


Z3:=Integers(3);
Z := IntegerRing();
GC := PolynomialRing(Z, 2); 
y2 := Sym(n);
V := VectorSpace(F, n);
zero := V ! 0;
zero[1]:=1;
zero[n]:=1;
Per :=PermutationGroup< n | {(i,i+1)(n-i,n+1-i): i in [1..n/2]}> ;
u := V ! zero;
ReversibleCode:=PermutationCode(u, Per);
SetVerbose("bestcode",true);
C:=BestDimensionLinearCode(n, W, d);
Length(n);Dimension(C);
PGC:=PermutationGroup(C);
perm:=elt<y2|4,5,6,1,2,3,10,11,12,7,8,9,16,17,18,13,14,15>;
//(1, 4)(2, 5)(3, 6)(7, 10)(8, 11)(9, 12)(13, 16)(14, 17)(15, 18)
D1:= [0: x in [1..n] ]; 
//read string;
k3:=1;
for i6 in [1..n] do
s3:="false";
for i3 in [1..n] do 
s1:= Image(perm, i6)  eq D1[i3]  ;
s2:=Image(perm,Image(perm, i6))  eq D1[i3];
if s1 eq true or s2 eq true then
s3 := "true";
end if;
end for;
if s3  eq   "false"   then
D1[n+1-k3]:=Image(perm, i6);
D1[k3]:=Image(perm,Image(perm, i6));
k3:=k3+1;
end if;
end for;
perm1:=y2 ! D1;
//D:=C^perm1;
D:=C^(perm1^(-1));
M:=MinimumWeight(W);
g:=0;
T:=0;
cwD<k,l,v,w>:= CompleteWeightEnumerator(D);
GCWD:=Evaluate(cwD,<l,l,v,v>);
g:=g+GCWD;
fixgcwcodewordsD:=MaxNorm(GCWD);

for i2 in Coefficients(GCWD) do
if i2 ne fixgcwcodewordsD then
g:=Reductum(g);
else
T:=T+g;
end if ;
end for;
gcw:=LeadingMonomial(T);
gcw1:=Degree(T, l);
C0:= D meet ReversibleCode;
cwC0<k,l,v,w>:= CompleteWeightEnumerator(C0);
GCWC0:=Evaluate(cwC0,<l,l,v,v>);  
fixgcwcodewordsC0:=MonomialCoefficient(GCWC0,gcw);
A:=(fixgcwcodewordsD-fixgcwcodewordsC0)/2;


strn:=IntegerToString(n);
strd:=IntegerToString(d);
str3:="lower bounds of GC_NL_RC code of length " Img strn cat " and minimum Hamming distance " cat strd;
str5:=outputfolder cat "GC_NL_RC_" cat " length " cat strn cat " and minimum Hamming distance " cat strd cat ".txt";
PrintFile(str5,str3);
fprintf str5, "%o \n",D;
fprintf str5, "\n constant GC-w =  %o \n",gcw1;
fprintf str5, "C0 = %o \n",C0;
fprintf str5, "D size= %o \n",D;
fprintf str5, "\n  codewords of fixed GC, NL and RC constraints = %o \n",A;
fprintf str5, "\n the involution =  %o \n",perm;

if A ne 0  and A le 50000 then
E:=ZeroMatrix((2^2), Z !( 2*A),n);
i:=0;
j:=0;
for d in D do
sssum:=0;
for iiii in [1..n] do 
if ((d[iiii] eq 0) or (d[iiii] eq 1)) then 
sssum:=sssum+1; 
end if;
end for;
if d in C0 then j:=j+1;end if;
if not d in C0 and sssum eq gcw1 then i:=i+1;i;E[i]:=Vector(d); end if;
end for;
//E;
"         ";
//read string;
B:=ZeroMatrix((2^2),Z ! (2*A),n);
for i7 in [1..2*A ] do
for i8 in [1..n] do
B[i7,n+1-i8]:=E[i7,i8];
end for;
end for;
//B;
"     ";
//read string;
Cat:=ZeroMatrix(Z3,Z ! (2*A),1);
for i5 in [1..2*A] do
for i6 in [1..2*A] do
if E[i5] eq B[i6] then 
Cat[i5,1]:=1;Cat[i6,1]:=2;
end if;
end for;
end for;
//read string;
codeheader:=IntegerToString(Z ! A) cat " codes found";
codeheader;
filestring:=outputfolder cat IntegerToString(n) cat "-" cat IntegerToString(d) cat "-GC-RC-" cat IntegerToString(Z ! A) cat ".cod";
filestring;
PrintFile(filestring,codeheader);
wordcount:=0;
for i4 in [1..(2*A)] do 
if Cat[i4,1] eq 1 then
codeline:="";
wordcount:=wordcount+1;
for iiiii in [1..n/2] do 
     case E[i4,iiiii]:
        when 1: codeline:=codeline cat "G"; 
        when x: codeline:=codeline cat "A";
        when x^2: codeline:=codeline cat "T";  
        when 0: codeline:=codeline cat "C";  
     end case;
end for;
for iiii in [(n/2)+1..n] do 
     case E[i4,iiii]:
        when 1: codeline:=codeline cat "C"; 
        when x: codeline:=codeline cat "T";
        when x^2: codeline:=codeline cat "A";  
        when 0: codeline:=codeline cat "G";  
     end case;
end for;
codeline:=codeline cat ": ";
codeline:=codeline cat IntegerToString(wordcount);
PrintFile(filestring,codeline);
end if;
end for;

end if ;
end for;













