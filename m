Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5EDDC433FE
	for <soc@archiver.kernel.org>; Sat, 19 Nov 2022 12:58:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CB6A8C433D6; Sat, 19 Nov 2022 12:58:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39F3AC4347C;
	Sat, 19 Nov 2022 12:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668862703;
	bh=fBCvTFx4V8wEdQC7VlRAM/X9HtFcth+toW6vRc/YwVg=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aM/DCs2ssY+RrWpkj/e06NkqsF/EZ+uAl8dCrOF6u5oY53jYcntz49HBsnGS07VIX
	 KUYrdM4Wc53XXbv15jvLFmlfZd8diiT9U3rWQ6TEGAdfvom6P+PrazSFlZfmXQfVHN
	 Cr/tMrXn0hk1gjHFJBPXiFvZOd1gVHdOk8W6zyx9Hq5lrbmXtF3uAMfdhSrnvw5kFw
	 myfJboxSB+dDREmEvUp9C6LXRDpecW2ovFIPR8hD9UYXU65Z4f1OrqznUzAN3YWccv
	 M/bXLyCgY0KNPz7uB1VcKRfHlMPIWk3DjjDwx6f6tL507Le+AABWtsWiqQkZl4uKuB
	 kSs5n0eRjMQMw==
From: Shawn Guo <shawnguo@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	arm@kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Stefan Agner <stefan@agner.ch>,
	Li Yang <leoyang.li@nxp.com>,
	kernel@pengutronix.de,
	linux-imx@nxp.com,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 5/6] i.MX arm64 device tree update for 6.2
Date: Sat, 19 Nov 2022 20:57:32 +0800
Message-Id: <20221119125733.32719-5-shawnguo@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221119125733.32719-1-shawnguo@kernel.org>
References: <20221119125733.32719-1-shawnguo@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

In order to apply the patch that renames DTB overlay source files
from .dts to .dtso, commit dcad240c15c10bebdccd1f29f1a44787528f2d76 from
Rob's branch dt/dtbo-rename below (stable) is pulled in to resolve the
dependency.  Please consider to pull, thanks!

  git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt/dtbo-rename

Shawn


The following changes since commit dcad240c15c10bebdccd1f29f1a44787528f2d76:

  kbuild: Cleanup DT Overlay intermediate files as appropriate (2022-11-18 14:45:30 -0600)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-dt64-6.2

for you to fetch changes up to 4c33cb31282c3968000a08223591c532128dfcfd:

  arm64: dts: freescale: Rename DTB overlay source files from .dts to .dtso (2022-11-19 14:30:40 +0800)

----------------------------------------------------------------
i.MX arm64 device tree update for 6.2:

- New device trees for i.MX8MM based Cloos PHG and WB15 SoM/EVK.
- A set of tqma8mpql/mba8mpxl changes, adding USB Host, PCIe, PWM fan
  support.
- Rename DTB overlay source files from .dts to .dtso.
- A series from Frank Li to add USB, ADC, FlexSPI, LPSPI support for
  i.MX8DXL.
- A couple of librem5-devkit changes, switching LED to use PWM and using
  function and color properties for LED.
- Enable wakeup-source for USB PHY for i.MX8MM/N EVK.
- A set of random changes from Marcel Ziswiler to improve i.MX8M based
  Verdin device trees.
- A series from Marek Vasut to update Data Modul i.MX8M Mini eDM SBC and
  DH electronics i.MX8M Plus DHCOM, modeling PMIC to SNVS RTC clock
  path, dropping QCA clk_out setup, adding bluetooth UART, etc.
- A bunch of changes from Peng Fan to add LPSPI, TPM etc for i.MX93,
  update i.MX8MP/N EVK with UART, I2C addition.
- Update cache properties per DeviceTree Specification v0.3.
- Add gpio-ranges property for i.MX8DXL and i.MX8Q LSIO Subsystem.
- Misc small and random changes.

----------------------------------------------------------------
Adrian Alonso (1):
      arm64: dts: imx8mm-evk: add vcc supply for pca6416

Alexander Stein (4):
      arm64: dts: tqma8mpql: add support for 2nd USB (host) interface
      arm64: dts: tqma8mq-mba8mx: Add vcc supply to i2c eeproms
      arm64: dts: tqma8mpql: add PCIe support
      arm64: dts: mba8mpxl: Add PWM fan support

Andrew Davis (1):
      arm64: dts: freescale: Rename DTB overlay source files from .dts to .dtso

Clark Wang (1):
      ARM64: dts: imx8mp-evk: add pwm support

Fabio Estevam (1):
      arm64: dts: imx8mm-phg: Add initial board support

Frank Li (7):
      arm64: dts: imx8dxl: add usb1 and usb2 support
      arm64: dts: imx8dxl: add adc0 support
      arm64: dts: imx8dxl_evk: add adc0 support
      arm64: dts: imx8dxl: add flexspi0 support
      arm64: dts: imx8dxl_evk: add flexspi0 support
      arm64: dts: imx8dxl: add lpspi support
      arm64: dts: imx8dxl_evk: add lpspi0 support

Guido Günther (2):
      arm64: dts: librem5-devkit: Make LED use PWM
      arm64: dts: librem5-devkit: Use function and color rather than label

Haibo Chen (2):
      arm64: dts: imx93: add gpio alises
      arm64: dts: imx8m[m,q]-evk: change to use off-on-delay-us in regulator

Han Xu (1):
      arm64: dts: imx8mp-evk: enable fspi nor on imx8mp evk

Li Jun (1):
      arm64: dts: imx8mm/n-evk: enable wakeup-source for usb phy

Marcel Ziswiler (10):
      arm64: dts: verdin-imx8mm: verdin-imx8mp: improve include notation
      arm64: dts: colibri-imx8x: improve include notation
      arm64: dts: verdin-imx8mm: verdin-imx8mp: rename sn65dsi83 to sn65dsi84
      arm64: dts: verdin-imx8mm: improve pcie node
      arm64: dts: verdin-imx8mp: improve pinctrl for vbus-supplies
      arm64: dts: verdin-imx8mp: remove usb_2 over-current detection disabling
      arm64: dts: verdin-imx8mp: add usb_1 over-current detection
      arm64: dts: verdin-imx8mp: disable usb port power control
      arm64: dts: verdin-imx8mp: add gpio usb-b connector
      arm64: dts: verdin-imx8mp: dahlia: mark usb_2 permanently attached

Marek Vasut (6):
      arm64: dts: imx8mm: Model PMIC to SNVS RTC clock path on Data Modul i.MX8M Mini eDM SBC
      arm64: dts: imx8mm: Drop QCA clk out setup on Data Modul i.MX8M Mini eDM SBC
      arm64: dts: imx8mp: Bind bluetooth UART on DH electronics i.MX8M Plus DHCOM
      arm64: dts: imx8mm-data-modul: Rename /watchdog-gpio to plain /watchdog
      arm64: dts: imx8mm: imx8mn: imx8mp: imx8mq: Replace opp-xM with opp-x000000
      arm64: dts: imx8mm: Remove watchdog always-enabled property from eDM SBC

Martin Kepplinger (1):
      arm64: dts: imx8mq: fix dtschema warning for imx7-csi

Peng Fan (13):
      arm64: dts: imx8m: align anatop with bindings
      arm64: dts: imx93: add nxp,no-divider for sysctr
      arm64: dts: imx93: add MU clock for mailbox
      arm64: dts: imx93: add extra lpspi node
      arm64: dts: imx93: add tpm nodes
      arm64: dts: imx8mp: update ecspi compatible and clk
      arm64: dts: imx8mp: add mlmix power domain
      arm64: dts: imx8mp-evk: enable uart1/3 ports
      arm64: dts: imx8mp-evk: enable I2C2 node
      arm64: dts: imx8mn-evk: update vdd_soc dvs voltage
      arm64: dts: imx8mn-evk: set off-on-delay-us in regulator
      arm64: dts: imx8mn-evk: add i2c gpio recovery settings
      arm64: dts: imx8mn-evk: enable uart1

Pierre Gondois (1):
      arm64: dts: Update cache properties for freescale

Sascha Hauer (1):
      arm64: dts: freescale: Add InnoComm i.MX8MM based WB15 SoM and EVK

Shawn Guo (1):
      Merge remote-tracking branch 'robh/dt/dtbo-rename' into imx/dt64

Shenwei Wang (5):
      arm64: dts: freescale: imx8dxl: add scu_gpio node
      arm64: dts: freescale: imx8dxl-evk: enable mii_select node
      arm64: dts: imx8dxl-ss-lsio: add gpio-ranges property
      arm64: dts: imx8qm-ss-lsio: add gpio-ranges property
      arm64: dts: imx8qxp-ss-lsio: add gpio-ranges property

Tim Harvey (2):
      arm64: dts: imx8m*-venice: add I2C GPIO bus recovery support
      arm64: dts: imx8m{m,n}-venice-gw7902: add gpio pins for new board revision

 arch/arm64/boot/dts/freescale/Makefile             |   2 +
 ...028a-qds-13bb.dts => fsl-ls1028a-qds-13bb.dtso} |   0
 ...028a-qds-65bb.dts => fsl-ls1028a-qds-65bb.dtso} |   0
 ...028a-qds-7777.dts => fsl-ls1028a-qds-7777.dtso} |   0
 ...028a-qds-85bb.dts => fsl-ls1028a-qds-85bb.dtso} |   0
 ...028a-qds-899b.dts => fsl-ls1028a-qds-899b.dtso} |   0
 ...028a-qds-9999.dts => fsl-ls1028a-qds-9999.dtso} |   0
 arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi     |   1 +
 arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi     |   1 +
 arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi     |   1 +
 arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi     |   4 +
 arch/arm64/boot/dts/freescale/fsl-ls2088a.dtsi     |   4 +
 arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi     |   8 +
 arch/arm64/boot/dts/freescale/imx8-ss-conn.dtsi    |  39 ++
 arch/arm64/boot/dts/freescale/imx8-ss-dma.dtsi     | 164 +++++++
 arch/arm64/boot/dts/freescale/imx8-ss-lsio.dtsi    |  17 +-
 arch/arm64/boot/dts/freescale/imx8dxl-evk.dts      | 107 +++++
 arch/arm64/boot/dts/freescale/imx8dxl-ss-adma.dtsi |  20 +
 arch/arm64/boot/dts/freescale/imx8dxl-ss-conn.dtsi |  10 +
 arch/arm64/boot/dts/freescale/imx8dxl-ss-lsio.dtsi |  46 ++
 arch/arm64/boot/dts/freescale/imx8dxl.dtsi         |   7 +
 .../boot/dts/freescale/imx8mm-beacon-som.dtsi      |   6 +-
 .../dts/freescale/imx8mm-data-modul-edm-sbc.dts    |  24 +-
 arch/arm64/boot/dts/freescale/imx8mm-evk.dts       |   6 +-
 arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi      |   6 +
 .../dts/freescale/imx8mm-innocomm-wb15-evk.dts     | 146 +++++++
 .../boot/dts/freescale/imx8mm-innocomm-wb15.dtsi   | 480 +++++++++++++++++++++
 .../boot/dts/freescale/imx8mm-kontron-osm-s.dtsi   |   4 +-
 .../boot/dts/freescale/imx8mm-kontron-sl.dtsi      |   4 +-
 arch/arm64/boot/dts/freescale/imx8mm-phg.dts       | 266 ++++++++++++
 .../boot/dts/freescale/imx8mm-phycore-som.dtsi     |   6 +-
 arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi  |   6 +-
 .../boot/dts/freescale/imx8mm-venice-gw700x.dtsi   |  30 +-
 ...219.dts => imx8mm-venice-gw72xx-0x-imx219.dtso} |   0
 ....dts => imx8mm-venice-gw72xx-0x-rs232-rts.dtso} |   0
 ...s422.dts => imx8mm-venice-gw72xx-0x-rs422.dtso} |   0
 ...s485.dts => imx8mm-venice-gw72xx-0x-rs485.dtso} |   0
 ...219.dts => imx8mm-venice-gw73xx-0x-imx219.dtso} |   0
 ....dts => imx8mm-venice-gw73xx-0x-rs232-rts.dtso} |   0
 ...s422.dts => imx8mm-venice-gw73xx-0x-rs422.dtso} |   0
 ...s485.dts => imx8mm-venice-gw73xx-0x-rs485.dtso} |   0
 .../boot/dts/freescale/imx8mm-venice-gw7901.dts    |  54 ++-
 .../boot/dts/freescale/imx8mm-venice-gw7902.dts    |  66 ++-
 .../boot/dts/freescale/imx8mm-venice-gw7903.dts    |  42 +-
 .../boot/dts/freescale/imx8mm-venice-gw7904.dts    |  54 ++-
 arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi   |  16 +-
 arch/arm64/boot/dts/freescale/imx8mm.dtsi          |   6 +-
 .../boot/dts/freescale/imx8mn-beacon-som.dtsi      |   6 +-
 arch/arm64/boot/dts/freescale/imx8mn-ddr4-evk.dts  |   6 +-
 arch/arm64/boot/dts/freescale/imx8mn-evk.dts       |   3 +-
 arch/arm64/boot/dts/freescale/imx8mn-evk.dtsi      |  47 +-
 .../boot/dts/freescale/imx8mn-venice-gw7902.dts    |  62 ++-
 arch/arm64/boot/dts/freescale/imx8mn.dtsi          |   7 +-
 .../arm64/boot/dts/freescale/imx8mp-dhcom-som.dtsi |  31 +-
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts       | 111 +++++
 .../dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts    | 159 ++++++-
 .../boot/dts/freescale/imx8mp-venice-gw74xx.dts    |  48 ++-
 .../boot/dts/freescale/imx8mp-verdin-dahlia.dtsi   |   1 +
 arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi   |  49 ++-
 arch/arm64/boot/dts/freescale/imx8mp.dtsi          |  34 +-
 arch/arm64/boot/dts/freescale/imx8mq-evk.dts       |   9 +-
 .../boot/dts/freescale/imx8mq-librem5-devkit.dts   |  22 +-
 arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi  |   6 +-
 arch/arm64/boot/dts/freescale/imx8mq-tqma8mq.dtsi  |   2 +
 arch/arm64/boot/dts/freescale/imx8mq.dtsi          |  16 +-
 arch/arm64/boot/dts/freescale/imx8qm-ss-lsio.dtsi  |  38 ++
 arch/arm64/boot/dts/freescale/imx8qm.dtsi          |   2 +
 .../dts/freescale/imx8qxp-colibri-eval-v3.dtsi     |   2 +-
 arch/arm64/boot/dts/freescale/imx8qxp-ss-lsio.dtsi |  25 ++
 arch/arm64/boot/dts/freescale/imx8qxp.dtsi         |   1 +
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi         |   1 +
 arch/arm64/boot/dts/freescale/imx93.dtsi           | 111 +++++
 arch/arm64/boot/dts/freescale/mba8mx.dtsi          |   1 +
 arch/arm64/boot/dts/freescale/s32g2.dtsi           |   2 +
 arch/arm64/boot/dts/freescale/s32v234.dtsi         |   2 +
 75 files changed, 2309 insertions(+), 148 deletions(-)
 rename arch/arm64/boot/dts/freescale/{fsl-ls1028a-qds-13bb.dts => fsl-ls1028a-qds-13bb.dtso} (100%)
 rename arch/arm64/boot/dts/freescale/{fsl-ls1028a-qds-65bb.dts => fsl-ls1028a-qds-65bb.dtso} (100%)
 rename arch/arm64/boot/dts/freescale/{fsl-ls1028a-qds-7777.dts => fsl-ls1028a-qds-7777.dtso} (100%)
 rename arch/arm64/boot/dts/freescale/{fsl-ls1028a-qds-85bb.dts => fsl-ls1028a-qds-85bb.dtso} (100%)
 rename arch/arm64/boot/dts/freescale/{fsl-ls1028a-qds-899b.dts => fsl-ls1028a-qds-899b.dtso} (100%)
 rename arch/arm64/boot/dts/freescale/{fsl-ls1028a-qds-9999.dts => fsl-ls1028a-qds-9999.dtso} (100%)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-innocomm-wb15-evk.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-innocomm-wb15.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-phg.dts
 rename arch/arm64/boot/dts/freescale/{imx8mm-venice-gw72xx-0x-imx219.dts => imx8mm-venice-gw72xx-0x-imx219.dtso} (100%)
 rename arch/arm64/boot/dts/freescale/{imx8mm-venice-gw72xx-0x-rs232-rts.dts => imx8mm-venice-gw72xx-0x-rs232-rts.dtso} (100%)
 rename arch/arm64/boot/dts/freescale/{imx8mm-venice-gw72xx-0x-rs422.dts => imx8mm-venice-gw72xx-0x-rs422.dtso} (100%)
 rename arch/arm64/boot/dts/freescale/{imx8mm-venice-gw72xx-0x-rs485.dts => imx8mm-venice-gw72xx-0x-rs485.dtso} (100%)
 rename arch/arm64/boot/dts/freescale/{imx8mm-venice-gw73xx-0x-imx219.dts => imx8mm-venice-gw73xx-0x-imx219.dtso} (100%)
 rename arch/arm64/boot/dts/freescale/{imx8mm-venice-gw73xx-0x-rs232-rts.dts => imx8mm-venice-gw73xx-0x-rs232-rts.dtso} (100%)
 rename arch/arm64/boot/dts/freescale/{imx8mm-venice-gw73xx-0x-rs422.dts => imx8mm-venice-gw73xx-0x-rs422.dtso} (100%)
 rename arch/arm64/boot/dts/freescale/{imx8mm-venice-gw73xx-0x-rs485.dts => imx8mm-venice-gw73xx-0x-rs485.dtso} (100%)
