%% company DNA

%% calculate
% load('../data/report.mat');
% 
% back = 1;
% forward = 1;
% 
% test_size = 1000;
% 
% random_corr = zeros(length(report),length(report), test_size);
% 
% for company = 1:length(report)
%     event_size = size(report{company,1}.event(:,2));
%     event_start = min(report{company,1}.stockdata(:,1))+back;
%     event_end = max(report{company,1}.stockdata(:,1))-forward;
%     company
%     for test_iter = 1:test_size
%         % try different period as DNA and see what is the position of the
%         % special days
%         pick_date = round(rand(event_size)*(event_end - event_start) + event_start);
%         
%         DNA_size = length(pick_date);
%         self_DNA = generate_DNA(company, pick_date, back, forward);
% 
%         for other = 1:length(report)
%             other_DNA = generate_DNA(other, pick_date, back, forward);
%             random_corr(company, other, test_iter) = DNA_sim(self_DNA, other_DNA);
%         end
%     end
%     
% end

%% analysis
corr_p = zeros(length(report));

for company = 1:length(report)
    for other = 1:length(report)
        temp = zeros(test_size,1);
        for i = 1:1000
            temp(i) = random_corr(company, other, i);
        end
        corr_p(company, other) = sum(temp < corr(company,other)+0.0000000000001)/test_size;
    end
end

mask = (corr_p<0.03)|(corr_p>0.97)&(corr_p <1-0.000000001);

edge_list = zeros(1,4);
count = 0;
for company = 1:length(report)
    for other = 1:length(report)
        if mask(company,other)
            count = count + 1
            edge_list(count,1) = company;
            edge_list(count,2) = other;
            edge_list(count,3) = corr(company, other);
            edge_list(count,4) = corr_p(company, other);
        end
    end
end