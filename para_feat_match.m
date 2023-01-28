function [inx,outclass] = para_feat_match(feat1)
dir_name = 'Feature_Dir\';

files = dir([dir_name '*.mat']);

all_dist = [];
classname = {};
for i = 1:length(files)
    file = [dir_name files(i).name];    
    load (file)
    dist_val = sum(sum((double(feat.val(:,1:end))-double(feat1(:,1:end))).^2)).^0.5;
    classname{i} = feat.class;
    all_dist = [all_dist;dist_val];
end

[val inx] = min(all_dist);

outclass = classname{inx};