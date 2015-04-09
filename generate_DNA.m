%% generate_DNA: generate other's DNA following conpany's event
function outputs = generate_DNA(company, date_list, back, forward)

	global report;

	% DNA_size = length(report{company,1}.event(:,1));
	DNA_size = length(date_list);

	outputs = zeros(DNA_size,1);
	for event_loc = 1:DNA_size
		[temp, start_date, end_date] = event_pick(company, date_list(event_loc), back, forward);
        outputs(event_loc) = temp;
    end

end