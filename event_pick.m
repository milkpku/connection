%% event_pick: find the needed period of a company
%% Input:
%% company:
%% event_date:
%% back: the number of working day before event_date
%% forward: the number of working day after event_date
%% Output:
%% outputs: wanted result
%% start_date: the date period start
%% end_date: the date period end
function [outputs, start_date, end_date] = event_pick(company, event_date, back, forward)
	global report
	% date data of company
	temp_data = report{company,1}.stockdata(:,1);

	outputs = 0;
	start_date = NaN;
	end_date = NaN;

	if isnan(event_date)
		return
    end
	% pick the start_date and end_date
	pick_forward = find(temp_data > event_date, forward, 'first');
	pick_back = find(temp_data < event_date, back, 'last');

	if length(pick_forward) == forward
		pick_end = pick_forward(end);
		end_date = temp_data(pick_end);
    else
		return
	end

	if length(pick_back) == back
		pick_start = pick_back(1);
		start_date = temp_data(pick_start);
    else
		return
	end

	outputs = (report{company,1}.stockdata(pick_end,2) / report{company,1}.stockdata(pick_start,2) - 1)*100;

end
