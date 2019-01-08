defmodule RoleVfio.Mixfile do
	use Mix.Project

	def project do
		[
			app:             :role_vfio,
			version:         "0.1.0",
			elixir:          ">= 1.4.0",
			build_embedded:  Mix.env == :prod,
			start_permanent: Mix.env == :prod,
			deps:            deps()
		]
	end

	defp deps do
		[
			{:converge,         ">= 0.1.0"},
			{:role_intel_iommu, ">= 0.1.0"},
		]
	end
end
