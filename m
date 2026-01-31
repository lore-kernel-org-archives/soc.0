Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F1AF3612D8
	for <soc@lists.linux.dev>; Sat, 31 Jan 2026 17:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769881618; cv=none; b=ldsZrc8s0TlKe8pxTdQTBS4B5dwGfM2dzGKlwdoAMuAbNml0X56xFHpaEGdfhB2BA1zp3EY+39RTLfYsNEQdI4436ijy+pphZ6StpjPtN8oVTpWaD2/FwajKUlDzE/SSh1bs4SRELLLAxZNUG2ujw61n5nmuLn31jYAZR9ELZu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769881618; c=relaxed/simple;
	bh=XJXhKDKIdbjjqxopEmAWWGnKUg42p9kFs2Ta8M/uoKs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=t+Y8AP6XnVADW13z/AZB64zGdyFagxf/mbQs1aXY5bCAOYsJH6E0BkRbGaGNIecvacjEOjQ88yPw/33FBz5aUZysPkBp/Gsh9x13T0NKdkR7UfAHLqTu4c8M158Z8vQB9Cub6kA9feLNgNN+Omk/M0TZNS0lDatlr8eCTMpZ+/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ERBXpdRn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ERBXpdRn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5ED9AC4CEF1;
	Sat, 31 Jan 2026 17:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769881617;
	bh=XJXhKDKIdbjjqxopEmAWWGnKUg42p9kFs2Ta8M/uoKs=;
	h=From:To:Cc:Subject:Date:From;
	b=ERBXpdRnPBX/6AOoFv2uuS1g/k6bexCua0jdu7KM82bFqIUWxP3BP3ZtEnyZwFtUg
	 tK7zOUS4t1W/rWEodPg1iUK+Ws9RajyGMVaCSu4E4Rw/hzp2SKWUvTwrn4FHW2WBbh
	 p9yVJpwC79HRUI+qlpbOOA2rcnfZxZdzFKkMmGtu/IaK8j4G/RyT9UJd8tLtT+q5KC
	 7ma5UfBled1ikcbA9SW0u2B0AXZuguA2uI5JwI5Ox870SRqKjLPyy2S59MJ/LXoPVO
	 ZFyGbIIiqL7pktUlR5RkZ4hHdFb+1hzs//iiTv2zaP3p979RayFTkf6PIGaF2nQaXV
	 K/CWuZayigIow==
From: Dinh Nguyen <dinguyen@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	soc@lists.linux.dev
Cc: dinguyen@kernel.org
Subject: [GIT PULL v2] arm/arm64: dts: socfpga: updates for v6.20, version 2
Date: Sat, 31 Jan 2026 11:46:56 -0600
Message-ID: <20260131174656.30403-1-dinguyen@kernel.org>
X-Mailer: git-send-email 2.42.0.411.g813d9a9188
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi soc maintainers,

This is version 2 of the PR that had dt-bindings for dma and mtd patches[1]. This
version has those patches removed and I'm taking them through the respective
maintainer's tree.

Thanks,
Dinh
[1] https://lore.kernel.org/soc/7c6de5dc-8396-4793-a4fa-184bfe4096f3@kernel.org

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git tags/socfpga_dts_updates_for_v6.20_v2

for you to fetch changes up to 42a8d7d72185247c0bbada1d2c44bef743ee6a5d:

  dt-bindings: intel: Add Agilex eMMC support (2026-01-30 09:50:07 -0600)

----------------------------------------------------------------
SoCFPGA DTS updates for v6.20, version 2
- dt-bindings updates:
	- Add intel,socfpga-agilex5-socdk-modular for the Agilex5 mod board
	- Add intel,socfpga-agilex-emmc for the Agilex eMMC daughter board
	- Move entries in intel,socfpga.yaml into altera.yaml
	- Add syscon as a fallback for sys-mgr

- Add dma-cohrerent property for Agilex5 NAND and DMA
- Add support for the Agilex5 modular board
- Add IOMMUS property for ethernet nodes for Agilex5
- Use lowercase hex for dts files
- Add #address-cells and #size-cells for sram
- Fix dtbs_check warning for fpga-region
- Move dma controller node for Agilex5 under simple-bus
- Add support for the Agilex eMMC daughter board

----------------------------------------------------------------
Dinh Nguyen (4):
      dt-bindings: arm: altera: combine Intel's SoCFPGA into altera.yaml
      dt-bindings: altera: document syscon as fallback for sys-mgr
      ARM: dts: socfpga: add #address-cells and #size-cells for sram node
      ARM: dts: socfpga: fix dtbs_check warning for fpga-region

Khairul Anuar Romli (2):
      arm64: dts: socfpga: agilex5: Add dma-coherent property
      arm64: dts: intel: agilex5: Add simple-bus node on top of dma controller node

Krzysztof Kozlowski (1):
      arm64: dts: altera: Use lowercase hex

Nazim Amirul (1):
      arm64: dts: socfpga: agilex5: Add IOMMUS property for ethernet nodes

Ng Tze Yee (2):
      arm64: dts: socfpga: agilex: add emmc support
      dt-bindings: intel: Add Agilex eMMC support

Niravkumar L Rabara (2):
      dt-bindings: intel: Add Agilex5 SoCFPGA modular board
      arm64: dts: socfpga: agilex5: add support for modular board

 Documentation/devicetree/bindings/arm/altera.yaml  |  27 +++++
 .../devicetree/bindings/arm/intel,socfpga.yaml     |  40 -------
 .../bindings/soc/altera/altr,sys-mgr.yaml          |   6 +-
 arch/arm/boot/dts/intel/socfpga/socfpga.dtsi       |   6 +-
 .../boot/dts/intel/socfpga/socfpga_arria10.dtsi    |   6 +-
 arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi  |   2 +-
 .../boot/dts/altera/socfpga_stratix10_socdk.dts    |   2 +-
 .../dts/altera/socfpga_stratix10_socdk_nand.dts    |   4 +-
 arch/arm64/boot/dts/intel/Makefile                 |   2 +
 arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi     | 130 ++++++++++++---------
 .../dts/intel/socfpga_agilex5_socdk_modular.dts    | 109 +++++++++++++++++
 arch/arm64/boot/dts/intel/socfpga_agilex_socdk.dts |   2 +-
 .../boot/dts/intel/socfpga_agilex_socdk_emmc.dts   | 105 +++++++++++++++++
 arch/arm64/boot/dts/intel/socfpga_n5x_socdk.dts    |   4 +-
 14 files changed, 336 insertions(+), 109 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/intel,socfpga.yaml
 create mode 100644 arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_modular.dts
 create mode 100644 arch/arm64/boot/dts/intel/socfpga_agilex_socdk_emmc.dts
