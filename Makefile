.PHONY: prereqs env create verify delete ports

prereqs:
	bash scripts/check-prereqs.sh

env:
	bash scripts/collect-env.sh

create:
	bash infra/kind/create.sh

verify:
	bash infra/kind/verify.sh

delete:
	bash infra/kind/delete.sh

ports:
	bash scripts/check-ports.sh

