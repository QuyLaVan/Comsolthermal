function out = model
%
% surface_mount.m

import com.comsol.model.*
import com.comsol.model.util.*

model = ModelUtil.create('Model');

model.modelPath('F:\Gitpush\Comsol');

model.component.create('comp1', true);

model.component('comp1').geom.create('geom1', 3);

model.component('comp1').mesh.create('mesh1');

model.component('comp1').physics.create('ht', 'HeatTransfer', 'geom1');

model.study.create('std1');
model.study('std1').setGenConv(true);
model.study('std1').create('stat', 'Stationary');
model.study('std1').feature('stat').activate('ht', true);

model.component('comp1').geom('geom1').insertFile('surface_mount_package_geom_sequence.mph', 'geom1');
model.component('comp1').geom('geom1').run('sel2');

model.component('comp1').view('view1').set('transparency', false);

model.component('comp1').material.create('mat1', 'Common');
model.component('comp1').material('mat1').propertyGroup.create('Enu', 'Young''s modulus and Poisson''s ratio');
model.component('comp1').material('mat1').propertyGroup.create('Murnaghan', 'Murnaghan');
model.component('comp1').material('mat1').propertyGroup.create('Lame', ['Lam' native2unicode(hex2dec({'00' 'e9'}), 'unicode') ' parameters']);
model.component('comp1').material('mat1').label('Aluminum');
model.component('comp1').material('mat1').set('family', 'aluminum');
model.component('comp1').material('mat1').propertyGroup('def').set('relpermeability', {'1' '0' '0' '0' '1' '0' '0' '0' '1'});
model.component('comp1').material('mat1').propertyGroup('def').set('heatcapacity', '900[J/(kg*K)]');
model.component('comp1').material('mat1').propertyGroup('def').set('thermalconductivity', {'238[W/(m*K)]' '0' '0' '0' '238[W/(m*K)]' '0' '0' '0' '238[W/(m*K)]'});
model.component('comp1').material('mat1').propertyGroup('def').set('electricconductivity', {'3.774e7[S/m]' '0' '0' '0' '3.774e7[S/m]' '0' '0' '0' '3.774e7[S/m]'});
model.component('comp1').material('mat1').propertyGroup('def').set('relpermittivity', {'1' '0' '0' '0' '1' '0' '0' '0' '1'});
model.component('comp1').material('mat1').propertyGroup('def').set('thermalexpansioncoefficient', {'23e-6[1/K]' '0' '0' '0' '23e-6[1/K]' '0' '0' '0' '23e-6[1/K]'});
model.component('comp1').material('mat1').propertyGroup('def').set('density', '2700[kg/m^3]');
model.component('comp1').material('mat1').propertyGroup('Enu').set('youngsmodulus', '70e9[Pa]');
model.component('comp1').material('mat1').propertyGroup('Enu').set('poissonsratio', '0.33');
model.component('comp1').material('mat1').propertyGroup('Murnaghan').set('l', '');
model.component('comp1').material('mat1').propertyGroup('Murnaghan').set('m', '');
model.component('comp1').material('mat1').propertyGroup('Murnaghan').set('n', '');
model.component('comp1').material('mat1').propertyGroup('Murnaghan').set('l', '-2.5e11[Pa]');
model.component('comp1').material('mat1').propertyGroup('Murnaghan').set('m', '-3.3e11[Pa]');
model.component('comp1').material('mat1').propertyGroup('Murnaghan').set('n', '-3.5e11[Pa]');
model.component('comp1').material('mat1').propertyGroup('Lame').set('lambLame', '');
model.component('comp1').material('mat1').propertyGroup('Lame').set('muLame', '');
model.component('comp1').material('mat1').propertyGroup('Lame').set('lambLame', '5.1e10[Pa]');
model.component('comp1').material('mat1').propertyGroup('Lame').set('muLame', '2.6e10[Pa]');
model.component('comp1').material('mat1').set('family', 'aluminum');
model.component('comp1').material.create('mat2', 'Common');
model.component('comp1').material('mat2').propertyGroup.create('Enu', 'Young''s modulus and Poisson''s ratio');
model.component('comp1').material('mat2').label('FR4 (Circuit Board)');
model.component('comp1').material('mat2').set('family', 'custom');
model.component('comp1').material('mat2').set('specular', 'custom');
model.component('comp1').material('mat2').set('customspecular', [0.39215686274509803 0.7843137254901961 0.39215686274509803]);
model.component('comp1').material('mat2').set('diffuse', 'custom');
model.component('comp1').material('mat2').set('customdiffuse', [0.39215686274509803 0.7843137254901961 0.39215686274509803]);
model.component('comp1').material('mat2').set('ambient', 'custom');
model.component('comp1').material('mat2').set('customambient', [0.39215686274509803 0.7843137254901961 0.39215686274509803]);
model.component('comp1').material('mat2').set('noise', true);
model.component('comp1').material('mat2').set('noisescale', 0.05);
model.component('comp1').material('mat2').set('noisefreq', 2.1);
model.component('comp1').material('mat2').set('lighting', 'cooktorrance');
model.component('comp1').material('mat2').set('fresnel', 0.3);
model.component('comp1').material('mat2').set('roughness', 0.6);
model.component('comp1').material('mat2').propertyGroup('def').set('relpermeability', {'1' '0' '0' '0' '1' '0' '0' '0' '1'});
model.component('comp1').material('mat2').propertyGroup('def').set('electricconductivity', {'0.004[S/m]' '0' '0' '0' '0.004[S/m]' '0' '0' '0' '0.004[S/m]'});
model.component('comp1').material('mat2').propertyGroup('def').set('relpermittivity', {'4.5' '0' '0' '0' '4.5' '0' '0' '0' '4.5'});
model.component('comp1').material('mat2').propertyGroup('def').set('thermalexpansioncoefficient', {'18e-6[1/K]' '0' '0' '0' '18e-6[1/K]' '0' '0' '0' '18e-6[1/K]'});
model.component('comp1').material('mat2').propertyGroup('def').set('heatcapacity', '1369[J/(kg*K)]');
model.component('comp1').material('mat2').propertyGroup('def').set('density', '1900[kg/m^3]');
model.component('comp1').material('mat2').propertyGroup('def').set('thermalconductivity', {'0.3[W/(m*K)]' '0' '0' '0' '0.3[W/(m*K)]' '0' '0' '0' '0.3[W/(m*K)]'});
model.component('comp1').material('mat2').propertyGroup('Enu').set('youngsmodulus', '22e9[Pa]');
model.component('comp1').material('mat2').propertyGroup('Enu').set('poissonsratio', '0.15');
model.component('comp1').material('mat2').set('family', 'custom');
model.component('comp1').material('mat2').set('lighting', 'cooktorrance');
model.component('comp1').material('mat2').set('fresnel', 0.3);
model.component('comp1').material('mat2').set('roughness', 0.6);
model.component('comp1').material('mat2').set('ambient', 'custom');
model.component('comp1').material('mat2').set('customambient', [0.39215686274509803 0.7843137254901961 0.39215686274509803]);
model.component('comp1').material('mat2').set('diffuse', 'custom');
model.component('comp1').material('mat2').set('customdiffuse', [0.39215686274509803 0.7843137254901961 0.39215686274509803]);
model.component('comp1').material('mat2').set('specular', 'custom');
model.component('comp1').material('mat2').set('customspecular', [0.39215686274509803 0.7843137254901961 0.39215686274509803]);
model.component('comp1').material('mat2').set('noisescale', 0.05);
model.component('comp1').material('mat2').set('noise', 'on');
model.component('comp1').material('mat2').set('noisefreq', 2.1);
model.component('comp1').material('mat2').set('noise', 'on');
model.component('comp1').material('mat2').set('alpha', 1);
model.component('comp1').material('mat1').selection.named('geom1_csel1_dom');
model.component('comp1').material('mat2').selection.named('geom1_blk1_dom');
model.component('comp1').material.create('mat3', 'Common');
model.component('comp1').material('mat3').label('Plastic');
model.component('comp1').material('mat3').selection.named('geom1_uni1_dom');
model.component('comp1').material('mat3').propertyGroup('def').set('density', '');
model.component('comp1').material('mat3').propertyGroup('def').set('heatcapacity', '');
model.component('comp1').material('mat3').propertyGroup('def').set('thermalconductivity', '');
model.component('comp1').material('mat3').propertyGroup('def').set('density', {'2700'});
model.component('comp1').material('mat3').propertyGroup('def').set('heatcapacity', {'900'});
model.component('comp1').material('mat3').propertyGroup('def').set('thermalconductivity', {'0.2'});
model.component('comp1').material.create('mat4', 'Common');
model.component('comp1').material('mat4').propertyGroup.create('Enu', 'Young''s modulus and Poisson''s ratio');
model.component('comp1').material('mat4').propertyGroup.create('RefractiveIndex', 'Refractive index');
model.component('comp1').material('mat4').label('Silicon');
model.component('comp1').material('mat4').set('family', 'custom');
model.component('comp1').material('mat4').set('specular', 'custom');
model.component('comp1').material('mat4').set('customspecular', [0.7843137254901961 1 1]);
model.component('comp1').material('mat4').set('diffuse', 'custom');
model.component('comp1').material('mat4').set('customdiffuse', [0.6666666666666666 0.6666666666666666 0.7058823529411765]);
model.component('comp1').material('mat4').set('ambient', 'custom');
model.component('comp1').material('mat4').set('customambient', [0.6666666666666666 0.6666666666666666 0.7058823529411765]);
model.component('comp1').material('mat4').set('noise', true);
model.component('comp1').material('mat4').set('noisefreq', 1);
model.component('comp1').material('mat4').set('lighting', 'cooktorrance');
model.component('comp1').material('mat4').set('fresnel', 0.7);
model.component('comp1').material('mat4').set('roughness', 0.5);
model.component('comp1').material('mat4').propertyGroup('def').set('relpermeability', {'1' '0' '0' '0' '1' '0' '0' '0' '1'});
model.component('comp1').material('mat4').propertyGroup('def').set('electricconductivity', {'1e-12[S/m]' '0' '0' '0' '1e-12[S/m]' '0' '0' '0' '1e-12[S/m]'});
model.component('comp1').material('mat4').propertyGroup('def').set('thermalexpansioncoefficient', {'2.6e-6[1/K]' '0' '0' '0' '2.6e-6[1/K]' '0' '0' '0' '2.6e-6[1/K]'});
model.component('comp1').material('mat4').propertyGroup('def').set('heatcapacity', '700[J/(kg*K)]');
model.component('comp1').material('mat4').propertyGroup('def').set('relpermittivity', {'11.7' '0' '0' '0' '11.7' '0' '0' '0' '11.7'});
model.component('comp1').material('mat4').propertyGroup('def').set('density', '2329[kg/m^3]');
model.component('comp1').material('mat4').propertyGroup('def').set('thermalconductivity', {'130[W/(m*K)]' '0' '0' '0' '130[W/(m*K)]' '0' '0' '0' '130[W/(m*K)]'});
model.component('comp1').material('mat4').propertyGroup('Enu').set('youngsmodulus', '170e9[Pa]');
model.component('comp1').material('mat4').propertyGroup('Enu').set('poissonsratio', '0.28');
model.component('comp1').material('mat4').propertyGroup('RefractiveIndex').set('n', '');
model.component('comp1').material('mat4').propertyGroup('RefractiveIndex').set('ki', '');
model.component('comp1').material('mat4').propertyGroup('RefractiveIndex').set('n', {'3.48' '0' '0' '0' '3.48' '0' '0' '0' '3.48'});
model.component('comp1').material('mat4').propertyGroup('RefractiveIndex').set('ki', {'0' '0' '0' '0' '0' '0' '0' '0' '0'});
model.component('comp1').material('mat4').set('family', 'custom');
model.component('comp1').material('mat4').set('lighting', 'cooktorrance');
model.component('comp1').material('mat4').set('fresnel', 0.7);
model.component('comp1').material('mat4').set('roughness', 0.5);
model.component('comp1').material('mat4').set('ambient', 'custom');
model.component('comp1').material('mat4').set('customambient', [0.6666666666666666 0.6666666666666666 0.7058823529411765]);
model.component('comp1').material('mat4').set('diffuse', 'custom');
model.component('comp1').material('mat4').set('customdiffuse', [0.6666666666666666 0.6666666666666666 0.7058823529411765]);
model.component('comp1').material('mat4').set('specular', 'custom');
model.component('comp1').material('mat4').set('customspecular', [0.7843137254901961 1 1]);
model.component('comp1').material('mat4').set('noisescale', 0);
model.component('comp1').material('mat4').set('noise', 'on');
model.component('comp1').material('mat4').set('noisefreq', 1);
model.component('comp1').material('mat4').set('noise', 'on');
model.component('comp1').material('mat4').set('alpha', 1);
model.component('comp1').material.create('mat5', 'Common');
model.component('comp1').material('mat5').propertyGroup.create('Enu', 'Young''s modulus and Poisson''s ratio');
model.component('comp1').material('mat5').propertyGroup.create('linzRes', 'Linearized resistivity');
model.component('comp1').material('mat5').label('Copper');
model.component('comp1').material('mat5').set('family', 'copper');
model.component('comp1').material('mat5').propertyGroup('def').set('relpermeability', {'1' '0' '0' '0' '1' '0' '0' '0' '1'});
model.component('comp1').material('mat5').propertyGroup('def').set('electricconductivity', {'5.998e7[S/m]' '0' '0' '0' '5.998e7[S/m]' '0' '0' '0' '5.998e7[S/m]'});
model.component('comp1').material('mat5').propertyGroup('def').set('thermalexpansioncoefficient', {'17e-6[1/K]' '0' '0' '0' '17e-6[1/K]' '0' '0' '0' '17e-6[1/K]'});
model.component('comp1').material('mat5').propertyGroup('def').set('heatcapacity', '385[J/(kg*K)]');
model.component('comp1').material('mat5').propertyGroup('def').set('relpermittivity', {'1' '0' '0' '0' '1' '0' '0' '0' '1'});
model.component('comp1').material('mat5').propertyGroup('def').set('density', '8960[kg/m^3]');
model.component('comp1').material('mat5').propertyGroup('def').set('thermalconductivity', {'400[W/(m*K)]' '0' '0' '0' '400[W/(m*K)]' '0' '0' '0' '400[W/(m*K)]'});
model.component('comp1').material('mat5').propertyGroup('Enu').set('youngsmodulus', '110e9[Pa]');
model.component('comp1').material('mat5').propertyGroup('Enu').set('poissonsratio', '0.35');
model.component('comp1').material('mat5').propertyGroup('linzRes').set('rho0', '');
model.component('comp1').material('mat5').propertyGroup('linzRes').set('alpha', '');
model.component('comp1').material('mat5').propertyGroup('linzRes').set('Tref', '');
model.component('comp1').material('mat5').propertyGroup('linzRes').set('rho0', '1.72e-8[ohm*m]');
model.component('comp1').material('mat5').propertyGroup('linzRes').set('alpha', '0.0039[1/K]');
model.component('comp1').material('mat5').propertyGroup('linzRes').set('Tref', '298[K]');
model.component('comp1').material('mat5').propertyGroup('linzRes').addInput('temperature');
model.component('comp1').material('mat5').set('family', 'copper');
model.component('comp1').material('mat4').selection.named('geom1_blk4_dom');
model.component('comp1').material('mat5').selection.geom('geom1', 2);
model.component('comp1').material('mat5').selection.named('geom1_sel2');

model.component('comp1').physics('ht').create('hs1', 'HeatSource', 3);
model.component('comp1').physics('ht').feature('hs1').selection.set([11]);
model.component('comp1').physics('ht').feature('hs1').set('Q0', '2e8');
model.component('comp1').physics('ht').create('hf1', 'HeatFluxBoundary', 2);
model.component('comp1').physics('ht').feature('hf1').selection.named('geom1_adjsel1');
model.component('comp1').physics('ht').feature('hf1').set('HeatFluxType', 'ConvectiveHeatFlux');
model.component('comp1').physics('ht').feature('hf1').set('h', 50);
model.component('comp1').physics('ht').feature('hf1').set('Text', '30[degC]');
model.component('comp1').physics('ht').create('temp1', 'TemperatureBoundary', 2);
model.component('comp1').physics('ht').feature('temp1').selection.set([4]);
model.component('comp1').physics('ht').feature('temp1').set('T0', '50[degC]');
model.component('comp1').physics('ht').create('sls1', 'SolidLayeredShell', 2);
model.component('comp1').physics('ht').feature('sls1').set('LayerType', 'Conductive');

model.component('comp1').material.create('slmat1', 'SingleShell');

model.component('comp1').physics('ht').feature('sls1').set('shelllist', 'slmat1');

model.component('comp1').material('slmat1').label('Copper Board');
model.component('comp1').material('slmat1').set('link', 'mat5');
model.component('comp1').material('slmat1').selection.set([7]);
model.component('comp1').material('slmat1').set('thickness', '1e-4[m]');

model.component('comp1').physics('ht').feature('sls1').selection.set([7]);
model.component('comp1').physics('ht').create('sls2', 'SolidLayeredShell', 2);
model.component('comp1').physics('ht').feature('sls2').selection.named('geom1_wp2_bnd');
model.component('comp1').physics('ht').feature('sls2').set('LayerType', 'Conductive');

model.component('comp1').material.create('slmat2', 'SingleShell');

model.component('comp1').physics('ht').feature('sls2').set('shelllist', 'slmat2');

model.component('comp1').material('slmat2').label('Copper Chip');
model.component('comp1').material('slmat2').set('link', 'mat5');
model.component('comp1').material('slmat2').selection.named('geom1_wp2_bnd');
model.component('comp1').material('slmat2').set('thickness', '5e-6[m]');

model.component('comp1').mesh('mesh1').create('size1', 'Size');
model.component('comp1').mesh('mesh1').feature('size1').selection.geom('geom1', 2);
model.component('comp1').mesh('mesh1').feature('size1').selection.set([4 7]);
model.component('comp1').mesh('mesh1').feature('size1').set('hauto', 2);
model.component('comp1').mesh('mesh1').create('ftet1', 'FreeTet');
model.component('comp1').mesh('mesh1').feature('size').set('hauto', 4);
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
model.sol('sol1').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('s1').feature('fc1').set('dtech', 'auto');
model.sol('sol1').feature('s1').feature('fc1').set('initstep', 0.01);
model.sol('sol1').feature('s1').feature('fc1').set('minstep', 1.0E-6);
model.sol('sol1').feature('s1').feature('fc1').set('maxiter', 50);
model.sol('sol1').feature('s1').feature('fc1').set('termonres', 'off');
model.sol('sol1').feature('s1').create('d1', 'Direct');
model.sol('sol1').feature('s1').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('s1').feature('d1').set('pivotperturb', 1.0E-13);
model.sol('sol1').feature('s1').feature('d1').label('PARDISO (ht)');
model.sol('sol1').feature('s1').create('i1', 'Iterative');
model.sol('sol1').feature('s1').feature('i1').set('linsolver', 'gmres');
model.sol('sol1').feature('s1').feature('i1').set('prefuntype', 'left');
model.sol('sol1').feature('s1').feature('i1').set('rhob', 400);
model.sol('sol1').feature('s1').feature('i1').label('Algebraic Multigrid (ht)');
model.sol('sol1').feature('s1').feature('i1').create('mg1', 'Multigrid');
model.sol('sol1').feature('s1').feature('i1').feature('mg1').set('prefun', 'saamg');
model.sol('sol1').feature('s1').feature('i1').feature('mg1').set('usesmooth', false);
model.sol('sol1').feature('s1').feature('i1').feature('mg1').set('saamgcompwise', true);
model.sol('sol1').feature('s1').feature('i1').feature('mg1').feature('pr').create('so1', 'SOR');
model.sol('sol1').feature('s1').feature('i1').feature('mg1').feature('pr').feature('so1').set('iter', 2);
model.sol('sol1').feature('s1').feature('i1').feature('mg1').feature('pr').feature('so1').set('relax', 0.9);
model.sol('sol1').feature('s1').feature('i1').feature('mg1').feature('po').create('so1', 'SOR');
model.sol('sol1').feature('s1').feature('i1').feature('mg1').feature('po').feature('so1').set('iter', 2);
model.sol('sol1').feature('s1').feature('i1').feature('mg1').feature('po').feature('so1').set('relax', 0.9);
model.sol('sol1').feature('s1').feature('i1').feature('mg1').feature('cs').create('d1', 'Direct');
model.sol('sol1').feature('s1').feature('i1').feature('mg1').feature('cs').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('s1').create('i2', 'Iterative');
model.sol('sol1').feature('s1').feature('i2').set('linsolver', 'gmres');
model.sol('sol1').feature('s1').feature('i2').set('prefuntype', 'left');
model.sol('sol1').feature('s1').feature('i2').set('rhob', 20);
model.sol('sol1').feature('s1').feature('i2').label('Geometric Multigrid (ht)');
model.sol('sol1').feature('s1').feature('i2').create('mg1', 'Multigrid');
model.sol('sol1').feature('s1').feature('i2').feature('mg1').set('prefun', 'gmg');
model.sol('sol1').feature('s1').feature('i2').feature('mg1').set('mcasegen', 'any');
model.sol('sol1').feature('s1').feature('i2').feature('mg1').feature('pr').create('so1', 'SOR');
model.sol('sol1').feature('s1').feature('i2').feature('mg1').feature('pr').feature('so1').set('iter', 2);
model.sol('sol1').feature('s1').feature('i2').feature('mg1').feature('po').create('so1', 'SOR');
model.sol('sol1').feature('s1').feature('i2').feature('mg1').feature('po').feature('so1').set('iter', 2);
model.sol('sol1').feature('s1').feature('i2').feature('mg1').feature('cs').create('d1', 'Direct');
model.sol('sol1').feature('s1').feature('i2').feature('mg1').feature('cs').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('s1').feature('fc1').set('linsolver', 'd1');
model.sol('sol1').feature('s1').feature('fc1').set('dtech', 'auto');
model.sol('sol1').feature('s1').feature('fc1').set('initstep', 0.01);
model.sol('sol1').feature('s1').feature('fc1').set('minstep', 1.0E-6);
model.sol('sol1').feature('s1').feature('fc1').set('maxiter', 50);
model.sol('sol1').feature('s1').feature('fc1').set('termonres', 'off');
model.sol('sol1').feature('s1').feature.remove('fcDef');
model.sol('sol1').attach('std1');

model.result.dataset.create('lshl1', 'LayeredShell');
model.result.dataset('lshl1').set('data', 'dset1');
model.result.dataset('lshl1').selection.geom('geom1', 3);
model.result.dataset('lshl1').selection.set([1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19]);
model.result.dataset('lshl1').selection.inherit(false);
model.result.create('pg1', 'PlotGroup3D');
model.result('pg1').label('Temperature (ht)');
model.result('pg1').set('data', 'dset1');
model.result('pg1').feature.create('surf1', 'Surface');
model.result('pg1').feature('surf1').set('colortable', 'ThermalLight');
model.result('pg1').feature('surf1').set('smooth', 'internal');
model.result('pg1').feature('surf1').set('data', 'parent');
model.result('pg1').feature.create('surf2', 'Surface');
model.result('pg1').feature('surf2').set('smooth', 'internal');
model.result('pg1').feature('surf2').set('data', 'lshl1');
model.result('pg1').feature('surf2').set('inheritplot', 'surf1');
model.result.create('pg2', 'PlotGroup3D');
model.result('pg2').label('Isothermal Contours (ht)');
model.result('pg2').set('data', 'dset1');
model.result('pg2').feature.create('iso1', 'Isosurface');
model.result('pg2').feature('iso1').label('Isosurface');
model.result('pg2').feature('iso1').set('number', 10);
model.result('pg2').feature('iso1').set('colortable', 'ThermalLight');
model.result('pg2').feature('iso1').set('data', 'parent');

model.sol('sol1').runAll;

model.result('pg1').run;
model.result('pg1').feature('surf2').set('data', 'lshl1');
model.result('pg1').run;
model.result('pg1').feature('surf2').set('unit', 'degC');
model.result('pg1').run;
model.result('pg1').feature('surf1').set('unit', 'degC');
model.result('pg1').run;

model.component('comp1').view('view1').set('transparency', false);

model.result.create('pg3', 'PlotGroup3D');
model.result('pg3').run;
model.result('pg3').label('Temperature, Slices');
model.result('pg3').create('slc1', 'Slice');
model.result('pg3').feature('slc1').set('unit', 'degC');
model.result('pg3').feature('slc1').set('quickplane', 'zx');
model.result('pg3').feature('slc1').set('colortable', 'ThermalLight');
model.result('pg3').run;
model.result.create('pg4', 'PlotGroup3D');
model.result('pg4').run;
model.result('pg4').label('Temperature, Chip Surface');
model.result('pg4').set('edges', false);
model.result('pg4').create('surf1', 'Surface');
model.result('pg4').feature('surf1').set('unit', 'degC');
model.result('pg4').feature('surf1').set('colortable', 'ThermalLight');
model.result('pg4').feature('surf1').create('sel1', 'Selection');
model.result('pg4').feature('surf1').feature('sel1').selection.set([195]);
model.result('pg4').run;

model.label('surface_moun.mph');

model.result('pg4').run;

out = model;
