%% ESTE PROGRAMA LEE Y GRAFICA LA BATIMETRIA EN ARCHIVO REGIONAL.DEPTH.A
% DEL DOMINIO EN EL GOLFO DE MEXICO
% EROP, 2020

clear all
close all
clc

%% Define paths and some parameters

addpath(genpath(['','../UTILITIES/']));
addpath(genpath(['','../cmocean/']));

region = 'GOMl0.04/';
user = 'erick';
hdir = '/LUSTRE/CIGOM/HYCOM/EXPS_CURSO/';
idir = [hdir,user,'/tutorial/topo/'];
psdir = [hdir,user,'/figures/Horz_maps/'];

% size of the domain
idm = 541 ;  % size of the domain 1/25°
jdm  = 385 ;  %
kdm = 27 ;   % number of layers

% Read grid and bathymetry files
file_grid = 'regional.grid.a';
file_depth = 'regional.depth.a';
[plon,plat,ulon,ulat,vlon,vlat,qlon,qlat,pang,pscx,pscy,qscx,qscy, ...
  uscx,uscy,vscx,vscy,cori,pasp]=read_grid_hycom(idm, jdm, rdir, file_grid);
bathy=read_depth_hycom(idm, jdm, ([rdir, file_depth]));

% Plot
figure
pcolor(bathy), colorbar

% Save figure for CEOF 1
disp(['Saving figure'])
print('-djpeg100','-r300',[File_1,'.jpg']);
