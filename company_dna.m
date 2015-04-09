%% company DNA
load('../data/report.mat');

back = 1;
forward = 1;

corr = zeros(length(report));

for company = 1:length(report)

	DNA_size = length(report{company,1}.event(:,2));

	self_DNA = generate_DNA(company, report{company,1}.event(:,2), back, forward);
    report{company,1}.DNA = zeros(DNA_size,length(report));
    
	for other = 1:length(report)
		other_DNA = generate_DNA(other, report{company,1}.event(:,2), back, forward);
        report{company,1}.DNA(:,other) = other_DNA;
		corr(company, other) = DNA_sim(self_DNA, other_DNA);
    end
    
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