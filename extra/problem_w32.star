prob(X1, X2) := p(X1, X2) && q(X1, X2)
warn(X1, X2) := [$, 32] [D] prob(X1, X2)
error(X1, X2) := [$, 32] [B] prob(X1, X2)
