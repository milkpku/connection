%% generate_DNA: generate other's DNA following conpany's event
function outputs = generate_DNA(company, other, back, forward)

	global report;

	DNA_size = length(report{company,1}.event(:,1));

	outputs = zeros(DNA_size,1);
	for event_loc = 1:DNA_size
		[temp, start_date, end_date] = event_pick(other, report{company,1}.event(event_loc,2), back, forward);
        outputs(event_loc) = temp;
    end

end