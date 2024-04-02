function z = normal_distribution(x, mu, DetSig, InvSig)

z = 1 / ((2*pi) * DetSig^(1/2)) * exp(-0.5 * (x-mu)' * InvSig * (x-mu));
end