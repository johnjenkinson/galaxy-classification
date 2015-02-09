%tophat transform
clear all; close all; clc;
L_window=3;
L1=floor(L_window/2); 
L2=L_window-1-L1;
% 	Morphological erosion,   min_falt_v(A,L1,L2), 
%	of an image A[M1,M2] when the v.line 1x[L1+1+L2].
%	For instance, 5=[2+1+2]
%
%	Artyom Grigoryan, TCAT, TAMU 1998
function Z=min_flat_v(A,L1,L2);


	[N2,N1]=size(A);

	L=L1+1+L2;
	j1=1+L1;
	j2=N2-L2;
		
	Z=A;
	
   B=zeros(L,1);
	for j=j1:j2
	for i=1:N1
	   B=double(A(j-L1:j+L2,i));
      T=min(B);
      Z(j,i)=uint8(T);      
	end; end;
%C=min_flat_v(Y_2D,L2,L1);

% 	Morphological erosion,    min_falt_h(A,L1,L2), 
%	of the image A[M1,M2] when the h.line 1x[L1+1+L2]
%	For instance, 5=[2+1+2]
%	
%	Artyom Grigoryan, TCAT, TAMU 1999
function Z=min_flat_h(A,L1,L2) 

	[N2,N1]=size(A);

	L=L1+1+L2;
	i1=1+L1;
	i2=N1-L2;

	Z=A;
   
   B=zeros(1,L);
	for j=1:N2
	for i=i1:i2
	   B=double(A(j,i-L1:i+L2));
      T=min(B);
      Z(j,i)=uint8(T);      
	end; end;
%D=min_flat_h(C,L2,L1);				

% 	Morphological dilation,   max_falt_v(A,L1,L2), 
%	of an image A[M1,M2] when the v.line 1x[L1+1+L2].
%	For instance, 5=[2+1+2]
%
%	Artyom Grigoryan, TCAT, TAMU 1998
function Z=max_flat_v(A,L1,L2);


	[N2,N1]=size(A);

	L=L1+1+L2;
	j1=1+L1;
	j2=N2-L2;
		
	Z=A;
   
   B=zeros(L,1);
	for j=j1:j2
	for i=1:N1
	   B=double(A(j-L1:j+L2,i));
      T=max(B);
      Z(j,i)=uint8(T);      
	end; end;
%%C=max_flat_v(D,L2,L1);

% 	Morphological dilation,    man_falt_h(A,L1,L2), 
%	of the image A[M1,M2] when the h.line 1x[L1+1+L2]
%	For instance, 5=[2+1+2]
%	
%	Artyom Grigoryan, TCAT, TAMU 1999

function Z=max_flat_h(A,L1,L2);

	[N2,N1]=size(A);

	L=L1+1+L2;
	i1=1+L1;
	i2=N1-L2;

	Z=A;
   
   B=zeros(1,L);
	for j=1:N2
	for i=i1:i2
	   B=double(A(j,i-L1:i+L2));
      T=max(B);
      Z(j,i)=uint8(T);      
	end; end;
%D=max_flat_h(C,L2,L1);	clear C;   

image_tht=tht_2Dfast(image_tobe,L_window);   

    gs=max(max(image_tht))-min(min(image_tht));    
    image(image_tht*2);
    colormap(gray(gs));    
    axis image;        axis off; 
    set(h_picture,'FontName','Times','FontSize',8);
    h_title=title('Top-Hat transform (3x3)'); 
    set(h_title,'Color',[0 0 0],'FontName','Times','FontSize',10);
    clear h_title N_temp M_temp;
