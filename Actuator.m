function out = model
%
% Actuator.m


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
model.study('std1').create('stat', 'Stationary');
model.study('std1').feature('stat').activate('solid', true);
model.study('std1').feature('stat').activate('ht', true);
model.study('std1').feature('stat').activate('ec', true);
model.study('std1').feature('stat').activate('te1', true);
model.study('std1').feature('stat').activate('tc1', true);
model.study('std1').feature('stat').activate('emh1', true);

model.param.set('lin', '15[mA]');
model.param.descr('lin', 'c');
model.param.descr('lin', 'Electrical current');

model.component('comp1').geom('geom1').lengthUnit([native2unicode(hex2dec({'00' 'b5'}), 'unicode') 'm']);
model.component('comp1').geom('geom1').feature.create('wp1', 'WorkPlane');
model.component('comp1').geom('geom1').feature('wp1').set('unite', true);
model.component('comp1').geom('geom1').feature('wp1').geom.create('r1', 'Rectangle');
model.component('comp1').geom('geom1').feature('wp1').geom.feature('r1').set('size', [15 105]);
model.component('comp1').geom('geom1').feature('wp1').geom.feature('r1').set('pos', [0 7.5]);
model.component('comp1').geom('geom1').feature('wp1').geom.run('r1');
model.component('comp1').geom('geom1').feature('wp1').geom.run('r1');
model.component('comp1').geom('geom1').feature('wp1').geom.feature('r1').set('pos', [7.5 0]);
model.component('comp1').geom('geom1').feature('wp1').geom.run('r1');
model.component('comp1').geom('geom1').feature('wp1').geom.run('r1');
model.component('comp1').geom('geom1').feature('wp1').geom.create('r2', 'Rectangle');
model.component('comp1').geom('geom1').feature('wp1').geom.feature('r2').set('size', [15 105]);
model.component('comp1').geom('geom1').feature('wp1').geom.feature('r2').set('pos', [-22.5 0]);
model.component('comp1').geom('geom1').feature('wp1').geom.run('r2');
model.component('comp1').geom('geom1').feature('wp1').geom.run('r2');
model.component('comp1').geom('geom1').feature('wp1').geom.create('r3', 'Rectangle');
model.component('comp1').geom('geom1').feature('wp1').geom.feature('r3').set('size', [45 15]);
model.component('comp1').geom('geom1').feature('wp1').geom.feature('r3').set('pos', [-22.5 90]);
model.component('comp1').geom('geom1').feature('wp1').geom.run('r3');
model.component('comp1').geom('geom1').feature('wp1').geom.run('r3');
model.component('comp1').geom('geom1').feature('wp1').geom.create('uni1', 'Union');
model.component('comp1').geom('geom1').feature('wp1').geom.feature('uni1').selection('input').set({'r1' 'r2' 'r3'});
model.component('comp1').geom('geom1').feature('wp1').geom.feature('uni1').set('intbnd', false);
model.component('comp1').geom('geom1').feature('wp1').geom.run('uni1');
model.component('comp1').geom('geom1').feature('wp1').geom.run('uni1');
model.component('comp1').geom('geom1').run('wp1');
model.component('comp1').geom('geom1').feature.create('ext1', 'Extrude');
model.component('comp1').geom('geom1').feature('ext1').set('workplane', 'wp1');
model.component('comp1').geom('geom1').feature('ext1').selection('input').set({'wp1'});
model.component('comp1').geom('geom1').feature('ext1').setIndex('distance', 15, 0);
model.component('comp1').geom('geom1').runPre('fin');
model.component('comp1').geom('geom1').run('ext1');
model.component('comp1').geom('geom1').create('blk1', 'Block');
model.component('comp1').geom('geom1').feature('blk1').set('size', [90 120 50]);
model.component('comp1').geom('geom1').feature('blk1').set('pos', [-45 0 -17]);
model.component('comp1').geom('geom1').runPre('fin');

model.component('comp1').view('view1').set('scenelight', true);
model.component('comp1').view('view1').set('renderwireframe', true);
model.component('comp1').view('view1').set('transparency', true);
model.component('comp1').view('view1').set('renderwireframe', false);

model.component('comp1').geom('geom1').feature.duplicate('wp2', 'wp1');
model.component('comp1').geom('geom1').run('wp2');
model.component('comp1').geom('geom1').feature.create('ext2', 'Extrude');
model.component('comp1').geom('geom1').feature('ext2').set('workplane', 'wp2');
model.component('comp1').geom('geom1').feature('ext2').selection('input').set({'wp2'});
model.component('comp1').geom('geom1').feature('ext2').setIndex('distance', -1, 0);
model.component('comp1').geom('geom1').runPre('fin');
model.component('comp1').geom('geom1').run;

model.component('comp1').material.create('mat1', 'Common');
model.component('comp1').material('mat1').label('IPS');
model.component('comp1').material('mat1').propertyGroup('def').set('thermalconductivity', {'0.3'});
model.component('comp1').material('mat1').propertyGroup('def').set('heatcapacity', {'1500'});
model.component('comp1').material('mat1').propertyGroup('def').set('youngsmodulus', {'4.0e9'});
model.component('comp1').material('mat1').propertyGroup('def').set('poissonsratio', {'0.3'});
model.component('comp1').material('mat1').propertyGroup('def').set('density', {'1111'});
model.component('comp1').material('mat1').propertyGroup('def').set('electricconductivity', {});
model.component('comp1').material('mat1').propertyGroup('def').set('thermalexpansioncoefficient', {'52.0e-6'});
model.component('comp1').material('mat1').selection.set([2 3]);
model.component('comp1').material.create('mat2', 'Common');
model.component('comp1').material('mat2').label('Nikkel');
model.component('comp1').material('mat2').propertyGroup('def').set('density', {'6500'});
model.component('comp1').material('mat2').propertyGroup('def').set('poissonsratio', {'0.33'});
model.component('comp1').material('mat2').propertyGroup('def').set('youngsmodulus', {'106.01e9'});
model.component('comp1').material('mat2').propertyGroup('def').set('thermalconductivity', {'8.6'});
model.component('comp1').material('mat2').propertyGroup('def').set('heatcapacity', {'3700'});
model.component('comp1').material('mat2').propertyGroup('def').set('electricconductivity', {'1.32e6'});
model.component('comp1').material('mat2').propertyGroup('def').set('relpermittivity', {'1'});
model.component('comp1').material('mat2').propertyGroup('def').set('thermalexpansioncoefficient', {'7.6e-6'});
model.component('comp1').material('mat2').selection.set([2 3]);
model.component('comp1').material.create('mat3', 'Common');
model.component('comp1').material('mat3').propertyGroup('def').func.create('eta', 'Piecewise');
model.component('comp1').material('mat3').propertyGroup('def').func.create('Cp', 'Piecewise');
model.component('comp1').material('mat3').propertyGroup('def').func.create('rho', 'Analytic');
model.component('comp1').material('mat3').propertyGroup('def').func.create('k', 'Piecewise');
model.component('comp1').material('mat3').propertyGroup('def').func.create('cs', 'Analytic');
model.component('comp1').material('mat3').propertyGroup('def').func.create('an1', 'Analytic');
model.component('comp1').material('mat3').propertyGroup('def').func.create('an2', 'Analytic');
model.component('comp1').material('mat3').propertyGroup.create('RefractiveIndex', 'Refractive index');
model.component('comp1').material('mat3').propertyGroup.create('NonlinearModel', 'Nonlinear model');
model.component('comp1').material('mat3').label('Air');
model.component('comp1').material('mat3').set('family', 'air');
model.component('comp1').material('mat3').propertyGroup('def').func('eta').set('arg', 'T');
model.component('comp1').material('mat3').propertyGroup('def').func('eta').set('pieces', {'200.0' '1600.0' '-8.38278E-7+8.35717342E-8*T^1-7.69429583E-11*T^2+4.6437266E-14*T^3-1.06585607E-17*T^4'});
model.component('comp1').material('mat3').propertyGroup('def').func('eta').set('argunit', 'K');
model.component('comp1').material('mat3').propertyGroup('def').func('eta').set('fununit', 'Pa*s');
model.component('comp1').material('mat3').propertyGroup('def').func('Cp').set('arg', 'T');
model.component('comp1').material('mat3').propertyGroup('def').func('Cp').set('pieces', {'200.0' '1600.0' '1047.63657-0.372589265*T^1+9.45304214E-4*T^2-6.02409443E-7*T^3+1.2858961E-10*T^4'});
model.component('comp1').material('mat3').propertyGroup('def').func('Cp').set('argunit', 'K');
model.component('comp1').material('mat3').propertyGroup('def').func('Cp').set('fununit', 'J/(kg*K)');
model.component('comp1').material('mat3').propertyGroup('def').func('rho').set('expr', 'pA*0.02897/R_const[K*mol/J]/T');
model.component('comp1').material('mat3').propertyGroup('def').func('rho').set('args', {'pA' 'T'});
model.component('comp1').material('mat3').propertyGroup('def').func('rho').set('dermethod', 'manual');
model.component('comp1').material('mat3').propertyGroup('def').func('rho').set('argders', {'pA' 'd(pA*0.02897/R_const/T,pA)'; 'T' 'd(pA*0.02897/R_const/T,T)'});
model.component('comp1').material('mat3').propertyGroup('def').func('rho').set('argunit', 'Pa,K');
model.component('comp1').material('mat3').propertyGroup('def').func('rho').set('fununit', 'kg/m^3');
model.component('comp1').material('mat3').propertyGroup('def').func('rho').set('plotargs', {'pA' '0' '1'; 'T' '0' '1'});
model.component('comp1').material('mat3').propertyGroup('def').func('k').set('arg', 'T');
model.component('comp1').material('mat3').propertyGroup('def').func('k').set('pieces', {'200.0' '1600.0' '-0.00227583562+1.15480022E-4*T^1-7.90252856E-8*T^2+4.11702505E-11*T^3-7.43864331E-15*T^4'});
model.component('comp1').material('mat3').propertyGroup('def').func('k').set('argunit', 'K');
model.component('comp1').material('mat3').propertyGroup('def').func('k').set('fununit', 'W/(m*K)');
model.component('comp1').material('mat3').propertyGroup('def').func('cs').set('expr', 'sqrt(1.4*R_const[K*mol/J]/0.02897*T)');
model.component('comp1').material('mat3').propertyGroup('def').func('cs').set('args', {'T'});
model.component('comp1').material('mat3').propertyGroup('def').func('cs').set('dermethod', 'manual');
model.component('comp1').material('mat3').propertyGroup('def').func('cs').set('argunit', 'K');
model.component('comp1').material('mat3').propertyGroup('def').func('cs').set('fununit', 'm/s');
model.component('comp1').material('mat3').propertyGroup('def').func('cs').set('plotargs', {'T' '273.15' '373.15'});
model.component('comp1').material('mat3').propertyGroup('def').func('an1').set('funcname', 'alpha_p');
model.component('comp1').material('mat3').propertyGroup('def').func('an1').set('expr', '-1/rho(pA,T)*d(rho(pA,T),T)');
model.component('comp1').material('mat3').propertyGroup('def').func('an1').set('args', {'pA' 'T'});
model.component('comp1').material('mat3').propertyGroup('def').func('an1').set('argunit', 'Pa,K');
model.component('comp1').material('mat3').propertyGroup('def').func('an1').set('fununit', '1/K');
model.component('comp1').material('mat3').propertyGroup('def').func('an1').set('plotargs', {'pA' '101325' '101325'; 'T' '273.15' '373.15'});
model.component('comp1').material('mat3').propertyGroup('def').func('an2').set('funcname', 'muB');
model.component('comp1').material('mat3').propertyGroup('def').func('an2').set('expr', '0.6*eta(T)');
model.component('comp1').material('mat3').propertyGroup('def').func('an2').set('args', {'T'});
model.component('comp1').material('mat3').propertyGroup('def').func('an2').set('argunit', 'K');
model.component('comp1').material('mat3').propertyGroup('def').func('an2').set('fununit', 'Pa*s');
model.component('comp1').material('mat3').propertyGroup('def').func('an2').set('plotargs', {'T' '200' '1600'});
model.component('comp1').material('mat3').propertyGroup('def').set('thermalexpansioncoefficient', '');
model.component('comp1').material('mat3').propertyGroup('def').set('molarmass', '');
model.component('comp1').material('mat3').propertyGroup('def').set('bulkviscosity', '');
model.component('comp1').material('mat3').propertyGroup('def').set('relpermeability', {'1' '0' '0' '0' '1' '0' '0' '0' '1'});
model.component('comp1').material('mat3').propertyGroup('def').set('relpermittivity', {'1' '0' '0' '0' '1' '0' '0' '0' '1'});
model.component('comp1').material('mat3').propertyGroup('def').set('dynamicviscosity', 'eta(T)');
model.component('comp1').material('mat3').propertyGroup('def').set('ratioofspecificheat', '1.4');
model.component('comp1').material('mat3').propertyGroup('def').set('electricconductivity', {'0[S/m]' '0' '0' '0' '0[S/m]' '0' '0' '0' '0[S/m]'});
model.component('comp1').material('mat3').propertyGroup('def').set('heatcapacity', 'Cp(T)');
model.component('comp1').material('mat3').propertyGroup('def').set('density', 'rho(pA,T)');
model.component('comp1').material('mat3').propertyGroup('def').set('thermalconductivity', {'k(T)' '0' '0' '0' 'k(T)' '0' '0' '0' 'k(T)'});
model.component('comp1').material('mat3').propertyGroup('def').set('soundspeed', 'cs(T)');
model.component('comp1').material('mat3').propertyGroup('def').set('thermalexpansioncoefficient', {'alpha_p(pA,T)' '0' '0' '0' 'alpha_p(pA,T)' '0' '0' '0' 'alpha_p(pA,T)'});
model.component('comp1').material('mat3').propertyGroup('def').set('molarmass', '0.02897');
model.component('comp1').material('mat3').propertyGroup('def').set('bulkviscosity', 'muB(T)');
model.component('comp1').material('mat3').propertyGroup('def').addInput('temperature');
model.component('comp1').material('mat3').propertyGroup('def').addInput('pressure');
model.component('comp1').material('mat3').propertyGroup('RefractiveIndex').set('n', '');
model.component('comp1').material('mat3').propertyGroup('RefractiveIndex').set('ki', '');
model.component('comp1').material('mat3').propertyGroup('RefractiveIndex').set('n', {'1' '0' '0' '0' '1' '0' '0' '0' '1'});
model.component('comp1').material('mat3').propertyGroup('RefractiveIndex').set('ki', {'0' '0' '0' '0' '0' '0' '0' '0' '0'});
model.component('comp1').material('mat3').propertyGroup('NonlinearModel').set('BA', '(def.gamma+1)/2');
model.component('comp1').material('mat3').materialType('nonSolid');
model.component('comp1').material('mat3').set('family', 'air');
model.component('comp1').material('mat3').selection.set([1]);
model.component('comp1').material('mat2').selection.set([2]);

model.component('comp1').physics('ec').feature('cucn1').setIndex('materialType', 'solid', 0);
model.component('comp1').physics('ec').selection.set([2]);
model.component('comp1').physics('ec').create('gnd1', 'Ground', 2);
model.component('comp1').physics('ec').feature('gnd1').selection.set([7]);
model.component('comp1').physics('ec').create('term1', 'Terminal', 2);
model.component('comp1').physics('ec').feature('term1').selection.set([24]);
model.component('comp1').physics('ec').feature('term1').set('I0', 'lin');
model.component('comp1').physics('ht').prop('ShapeProperty').set('order_temperature', 2);
model.component('comp1').physics('ht').create('temp1', 'TemperatureBoundary', 2);
model.component('comp1').physics('ht').feature('temp1').selection.set([7 10 24 26]);
model.component('comp1').physics('ht').create('fluid1', 'FluidHeatTransferModel', 3);
model.component('comp1').physics('ht').feature('fluid1').selection.set([1]);
model.component('comp1').physics('ht').feature('fluid1').set('fluidType', 'moistAir');
model.component('comp1').physics('solid').selection.set([2 3]);
model.component('comp1').physics('solid').create('fix1', 'Fixed', 2);
model.component('comp1').physics('solid').feature('fix1').selection.set([7 10 24 26]);

model.component('comp1').multiphysics('te1').set('IncludeMechanicalLosses', true);

model.component('comp1').mesh('mesh1').run;

model.sol.create('sol1');
model.sol('sol1').study('std1');

model.study('std1').feature('stat').set('notlistsolnum', 1);
model.study('std1').feature('stat').set('notsolnum', '1');
model.study('std1').feature('stat').set('listsolnum', 1);
model.study('std1').feature('stat').set('solnum', '1');

model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').feature('st1').set('study', 'std1');
model.sol('sol1').feature('st1').set('studystep', 'stat');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').feature('v1').set('control', 'stat');
model.sol('sol1').create('s1', 'Stationary');
model.sol('sol1').feature('s1').feature('aDef').set('cachepattern', true);
model.sol('sol1').feature('s1').create('seDef', 'Segregated');
model.sol('sol1').feature('s1').create('se1', 'Segregated');
model.sol('sol1').feature('s1').feature('se1').feature.remove('ssDef');
model.sol('sol1').feature('s1').feature('se1').create('ss1', 'SegregatedStep');
model.sol('sol1').feature('s1').feature('se1').feature('ss1').set('segvar', {'comp1_V' 'comp1_ec_term1_V0_ode'});
model.sol('sol1').feature('s1').create('i1', 'Iterative');
model.sol('sol1').feature('s1').feature('i1').set('linsolver', 'cg');
model.sol('sol1').feature('s1').feature('i1').create('mg1', 'Multigrid');
model.sol('sol1').feature('s1').feature('i1').feature('mg1').set('prefun', 'amg');
model.sol('sol1').feature('s1').feature('se1').feature('ss1').set('linsolver', 'i1');
model.sol('sol1').feature('s1').feature('se1').create('ss2', 'SegregatedStep');
model.sol('sol1').feature('s1').feature('se1').feature('ss2').set('segvar', {'comp1_T'});
model.sol('sol1').feature('s1').feature('se1').feature('ss2').set('subdamp', 1);
model.sol('sol1').feature('s1').feature('se1').feature('ss2').set('subjtech', 'minimal');
model.sol('sol1').feature('s1').create('d1', 'Direct');
model.sol('sol1').feature('s1').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('s1').feature('d1').set('pivotperturb', 1.0E-13);
model.sol('sol1').feature('s1').feature('d1').label('PARDISO ht (te1)');
model.sol('sol1').feature('s1').feature('se1').feature('ss2').set('linsolver', 'd1');
model.sol('sol1').feature('s1').feature('se1').feature('ss2').label('Heat transfer T');
model.sol('sol1').feature('s1').feature('se1').create('ss3', 'SegregatedStep');
model.sol('sol1').feature('s1').feature('se1').feature('ss3').set('segvar', {'comp1_u'});
model.sol('sol1').feature('s1').create('d2', 'Direct');
model.sol('sol1').feature('s1').feature('d2').set('linsolver', 'mumps');
model.sol('sol1').feature('s1').feature('d2').label('Suggested Direct Solver solid (te1)');
model.sol('sol1').feature('s1').feature('se1').feature('ss3').set('linsolver', 'd2');
model.sol('sol1').feature('s1').feature('se1').set('segtermonres', 'off');
model.sol('sol1').feature('s1').feature('se1').create('ll1', 'LowerLimit');
model.sol('sol1').feature('s1').feature('se1').feature('ll1').set('lowerlimit', 'comp1.T 0');
model.sol('sol1').feature('s1').create('i2', 'Iterative');
model.sol('sol1').feature('s1').feature('i2').set('linsolver', 'gmres');
model.sol('sol1').feature('s1').feature('i2').set('rhob', 400);
model.sol('sol1').feature('s1').feature('i2').set('nlinnormuse', true);
model.sol('sol1').feature('s1').feature('i2').label('Suggested Iterative Solver solid (te1)');
model.sol('sol1').feature('s1').feature('i2').create('mg1', 'Multigrid');
model.sol('sol1').feature('s1').feature('i2').feature('mg1').set('prefun', 'gmg');
model.sol('sol1').feature('s1').feature('i2').feature('mg1').feature('pr').create('so1', 'SOR');
model.sol('sol1').feature('s1').feature('i2').feature('mg1').feature('pr').feature('so1').set('relax', 0.8);
model.sol('sol1').feature('s1').feature('i2').feature('mg1').feature('po').create('so1', 'SOR');
model.sol('sol1').feature('s1').feature('i2').feature('mg1').feature('po').feature('so1').set('relax', 0.8);
model.sol('sol1').feature('s1').create('i3', 'Iterative');
model.sol('sol1').feature('s1').feature('i3').set('linsolver', 'gmres');
model.sol('sol1').feature('s1').feature('i3').set('prefuntype', 'left');
model.sol('sol1').feature('s1').feature('i3').set('rhob', 400);
model.sol('sol1').feature('s1').feature('i3').label('Algebraic Multigrid ht (te1)');
model.sol('sol1').feature('s1').feature('i3').create('mg1', 'Multigrid');
model.sol('sol1').feature('s1').feature('i3').feature('mg1').set('prefun', 'saamg');
model.sol('sol1').feature('s1').feature('i3').feature('mg1').set('usesmooth', false);
model.sol('sol1').feature('s1').feature('i3').feature('mg1').set('saamgcompwise', true);
model.sol('sol1').feature('s1').feature('i3').feature('mg1').feature('pr').create('so1', 'SOR');
model.sol('sol1').feature('s1').feature('i3').feature('mg1').feature('pr').feature('so1').set('iter', 2);
model.sol('sol1').feature('s1').feature('i3').feature('mg1').feature('pr').feature('so1').set('relax', 0.9);
model.sol('sol1').feature('s1').feature('i3').feature('mg1').feature('po').create('so1', 'SOR');
model.sol('sol1').feature('s1').feature('i3').feature('mg1').feature('po').feature('so1').set('iter', 2);
model.sol('sol1').feature('s1').feature('i3').feature('mg1').feature('po').feature('so1').set('relax', 0.9);
model.sol('sol1').feature('s1').feature('i3').feature('mg1').feature('cs').create('d1', 'Direct');
model.sol('sol1').feature('s1').feature('i3').feature('mg1').feature('cs').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('s1').create('i4', 'Iterative');
model.sol('sol1').feature('s1').feature('i4').set('linsolver', 'gmres');
model.sol('sol1').feature('s1').feature('i4').set('prefuntype', 'left');
model.sol('sol1').feature('s1').feature('i4').set('rhob', 20);
model.sol('sol1').feature('s1').feature('i4').label('Geometric Multigrid ht (te1)');
model.sol('sol1').feature('s1').feature('i4').create('mg1', 'Multigrid');
model.sol('sol1').feature('s1').feature('i4').feature('mg1').set('prefun', 'gmg');
model.sol('sol1').feature('s1').feature('i4').feature('mg1').set('mcasegen', 'any');
model.sol('sol1').feature('s1').feature('i4').feature('mg1').feature('pr').create('so1', 'SOR');
model.sol('sol1').feature('s1').feature('i4').feature('mg1').feature('pr').feature('so1').set('iter', 2);
model.sol('sol1').feature('s1').feature('i4').feature('mg1').feature('po').create('so1', 'SOR');
model.sol('sol1').feature('s1').feature('i4').feature('mg1').feature('po').feature('so1').set('iter', 2);
model.sol('sol1').feature('s1').feature('i4').feature('mg1').feature('cs').create('d1', 'Direct');
model.sol('sol1').feature('s1').feature('i4').feature('mg1').feature('cs').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('s1').feature.remove('fcDef');
model.sol('sol1').feature('s1').feature.remove('seDef');
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

model.sol('sol1').runFromTo('st1', 's1');

model.result('pg1').run;
model.result('pg2').run;
model.result('pg2').run;
model.result('pg3').run;
model.result('pg3').run;
model.result('pg4').run;
model.result('pg3').run;
model.result('pg4').run;
model.result.export.create('data1', 'Data');
model.result.export('data1').setIndex('expr', 't', 1);
model.result.export('data1').setIndex('descr', 'time', 1);
model.result.export('data1').set('filename', 'F:\Simulation\2021\Comsol\Untitled.txt');
model.result.export('data1').set('allowdescrupdate', false);
model.result.export('data1').move('expr', [1], -1);
model.result.export('data1').move('unit', [1], -1);
model.result.export('data1').move('descr', [1], -1);
model.result.export('data1').set('allowdescrupdate', true);
model.result('pg3').run;
model.result('pg4').run;
model.result('pg4').set('allowtableupdate', false);
model.result('pg4').feature('mslc1').set('rangeunit', 'V');
model.result('pg4').feature('mslc1').set('rangecolormin', 0);
model.result('pg4').feature('mslc1').set('rangecolormax', 0.11483915559157802);
model.result('pg4').feature('mslc1').set('rangecoloractive', 'off');
model.result('pg4').feature('mslc1').set('rangeactualminmax', [0 0.11483915559157802]);
model.result('pg4').feature('mslc1').set('rangeisshared', false);
model.result('pg4').feature('mslc1').set('rangedatamin', 0);
model.result('pg4').feature('mslc1').set('rangedatamax', 0.11483915559157802);
model.result('pg4').feature('mslc1').set('rangedataactive', 'off');
model.result('pg4').set('allowtableupdate', true);
model.result.export('data1').setIndex('expr', 'd', 0);
model.result.export('data1').setIndex('expr', 'node', 0);
model.result.export('data1').setIndex('expr', '', 0);
model.result.export('data1').remove('unit', 0);
model.result.export('data1').remove('descr', 0);
model.result.export('data1').remove('expr', [0]);
model.result.export('data1').run;
model.result('pg1').run;
model.result('pg1').run;
model.result('pg1').run;

model.label('Actuator.mph');

model.result('pg1').run;
model.result('pg1').run;
model.result('pg1').set('allowtableupdate', false);
model.result('pg1').feature('surf1').set('rangeunit', 'N/m^2');
model.result('pg1').feature('surf1').set('rangecolormin', 691216.757340227);
model.result('pg1').feature('surf1').set('rangecolormax', 4.420628564483924E8);
model.result('pg1').feature('surf1').set('rangecoloractive', 'off');
model.result('pg1').feature('surf1').set('rangeactualminmax', [691216.757340227 4.420628564483924E8]);
model.result('pg1').feature('surf1').set('rangeisshared', false);
model.result('pg1').feature('surf1').set('rangedatamin', 691216.757340227);
model.result('pg1').feature('surf1').set('rangedatamax', 4.420628564483924E8);
model.result('pg1').feature('surf1').set('rangedataactive', 'off');
model.result('pg1').feature('surf1').feature('def').set('scale', 1.8408253460713926);
model.result('pg1').feature('surf1').feature('def').set('scaleactive', false);
model.result('pg1').set('allowtableupdate', true);
model.result.table.create('evl3', 'Table');
model.result.table('evl3').comments('Interactive 3D values');
model.result.table('evl3').label('Evaluation 3D');
model.result.table('evl3').addRow([22.579857596450694 68.82832508398556 -2.8556297810777647 1.4937071611573756E8], [0 0 0 0]);
model.result.table('evl3').addRow([22.793279972295636 69.59585164237747 1.1461384306930729 4.0378933366657704E7], [0 0 0 0]);
model.result.table('evl3').addRow([22.894377058075065 83.25822625229253 2.1819346466456944 3.2246413742744725E7], [0 0 0 0]);

model.file.remove('res1');
model.file.remove('res2');

model.label('Actuator.mph');

out = model;
