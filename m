Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AB5E2F1FEA
	for <soc@lists.linux.dev>; Tue,  3 Feb 2026 03:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770089533; cv=none; b=P4vVShZ+Wl2zUgsuqoXq4Ae9Y5pWxYNu0Ivgwxlfwy4bIo5tC8+VSVxoRv0XJMho6rwiwkUdx6DlWUqrPZ86WUTScg779Lal74eMiQ2prq5hDJoIfSDQyd7FqsNYihmrqHt2mgM149dyvWRDgZgt3hDX6CnOfggmTzLon1E9ZY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770089533; c=relaxed/simple;
	bh=Dz4l/Mpl4ocfA9ZZ7i3KuAhbHda43AUDNhfdrlIP03Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=r3Cg3qflW78pQOabM4F7AlDKvU2Jbk/6L6uMUGbmShGf54QOL+ohGtLJqWM6/G7ywD8TFzQMBn8NIxbhqxIwWfa3e0kpK/i/0TNsdsIhQv0cus5elAWTVbqOjT61rMHWNrJDaTUnk3gmhTCA+9+43bV+qjZBNT70zafRoWRm3k0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z1Yrdw/I; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z1Yrdw/I"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03E62C116D0;
	Tue,  3 Feb 2026 03:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770089533;
	bh=Dz4l/Mpl4ocfA9ZZ7i3KuAhbHda43AUDNhfdrlIP03Y=;
	h=From:To:Cc:Subject:Date:From;
	b=Z1Yrdw/IWZNtJMDx7o0/q7+zt41o3HqKlRqEerCLm7Kqcg5lQmHW+YLQbAWvFcyxg
	 hd9NxBWrDPO5UfYnNh4Xn6P4WbzZVcyJYRDo2wY3YTNOjqGRZ+7jMG36s0K52OQ7it
	 WH9q5JN8guVVFoc3AMLKd5PqbBlAnio30QwssbSJsgR4OJSOdmjxw35ShxpCZ4fNcF
	 JG1wNslQhkvyp48Erin1dspxV4qFBvxbnhfR/+VhIlRvwK40NyJV7QCdG4eTInwvtD
	 5tVslr1Hlh3JM2yr+OB9ae+QX3Rewojme7Zrab54/ZYHPLL56wlNMhPoHqK0N1Pf+C
	 Ydcake3QNr7HA==
From: Dinh Nguyen <dinguyen@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	soc@lists.linux.dev
Cc: dinguyen@kernel.org
Subject: [GIT PULL v3] arm/arm64: dts: socfpga: updates for v6.20, version 3
Date: Mon,  2 Feb 2026 21:32:11 -0600
Message-ID: <20260203033211.149355-1-dinguyen@kernel.org>
X-Mailer: git-send-email 2.42.0.411.g813d9a9188
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi soc maintainers,

This is version 3 of the PR.

V2 of this PR had a typo in the patch ("dt-bindings: intel: Add Agilex eMMC
support"). I incorrectly added the binding "intel,socfpga-agilex-emmc" which
should have been "intel,socfpga-agilex-socdk-emmc". V3 has this fix.

Thanks
Dinh


The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git tags/socfpga_dts_updates_for_v6.20_v3

for you to fetch changes up to 4d904af4d6ce29b9240ebecd35e31458d08cd577:

  dt-bindings: intel: Add Agilex eMMC support (2026-02-02 21:02:33 -0600)

----------------------------------------------------------------
SoCFPGA DTS updates for v6.20, version 3
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
