alias Converge.Util

defmodule RoleVfio do
	def role(tags \\ []) do
		%{
			cmdline_normal_only: [
				# pcie_acs_override= requires the ACS override patch; we use it to put
				# our IOMMU Group 1 GPUs into their own groups.
				"pcie_acs_override=downstream",
			] ++ case Util.tag_values(tags, "vfio_pci_id") do
				[]  -> []
				ids -> ["vfio-pci.ids=#{Enum.join(ids, ",")}"]
			end,
			boot_time_kernel_modules: [
				"vfio",
				"vfio_iommu_type1",
				"vfio_pci",
				"vfio_virqfd",
			],
			implied_roles: [RoleIntelIommu],
		}
	end
end
