function out = model
%
% Circut.m
%

import com.comsol.model.*
import com.comsol.model.util.*

model = ModelUtil.create('Model');

model.modelPath('F:\Gitpush\Comsol');

model.component.create('comp1', true);

model.component('comp1').geom.create('geom1', 3);

model.component('comp1').mesh.create('mesh1');

model.component('comp1').physics.create('solid', 'SolidMechanics', 'geom1');
model.component('comp1').physics('solid').prop('StructuralTransientBehavior').set('StructuralTransientBehavior', 'Quasistatic');
model.component('comp1').physics.create('ht', 'HeatTransfer', 'geom1');
model.component('comp1').physics('ht').prop('ShapeProperty').set('order_temperature', '1');
model.component('comp1').physics.create('ec', 'ConductiveMedia', 'geom1');

model.component('comp1').multiphysics.create('te1', 'ThermalExpansion', 3);
model.component('comp1').multiphysics('te1').selection.all;
model.component('comp1').multiphysics('te1').set('Heat_physics', 'ht');
model.component('comp1').multiphysics('te1').set('Solid_physics', 'solid');
model.component('comp1').multiphysics.create('tc1', 'TemperatureCoupling');
model.component('comp1').multiphysics('tc1').set('TemperatureSource_physics', 'ht');
model.component('comp1').multiphysics('tc1').set('TemperatureDestination_physics', 'solid');
model.component('comp1').multiphysics.create('emh1', 'ElectromagneticHeating');
model.component('comp1').multiphysics('emh1').set('EMHeat_physics', 'ec');
model.component('comp1').multiphysics('emh1').set('Heat_physics', 'ht');

model.study.create('std1');
model.study('std1').setGenConv(true);
model.study('std1').create('time', 'Transient');
model.study('std1').feature('time').activate('solid', true);
model.study('std1').feature('time').activate('ht', true);
model.study('std1').feature('time').activate('ec', true);
model.study('std1').feature('time').activate('te1', true);
model.study('std1').feature('time').activate('tc1', true);
model.study('std1').feature('time').activate('emh1', true);

model.component('comp1').geom('geom1').lengthUnit('mm');
model.component('comp1').geom('geom1').create('blk1', 'Block');
model.component('comp1').geom('geom1').feature('blk1').set('size', [1 0.02 1]);
model.component('comp1').geom('geom1').run('blk1');
model.component('comp1').geom('geom1').run('blk1');
model.component('comp1').geom('geom1').create('blk2', 'Block');
model.component('comp1').geom('geom1').feature('blk2').set('size', [1 0.005 0.7]);
model.component('comp1').geom('geom1').feature('blk2').set('pos', [0.1 0.02 0.1]);
model.component('comp1').geom('geom1').runPre('fin');
model.component('comp1').geom('geom1').feature('blk2').set('base', 'center');
model.component('comp1').geom('geom1').runPre('fin');
model.component('comp1').geom('geom1').feature('blk2').set('size', [0.1 0.005 0.7]);
model.component('comp1').geom('geom1').run('blk2');
model.component('comp1').geom('geom1').runPre('fin');
model.component('comp1').geom('geom1').run('blk2');
model.component('comp1').geom('geom1').feature('blk2').set('base', 'corner');
model.component('comp1').geom('geom1').runPre('fin');
model.component('comp1').geom('geom1').run('blk2');
model.component('comp1').geom('geom1').create('blk3', 'Block');
model.component('comp1').geom('geom1').feature('blk3').set('size', [0.45 0.005 0.1]);
model.component('comp1').geom('geom1').feature('blk3').set('pos', [0.1 0.02 0.8]);
model.component('comp1').geom('geom1').run('blk3');
model.component('comp1').geom('geom1').feature.duplicate('blk4', 'blk3');
model.component('comp1').geom('geom1').feature('blk4').set('size', [0.1 0.005 0.6]);
model.component('comp1').geom('geom1').feature('blk4').set('pos', [0.45 0.02 0.2]);
model.component('comp1').geom('geom1').run('blk4');
model.component('comp1').geom('geom1').run;
model.component('comp1').geom('geom1').runPre('fin');
model.component('comp1').geom('geom1').feature.duplicate('blk5', 'blk4');
model.component('comp1').geom('geom1').feature('blk5').set('size', [0.45 0.005 0.1]);
model.component('comp1').geom('geom1').feature('blk5').set('pos', [0.45 0.02 0.1]);
model.component('comp1').geom('geom1').runPre('fin');
model.component('comp1').geom('geom1').feature.duplicate('blk6', 'blk5');
model.component('comp1').geom('geom1').feature('blk6').set('size', [0.1 0.005 0.7]);
model.component('comp1').geom('geom1').feature('blk6').set('pos', [0.8 0.02 0.2]);
model.component('comp1').geom('geom1').runPre('fin');
model.component('comp1').geom('geom1').run('blk6');
model.component('comp1').geom('geom1').create('uni1', 'Union');
model.component('comp1').geom('geom1').feature('uni1').selection('input').set({'blk2' 'blk3' 'blk4' 'blk5' 'blk6'});
model.component('comp1').geom('geom1').runPre('fin');
model.component('comp1').geom('geom1').run;

model.component('comp1').material.create('mat1', 'Common');
model.component('comp1').material('mat1').label('Copper [solid,polished]');
model.component('comp1').material('mat1').propertyGroup('def').set('thermalexpansioncoefficient', '(alpha_solid_1(T[1/K])[1/K]+(Tempref-293[K])*if(abs(T-Tempref)>1e-3,(alpha_solid_1(T[1/K])[1/K]-alpha_solid_1(Tempref[1/K])[1/K])/(T-Tempref),d(alpha_solid_1(T[1/K])[1/K],T)))/(1+alpha_solid_1(Tempref[1/K])[1/K]*(Tempref-293[K]))');
model.component('comp1').material('mat1').propertyGroup('def').set('heatcapacity', 'C_solid_1(T[1/K])[J/(kg*K)]');
model.component('comp1').material('mat1').propertyGroup('def').set('HC', 'HC_solid_1(T[1/K])[J/(mol*K)]');
model.component('comp1').material('mat1').propertyGroup('def').set('VP', 'VP_solid_1(T[1/K])[Pa]');
model.component('comp1').material('mat1').propertyGroup('def').set('emissivity', 'epsilon_solid_polished_2(T[1/K])');
model.component('comp1').material('mat1').propertyGroup('def').set('density', 'rho_solid_1(T[1/K])[kg/m^3]');
model.component('comp1').material('mat1').propertyGroup('def').func.create('alpha_solid_1', 'Piecewise');
model.component('comp1').material('mat1').propertyGroup('def').func('alpha_solid_1').set('funcname', 'alpha_solid_1');
model.component('comp1').material('mat1').propertyGroup('def').func('alpha_solid_1').set('arg', 'T');
model.component('comp1').material('mat1').propertyGroup('def').func('alpha_solid_1').set('extrap', 'constant');
model.component('comp1').material('mat1').propertyGroup('def').func('alpha_solid_1').set('pieces', {'4.0' '100.0' '1.104402E-5+4.812192E-8*T^1-1.223083E-10*T^2';  ...
'100.0' '210.0' '1.276495E-5+1.849516E-8*T^1+1.203963E-11*T^2-1.023671E-13*T^3';  ...
'210.0' '800.0' '1.47252E-5+8.137386E-9*T^1-4.58414E-12*T^2';  ...
'800.0' '1273.0' '1.83456E-5-1.577095E-9*T^1+1.908643E-12*T^2'});
model.component('comp1').material('mat1').propertyGroup('def').func.create('C_solid_1', 'Piecewise');
model.component('comp1').material('mat1').propertyGroup('def').func('C_solid_1').set('funcname', 'C_solid_1');
model.component('comp1').material('mat1').propertyGroup('def').func('C_solid_1').set('arg', 'T');
model.component('comp1').material('mat1').propertyGroup('def').func('C_solid_1').set('extrap', 'constant');
model.component('comp1').material('mat1').propertyGroup('def').func('C_solid_1').set('pieces', {'1.0' '17.5' '0.008168055+0.00104457*T^1+0.003441219*T^2+2.847033E-4*T^3+2.246429E-5*T^4';  ...
'17.5' '62.0' '29.05972-3.767169*T^1+0.1540539*T^2-0.001048364*T^3+3.010206E-7*T^4';  ...
'62.0' '300.0' '-215.2814+8.236392*T^1-0.04732108*T^2+1.291112E-4*T^3-1.357031E-7*T^4';  ...
'300.0' '1300.0' '342.764+0.1338348*T^1+5.535252E-5*T^2-1.971221E-7*T^3+1.140747E-10*T^4'});
model.component('comp1').material('mat1').propertyGroup('def').func.create('HC_solid_1', 'Piecewise');
model.component('comp1').material('mat1').propertyGroup('def').func('HC_solid_1').set('funcname', 'HC_solid_1');
model.component('comp1').material('mat1').propertyGroup('def').func('HC_solid_1').set('arg', 'T');
model.component('comp1').material('mat1').propertyGroup('def').func('HC_solid_1').set('extrap', 'constant');
model.component('comp1').material('mat1').propertyGroup('def').func('HC_solid_1').set('pieces', {'1.0' '17.5' '5.190474E-4+6.637828E-5*T^1+2.186757E-4*T^2+1.809176E-5*T^3+1.427516E-6*T^4';  ...
'17.5' '62.0' '1.846629-0.2393885*T^1+0.00978951*T^2-6.661932E-5*T^3+1.912866E-8*T^4';  ...
'62.0' '300.0' '-13.68027+0.5233899*T^1-0.003007065*T^2+8.204498E-6*T^3-8.623391E-9*T^4';  ...
'300.0' '1300.0' '21.78128+0.008504666*T^1+3.517431E-6*T^2-1.252632E-8*T^3+7.248993E-12*T^4'});
model.component('comp1').material('mat1').propertyGroup('def').func.create('VP_solid_1', 'Piecewise');
model.component('comp1').material('mat1').propertyGroup('def').func('VP_solid_1').set('funcname', 'VP_solid_1');
model.component('comp1').material('mat1').propertyGroup('def').func('VP_solid_1').set('arg', 'T');
model.component('comp1').material('mat1').propertyGroup('def').func('VP_solid_1').set('extrap', 'constant');
model.component('comp1').material('mat1').propertyGroup('def').func('VP_solid_1').set('pieces', {'293.0' '1358.0' '(exp((-1.774800e+04/T-7.317000e-01*log10(T)+1.200381e+01)*log(10.0)))*1.333200e+02'});
model.component('comp1').material('mat1').propertyGroup('def').func.create('epsilon_solid_polished_2', 'Piecewise');
model.component('comp1').material('mat1').propertyGroup('def').func('epsilon_solid_polished_2').set('funcname', 'epsilon_solid_polished_2');
model.component('comp1').material('mat1').propertyGroup('def').func('epsilon_solid_polished_2').set('arg', 'T');
model.component('comp1').material('mat1').propertyGroup('def').func('epsilon_solid_polished_2').set('extrap', 'constant');
model.component('comp1').material('mat1').propertyGroup('def').func('epsilon_solid_polished_2').set('pieces', {'293.0' '750.0' '0.0027+2.72E-5*T^1'});
model.component('comp1').material('mat1').propertyGroup('def').func.create('rho_solid_1', 'Piecewise');
model.component('comp1').material('mat1').propertyGroup('def').func('rho_solid_1').set('funcname', 'rho_solid_1');
model.component('comp1').material('mat1').propertyGroup('def').func('rho_solid_1').set('arg', 'T');
model.component('comp1').material('mat1').propertyGroup('def').func('rho_solid_1').set('extrap', 'constant');
model.component('comp1').material('mat1').propertyGroup('def').func('rho_solid_1').set('pieces', {'4.0' '90.0' '9028.155+0.001936185*T^1-4.310034E-4*T^2-8.227902E-6*T^3';  ...
'90.0' '250.0' '9034.264-0.05885933*T^1-0.001406238*T^2+1.736657E-6*T^3';  ...
'250.0' '800.0' '9062.242-0.3913962*T^1-8.947644E-5*T^2';  ...
'800.0' '1273.0' '9038.962-0.3593546*T^1-9.31574E-5*T^2'});
model.component('comp1').material('mat1').propertyGroup('def').addInput('temperature');
model.component('comp1').material('mat1').propertyGroup('def').addInput('strainreferencetemperature');
model.component('comp1').material('mat1').propertyGroup.create('ThermalExpansion', 'Thermal expansion');
model.component('comp1').material('mat1').propertyGroup('ThermalExpansion').set('dL', '(dL_solid_1(T[1/K])-dL_solid_1(Tempref[1/K]))/(1+dL_solid_1(Tempref[1/K]))');
model.component('comp1').material('mat1').propertyGroup('ThermalExpansion').set('dLIso', '(dL_solid_1(T)-dL_solid_1(Tempref))/(1+dL_solid_1(Tempref))');
model.component('comp1').material('mat1').propertyGroup('ThermalExpansion').set('alphatan', 'CTE_solid_1(T[1/K])[1/K]');
model.component('comp1').material('mat1').propertyGroup('ThermalExpansion').set('alphatanIso', 'CTE_solid_1(T)');
model.component('comp1').material('mat1').propertyGroup('ThermalExpansion').func.create('dL_solid_1', 'Piecewise');
model.component('comp1').material('mat1').propertyGroup('ThermalExpansion').func('dL_solid_1').set('funcname', 'dL_solid_1');
model.component('comp1').material('mat1').propertyGroup('ThermalExpansion').func('dL_solid_1').set('arg', 'T');
model.component('comp1').material('mat1').propertyGroup('ThermalExpansion').func('dL_solid_1').set('extrap', 'constant');
model.component('comp1').material('mat1').propertyGroup('ThermalExpansion').func('dL_solid_1').set('pieces', {'4.0' '80.0' '-0.003272586-6.837087E-8*T^1+1.574823E-8*T^2+3.040518E-10*T^3';  ...
'80.0' '250.0' '-0.003491523+2.12144E-6*T^1+5.197613E-8*T^2-6.339761E-11*T^3';  ...
'250.0' '800.0' '-0.004355177+1.293125E-5*T^1+7.341229E-9*T^2-2.541027E-12*T^3';  ...
'800.0' '1273.0' '-0.004359242+1.427188E-5*T^1+3.639858E-9*T^2'});
model.component('comp1').material('mat1').propertyGroup('ThermalExpansion').func.create('CTE_solid_1', 'Piecewise');
model.component('comp1').material('mat1').propertyGroup('ThermalExpansion').func('CTE_solid_1').set('funcname', 'CTE_solid_1');
model.component('comp1').material('mat1').propertyGroup('ThermalExpansion').func('CTE_solid_1').set('arg', 'T');
model.component('comp1').material('mat1').propertyGroup('ThermalExpansion').func('CTE_solid_1').set('extrap', 'constant');
model.component('comp1').material('mat1').propertyGroup('ThermalExpansion').func('CTE_solid_1').set('pieces', {'4.0' '13.0' '-8.574809E-9+4.13567E-9*T^1-5.673583E-10*T^2+5.520915E-11*T^3';  ...
'13.0' '60.0' '2.194122E-7-2.662325E-8*T^1+4.800942E-10*T^2+6.093443E-11*T^3-6.195564E-13*T^4';  ...
'60.0' '250.0' '-8.81E-6+3.292355E-7*T^1-1.773823E-9*T^2+4.545667E-12*T^3-4.483983E-15*T^4';  ...
'250.0' '800.0' '1.104756E-5+2.743089E-8*T^1-3.159431E-11*T^2+1.370433E-14*T^3'});
model.component('comp1').material('mat1').propertyGroup('ThermalExpansion').addInput('temperature');
model.component('comp1').material('mat1').propertyGroup('ThermalExpansion').addInput('strainreferencetemperature');
model.component('comp1').material('mat1').propertyGroup.create('Enu', 'Young''s modulus and Poisson''s ratio');
model.component('comp1').material('mat1').propertyGroup('Enu').set('youngsmodulus', 'E(T[1/K])[Pa]');
model.component('comp1').material('mat1').propertyGroup('Enu').set('poissonsratio', 'nu(T[1/K])');
model.component('comp1').material('mat1').propertyGroup('Enu').func.create('E', 'Piecewise');
model.component('comp1').material('mat1').propertyGroup('Enu').func('E').set('funcname', 'E');
model.component('comp1').material('mat1').propertyGroup('Enu').func('E').set('arg', 'T');
model.component('comp1').material('mat1').propertyGroup('Enu').func('E').set('extrap', 'constant');
model.component('comp1').material('mat1').propertyGroup('Enu').func('E').set('pieces', {'4.0' '300.0' '1.37E11-3.330669E-6*T^1-127000.0*T^2'; '300.0' '1250.0' '1.408492E11-4.703751E7*T^1-12923.82*T^2'});
model.component('comp1').material('mat1').propertyGroup('Enu').func.create('nu', 'Piecewise');
model.component('comp1').material('mat1').propertyGroup('Enu').func('nu').set('funcname', 'nu');
model.component('comp1').material('mat1').propertyGroup('Enu').func('nu').set('arg', 'T');
model.component('comp1').material('mat1').propertyGroup('Enu').func('nu').set('extrap', 'constant');
model.component('comp1').material('mat1').propertyGroup('Enu').func('nu').set('pieces', {'4.0' '300.0' '0.3378748+7.672235E-7*T^1-3.529109E-8*T^2'});
model.component('comp1').material('mat1').propertyGroup('Enu').addInput('temperature');
model.component('comp1').material('mat1').propertyGroup.create('KG', 'Bulk modulus and shear modulus');
model.component('comp1').material('mat1').propertyGroup('KG').set('G', 'mu(T[1/K])[Pa]');
model.component('comp1').material('mat1').propertyGroup('KG').set('K', 'kappa(T[1/K])[Pa]');
model.component('comp1').material('mat1').propertyGroup('KG').func.create('mu', 'Piecewise');
model.component('comp1').material('mat1').propertyGroup('KG').func('mu').set('funcname', 'mu');
model.component('comp1').material('mat1').propertyGroup('KG').func('mu').set('arg', 'T');
model.component('comp1').material('mat1').propertyGroup('KG').func('mu').set('extrap', 'constant');
model.component('comp1').material('mat1').propertyGroup('KG').func('mu').set('pieces', {'4.0' '300.0' '5.12E10+4.718448E-7*T^1-46300.0*T^2'});
model.component('comp1').material('mat1').propertyGroup('KG').func.create('kappa', 'Piecewise');
model.component('comp1').material('mat1').propertyGroup('KG').func('kappa').set('funcname', 'kappa');
model.component('comp1').material('mat1').propertyGroup('KG').func('kappa').set('arg', 'T');
model.component('comp1').material('mat1').propertyGroup('KG').func('kappa').set('extrap', 'constant');
model.component('comp1').material('mat1').propertyGroup('KG').func('kappa').set('pieces', {'4.0' '300.0' '1.408545E11-151138.5*T^1-155999.5*T^2'});
model.component('comp1').material('mat1').propertyGroup('KG').addInput('temperature');
model.component('comp1').material('mat1').set('family', 'copper');
model.component('comp1').material.remove('mat1');
model.component('comp1').material.create('mat1', 'Common');
model.component('comp1').material('mat1').propertyGroup.create('Enu', 'Young''s modulus and Poisson''s ratio');
model.component('comp1').material('mat1').propertyGroup.create('linzRes', 'Linearized resistivity');
model.component('comp1').material('mat1').label('Copper');
model.component('comp1').material('mat1').set('family', 'copper');
model.component('comp1').material('mat1').propertyGroup('def').set('relpermeability', {'1' '0' '0' '0' '1' '0' '0' '0' '1'});
model.component('comp1').material('mat1').propertyGroup('def').set('electricconductivity', {'5.998e7[S/m]' '0' '0' '0' '5.998e7[S/m]' '0' '0' '0' '5.998e7[S/m]'});
model.component('comp1').material('mat1').propertyGroup('def').set('thermalexpansioncoefficient', {'17e-6[1/K]' '0' '0' '0' '17e-6[1/K]' '0' '0' '0' '17e-6[1/K]'});
model.component('comp1').material('mat1').propertyGroup('def').set('heatcapacity', '385[J/(kg*K)]');
model.component('comp1').material('mat1').propertyGroup('def').set('relpermittivity', {'1' '0' '0' '0' '1' '0' '0' '0' '1'});
model.component('comp1').material('mat1').propertyGroup('def').set('density', '8960[kg/m^3]');
model.component('comp1').material('mat1').propertyGroup('def').set('thermalconductivity', {'400[W/(m*K)]' '0' '0' '0' '400[W/(m*K)]' '0' '0' '0' '400[W/(m*K)]'});
model.component('comp1').material('mat1').propertyGroup('Enu').set('youngsmodulus', '110e9[Pa]');
model.component('comp1').material('mat1').propertyGroup('Enu').set('poissonsratio', '0.35');
model.component('comp1').material('mat1').propertyGroup('linzRes').set('rho0', '');
model.component('comp1').material('mat1').propertyGroup('linzRes').set('alpha', '');
model.component('comp1').material('mat1').propertyGroup('linzRes').set('Tref', '');
model.component('comp1').material('mat1').propertyGroup('linzRes').set('rho0', '1.72e-8[ohm*m]');
model.component('comp1').material('mat1').propertyGroup('linzRes').set('alpha', '0.0039[1/K]');
model.component('comp1').material('mat1').propertyGroup('linzRes').set('Tref', '298[K]');
model.component('comp1').material('mat1').propertyGroup('linzRes').addInput('temperature');
model.component('comp1').material('mat1').set('family', 'copper');
model.component('comp1').material('mat1').selection.set([1]);
model.component('comp1').material.create('mat2', 'Common');
model.component('comp1').material('mat2').propertyGroup.create('Enu', 'Young''s modulus and Poisson''s ratio');
model.component('comp1').material('mat2').propertyGroup.create('RefractiveIndex', 'Refractive index');
model.component('comp1').material('mat2').label('Silicon');
model.component('comp1').material('mat2').set('family', 'custom');
model.component('comp1').material('mat2').set('specular', 'custom');
model.component('comp1').material('mat2').set('customspecular', [0.7843137254901961 1 1]);
model.component('comp1').material('mat2').set('diffuse', 'custom');
model.component('comp1').material('mat2').set('customdiffuse', [0.6666666666666666 0.6666666666666666 0.7058823529411765]);
model.component('comp1').material('mat2').set('ambient', 'custom');
model.component('comp1').material('mat2').set('customambient', [0.6666666666666666 0.6666666666666666 0.7058823529411765]);
model.component('comp1').material('mat2').set('noise', true);
model.component('comp1').material('mat2').set('noisefreq', 1);
model.component('comp1').material('mat2').set('lighting', 'cooktorrance');
model.component('comp1').material('mat2').set('fresnel', 0.7);
model.component('comp1').material('mat2').set('roughness', 0.5);
model.component('comp1').material('mat2').propertyGroup('def').set('relpermeability', {'1' '0' '0' '0' '1' '0' '0' '0' '1'});
model.component('comp1').material('mat2').propertyGroup('def').set('electricconductivity', {'1e-12[S/m]' '0' '0' '0' '1e-12[S/m]' '0' '0' '0' '1e-12[S/m]'});
model.component('comp1').material('mat2').propertyGroup('def').set('thermalexpansioncoefficient', {'2.6e-6[1/K]' '0' '0' '0' '2.6e-6[1/K]' '0' '0' '0' '2.6e-6[1/K]'});
model.component('comp1').material('mat2').propertyGroup('def').set('heatcapacity', '700[J/(kg*K)]');
model.component('comp1').material('mat2').propertyGroup('def').set('relpermittivity', {'11.7' '0' '0' '0' '11.7' '0' '0' '0' '11.7'});
model.component('comp1').material('mat2').propertyGroup('def').set('density', '2329[kg/m^3]');
model.component('comp1').material('mat2').propertyGroup('def').set('thermalconductivity', {'130[W/(m*K)]' '0' '0' '0' '130[W/(m*K)]' '0' '0' '0' '130[W/(m*K)]'});
model.component('comp1').material('mat2').propertyGroup('Enu').set('youngsmodulus', '170e9[Pa]');
model.component('comp1').material('mat2').propertyGroup('Enu').set('poissonsratio', '0.28');
model.component('comp1').material('mat2').propertyGroup('RefractiveIndex').set('n', '');
model.component('comp1').material('mat2').propertyGroup('RefractiveIndex').set('ki', '');
model.component('comp1').material('mat2').propertyGroup('RefractiveIndex').set('n', {'3.48' '0' '0' '0' '3.48' '0' '0' '0' '3.48'});
model.component('comp1').material('mat2').propertyGroup('RefractiveIndex').set('ki', {'0' '0' '0' '0' '0' '0' '0' '0' '0'});
model.component('comp1').material('mat2').set('family', 'custom');
model.component('comp1').material('mat2').set('lighting', 'cooktorrance');
model.component('comp1').material('mat2').set('fresnel', 0.7);
model.component('comp1').material('mat2').set('roughness', 0.5);
model.component('comp1').material('mat2').set('ambient', 'custom');
model.component('comp1').material('mat2').set('customambient', [0.6666666666666666 0.6666666666666666 0.7058823529411765]);
model.component('comp1').material('mat2').set('diffuse', 'custom');
model.component('comp1').material('mat2').set('customdiffuse', [0.6666666666666666 0.6666666666666666 0.7058823529411765]);
model.component('comp1').material('mat2').set('specular', 'custom');
model.component('comp1').material('mat2').set('customspecular', [0.7843137254901961 1 1]);
model.component('comp1').material('mat2').set('noisescale', 0);
model.component('comp1').material('mat2').set('noise', 'on');
model.component('comp1').material('mat2').set('noisefreq', 1);
model.component('comp1').material('mat2').set('noise', 'on');
model.component('comp1').material('mat2').set('alpha', 1);
model.component('comp1').material('mat2').selection.set([2 3 4 5 6]);

model.component('comp1').physics('solid').create('fix1', 'Fixed', 2);
model.component('comp1').physics('solid').feature('fix1').selection.set([13 14 24 25 33]);

model.component('comp1').mesh('mesh1').run;

model.sol.create('sol1');
model.sol('sol1').study('std1');

model.study('std1').feature('time').set('notlistsolnum', 1);
model.study('std1').feature('time').set('notsolnum', '1');
model.study('std1').feature('time').set('listsolnum', 1);
model.study('std1').feature('time').set('solnum', '1');

model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').feature('st1').set('study', 'std1');
model.sol('sol1').feature('st1').set('studystep', 'time');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').feature('v1').feature('comp1_u').set('scalemethod', 'manual');
model.sol('sol1').feature('v1').feature('comp1_u').set('scaleval', '1e-2*0.0014144345159815637');
model.sol('sol1').feature('v1').set('control', 'time');
model.sol('sol1').create('t1', 'Time');
model.sol('sol1').feature('t1').set('tlist', 'range(0,0.1,1)');
model.sol('sol1').feature('t1').set('plot', 'off');
model.sol('sol1').feature('t1').set('plotgroup', 'Default');
model.sol('sol1').feature('t1').set('plotfreq', 'tout');
model.sol('sol1').feature('t1').set('probesel', 'all');
model.sol('sol1').feature('t1').set('probes', {});
model.sol('sol1').feature('t1').set('probefreq', 'tsteps');
model.sol('sol1').feature('t1').set('atolglobalvaluemethod', 'factor');
model.sol('sol1').feature('t1').set('atolmethod', {'comp1_T' 'global' 'comp1_u' 'global' 'comp1_V' 'global'});
model.sol('sol1').feature('t1').set('atol', {'comp1_T' '1e-3' 'comp1_u' '1e-3' 'comp1_V' '1e-3'});
model.sol('sol1').feature('t1').set('atolvaluemethod', {'comp1_T' 'factor' 'comp1_u' 'factor' 'comp1_V' 'factor'});
model.sol('sol1').feature('t1').set('estrat', 'exclude');
model.sol('sol1').feature('t1').set('maxorder', 2);
model.sol('sol1').feature('t1').set('control', 'time');
model.sol('sol1').feature('t1').feature('aDef').set('cachepattern', true);
model.sol('sol1').feature('t1').create('seDef', 'Segregated');
model.sol('sol1').feature('t1').create('se1', 'Segregated');
model.sol('sol1').feature('t1').feature('se1').feature.remove('ssDef');
model.sol('sol1').feature('t1').feature('se1').create('ss1', 'SegregatedStep');
model.sol('sol1').feature('t1').feature('se1').feature('ss1').set('segvar', {'comp1_V'});
model.sol('sol1').feature('t1').create('i1', 'Iterative');
model.sol('sol1').feature('t1').feature('i1').set('linsolver', 'cg');
model.sol('sol1').feature('t1').feature('i1').create('mg1', 'Multigrid');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('prefun', 'amg');
model.sol('sol1').feature('t1').feature('se1').feature('ss1').set('linsolver', 'i1');
model.sol('sol1').feature('t1').feature('se1').create('ss2', 'SegregatedStep');
model.sol('sol1').feature('t1').feature('se1').feature('ss2').set('segvar', {'comp1_T'});
model.sol('sol1').feature('t1').feature('se1').feature('ss2').set('subdamp', 1);
model.sol('sol1').feature('t1').feature('se1').feature('ss2').set('subjtech', 'once');
model.sol('sol1').feature('t1').create('d1', 'Direct');
model.sol('sol1').feature('t1').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('t1').feature('d1').set('pivotperturb', 1.0E-13);
model.sol('sol1').feature('t1').feature('d1').label('PARDISO ht (te1)');
model.sol('sol1').feature('t1').feature('se1').feature('ss2').set('linsolver', 'd1');
model.sol('sol1').feature('t1').feature('se1').feature('ss2').label('Heat transfer T');
model.sol('sol1').feature('t1').feature('se1').create('ss3', 'SegregatedStep');
model.sol('sol1').feature('t1').feature('se1').feature('ss3').set('segvar', {'comp1_u'});
model.sol('sol1').feature('t1').create('d2', 'Direct');
model.sol('sol1').feature('t1').feature('d2').set('linsolver', 'mumps');
model.sol('sol1').feature('t1').feature('d2').label('Suggested Direct Solver solid (te1)');
model.sol('sol1').feature('t1').feature('se1').feature('ss3').set('linsolver', 'd2');
model.sol('sol1').feature('t1').feature('se1').set('segstabacc', 'segaacc');
model.sol('sol1').feature('t1').feature('se1').set('segaaccdim', 5);
model.sol('sol1').feature('t1').feature('se1').set('segaaccmix', 0.9);
model.sol('sol1').feature('t1').feature('se1').set('segaaccdelay', 1);
model.sol('sol1').feature('t1').feature('se1').create('ll1', 'LowerLimit');
model.sol('sol1').feature('t1').feature('se1').feature('ll1').set('lowerlimit', 'comp1.T 0');
model.sol('sol1').feature('t1').create('i2', 'Iterative');
model.sol('sol1').feature('t1').feature('i2').set('linsolver', 'gmres');
model.sol('sol1').feature('t1').feature('i2').set('rhob', 400);
model.sol('sol1').feature('t1').feature('i2').set('nlinnormuse', true);
model.sol('sol1').feature('t1').feature('i2').label('Suggested Iterative Solver solid (te1)');
model.sol('sol1').feature('t1').feature('i2').create('mg1', 'Multigrid');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').set('prefun', 'gmg');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').create('so1', 'SOR');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').feature('so1').set('relax', 0.8);
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').create('so1', 'SOR');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').feature('so1').set('relax', 0.8);
model.sol('sol1').feature('t1').create('i3', 'Iterative');
model.sol('sol1').feature('t1').feature('i3').set('linsolver', 'gmres');
model.sol('sol1').feature('t1').feature('i3').set('prefuntype', 'left');
model.sol('sol1').feature('t1').feature('i3').set('rhob', 400);
model.sol('sol1').feature('t1').feature('i3').label('Algebraic Multigrid ht (te1)');
model.sol('sol1').feature('t1').feature('i3').create('mg1', 'Multigrid');
model.sol('sol1').feature('t1').feature('i3').feature('mg1').set('prefun', 'saamg');
model.sol('sol1').feature('t1').feature('i3').feature('mg1').set('usesmooth', false);
model.sol('sol1').feature('t1').feature('i3').feature('mg1').set('saamgcompwise', true);
model.sol('sol1').feature('t1').feature('i3').feature('mg1').feature('pr').create('so1', 'SOR');
model.sol('sol1').feature('t1').feature('i3').feature('mg1').feature('pr').feature('so1').set('iter', 2);
model.sol('sol1').feature('t1').feature('i3').feature('mg1').feature('pr').feature('so1').set('relax', 0.9);
model.sol('sol1').feature('t1').feature('i3').feature('mg1').feature('po').create('so1', 'SOR');
model.sol('sol1').feature('t1').feature('i3').feature('mg1').feature('po').feature('so1').set('iter', 2);
model.sol('sol1').feature('t1').feature('i3').feature('mg1').feature('po').feature('so1').set('relax', 0.9);
model.sol('sol1').feature('t1').feature('i3').feature('mg1').feature('cs').create('d1', 'Direct');
model.sol('sol1').feature('t1').feature('i3').feature('mg1').feature('cs').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('t1').create('i4', 'Iterative');
model.sol('sol1').feature('t1').feature('i4').set('linsolver', 'gmres');
model.sol('sol1').feature('t1').feature('i4').set('prefuntype', 'left');
model.sol('sol1').feature('t1').feature('i4').set('rhob', 20);
model.sol('sol1').feature('t1').feature('i4').label('Geometric Multigrid ht (te1)');
model.sol('sol1').feature('t1').feature('i4').create('mg1', 'Multigrid');
model.sol('sol1').feature('t1').feature('i4').feature('mg1').set('prefun', 'gmg');
model.sol('sol1').feature('t1').feature('i4').feature('mg1').set('mcasegen', 'any');
model.sol('sol1').feature('t1').feature('i4').feature('mg1').feature('pr').create('so1', 'SOR');
model.sol('sol1').feature('t1').feature('i4').feature('mg1').feature('pr').feature('so1').set('iter', 2);
model.sol('sol1').feature('t1').feature('i4').feature('mg1').feature('po').create('so1', 'SOR');
model.sol('sol1').feature('t1').feature('i4').feature('mg1').feature('po').feature('so1').set('iter', 2);
model.sol('sol1').feature('t1').feature('i4').feature('mg1').feature('cs').create('d1', 'Direct');
model.sol('sol1').feature('t1').feature('i4').feature('mg1').feature('cs').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('t1').feature.remove('fcDef');
model.sol('sol1').feature('t1').feature.remove('seDef');
model.sol('sol1').attach('std1');

model.result.create('pg1', 'PlotGroup3D');
model.result('pg1').set('data', 'dset1');
model.result('pg1').create('surf1', 'Surface');
model.result('pg1').feature('surf1').set('expr', {'solid.mises'});
model.result('pg1').label('Stress (solid)');
model.result('pg1').feature('surf1').set('colortable', 'RainbowLight');
model.result('pg1').feature('surf1').set('resolution', 'normal');
model.result('pg1').feature('surf1').create('def', 'Deform');
model.result('pg1').feature('surf1').feature('def').set('expr', {'u' 'v' 'w'});
model.result('pg1').feature('surf1').feature('def').set('descr', 'Displacement field');
model.result.create('pg2', 'PlotGroup3D');
model.result('pg2').label('Temperature (ht)');
model.result('pg2').set('data', 'dset1');
model.result('pg2').feature.create('surf1', 'Surface');
model.result('pg2').feature('surf1').set('expr', 'T');
model.result('pg2').feature('surf1').set('colortable', 'ThermalLight');
model.result('pg2').feature('surf1').set('data', 'parent');
model.result.create('pg3', 'PlotGroup3D');
model.result('pg3').label('Isothermal Contours (ht)');
model.result('pg3').set('data', 'dset1');
model.result('pg3').feature.create('iso1', 'Isosurface');
model.result('pg3').feature('iso1').label('Isosurface');
model.result('pg3').feature('iso1').set('expr', 'T');
model.result('pg3').feature('iso1').set('number', 10);
model.result('pg3').feature('iso1').set('colortable', 'ThermalLight');
model.result('pg3').feature('iso1').set('data', 'parent');
model.result.create('pg4', 'PlotGroup3D');
model.result('pg4').label('Electric Potential (ec)');
model.result('pg4').set('frametype', 'spatial');
model.result('pg4').set('data', 'dset1');
model.result('pg4').feature.create('mslc1', 'Multislice');
model.result('pg4').feature('mslc1').set('expr', 'V');
model.result('pg4').feature('mslc1').set('colortable', 'RainbowLight');
model.result('pg4').feature('mslc1').set('data', 'parent');

model.sol('sol1').runFromTo('st1', 't1');

model.result('pg1').run;
model.result('pg1').run;
model.result('pg1').run;
model.result('pg1').run;
model.result('pg1').run;
model.result('pg1').set('showlegendsmaxmin', true);
model.result('pg2').run;
model.result('pg2').setIndex('looplevel', 10, 0);
model.result('pg2').run;
model.result('pg2').setIndex('looplevel', 9, 0);
model.result('pg2').run;
model.result('pg2').setIndex('looplevel', 8, 0);
model.result('pg2').run;
model.result('pg2').setIndex('looplevel', 7, 0);
model.result('pg2').run;
model.result('pg2').setIndex('looplevel', 6, 0);
model.result('pg2').run;
model.result('pg2').setIndex('looplevel', 5, 0);
model.result('pg2').run;
model.result('pg2').setIndex('looplevel', 6, 0);
model.result('pg2').run;
model.result('pg2').setIndex('looplevel', 7, 0);
model.result('pg2').run;
model.result('pg2').setIndex('looplevel', 8, 0);
model.result('pg2').run;
model.result('pg2').setIndex('looplevel', 9, 0);
model.result('pg2').run;
model.result('pg2').setIndex('looplevel', 10, 0);
model.result('pg2').run;
model.result('pg2').setIndex('looplevel', 11, 0);
model.result('pg2').run;
model.result('pg3').run;
model.result('pg3').run;
model.result('pg3').setIndex('looplevel', 10, 0);
model.result('pg3').run;
model.result('pg3').setIndex('looplevel', 9, 0);
model.result('pg3').run;
model.result('pg3').run;

model.label('Circut.mph');

model.result('pg3').run;

out = model;
