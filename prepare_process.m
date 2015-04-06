

function prepare_process()
	global report
	stock_path = '../data/stock/';
	event_path = '../data/event/';

	for companyID = 1:22
	    % read in stock data
	    try
	        report{companyID,1}.stockdata = dlmread([stock_path, num2str(companyID)]);
	        report{companyID,1}.companyID = companyID;
	    catch
	        sprintf('miss stock data of company %d',companyID)
	    end

	    % read in stock data
	    try
	        report{companyID,1}.event = dlmread([event_path, num2str(companyID)]);
	    catch
	        sprintf('miss event data of company %d',companyID)
	    end
	end

