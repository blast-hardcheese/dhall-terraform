var_file=vars
root=./
target=$(root)/target/

stub-var-file:
	@touch $(var_file)

clean-target:
	rm -rf $(target)

default: clean-target stub-var-file
	@echo "Rendering dhall"
	@mkdir -p $(target)
	@dhall-to-json <<< "$(root)/test.tf.dhall" > "$(target)/test.tf.json"
	@echo "Running terraform"
	@terraform plan \
		-var-file=$(var_file)
		$(target)

watch:
	while true; do \
		find $(root) -name '*.tf.dhall' -type f | entr -cd make; \
		sleep 1; \
	done
