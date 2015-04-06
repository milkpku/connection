%% DNA_sim: modified vector operation
function [outputs] = DNA_sim(self_DNA, other_DNA)

	% change scale
	self_DNA = 1./(1+exp(self_DNA/5)) - 0.5;
	other_DNA = 1./(1+exp(other_DNA/5)) - 0.5;

	% normalize
	self_DNA = self_DNA/sqrt(sum(self_DNA.^2));
	other_DNA = other_DNA/sqrt(sum(other_DNA.^2));

	outputs = self_DNA' * other_DNA;
end
