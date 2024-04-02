clear all
format long

% Get the Graph structure:
graph = read_gml('Data_83.gml');

% Show the Graph structure:
show_graph = graph;
show_nodes = graph.node;
show_edges = graph.edge;

no_nodes=length(show_nodes);
no_edges=length(show_edges);

match=["_","0","1","2","3","4","5","6","7","8","9"];

for nn=1:no_nodes
    x1=extractfield(show_nodes(nn),'dn_position_x');
    y1=extractfield(show_nodes(nn),'dn_position_y');
    z1=extractfield(show_nodes(nn),'dn_position_z');
    x11=cell2mat(x1);
    y11=cell2mat(y1);
    z11=cell2mat(z1);
    x111=str2num(x11);
    y111=str2num(y11);
    z111=str2num(z11);
    x_position(nn)=str2num(x111);
    y_position(nn)=str2num(y111);
    z_position(nn)=str2num(z111);
    S_Name(nn)= erase(str2num(cell2mat(extractfield(show_nodes(nn),'dn_fsname'))),match);
end

S_Name_T=unique(S_Name','rows');
S_Name_D=S_Name_T';

for nn=1:no_edges
    EDGE(nn)=nn;
    e_source(nn)=extractfield(show_edges(nn),'source');
    e_target(nn)=extractfield(show_edges(nn),'target');
    xn1=extractfield(show_edges(nn),'fiber_length_mean');
    xn11=cell2mat(xn1);
    xn111=str2num(xn11);
    FLM(nn)=str2num(xn111);

    xnn1=extractfield(show_edges(nn),'number_of_fibers');
    xnn11=cell2mat(xnn1);
    xnn111=str2num(xnn11);
    NOF(nn)=str2num(xnn111);

end

Connections=transpose([e_source;e_target]);
Centers=transpose([x_position;y_position;z_position]);
C=Centers;
Property=transpose(NOF);

W=zeros(no_nodes,no_nodes);
D=zeros(no_nodes,no_nodes);
for nn=1:no_edges
    W(e_source(nn),e_target(nn))=NOF(nn)/FLM(nn);
end

for nn=1:no_nodes
    for mm=nn+1:no_nodes
        W(mm,nn)=W(nn,mm);
    end
end
for nn=1:no_nodes
    D(nn,nn)=sum(W(nn,:));
end
for mm=1:no_nodes
    for nn=1:no_nodes
        L(nn,mm)=D(nn,mm)-W(nn,mm);
    end
end

save("GraphData_83.mat","Centers","Connections","L");
