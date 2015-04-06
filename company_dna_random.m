%% company DNA
load('../data/report.mat');

back = 1;
forward = 1;

corr = zeros(length(report));

for company = 1:length(report)

	DNA_size = length(report{company,1}.event(:,1));
    for i = 1:DNA_size
        size = 80;
        flux = round((rand()-0.5)*size);
        report{company,1}.event(:,2) = report{company,1}.event(:,2) + flux;
    end
    
	self_DNA = generate_DNA(company, company, back, forward);
    report{company,1}.DNA = zeros(DNA_size,length(report));
    
	for other = 1:length(report)
		other_DNA = generate_DNA(company, other, back, forward);
        report{company,1}.DNA(:,other) = other_DNA;
		corr(company, other) = DNA_sim(self_DNA, other_DNA);
    end
    
    corr(company,company) = NaN;
    
end

edge_list = zeros(1,3);
count = 0;
for company = 1:length(report)
    for other = 1:length(report)
        if company == other
            continue;
        end
        count = count +1;
        edge_list(count,1) = company;
        edge_list(count,2) = other;
        edge_list(count,3) = abs(corr(company, other));
    end
end

xvalue = -0.7:0.1:1;
s_1 = subplot(2,1,1);
s_2 = subplot(2,1,2);
hist(s_1, a(:,2), xvalue);
hist(s_2, corr(:,2), xvalue);