Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C392A946C
	for <soc@lists.linux.dev>; Sat, 24 Jan 2026 20:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769284879; cv=none; b=WZ1cYr/vnolO1hDShgi0AK+YAAXGWKU8sV1ghtJ/T8bPKakFtkhbmitzAONG2UnQ1QSFDmn0d7R9xVIoNXlw4qGdnQeGxc2iZcMy1h1u352mxc5/hqSNEYEKpjlzJwUjjEtXmHo55e8D0GrEuieg3zo65khSOf82rFMZnGMtiY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769284879; c=relaxed/simple;
	bh=vWAkqFd+8+4rfuGqKrFOjnRspyOydTrshpi/s8xSGmM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ba595gHUX2sExQuZExHjZ5wPgjt6HvU4WVp+m6tm1sB/HRlTS0zwIkmS8+TZDwUZyDZG0Vo5jUaWu68d2v122WZECfOTeIKvB+8TsFQHkPhtCsTmrv50qrK5c0BY1/+KbRXZ80VVYFymr8IsZyFz1rM6fa/XvRPjibV+v6tx0d0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aJAer8s3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aJAer8s3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 217EDC116D0;
	Sat, 24 Jan 2026 20:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769284879;
	bh=vWAkqFd+8+4rfuGqKrFOjnRspyOydTrshpi/s8xSGmM=;
	h=From:To:Cc:Subject:Date:From;
	b=aJAer8s3PItguE9Inc1JCT1Z1N56jmGASBdSeh9A1mU/Fw1Wzqfi5kYHeM7cJ5rxV
	 o/huK/2IRYpHsTAI4ibxO0qBX4JxdfVL0mpokL3Fy1MdPNSYFAqokCGY4lLwe4ApDd
	 MUer7tu6MqGm0nIrnzc86ihu2i/O/KMES9+sCZzar7Z7TP1bzStRBZp+Pn20BtcK7E
	 Qy/CPy92cYXK6UbdktOpE1Sck9yXKR8+lpI9WON4rJcPETEGK+QWmyPXLeMJmGk4Bn
	 YyOd37Et8ya1UW7lDXPjIFNq2Qp+W7F7jpMTYkw+R7en9yKKjE0aIJUnmTJatrcZ3s
	 23a8/DMN7Wr0Q==
From: Dinh Nguyen <dinguyen@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	soc@lists.linux.dev
Cc: dinguyen@kernel.org
Subject: [GIT PULL] arm/arm64: dts: socfpga: updates for v6.20
Date: Sat, 24 Jan 2026 14:01:18 -0600
Message-ID: <20260124200118.2789128-1-dinguyen@kernel.org>
X-Mailer: git-send-email 2.42.0.411.g813d9a9188
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git tags/socfpga_dts_updates_for_v6.20

for you to fetch changes up to 1a457681c075e1bd894df753087cb4268ce9f9e9:

  arm64: dts: intel: agilex5: Add simple-bus node on top of dma controller node (2026-01-02 07:52:44 -0600)

----------------------------------------------------------------
SoCFPGA DTS updates for v6.20
- dt-bindings updates:
	- Add dma-coherent for cdns,hp-nfc and snps,dw-axi-dmac
	- Add intel,socfpga-agilex5-socdk-modular for the Agilex5 mod board
	- Move entries in intel,socfpga.yaml into altera.yaml
	- Add syscon as a fallback for sys-mgr

- Add dma-cohrerent property for Agilex5 NAND and DMA
- Add support for the Agilex5 modular board
- Add IOMMUS property for ethernet nodes for Agilex5
- Use lowercase hex for dts files
- Add #address-cells and #size-cells for sram
- Fix dtbs_check warning for fpga-region
- Move dma controller node for Agilex5 under simple-bus

----------------------------------------------------------------
Dinh Nguyen (4):
      dt-bindings: arm: altera: combine Intel's SoCFPGA into altera.yaml
      dt-bindings: altera: document syscon as fallback for sys-mgr
      ARM: dts: socfpga: add #address-cells and #size-cells for sram node
      ARM: dts: socfpga: fix dtbs_check warning for fpga-region

Khairul Anuar Romli (4):
      dt-bindings: mtd: cdns,hp-nfc: Add dma-coherent property
      dt-bindings: dma: snps,dw-axi-dmac: add dma-coherent property
      arm64: dts: socfpga: agilex5: Add dma-coherent property
      arm64: dts: intel: agilex5: Add simple-bus node on top of dma controller node

Krzysztof Kozlowski (1):
      arm64: dts: altera: Use lowercase hex

Nazim Amirul (1):
      arm64: dts: socfpga: agilex5: Add IOMMUS property for ethernet nodes

Niravkumar L Rabara (2):
      dt-bindings: intel: Add Agilex5 SoCFPGA modular board
      arm64: dts: socfpga: agilex5: add support for modular board

 Documentation/devicetree/bindings/arm/altera.yaml  |  26 +++++
 .../devicetree/bindings/arm/intel,socfpga.yaml     |  40 -------
 .../devicetree/bindings/dma/snps,dw-axi-dmac.yaml  |   2 +
 .../devicetree/bindings/mtd/cdns,hp-nfc.yaml       |   2 +
 .../bindings/soc/altera/altr,sys-mgr.yaml          |   6 +-
 arch/arm/boot/dts/intel/socfpga/socfpga.dtsi       |   6 +-
 .../boot/dts/intel/socfpga/socfpga_arria10.dtsi    |   6 +-
 arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi  |   2 +-
 .../boot/dts/altera/socfpga_stratix10_socdk.dts    |   2 +-
 .../dts/altera/socfpga_stratix10_socdk_nand.dts    |   4 +-
 arch/arm64/boot/dts/intel/Makefile                 |   1 +
 arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi     | 130 ++++++++++++---------
 .../dts/intel/socfpga_agilex5_socdk_modular.dts    | 109 +++++++++++++++++
 arch/arm64/boot/dts/intel/socfpga_agilex_socdk.dts |   2 +-
 arch/arm64/boot/dts/intel/socfpga_n5x_socdk.dts    |   4 +-
 15 files changed, 233 insertions(+), 109 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/intel,socfpga.yaml
 create mode 100644 arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_modular.dts
