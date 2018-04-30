root=./
target=$(root)/target/

default: render

clean-target:
	rm -rf $(target)

render: clean-target
	@echo "Rendering dhall"
	@mkdir -p $(target)
	@dhall-to-json <<< "$(root)/test.tf.dhall" > "$(target)/test.tf.json"
	@echo "Running terraform"
	@terraform plan \
		$(target)

watch:
	while true; do \
		find $(root) -name '*.tf.dhall' -type f | entr -cd make; \
		sleep 1; \
	done
