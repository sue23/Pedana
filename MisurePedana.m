FileName = {'MisurePedana Cal 01','MisurePedana Cal 02','MisurePedana Cal 03'};
for i =1:3
    c3d=c3d2c3d(FileName{i});
    TRJ=c3dget(c3d,c3d.c3dpar.subjects.names,c3d.c3dpar.point.labels,'a');%trajectory
    avgTRJ=mean(TRJ,1);
    for j=1:10
        eval([c3d.c3dpar.point.labels{j}, '(', num2str(i), ',:)=[' num2str(avgTRJ(:,:,j)), '];'])
    end
end

for j=1:10
    eval(['avg', c3d.c3dpar.point.labels{j}, '=mean(', mat2str(eval(c3d.c3dpar.point.labels{j})), ');'])
end

r1 = sqrt(sum((avgc1(:,1:2)-avgcentro(:,1:2)).^2));
r2 = sqrt(sum((avgc2(:,1:2)-avgcentro(:,1:2)).^2));
r3 = sqrt(sum((avgc3(:,1:2)-avgcentro(:,1:2)).^2));

a1c1 = sqrt(sum((avgc1(:,1:2)-avga1(:,1:2)).^2));
b1c1 = sqrt(sum((avgc1(:,1:2)-avgb1(:,1:2)).^2));

a2c2 = sqrt(sum((avgc1(:,1:2)-avga1(:,1:2)).^2));
b2c2 = sqrt(sum((avgc1(:,1:2)-avgb1(:,1:2)).^2));

a3c3 = sqrt(sum((avgc1(:,1:2)-avga1(:,1:2)).^2));
b3c3 = sqrt(sum((avgc1(:,1:2)-avgb1(:,1:2)).^2));

R=mean([r1 r2 r3])*1e-3; %metri
l=mean([a1c1 b1c1 a2c2 b2c2 a3c3 b3c3])*1e-3; %metri