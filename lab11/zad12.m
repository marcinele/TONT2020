% This script is written and read by pdetool and should NOT be edited.
% There are two recommended alternatives:
% 1) Export the required variables from pdetool and create a MATLAB script
%    to perform operations on these.
% 2) Define the problem completely using a MATLAB script. See
%    https://www.mathworks.com/help/pde/examples.html for examples
%    of this approach.
function pdemodel
[pde_fig,ax]=pdeinit;
pdetool('appl_cb',9);
set(ax,'DataAspectRatio',[1 1 3.3333333333333335]);
set(ax,'PlotBoxAspectRatio',[1 0.48697916666666674 0.48697916666666674]);
set(ax,'XLim',[-0.29999999999999999 0.29999999999999999]);
set(ax,'YLim',[-0.29999999999999999 0.29999999999999999]);
set(ax,'XTickMode','auto');
set(ax,'YTickMode','auto');
pdetool('gridon','on');

% Geometry description:
pderect([-0.0036800986842104172 0.0022409539473685208 0.016362053194483667 0.17228310582606257],'R1');
pderect([0.0027549342105264996 -0.29132401315789475 0.17107989726991268 0.1631851604278074],'R2');
pdeellip(0.0003906250000001027,-0.021649838164930948,0.026315789473684126,0.043421052631578971,...
0,'E1');
set(findobj(get(pde_fig,'Children'),'Tag','PDEEval'),'String','R1+R2+E1')

% Boundary conditions:
pdetool('changemode',0)
pdesetbd(23,...
'dir',...
1,...
'1',...
'200')
pdesetbd(21,...
'dir',...
1,...
'1',...
'200')
pdesetbd(20,...
'dir',...
1,...
'1',...
'200')
pdesetbd(19,...
'dir',...
1,...
'1',...
'200')
pdesetbd(18,...
'dir',...
1,...
'1',...
'0')
pdesetbd(16,...
'dir',...
1,...
'1',...
'20')
pdesetbd(15,...
'dir',...
1,...
'1',...
'20')
pdesetbd(13,...
'dir',...
1,...
'1',...
'0')
pdesetbd(11,...
'dir',...
1,...
'1',...
'20')
pdesetbd(9,...
'dir',...
1,...
'1',...
'0')
pdesetbd(8,...
'dir',...
1,...
'1',...
'0')
pdesetbd(6,...
'dir',...
1,...
'1',...
'20')
pdesetbd(4,...
'dir',...
1,...
'1',...
'0')
pdesetbd(3,...
'dir',...
1,...
'1',...
'0')
pdesetbd(2,...
'dir',...
1,...
'1',...
'0')

% Mesh generation:
setappdata(pde_fig,'Hgrad',1.3);
setappdata(pde_fig,'refinemethod','regular');
setappdata(pde_fig,'jiggle',char('on','mean',''));
setappdata(pde_fig,'MesherVersion','preR2013a');
pdetool('initmesh')
pdetool('refine')

% PDE coefficients:
pdeseteq(2,...
'2.23',...
'62',...
'(200)+(62).*(20)',...
'(8.96).*(0.385)',...
'0:0.0001:0.001',...
'20.0',...
'0.0',...
'[0 100]')
setappdata(pde_fig,'currparam',...
['8.96 ';...
'0.385';...
'2.23 ';...
'200  ';...
'62   ';...
'20   '])

% Solve parameters:
setappdata(pde_fig,'solveparam',...
char('0','2394','10','pdeadworst',...
'0.5','longest','0','1e-4','','fixed','inf'))

% Plotflags and user data strings:
setappdata(pde_fig,'plotflags',[1 1 1 1 1 1 5 1 0 0 1 11 1 0 0 0 0 1]);
setappdata(pde_fig,'colstring','');
setappdata(pde_fig,'arrowstring','');
setappdata(pde_fig,'deformstring','');
setappdata(pde_fig,'heightstring','');

% Solve PDE:
pdetool('solve')
