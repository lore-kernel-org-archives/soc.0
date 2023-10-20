Return-Path: <conor@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91AA4CDB474
	for <soc@archiver.kernel.org>; Fri, 20 Oct 2023 13:19:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6C988C433C8; Fri, 20 Oct 2023 13:19:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4ABBCC433C7;
	Fri, 20 Oct 2023 13:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697807959;
	bh=IFYZh0PK+ZqTUr1k/dLRLjLE8s8/0wnHFTC9pViaxh8=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=gGP7QqDorJF7t5G71u09Yc+IU9HlEG+VSJtLubkKzLvteYGyVHleNncd2/UgRbfSe
	 a41Qnjk880C2g6j26vhCD0/1omgZTYhsTU+gQwOfl8c7AoTlFPAFIgfFXl5vCs5klv
	 jK5TEHBRJV+BGMS0RTRsSuN5zbewfAnsi9Ez7XDOQGib473/MTX8TVnOMzZfP26tbl
	 kL6HeC5CT9MMt3umwpowiqvNVLW30esvOyaaQD3FtM8aQ/6jShJ/GkR+rZ9B1q0SbJ
	 7mK5VilHFL9cryhGZsP4b2eRsUXChZy0B9ziuiER9rQVBVWsDqiWBEmdZhaRbpWQ84
	 WjMKG3JlKh2xQ==
From: Conor Dooley <conor@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Moritz Fischer <mdf@kernel.org>,
	Wu Hao <hao.wu@intel.com>,
	Xu Yilun <yilun.xu@intel.com>,
	Tom Rix <trix@redhat.com>,
	Russ Weight <russell.h.weight@intel.com>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-fpga@vger.kernel.org
Subject: [PATCH v3 0/6] PolarFire SoC Auto Update Support
Date: Fri, 20 Oct 2023 14:18:38 +0100
Message-Id: <20231020-agreeably-filing-3d48708e6262@spud>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3656; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=Sx7XDhJn2vtaqpSQPM4WYWdT2f14tTpPwy2yBjd+DQQ=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDKlGdfJNElr5KoEZIY5Fs+O5rDWZtk1m+Gnj8+d2bHtZK Lva1AMdpSwMYhwMsmKKLIm3+1qk1v9x2eHc8xZmDisTyBAGLk4BmMh0D4b/ji2KjFdXcYtekpw7 qUxSVd6t6ujhOl5twdrG54afJKZZMfyzLy3SbvqVenSpbHL+r5u7ThYfbXvaGhrL9q/079dijmY eAA==
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit

From: Conor Dooley <conor.dooley@microchip.com>

Hey all,

This patchset adds support for the "Auto Update" feature on PolarFire
SoC that allows for writing an FPGA bistream to the SPI flash connected
to the system controller.
On powercycle (or reboot depending on how the firmware implements the
openSBI SRST extension) "Auto Update" will take place, and program the
FPGA with the contents of the SPI flash - provided that that image is
valid and an actual upgrade from that already programmed.

Previously this driver was added to the FPGA subsystem, but as there is
no capability for dynamic reconfiguration due to the device reset
requirement, the FPGA manager framework is not actually used by the
driver. As a result, the FPGA maintainers did not think it belonged in
that directory, and after speaking to Arnd, I have put it in
drivers/firmware/microchip instead. Otherwise, very little has changed
here, compared to the previous submission.

If this is acceptable, I can add this to my eventual SoC drivers pull
request for v6.8.

Cheers,
Conor.

Changes in v3:
- Move the driver to drivers/firmware
- Rename the firmware upload device: s/mpfs_bitstream/mpfs-auto-update/
- Fix the clock parentage for the qspi node added in this series
- https://lore.kernel.org/linux-fpga/ZDlJxrybiWy3Mk4Y@yilunxu-OptiPlex-7050/

Changes in v2:
- per Russ' suggestion, the driver has been switched to using the
  firmware-upload API rather than the fpga one
- as a result of that change, the structure of the driver has changed
  significantly, although most of that is reshuffling existing code
  around
- check if the upgrade is possible in probe and fail if it isn't
- only write the image index if it is not already set
- delete the now unneeded debugfs bits

CC: Arnd Bergmann <arnd@arndb.de>
CC: Conor Dooley <conor.dooley@microchip.com>
CC: Daire McNamara <daire.mcnamara@microchip.com>
CC: Rob Herring <robh+dt@kernel.org>
CC: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
CC: Moritz Fischer <mdf@kernel.org>
CC: Wu Hao <hao.wu@intel.com>
CC: Xu Yilun <yilun.xu@intel.com>
CC: Tom Rix <trix@redhat.com>
CC: Russ Weight <russell.h.weight@intel.com>
CC: linux-riscv@lists.infradead.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-fpga@vger.kernel.org
CC: soc@kernel.org

Conor Dooley (6):
  dt-bindings: soc: microchip: add a property for system controller
    flash
  soc: microchip: mpfs: enable access to the system controller's flash
  soc: microchip: mpfs: print service status in warning message
  soc: microchip: mpfs: add auto-update subdev to system controller
  firmware: microchip: add PolarFire SoC Auto Update support
  riscv: dts: microchip: add the mpfs' system controller qspi &
    associated flash

 .../microchip,mpfs-sys-controller.yaml        |  10 +
 .../boot/dts/microchip/mpfs-icicle-kit.dts    |  21 +
 arch/riscv/boot/dts/microchip/mpfs.dtsi       |  17 +
 drivers/firmware/Kconfig                      |   1 +
 drivers/firmware/Makefile                     |   1 +
 drivers/firmware/microchip/Kconfig            |  12 +
 drivers/firmware/microchip/Makefile           |   3 +
 drivers/firmware/microchip/mpfs-auto-update.c | 494 ++++++++++++++++++
 drivers/soc/microchip/Kconfig                 |   1 +
 drivers/soc/microchip/mpfs-sys-controller.c   |  33 +-
 include/soc/microchip/mpfs.h                  |   2 +
 11 files changed, 592 insertions(+), 3 deletions(-)
 create mode 100644 drivers/firmware/microchip/Kconfig
 create mode 100644 drivers/firmware/microchip/Makefile
 create mode 100644 drivers/firmware/microchip/mpfs-auto-update.c

-- 
2.39.2

