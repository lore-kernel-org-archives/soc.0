Received: from fhigh-a3-smtp.messagingengine.com (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CED331A724C
	for <soc@lists.linux.dev>; Tue, 18 Aug 2026 21:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787087829; cv=none; b=KXjm6dQCEF4DEbysATh7SpPjBg3ZROIJSWOI3xwwwx5nbPzaY19AjeCsUlFD6T0z5CW/9azHr04LYk10UsuJmGx3OgfhdcZOKh0Y/Yv/WGAbESmIFk/MKD/dUN86zjcYne4kq1HDtOBsloJLsRBeSbIywIZkrIDrkHjV577FZg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787087829; c=relaxed/simple;
	bh=qDF6BkwGBq4ZYOGhuw0C/LT7mOpAh3qxGW4nfTncwYk=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:Subject:Content-Type; b=ghTE1o66FZAVKHXjya1jZ8wma3y8FdJhD+AN42RVckD0OYEh3hgSPgZ+xAX+SXMoIJ2Q0jAsopE9upkVPcL7TFz+NLRU+VgJRDJGsUGQQzRGORxgwiHfJr/pwXpnF5de3uLr8D5AbiaqBbixRkDbBEuJ24rarfjPLV5qVagDfWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=csGHi71L; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=cVa/7d5D; arc=none smtp.client-ip=103.168.172.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="csGHi71L";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="cVa/7d5D"
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 62FBE1400143;
	Tue, 18 Aug 2026 17:17:01 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Tue, 18 Aug 2026 17:17:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm2; t=1787087820; x=1787174220; bh=Tu
	RSGJc5ujDUl5LEENL9VkPehi5zlPX5QQsNV72ViYI=; b=csGHi71LrFt1Cc0T+V
	Y8WQMyGc3J1auKbZYMhaKsfvA9jzzSZ1NKYsL0lvM/dobuKJsJo6rD/aosPeBo6H
	elr/dQuZoiIFP6HwD3dyCEB800wVx8iBPf1Lm5ShNyEoO2amZCDxuM5qOmSTj/NK
	Mnt6zI8Lhy90xBeb6Eo23Pzn8bYfqxHF1pOtJOSzt1VNWH3CR/hkdF5wAXMqsDlh
	x5Cq0+w2wXy1jV9E4W1fFke7t1J7E/yj/x+ddsNIWVcOddsPqcN2tnjV0qpey/AY
	uyKwrPmmw++3x31Z8GltKm5npScvOqvqqjvVvT9wr45df6MEEzAf2A7qWw1UQIZB
	qQuw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1787087820; x=1787174220; bh=TuRSGJc5ujDUl5LEENL9VkPehi5z
	lPX5QQsNV72ViYI=; b=cVa/7d5D3FcEOyGMf04Y2IIrO57EkHmUmIaoVatMWack
	OXE8DDETVDUaYfNb/mfd2dj7maNIP/8nOBRyMUAz6kF0Bjf4YB1qNk2s2bw03Qx4
	7ky3XtQLRyG17Ei+brzGG8Ct9NKwf/d8ND2rwg8TwEVrDzTmZEtdDI99TuXLU+lm
	89SSbS/fbdhfQJrRntCfzj6qHTvZsa4oL3Z+Cbw1jyUVXPr8jENRema6AwFxtrmt
	bgYGKO2J8g4K37siAyzPXtuI+amV9rY5jDVFZIJllzFpGyECwG1dDo2fbU6BUCLT
	MQvKRVAq+lQNRVcnGddOEuvPP7+kfKfg5t7Xp73MNg==
X-ME-Sender: <xms:ysuEavz2iASC7-SITXGvsVpX1D05QU3wDT9izE5Q3L5JcJSkEJrOtQ>
    <xme:ysuEaiFlFhDOwwZFOVLkJIESvXDRNaWQVPj6IWQnmN4H4Ks5_aNMyREs2GPOp1Kft
    -5lhqceqpWJb3edD4N52Y7GE01-GGHV3xLliIQGIBTiS9RMjpALvw>
X-ME-Proxy-Cause: dmFkZTGMarMvN+9knQboVmH/AKkaG+iSn0TdnK4yel5Znk5/lzhfHZ5CWHO+lbPLVeo0bE
    BIGVMzPZjMvphB689gVfoAz4FqE/06czHa18+w7zrf1pM8gaHoFi7j8KiFQ+MQM9GMTsdr
    OQklQKBmE2Aal0c7hdkigkSXlif0NopXFh1J614eLqtLQFlfyezZGFm6/tWX4Xay37WJeW
    G4cnFfSl7xSGj5ZgEJJxt4DmE2+MPOM2vcI+Wv7HJx8QrmRsJAkn6M4z+Dd8lJwWTv95XJ
    1GBab850GPL2cL0JQFeLVUss1k5f3ghytwEFap65gp0Kyyw2mkudb8RtCgMItpE4HUmkkb
    pvRoexQQdGI0iscqQs/WepRrIQ/IbZQbfCRYVHslb8A8fjdemzZuem+c+mMcSf+upLM4DM
    UMMl4nyD47DEZ1s6S/Re3OyUrsLjUpWnPptYB421gU25KlJnKzf3aYeckrYrW9J3dRISPC
    dql6J7AXdMlMFhjg0HCWDzRB5Pi2AApOfmxYphUpxIaVEu3fgq7oWLhz2FFiipMJDX2Rzh
    LQdC13CPVnbThK3hWwhsAddBHW1BMKyUdIzPU1et4TLRrNJcxmbbaGp1OQjRptp5VNZYTV
    W6WSuPVtzg23iKqX5ELd9H+CWyjOqlfcLKaHD5IMQj39gWiHnadUheL5RH0Q
X-ME-Proxy: <xmx:y8uEapc_5HqV8w645yRNaJ68W9H3XJ2HwHbn_eLDMNXW6lTv0vVuMw>
    <xmx:y8uEauGjsRCfgZGIzX6E-n3NJ4qRJGAMeWbnOizYHRXOD8ja1CJXAw>
    <xmx:y8uEaq1_XYmbuZro6lGeTWaiYYs5utQlaWIVK7XNanlKUuc0XLn-eg>
    <xmx:y8uEaun0obwgf-4CcBNh4HzRX_bOj0hCW11RlDPNPPrFHujVMteaGQ>
    <xmx:zMuEarUgFxqzViaeYlCYTNBtCOuz8kexb7QX5wsHFNHoUtZTagnauIGe>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 894C332A0074; Tue, 18 Aug 2026 17:16:58 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: AkXPavMUVLK3
Date: Tue, 18 Aug 2026 23:16:37 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
Cc: soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Message-Id: <65b2fd96-9f44-407a-84f6-b42db271c3de@app.fastmail.com>
Subject: [GIT PULL 1/4] soc: devicetree updates for 7.3
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The following changes since commit f5098b6bae761e346ebcd9da7f95622c04733=
cff:

  Linux 7.2-rc5 (2026-07-26 14:45:48 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-d=
t-7.3

for you to fetch changes up to dfda289ad743d037f33f9e3796e3fd40ca23374c:

  Merge tag 'mvebu-dt64-7.3-1' of git://git.kernel.org/pub/scm/linux/ker=
nel/git/gclement/mvebu into soc/dt (2026-08-17 15:08:09 +0200)

----------------------------------------------------------------
soc: devicetree updates for 7.3

There are two new mystery SoCs with very little public information
about them so far, Qualcomm's Cortex-A78C based "Shikra" and
Altera's Cortex-A720 based Agilex72 SOCFPGA.

We have also gained support for a couple of SoCs from the
2023/2024 timeframe that have been in the making for a while:

 - The Apple platform gains support for M3 Pro, Max and Ultra SoC,
   following the basic M3 support from 7.2.

 - Samsung Exynos 1580 is a high-end mobile phone SoC from 2024

 - Canaan K230 is a RISC-V based 64-bit AI SoC, based on the
   earlier K210 chip

 - Sophgo SG2000 is a mixed Arm/RISC-V chip that was already
   supported using the Arm core but is now also added for RISC-V
   along with several other variants of the cv18xx series

In terms of newly added machines we have reference platforms
for all the chips above, plus

 - only four 32-bit Arm boards: two older phones and two
   older industrial/embedded boards; using Allwinner, Qualcomm and
   Rockchip SoCs

 - Three laptops und three phones using Qualcomm SoCs

 - Ten 64-bit Rockchips based single-board computers, along with one
 NAS box and a game console.

 - Seven industrial/embedded boards and modules using NXP i.MX8/9 SoCs.

 - A Lenovo desktop box based on NVIDIA Jetson Xavier NX

 - A few more single-board computers based on Allwinnner A133,
   Spacemit K1 and TI AM62.

As usual, there is a constant stream of minor cleanups and fixes
towards addressing the 'dt-check-style --mode strict' warnings,
and everyone is expected to address those warnings for new
submissions now.

----------------------------------------------------------------
Abel Vesa (10):
      dt-bindings: arm: qcom: Document Eliza CQS SoM and its EVK board
      arm64: dts: qcom: eliza: Add Eliza CQS SoM platform
      arm64: dts: qcom: eliza: Add Eliza CQS EVK board
      arm64: dts: qcom: eliza: Add PMIC nodes for CQS SoM and MTP
      arm64: dts: qcom: eliza: Add CPU and LLCC BWMONs
      arm64: dts: qcom: eliza: Enable first QUPv3 wrapper by default
      arm64: dts: qcom: eliza-mtp: Enable touchscreen
      arm64: dts: qcom: glymur: Add CX power domain to GCC
      arm64: dts: qcom: eliza-evk: Add support for USB and SD card
      arm64: dts: qcom: eliza: Describe the ADSP GPR node

Ajit Singh (3):
      dt-bindings: vendor-prefixes: Add prefix for Vicharak
      dt-bindings: arm: qcom: Add Vicharak Axon Mini
      arm64: dts: qcom: qcs6490: Add Vicharak Axon Mini

Akhil P Oommen (1):
      arm64: dts: qcom: Add GPU support for Glymur

Akhil R (1):
      arm64: tegra: Enable GPCDMA in Tegra264 and add iommu-map

Alexander Feilke (3):
      arm64: dts: imx91-tqma9131: move ele-reserved memory into 512MB ra=
nge
      arm64: dts: ti: k3-am642-tqma64xxl: add ospi0 vcc-supply
      arm64: dts: ti: k3-am642-tqma64xxl-mbax4xxl: add icssg1 ti,pa-stats

Alexander Koskovich (1):
      arm64: dts: qcom: milos-nothing-asteroids: Drop simplefb

Alexander Stein (4):
      arm64: dts: freescale: Add dual-channel LVDS overlay for TQMa8MPxS
      arm64: dts: imx93-tqma9352-mba93xxla: Add LVDS overlay
      arm64: dts: imx93-tqma9352-mba93xxca: Add LVDS overlay
      arm64: dts: imx8mp: add missing #sound-dai-cells to xcvr

Alexander Sverdlin (5):
      dt-bindings: vendor-prefixes: Add Shenzhen Baijie Technology Co., =
Ltd.
      dt-bindings: arm: sunxi: Add Baijie HelperBoard A133 compatible
      dt-bindings: input: sun4i-lradc-keys: Add A100/A133 compatible
      arm64: dts: allwinner: a100: Add LRADC node
      arm64: dts: allwinner: A133: add support for Baijie Helper A133 bo=
ard

Alexandre Belloni (15):
      Merge tag 'hisi-arm64-dt-for-7.3' of https://github.com/hisilicon/=
linux-hisi into soc/dt
      Merge tag 'imx-dt64-7.3' of https://git.kernel.org/pub/scm/linux/k=
ernel/git/frank.li/linux into soc/dt
      Merge tag 'qcom-arm64-for-7.3' of https://git.kernel.org/pub/scm/l=
inux/kernel/git/qcom/linux into soc/dt
      Merge tag 'amlogic-arm64-dt-for-v7.3' of https://git.kernel.org/pu=
b/scm/linux/kernel/git/amlogic/linux into soc/dt
      Merge tag 'v7.3-rockchip-dts64-1' of https://git.kernel.org/pub/sc=
m/linux/kernel/git/mmind/linux-rockchip into soc/dt
      Merge tag 'spacemit-dt-for-7.3-1' of https://git.kernel.org/pub/sc=
m/linux/kernel/git/spacemit/linux into soc/dt
      Merge tag 'omap-for-v7.3/dt-signed' of git://git.kernel.org/pub/sc=
m/linux/kernel/git/khilman/linux-omap into soc/dt
      Merge tag 'sunxi-dt-for-7.3' of https://git.kernel.org/pub/scm/lin=
ux/kernel/git/sunxi/linux into soc/dt
      Merge tag 'nuvoton-arm-7.3-devicetree-0' of https://git.kernel.org=
/pub/scm/linux/kernel/git/bmc/linux into soc/dt
      Merge tag 'nuvoton-arm64-7.3-devicetree-0' of https://git.kernel.o=
rg/pub/scm/linux/kernel/git/bmc/linux into soc/dt
      Merge tag 'aspeed-arm-7.3-devicetree-0' of https://git.kernel.org/=
pub/scm/linux/kernel/git/bmc/linux into soc/dt
      Merge tag 'tegra-for-7.3-dt-bindings' of git://git.kernel.org/pub/=
scm/linux/kernel/git/tegra/linux into soc/dt
      Merge tag 'tegra-for-7.3-arm64-dt' of git://git.kernel.org/pub/scm=
/linux/kernel/git/tegra/linux into soc/dt
      Merge tag 'mvebu-dt-7.3-1' of git://git.kernel.org/pub/scm/linux/k=
ernel/git/gclement/mvebu into soc/dt
      Merge tag 'mvebu-dt64-7.3-1' of git://git.kernel.org/pub/scm/linux=
/kernel/git/gclement/mvebu into soc/dt

Alexandre Messier (4):
      ARM: dts: qcom: msm8974pro-htc-m8: add status LEDs
      ARM: dts: qcom: msm8974pro-htc-m8: add NFC support
      ARM: dts: qcom: msm8974pro-htc-m8: add Bluetooth pins
      ARM: dts: qcom: msm8974pro-htc-m8: add touchscreen

Alim Akhtar (3):
      dt-binding: ARM: samsung: Add Samsung Exynos8855
      arm64: dts: exynos: add initial support for Samsung Exynos8855 smdk
      MAINTAINERS: Add entry for Samsung Exynos8855 SoC

Ananthu C V (3):
      dt-bindings: sram: document glymur as compatible
      arm64: dts: qcom: glymur: add IMEM and PIL regions
      arm64: dts: qcom: glymur: fix SoCCP memory mappings

Andre Przywara (2):
      ARM: dts: allwinner: a10: Fix PMU interrupt
      arm64: dts: allwinner: a523: enable IR on the Avaota A1

Andreas Kemnade (1):
      ARM: dts: ti/omap: embt2ws: use mulit-led for RGB LED

AngeloGioacchino Del Regno (8):
      arm64: dts: mediatek: tungsten-smarc: Remove unnecessary cells
      arm64: dts: mediatek: mt6795: Remove deprecated UART DMA property
      arm64: dts: mediatek: mt8183: Add and use UART AP_DMA controller
      arm64: dts: mediatek: mt8186: Add and use UART AP_DMA controller
      arm64: dts: mediatek: mt8188: Add and use UART AP_DMA controller
      arm64: dts: mediatek: mt8192: Add and use UART AP_DMA controller
      arm64: dts: mediatek: mt8195: Add and use UART AP_DMA controller
      dt-bindings: soc: mediatek: mutex: Improve title and description

Anshul Dalal (1):
      arm64: dts: ti: k3-am62l: Add bootph to usb0

Antony Kurniawan Soemardi (1):
      ARM: dts: qcom: pm8921: add labels for ADC channels

Aradhya Bhatia (2):
      arm64: dts: ti: Add Microtips OLDI SK-LCD1 Overlay for AM625-SK
      arm64: dts: ti: Add LincolnTech OLDI LCD-185 Overlay for AM625-Bea=
glePlay

Arnd Bergmann (26):
      Merge tag 'riscv-dt-for-v7.3-early-k230' of https://git.kernel.org=
/pub/scm/linux/kernel/git/conor/linux into soc/dt
      Merge tag 'renesas-dts-for-v7.3-tag1' of https://git.kernel.org/pu=
b/scm/linux/kernel/git/geert/renesas-devel into soc/dt
      Merge tag 'realtek-dt-v7.3' of https://git.kernel.org/pub/scm/linu=
x/kernel/git/yu_chun/linux into soc/dt
      Merge tag 'samsung-dt64-7.3' of https://git.kernel.org/pub/scm/lin=
ux/kernel/git/krzk/linux into soc/dt
      Merge tag 'thead-dt-for-v7.3' of https://git.kernel.org/pub/scm/li=
nux/kernel/git/fustini/linux into soc/dt
      Merge tag 'v7.3-rockchip-dts32-1' of https://git.kernel.org/pub/sc=
m/linux/kernel/git/mmind/linux-rockchip into soc/dt
      Merge tag 'socfpga_dts_updates_for_v7.3' of https://git.kernel.org=
/pub/scm/linux/kernel/git/dinguyen/linux into soc/dt
      Merge tag 'cix-dt-v7.3-rc1' of https://github.com/cixtech/linux-ma=
inline into soc/dt
      Merge tag 'imx-dt-7.3' of https://git.kernel.org/pub/scm/linux/ker=
nel/git/frank.li/linux into soc/dt
      Merge tag 'mtk-dts32-for-v7.3' of https://git.kernel.org/pub/scm/l=
inux/kernel/git/mediatek/linux into soc/dt
      Merge tag 'mtk-dts64-for-v7.3' of https://git.kernel.org/pub/scm/l=
inux/kernel/git/mediatek/linux into soc/dt
      Revert "riscv: dts: spacemit: k3: add i2s0-i2s5 nodes"
      Merge tag 'riscv-sophgo-dt-for-v7.3' of https://github.com/sophgo/=
linux into soc/dt
      Merge tag 'arm-sophgo-dt-for-v7.3' of https://github.com/sophgo/li=
nux into soc/dt
      Merge tag 'v7.3-rockchip-dts32-2' of https://git.kernel.org/pub/sc=
m/linux/kernel/git/mmind/linux-rockchip into soc/dt
      Merge tag 'v7.3-rockchip-dts64-2' of https://git.kernel.org/pub/sc=
m/linux/kernel/git/mmind/linux-rockchip into soc/dt
      Merge tag 'samsung-dt64-7.3-2' of https://git.kernel.org/pub/scm/l=
inux/kernel/git/krzk/linux into soc/dt
      Merge tag 'samsung-dt-7.3' of https://git.kernel.org/pub/scm/linux=
/kernel/git/krzk/linux into soc/dt
      Merge tag 'dt64-cleanup-7.3' of https://git.kernel.org/pub/scm/lin=
ux/kernel/git/krzk/linux-dt into soc/dt
      Merge tag 'dt-cleanup-7.3' of https://git.kernel.org/pub/scm/linux=
/kernel/git/krzk/linux-dt into soc/dt
      Merge tag 'zynqmp-dt-for-7.3' of https://github.com/Xilinx/linux-x=
lnx into soc/dt
      Merge tag 'ti-k3-dts-for-v7.3' of https://git.kernel.org/pub/scm/l=
inux/kernel/git/ti/linux into soc/dt
      Merge tag 'qcom-arm64-for-7.3-2' of https://git.kernel.org/pub/scm=
/linux/kernel/git/qcom/linux into soc/dt
      Merge tag 'qcom-arm32-for-7.3' of https://git.kernel.org/pub/scm/l=
inux/kernel/git/qcom/linux into soc/dt
      Merge tag 'apple-soc-dt-7.3' of https://git.kernel.org/pub/scm/lin=
ux/kernel/git/sven/linux into soc/dt
      Merge tag 'microchip-dt64-7.3' of https://git.kernel.org/pub/scm/l=
inux/kernel/git/at91/linux into soc/dt

Ashish Mhetre (2):
      dt-bindings: iommu: Fix interrupt type in example
      arm64: tegra: Fix CMDQV interrupt type on Tegra264

Aurelien Jarno (12):
      riscv: dts: spacemit: set console baud rate on K3 Pico-ITX board
      riscv: dts: spacemit: enable the i2c2 adapter on K3 Pico-ITX board
      riscv: dts: spacemit: add 24c02 eeprom on K3 Pico-ITX board
      riscv: dts: spacemit: add i2c aliases on K3 Pico-ITX board
      riscv: dts: spacemit: improve RTL8211F PHY configuration on K3 Pic=
o-ITX board
      riscv: dts: spacemit: k1-bananapi-f3: fix maximum CPU core voltage
      riscv: dts: spacemit: k1-milkv-jupiter: fix maximum CPU core volta=
ge
      riscv: dts: spacemit: k1-orangepi-rv2: fix maximum CPU core voltage
      riscv: dts: spacemit: k1-musepi-pro: fix maximum CPU core voltage
      riscv: dts: spacemit: k1-orangepi-r2s: fix maximum CPU core voltage
      riscv: dts: spacemit: k1-bananapi-cm6: fix maximum CPU core voltage
      riscv: dts: spacemit: Add cpu scaling for Milk-V Jupiter

Ayyagari Ushasreevalli (3):
      arm64: dts: qcom: lemans-pmics: Add ADC support for PMM8654au
      arm64: dts: qcom: monaco-pmics: Add ADC support for PMM8620AU
      arm64: dts: qcom: hamoa-pmics: Add ADC support

Bibek Kumar Patro (2):
      arm64: dts: qcom: shikra: Add CDSP, LPAICP, MPSS remoteproc PAS no=
des
      arm64: dts: qcom: shikra: Enable CDSP, LPAICP and MPSS on EVK boar=
ds

Biju Das (5):
      arm64: dts: renesas: r9a08g046l48-smarc: Enable rsci{1,2,3} nodes
      arm64: dts: renesas: r9a08g046: Add RSPI{0..2} nodes
      arm64: dts: renesas: r9a08g046l48-smarc: Enable RSPI2
      arm64: dts: renesas: r9a09g047e57-smarc: Drop SW_SER0_PMOD conditi=
on for rsci4
      arm64: dts: renesas: r9a09g047: Add max-frequency to SDHI nodes

Biswapriyo Nath (6):
      arm64: dts: qcom: sm6125: Use 64 bit addressing
      arm64: dts: qcom: sm6125-xiaomi-ginkgo: Enable vibrator
      arm64: dts: qcom: sm6125: Enable USB-C port handling
      arm64: dts: qcom: sm6125-xiaomi-ginkgo: Add PMI632 Type-C property
      arm64: dts: qcom: sm6125-xiaomi-ginkgo: Add IR transmitter
      arm64: dts: qcom: sm6125-xiaomi-ginkgo: Add vbus-supply in Type-C =
connector

Biwen Li (1):
      arm64: dts: imx8ulp-evk: Update rpmsg resource table address

Bjorn Andersson (3):
      Merge branch '20260617-evacc_glymur-v2-2-905108dacaaa@oss.qualcomm=
.com' into arm64-for-7.3
      Merge branch '20260608-shikra-gcc-rpmcc-clks-v5-2-94cefe092ee3@oss=
.qualcomm.com' into HEAD
      Merge branch '20260624-glymur_camcc-v5-1-a321df74b1a1@oss.qualcomm=
.com' into HEAD

Brian Mayer (1):
      arm64: dts: rockchip: add HYM8563 RTC to Radxa CM5 IO board

Brian Norris (1):
      arm64: dts: qcom: Add #{address,size}-cells to Chromium-based /fir=
mware

Bryan O'Donoghue (1):
      arm64: dts: qcom: x1e80100: Add CAMCC block definition

Chancel Liu (3):
      arm64: dts: imx91-9x9-qsb: Add audio-related board muxes
      arm64: dts: imx91-9x9-qsb: Add WM8524 sound card support
      arm64: dts: imx91-9x9-qsb: Add PDM microphone sound card support

Chen-Yu Tsai (3):
      arm64: dts: mediatek: mt8183-kukui: Add supply for SPI NOR flash
      arm64: dts: mediatek: mt8188-geralt: Add supply for SPI NOR flash
      arm64: dts: mediatek: mt8192-asurada: Disable mmc1 on Spherion

Chen-Yu Yeh (3):
      dt-bindings: soc: sophgo: add Milk-V Duo 256M board
      riscv: dts: sophgo: cv180x: Add PWR_GPIO controller
      riscv: dts: sophgo: Add Milk-V Duo 256M board support

Chintan Vankar (1):
      arm64: dts: ti: k3-am62a7-sk: Add bootph-all property in cpsw_mac_=
syscon node

Chris Morgan (3):
      dt-bindings: arm: rockchip: Add Anbernic RG Vita-Pro
      arm64: dts: rockchip: Add Anbernic RG Vita-Pro
      arm64: dts: rockchip: Add icm42607p IMU for RG-DS

Christopher Obbard (1):
      arm64: dts: qcom: msm8996: add blsp2_spi5 node

Chukun Pan (3):
      dt-bindings: arm: rockchip: Add HINLINK H28K
      arm64: dts: rockchip: Add HINLINK H28K
      riscv: dts: spacemit: enable PCIe on OrangePi R2S

Coia Prant (6):
      arm64: dts: rockchip: Replace deprecated 'gpio' property with 'gpi=
os' for 9Tripod X3568 v4
      arm64: dts: rockchip: Add AP6275S support for 9Tripod X3568 v4
      arm64: dts: rockchip: Fix incorrect interrupt for the 9Tripod X356=
8 v4
      dt-bindings: vendor-prefixes: Add graperain
      dt-bindings: arm: rockchip: Add Graperain G3568 series
      arm64: dts: rockchip: Add devicetree for the Graperain G3568 v2

Conor Dooley (1):
      Merge branch 'k230-basic' into riscv-dt-for-next

Cristian Cozzolino (4):
      arm64: dts: qcom: msm8953-flipkart-rimob: Enable display and GPU
      arm64: dts: qcom: msm8953-flipkart-rimob: Enable WiFi/Bluetooth
      arm64: dts: qcom: msm8953-flipkart-rimob: Enable touchscreen
      arm64: dts: qcom: msm8953-flipkart-rimob: Enable Hall sensor

Damon Ding (3):
      arm64: dts: rockchip: Add missing hclk for RK3588 eDP0
      arm64: dts: rockchip: Add missing hclk for RK3588 eDP1
      arm64: dts: rockchip: Add eDP node for RK3576

Dan Carpenter (1):
      arm64: dts: s32g: Add GPR syscon region

Daniele Briguglio (4):
      dt-bindings: vendor-prefixes: Add youyeetoo
      dt-bindings: arm: rockchip: Add Youyeetoo YY3588
      arm64: dts: rockchip: Add Youyeetoo YY3588
      arm64: dts: rockchip: fix HDMI-RX signal detect GPIO on yy3588

David Heidelberg (4):
      dt-bindings: arm: qcom,ids: Add SoC ID for Snapdragon SDM 850
      arm64: dts: qcom: sdm845-oneplus: Update compatible to include mod=
el
      arm64: dts: qcom: qcm6490-shift-otter: Convert fb to use memory-re=
gion
      arm64: dts: qcom: qcm6490-fairphone-fp5: Convert fb to use memory-=
region

David Lechner (TI) (1):
      arm64: dts: ti: k3-am67a-beagley-ai: Add gpio line names

David Wales (2):
      dt-bindings: arm: qcom: Add Motorola Moto G2 (2014)
      ARM: dts: qcom: msm8226: Support Motorola Moto G2 (2014)

Dawid Wro=CC=81bel (1):
      arm64: dts: qcom: sm8250-xiaomi-elish: correct the board ID

Dennis Gilmore (4):
      dt-bindings: arm: rockchip: Add Orange Pi 5 Pro
      arm64: dts: rockchip: rename PLDO regulator labels to match schema=
tic on rk3588s-orangepi-5
      arm64: dts: rockchip: refactor items from Orange Pi 5/b to prep fo=
r Pro
      arm64: dts: rockchip: Add Orange Pi 5 Pro board support

Devi Priya (1):
      arm64: dts: qcom: ipq6018: add pwm node

Dinh Nguyen (2):
      dt-bindings: net: altr,socfpga-stmmac: add more interrupts for Agi=
lex5
      arm64: dts: socfpga: agilex5: update channel interrupts for gmac1 =
and gmac2

Dipa Mantre (1):
      arm64: dts: qcom: kaanapali: Enable cpufreq cooling devices

Dmitry Baryshkov (13):
      arm64: dts: qcom: sdm845: consolidate IPA properties
      arm64: dts: qcom: sm6350: consolidate IPA properties
      arm64: dts: qcom: sm8350: consolidate IPA properties
      arm64: dts: qcom: sm8650: consolidate IPA properties
      arm64: dts: qcom: kodiak: consolidate IPA properties
      ARM: dts: qcom: sdx55: consolidate IPA properties
      arm64: dts: qcom: sc8280xp: sort reserved memory regions
      arm64: dts: qcom: sm8350: add Iris device
      arm64: dts: qcom: sm8350-hdk: enable Iris core
      arm64: dts: qcom: sm6115: add venus device
      arm64: dts: qcom: qrb4210-rb2: enable venus device
      arm64: dts: qcom: sm8250: sort out Iris power domains
      arm64: dts: qcom: sm8250: correct frequencies in the Iris OPP table

Dominik Haller (1):
      arm64: dts: ti: k3-am68-phyboard-izar: Add pwm fan

Ekansh Gupta (2):
      arm64: dts: qcom: hamoa: add audio PD remote heap region
      arm64: dts: qcom: talos: Add memory-region for audio PD

Emil Renner Berthing (2):
      riscv: dts: thead: Add IO labels for the IO expansion on I2C1
      riscv: dts: thead: Add remaining Lichee Pi 4A IO expansions

Erikas Bitovtas (2):
      ARM: dts: qcom: msm8926-sony-xperia-yukon-eagle: add initial devic=
e tree
      dt-bindings: arm: qcom: Add Sony Xperia M2

Ernest Van Hoecke (7):
      arm64: dts: freescale: imx8mm-verdin: Add NAU8822 Bridge Tied Load
      arm64: dts: freescale: imx8mm-verdin: Add DSI to HDMI adapter over=
lay
      arm64: dts: freescale: imx8mm-verdin: Add Toradex DSI to LVDS adap=
ter with 10.1" display
      arm64: dts: freescale: imx8mm-verdin: Add Toradex Capacitive Touch=
 Display 10.1" DSI
      arm64: dts: freescale: imx8mm-verdin: Add Toradex Capacitive Touch=
 Display 7" DSI
      arm64: dts: freescale: imx8mm-verdin: Add Cortex-M4F remoteproc
      arm64: dts: freescale: imx8mm-verdin: Add Cortex-M4F UART_4 overlay

Esben Haabendal (1):
      arm64: dts: imx8mq: Add DCSS node

Esteban Urrutia (3):
      arm64: dts: qcom: sm8450: Add missing PCM_OUT port
      arm64: dts: qcom: sm8450: Remove unneeded reserved memory nodes
      arm64: dts: qcom: sm8450: Add mode-switch property to qmpphy

Fabio Estevam (10):
      arm64: dts: rockchip: Fix rk3588s-roc-pc audio description
      arm64: dts: rockchip: Enable USB device mode on rk3588s-roc-pc
      arm64: dts: rockchip: Fix Gru WLAN sideband interrupt
      arm64: dts: rockchip: Fix the rk3566-radxa-cm3 Wifi compatible
      arm64: dts: rockchip: Fix rk3566-bigtreetech-cb2 touchscreen prope=
rty
      arm64: dts: rockchip: Drop data-mapping from Engicam PX30 Core
      arm64: dts: rockchip: Add CSI-2 bus type to ROCK 5B+ camera overla=
ys
      arm64: dts: rockchip: Fix rk3399-roc-pc-plus analog audio
      arm64: dts: rockchip: Enable wireless on rk3399-roc-pc-plus
      arm64: dts: rockchip: Keep rk3399-roc-pc-plus work LED on

Fenglin Wu (1):
      arm64: dts: qcom: Add gpio device node for pm8010

Francesco Dolcini (2):
      arm64: dts: freescale: imx95-toradex-smarc: add alias for lpuart5
      arm64: dts: ti: k3-am62-verdin: Add RPi Touch Display 2 7-inch

Frank Li (23):
      arm64: dts: imx8mp-evk: add board-level mux for CAN2 and MICFIL
      arm64: dts: imx8mp-evk: add flexcan2 overlay file
      dt-bindings: input: fsl,scu-key: Add compatible string fsl,imx8qm-=
sc-key
      arm64: dts: imx8qm: add scu power key support
      dt-bindings: fsl,fpga-qixis: Add fsl,ls1021aqds-fpga compatible st=
ring
      ARM: dts: ls1021a-qds: add compatible string "fsl,ls1021aqds-fpga"=
 for on boards FPGA chip
      dt-bindings: soc: imx: Add fsl,eim-bus
      ARM: dts: imx53-ard: change node name eim-cs1 to eim-cs1-bus
      ARM: dts: ls1021a-moxa-uc-8410a: add led suffix to fix CHECK_DTBS =
warnings
      ARM: dts: ls1021a-twr: add power-supply for lcd panel
      ARM: dts: ls1021a-moxa-uc-8410a: use compatible string ethernet-ph=
y-ieee802.3-c22
      ARM: dts: ls1021a-moxa-uc-8410a: replace spansion,s25fl164k with j=
edec,spi-nor
      ARM: dts: ls1021a-moxa-uc-8410a: remove undocument property defaul=
t-state of gpio-keys
      ARM: dts: imx6dl-plym2m: change #io-channel-cells to 1 of voltage =
divider
      ARM: dts: imx53-smd: remove undocument property clock-names of ovt=
i,ov5642
      ARM: dts: imx6ul-isiot: remove undocument property clock-names of =
fsl,sgtl5000
      ARM: dts: imx6ull-engicam-microgea: remove nand-ecc-strength and n=
and-ecc-step-size
      arm64: dts: imx8qm-ss-dma: add lpuart4 node
      arm64: dts: imx8qm-ss-audio: add spdif1 node
      arm64: dts: imx8qm-ss-lsio: add lsio mu8 and mu8b
      arm64: dts: imx8-ss-audio: Fix LPCG clock indices for ASRC0
      dt-bindings: display: imx: Add deprecated property display and dis=
play0
      ARM: dts: ls1021a-iot: rename display@0 to display0

Frieder Schrempf (1):
      arm64: dts: imx93-kontron: set memory node to 0x80000000/1GiB

Gaurav Kohli (1):
      arm64: dts: qcom: shikra: Enable TSENS and thermal zones

Geert Uytterhoeven (2):
      arm64: dts: intel: keembay: Always use decimal interrupts
      arm64: tegra: Drop CPU masks from GICv3 PPI interrupts

George Moussalem (5):
      arm64: dts: qcom: ipq5018: add pwm node
      arm64: dts: qcom: ipq5332: add pwm node
      arm64: dts: qcom: ipq9574: add pwm node
      arm64: dts: qcom: ipq5018: Correct CMN PLL reference clock rate
      arm64: qcom: ipq5018: Add GEPHY RX and TX clocks

Gopikrishna Garmidi (4):
      arm64: dts: qcom: glymur: Fix unit-address mismatch for spmi_bus2
      arm64: dts: qcom: glymur-crd: Move common board nodes to shared DT=
SI
      arm64: dts: qcom: glymur: Fix gcc clock specifier for usb_mp_qmpph=
y nodes
      arm64: dts: qcom: glymur-crd: merge duplicate &pmh0101_gpios node =
extensions

Guodong Xu (1):
      riscv: dts: spacemit: Use symbolic PDMA request numbers on K1

Haibo Chen (1):
      arm64: dts: imx91-9x9-qsb: add CAN support overlay file

Han Xu (1):
      arm64: dts: imx94-xspi: add the DMA channels

Hans de Goede (3):
      arm64: dts: qcom: hamoa: Fix xbl_tmp_buffer_mem size
      arm64: dts: qcom: hamoa: Remove mem-reservations which are already=
 covered by EFI
      arm64: dts: monaco: Fix CSI I2C controllers default bus frequency

Haritha S K (2):
      arm64: dts: qcom: talos: Add passive polling-delay for gpu-thermal=
 zone
      arm64: dts: qcom: eliza: Enable cpufreq cooling devices

Harrison Vanderbyl (1):
      arm64: dts: qcom: purwa: Add Microsoft Surface Pro 12in

Harshal Dev (1):
      arm64: dts: qcom: glymur: add TRNG node

Hongyang Zhao (1):
      arm64: dts: qcom: kodiak: Move PCIe GPIOs and PHYs to root ports

Hrushiraj Gandhi (6):
      dt-bindings: arm: rockchip: add Vicharak Axon board
      arm64: dts: rockchip: add Vicharak Axon board
      dt-bindings: arm: rockchip: Add Vicharak Vaaman2
      arm64: dts: rockchip: Add Vicharak Vaaman2 board
      dt-bindings: arm: rockchip: Add Vicharak Vaaman board
      arm64: dts: rockchip: Add Vicharak Vaaman board

Icenowy Zheng (2):
      riscv: dts: thead: th1520: remove pclk for I2C1
      riscv: dts: thead: lpi4a: sort nodes

Imran Shaik (5):
      dt-bindings: clock: qcom,rpmcc: Add Qualcomm Shikra SoC RPMCC
      dt-bindings: clock: qcom: Add Qualcomm Shikra SoC Global Clock Con=
troller
      arm64: dts: qcom: talos: Fix cpu6 1094.4MHz OPP frequency typo
      arm64: dts: qcom: agatti: Add missing CX power domain to DISPCC
      arm64: dts: qcom: shikra: Add support for DISPCC/GPUCC nodes

Inochi Amaoto (8):
      riscv: dts: spacemit: Add enough deassert time for the PHY on PICO=
 ITX
      riscv: dts: spacemit: Add enough deassert time for the PHY on com2=
60 board
      riscv: dts: spacemit: Fix phy id check for the phy on pico-itx boa=
rd
      riscv: dts: spacemit: Fix phy id check for the phy on com260 board
      riscv: dts: spacemit: k3: add USB controller and USB phy support
      riscv: dts: spacemit: Make dtschema recognize the etherent PHY cor=
rectly on K3 pico-itx board
      riscv: dts: spacemit: Make dtschema recognize the etherent PHY cor=
rectly on K3 com260 board
      riscv: dts: sophgo: cv180x: Allow the DMA multiplexer to set chann=
el number for DMA controller

Ioana Ciornei (8):
      arm64: dts: lx2160a: explicitly enable serdes_1 node
      arm64: dts: lx2160a: extract the PCIe nodes into a separate dtsi
      arm64: dts: lx2160a: extract the SerDes nodes into a separate dtsi
      arm64: dts: lx2160a: extract the PCIe from LX2160A Rev2 into a sep=
arate file
      arm64: dts: lx2160a: split the dtsi to avoid delete-property
      arm64: dts: lx2160a: transition to device-specific SerDes compatib=
le strings
      arm64: dts: lx2162a: transition to device-specific SerDes compatib=
le strings
      arm64: dts: ls1088a: describe the Lynx 10G SerDes blocks

Jacky Bai (1):
      arm64: dts: imx93: update the tmu compatible string

Jagadeesh Kona (2):
      dt-bindings: clock: qcom: Add Glymur camera clock controller
      arm64: dts: qcom: glymur: Add camera clock controller support

Jai Luthra (4):
      arm64: dts: ti: k3-am67a-beagley-ai: Setup I2C for CSI/DSI connect=
ors
      arm64: dts: ti: k3-am67a-beagley-ai: Add DSI0/CSI1 mux
      arm64: dts: ti: k3-am67a-beagley-ai: Add overlay for IMX219 on CSI0
      arm64: dts: ti: k3-am67a-beagley-ai: Add overlay for IMX219 on CSI1

Jakob Unterwurzacher (1):
      arm64: dts: rockchip: fix emmc reset polarity on px30-cobra

James Calligeros (12):
      arm64: dts: apple: t8112: Add SMC hwmon node
      arm64: dts: apple: t8103: Add SMC hwmon node
      arm64: dts: apple: t600x: Add SMC hwmon node
      arm64: dts: apple: t602x: Add SMC hwmon node
      arm64: dts: apple: Add common SMC hwmon infrastructure
      arm64: dts: apple: t8103: Add common SMC hwmon sensors
      arm64: dts: apple: t8112: Add common SMC hwmon sensors
      arm64: dts: apple: t600x: Add common SMC hwmon sensors
      arm64: dts: apple: t602x: Add common SMC hwmon sensors
      arm64: dts: apple: t8103: jxxx: Add device-specific SMC hwmon sens=
ors
      arm64: dts: apple: t8112: jxxx: Add device-specific SMC hwmon sens=
ors
      arm64: dts: apple: t60xx: jxxx: Add device-specific SMC hwmon sens=
ors

Janne Grunau (9):
      dt-bindings: arm: apple: Add M3 Pro/Max/Ultra devices (T603x)
      dt-bindings: interrupt-controller: apple,aic2: Invert #interrupt-c=
ells condition
      dt-bindings: interrupt-controller: apple,aic2: Add apple,t6031-aic=
3 compatible
      dt-bindings: arm: apple: apple,pmgr: Add t6030 and t6031 compatibl=
es
      dt-bindings: power: apple,pmgr-pwrstate: Add t6030 and t6031 compa=
tibles
      dt-bindings: i2c: apple,i2c: Add t6030 and t6031 compatibles
      dt-bindings: pwm: apple,s5l-fpwm: Add t6030 and t6031 compatibles
      arm64: dts: apple: Initial T603[124] (M3 Max and Ultra) device tre=
es
      arm64: dts: apple: Initial T6030 (M3 Pro) device trees

Jennifer Berringer (2):
      riscv: dts: spacemit: k3-com260: add eeprom on i2c2
      riscv: dts: spacemit: k3-com260-ifx: add eeprom on i2c1

Jens Glathe (1):
      arm64: dts: qcom: sc8280xp-blackrock: switch to uefi rtc offset

Jian Hu (2):
      arm64: dts: meson: a1: Add clk measure support
      arm64: dts: amlogic: t7: Add clk measure support

Jianping Li (1):
      arm64: dts: qcom: kodiak: avoid EFI overlap for ADSP remote heap

Jiaxing Hu (2):
      dt-bindings: arm: rockchip: Add ArmSoM CM5 and CM5-IO
      arm64: dts: rockchip: Add ArmSoM CM5 and CM5-IO

Jiayu Du (1):
      riscv: dts: canaan: Correct the formatting issues about k230 dts

Jie Gan (13):
      arm64: dts: qcom: lemans: Add label properties to CoreSight devices
      arm64: dts: qcom: talos: Add label properties to CoreSight devices
      arm64: dts: qcom: monaco: Add label properties to CoreSight devices
      arm64: dts: qcom: kodiak: Add label properties to CoreSight devices
      arm64: dts: qcom: kaanapali: Add label properties to CoreSight dev=
ices
      arm64: dts: qcom: sm8750: Add label properties to CoreSight devices
      arm64: dts: qcom: hamoa: Add label properties to CoreSight devices
      arm64: dts: qcom: monaco: fix wrong connection for the replicator
      arm64: dts: qcom: glymur: Add label properties to CoreSight devices
      dt-binding: document QCOM platforms for CTCU device
      arm64: dts: qcom: hamoa: enable ETR and CTCU devices
      arm64: dts: qcom: sm8750: enable ETR and CTCU devices
      arm64: dts: qcom: glymur: enable ETR and CTCU devices

Jie Zhang (1):
      arm64: dts: qcom: talos-evk-som: Enable Adreno 612 GPU

Jingyi Wang (4):
      dt-bindings: cache: qcom,llcc: Document Maili SoC
      arm64: dts: qcom: kaanapali: Add SoCCP for Kaanapali SoC
      arm64: dts: qcom: kaanapali-qrd: Add SoCCP node
      arm64: dts: qcom: kaanapali-mtp: Add SoCCP node

Jiqi Li (2):
      dt-bindings: arm: tegra: Add lenovo,thinkedge-se70 compatible stri=
ng
      arm64: tegra: Add Lenovo ThinkEdge SE70 device tree

Jishnu Prakash (1):
      arm64: dts: qcom: Add header file for ADC5 Gen3 channel macros

Joe Sandom (5):
      arm64: dts: qcom: sm8550: add PCIe MHI register regions
      arm64: dts: qcom: sm8550: add PCIe port labels
      arm64: dts: qcom: sm8550: move IPA properties to SoC device tree
      dt-bindings: arm: qcom: document QCS8550 RB5Gen2 board
      arm64: dts: qcom: qcs8550: add QCS8550 RB5Gen2 board support

John Madieu (6):
      arm64: dts: renesas: rzv2h: Add audio clock inputs
      arm64: dts: renesas: rzg3e-smarc-som: Add I2C1 support
      arm64: dts: renesas: r9a09g047: Add RZ/G3E Sound support
      arm64: dts: renesas: rzg3e-smarc-som: Add Versa3 clock generator
      arm64: dts: renesas: rzg3e-smarc-som: Add audio pinmux definitions
      arm64: dts: renesas: r9a09g047e57-smarc: Add DA7212 audio codec su=
pport

Joshua Milas (3):
      riscv64: dts: sophgo: add SG2000 dtsi
      riscv64: dts: sophgo: add initial Milk-V Duo S board support
      arm64: dts: sophgo: add initial Milk-V Duo S board support

Judith Mendez (2):
      dt-bindings: arm: ti: Add am62l3-beaglebadge
      arm64: dts: ti: Add k3-am62l3-beaglebadge

Jun Guo (1):
      arm64: dts: cix: add sky1 DMA-350 node with channel IRQ entries

Jun Yan (4):
      arm64: dts: amlogic: meson-axg: Disable nfc node by default
      arm64: dts: amlogic: meson-axg: Add missing nand_rb0 pin to nand_a=
ll_pins
      arm64: dts: amlogic: meson-axg: Disable pcie_phy node by default
      arm64: dts: amlogic: meson-axg-s400: enable mipi_pcie_analog_dphy =
for PCIe

Junhui Liu (5):
      riscv: dts: canaan: k230: Add "b" ISA extension
      riscv: dts: canaan: add reset controller for K230
      dt-bindings: riscv: spacemit: Add Banana Pi BPI-CM6 compatible
      riscv: dts: spacemit: k1: Split gmac_clk_ref into independent pinc=
trl groups
      riscv: dts: spacemit: k1: Add Banana Pi BPI-CM6 IO board

Justin Suess (3):
      media: dt-bindings: allwinner,sun4i-a10-ir: add A523 compatible
      arm64: dts: allwinner: a523: add IR receiver nodes
      arm64: dts: allwinner: a523: enable IR receiver on the X96Q Pro+

J=C3=A9r=C3=B4me de Bretagne (10):
      arm64: dts: qcom: sc8280xp-arcata: Enable backlight
      arm64: dts: qcom: sc8280xp-arcata: Enable the eDP display
      arm64: dts: qcom: sc8280xp-arcata: add USB-C orientation GPIOs
      arm64: dts: qcom: sc8280xp-arcata: Fix top USB-C DP alt mode
      arm64: dts: qcom: sc8280xp-arcata: Enable 4-lane DP support
      arm64: dts: qcom: sc8280xp-arcata: Add volume up/down GPIO keys
      arm64: dts: qcom: sc8280xp-arcata: Add lid switch
      arm64: dts: qcom: sc8280xp-arcata: model the PMU of the on-board w=
cn6855
      arm64: dts: qcom: sc8280xp-arcata: Switch to uefi rtc offset
      arm64: dts: qcom: sc8280xp-arcata: Drop duplicate DMIC supplies

Kathiravan Thirumoorthy (9):
      dt-bindings: arm: qcom: sort compatibles alphabetically by base SoC
      arm64: dts: qcom: ipq5332: Move PHYs and PERST# to Root Port node
      arm64: dts: qcom: ipq5424: Move PHYs and PERST# to Root Port node
      arm64: dts: qcom: ipq9574: Add missing PCIe global IRQs
      arm64: dts: qcom: ipq8074: move PCIe phys and PERST# to port node
      arm64: dts: qcom: ipq6018: move PCIe phys to port node
      arm64: dts: qcom: ipq5018: move PCIe phys and PERST# to port node
      arm64: dts: qcom: ipq9574: Add PCIe bridge node
      arm64: dts: qcom: ipq9574: enable the PCIe support on RDP454

Khristine Andreea Barbulescu (1):
      arm64: dts: s32g: describe GPIO and EIRQ resources in SIUL2 pinctr=
l node

Komal Bajaj (9):
      dt-bindings: arm: qcom: Document Shikra and its EVK boards
      arm64: dts: qcom: Introduce Shikra SoC base dtsi
      arm64: dts: qcom: Add Shikra CQ2390M SoM platform
      arm64: dts: qcom: Add Shikra IQ2390S SoM platform
      arm64: dts: qcom: Add Shikra EVK boards
      arm64: dts: qcom: shikra: Add cpufreq-hw, EPSS L3 interconnect and=
 OPP tables
      arm64: dts: qcom: shikra: add WiFi node support
      arm64: dts: qcom: shikra: Enable WiFi/BT on SoMs
      arm64: dts: qcom: shikra: Add gpio-reserved-ranges to tlmm

Konrad Dybcio (24):
      arm64: dts: qcom: hamoa: Add interconnects to primary USB3 control=
ler
      arm64: dts: qcom: hamoa: Fix clocks for HSPHYs
      arm64: dts: qcom: sc8280xp: Add Iris core
      arm64: dts: qcom: sc8280xp-x13s: Enable Iris
      arm64: dts: qcom: sc8180x-primus: Rename regulator nodes
      arm64: dts: qcom: sc8180x-primus: Describe the display power net
      arm64: dts: qcom: sc8180x-lenovo-flex-5g: Rename regulator nodes
      arm64: dts: qcom: sc8180x-lenovo-flex-5g: Describe the display pow=
er net
      arm64: dts: qcom: monaco-arduino-monza: Remove duplicate includes
      arm64: dts: qcom: msm8996-xiaomi-gemini: Fix up ti,drv2604 enable =
GPIO
      arm64: dts: qcom: smb2370: Disable SMB2370_2 by default
      arm64: dts: qcom: glymur: Add PCIe port compatibles and ports
      arm64: dts: qcom: msm8998: Don't pull-up I2C pins by default in sl=
eep
      arm64: dts: qcom: msm8976-longcheer-l9360: Fix accidental node ove=
rride
      arm64: dts: qcom: sdm632-motorola-ocean: Fix LED default trigger p=
roperty
      arm64: dts: qcom: qcs8300-ride: Fix BT RFA supply name
      arm64: dts: qcom: talos-evk-som: Fix BT RFA supply name
      arm64: dts: qcom: Rename pci@ nodes to pcie@
      arm64: dts: qcom: sc8280xp-crd: Add pmic-glink orientation GPIOs
      arm64: dts: qcom: sc8280xp-crd: Fix the pin index for misc_3p3_reg=
_en
      dt-bindings: arm: qcom: Add Asus Zenbook A16 (UX3607OA)
      arm64: dts: qcom: eliza-cqs-som: Add eUSB2 repeater supplies
      arm64: dts: qcom: glymur: Fix PDC IRQ mapping
      arm64: dts: qcom: glymur: Add Asus Zenbook A16 (UX3607OA)

Konstantin Shabanov (3):
      dt-bindings: vendor-prefixes: Add HONOR
      dt-bindings: arm: qcom: Add HONOR MagicBook Art 14
      arm64: dts: qcom: Add HONOR MagicBook Art 14 device tree

Krishna Kurapati (7):
      arm64: dts: qcom: sm8750: Add wakeup-source property to usb contro=
ller
      arm64: dts: qcom: kaanapali: Add missing properties to usb control=
ler
      arm64: dts: qcom: kaanapali-mtp: Add PMIC Glink node
      arm64: dts: qcom: kaanapali-qrd: Add PMIC Glink node
      arm64: dts: qcom: qcs404: Fix DTBS Check errors in usb controller =
nodes
      arm64: dts: qcom: glymur: Fix properties of usb_hs node
      arm64: dts: qcom: glymur: Configure USB controllers are wakeup-cap=
able

Krzysztof Kozlowski (62):
      ARM: dts: ti: Add specific compatibles for SCM conf nodes
      arm64: dts: qcom: sm6115-pro1x: Correct touchscreen GPIO flags
      arm64: dts: qcom: talos: Fix GMU unit address
      ARM: dts: intel: arria10: Correct indentation
      ARM: dts: nxp: ls: Correct indentation
      ARM: dts: allwinner: sun8i-h3: Correct indentation
      ARM: dts: ti: omap: Correct indentation
      arm64: dts: qcom: sm8650: Correct and complete DP address spaces
      arm64: dts: qcom: sm8750: Correct and complete DP address spaces
      arm64: dts: qcom: sm8750: Correct DPU VBIF address space size
      arm64: dts: hisilicon: hi3798cv200: Drop unused clock-names and re=
set-names
      arm64: dts: hisilicon: Correct indentation
      arm64: dts: mediatek: Correct indentation and whitespace
      ARM: dts: mediatek: mt8127: Correct indentation
      arm64: dts: xilinx: zynqmp-sck: Correct indentation
      ARM: dts: st: spear: Correct indentation
      ARM: dts: st: ste: Correct indentation
      ARM: dts: st: spear13xx: Drop unused/incorrect usbh0_id and usbh1_=
id
      arm64: dts: imx8: Correct indentation and whitespace
      arm64: dts: s32g3: Correct indentation
      ARM: dts: marvell: armada: Correct indentation
      ARM: dts: marvell: kirkwood: Correct indentation
      ARM: dts: marvell: orion5x: Correct indentation
      arm64: dts: qcom: Use hyphen in node names
      arm64: dts: qcom: Use tab for indentation
      arm64: dts: qcom: Use lowercase hex for unit addresses and values
      arm64: dts: qcom: Correct whitespace around '=3D'
      arm64: dts: qcom: glymur: Drop fake PCIe phy 3B
      arm64: dts: amlogic: Correct indentation and whitespace
      ARM: dts: aspeed: Correct indentation
      arm64: dts: rockchip: Correct indentation
      ARM: dts: sigmastar: Correct indentation
      ARM: dts: arm: Correct indentation
      ARM: dts: microchip: at91: Correct indentation
      ARM: dts: vt8500: Correct indentation
      ARM: dts: nvidia: tegra114-asus-tf701t: Correct trailing whitespace
      arm64: dts: amd: seattle: Remove useless clocks DTSI include
      arm64: dts: amd: seattle: Remove useless xgbe DTSI include
      dt-bindings: arm: qcom-soc: Include Eliza, Kaanapali and others in=
 SoC names
      dt-bindings: arm: qcom-soc: Document more of existing legacy style=
 compatibles
      dt-bindings: arm: qcom-soc: Validate nodes with fallbacks
      dt-bindings: arm: qcom-soc: Allow WSA88xx speaker compatible
      arm64: tegra: Correct Tegra194 p2972 interrupt flags
      arm64: tegra: Correct Tegra234 p3737 interrupt flags
      arm64: tegra: Correct Tegra234 p3740 interrupt flags
      arm64: dts: exynos: Move 'status' to the end to match coding style
      arm64: dts: exynos: Align continued properties and add missing bla=
nk lines
      arm64: dts: exynos5433: Override thermal zones by phandle
      arm64: dts: exynos: Re-order clocks and align continued properties
      arm64: dts: google: Move 'status' to the end to match coding style
      arm64: dts: google: Align continued properties and add missing bla=
nk lines
      arm64: dts: fsd: Move 'status' to the end to match coding style
      arm64: dts: fsd: Align continued properties and add missing blank =
lines
      ARM: dts: rockchip: Correct white-space style
      arm64: dts: rockchip: Correct white-space style
      ARM: dts: allwinner: Correct white-space style
      arm64: dts: allwinner: Correct white-space style
      arm64: dts: exynos: Correct white-space style
      ARM: dts: Correct white-space style
      arm64: dts: Correct white-space style
      arm64: dts: ti: Correct white-space style
      Documentation/process: maintainer-soc: Mention expectation about d=
t-check-style

Kuldeep Singh (3):
      arm64: dts: qcom: sm8750: wire UFS to ice instance
      arm64: dts: qcom: kaanapali: Add TRNG node
      arm64: dts: qcom: kaanapali: Add qcrypto node support

Lad Prabhakar (8):
      arm64: dts: renesas: rzt2h-n2h-evk: Remove unused MII/GMII pins
      arm64: dts: renesas: rzt2h-n2h-evk: Configure ETH pins
      arm64: dts: renesas: rzt2h-n2h-evk: Configure SCI0 pins
      arm64: dts: renesas: rzt2h-n2h-evk-common: Add memory nodes
      arm64: dts: renesas: r9a09g057: Add PCIe nodes
      arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Enable PCIe
      arm64: dts: renesas: r9a09g056: Fix PCIe dma-ranges memory space c=
ode
      arm64: dts: renesas: r9a09g047: Fix PCIe dma-ranges memory space c=
ode

Lech Perczak (1):
      ARM: dts: imx7d-pico: describe Bluetooth controller

Leonardo Costa (3):
      arm64: dts: ti: k3-am62-verdin: Add Toradex Capacitive Touch Displ=
ay 10.1" LVDS V2
      arm64: dts: ti: k3-am62-verdin: Add Toradex DSI to LVDS adapter wi=
th the 10.1" V2 display
      arm64: dts: ti: k3-am62-verdin: Add Mezzanine with Toradex Display=
 10.1" LVDS

Linus Walleij (1):
      ARM: dts: ixp4xx: Drop the reg-offset hack

Liu Changjie (2):
      dt-bindings: arm: rockchip: Add LCKFB Taishan Pi 3M
      arm64: dts: rockchip: Add LCKFB Taishan Pi 3M

Liu Ying (3):
      dt-bindings: soc: imx: fsl,imx93-media-blk-ctrl: Allow LVDS Displa=
y Bridge child node
      arm64: dts: imx93: Add LVDS Display Bridge support
      arm64: dts: imx93-11x11-evk: Add DY1212W-4856 LVDS panel

Loic Poulain (3):
      arm64: dts: qcom: monaco-arduino-monza: add USB-C controller and c=
onnector
      arm64: dts: qcom: monaco-arduino-monza: Add fan controller and the=
rmal cooling
      arm64: dts: qcom: monaco-arduino-monza: add ina232 power sensor

Louis-Alexis Eyraud (4):
      arm64: dts: mediatek: mt8390-genio-common: Add MT6365 PMIC supplies
      arm64: dts: mediatek: mt8395-genio-common: Add MT6365 PMIC supplies
      arm64: dts: mediatek: mt8395-radxa-nio-12l: Add MT6365 PMIC suppli=
es
      arm64: dts: mediatek: mt6359: use proper compatible for rtc

Luca Weiss (11):
      arm64: dts: qcom: milos: Add interconnects to camcc
      arm64: dts: qcom: milos: Add IMEM node
      arm64: dts: qcom: milos: Add display (MDSS)
      arm64: dts: qcom: milos: Add IPA node
      arm64: dts: qcom: milos-fairphone-fp6: Enable IPA
      arm64: dts: qcom: sm6350: Add interconnects for GPU, MPSS & CDSP
      arm64: dts: qcom: sm6350: Add PIL info region
      arm64: dts: qcom: sm7225-fairphone-fp4: Fix address in fb node name
      arm64: dts: qcom: qcm6490-fairphone-fp5: Add AW88261 amplifiers
      arm64: dts: qcom: milos: Add reset for sdhc_2
      arm64: dts: qcom: milos: Add GX clock controller

Lukas Schmid (3):
      dt-bindings: arm: sunxi: Add NetCube Systems OpenNMC (dobermann)
      riscv: dts: allwinner: d1s-t113: Add uart4 pinctrl required by Net=
Cube Systems OpenNMC
      ARM: dts: allwinner: add support for NetCube Systems OpenNMC (dobe=
rmann)

Lukas Timmermann (1):
      ARM: dts: exynos: Add bluetooth support to manta

Luo Jie (2):
      arm64: dts: qcom: ipq5332: Add CMN PLL node for networking hardware
      arm64: dts: qcom: ipq5332: Represent xo_board as fixed-factor clock

Mahadevan P (1):
      arm64: dts: qcom: qcs6490-rb3gen2: Enable 4-lane DisplayPort Alt M=
ode

Manaf Meethalavalappu Pallikunhi (1):
      arm64: dts: qcom: glymur: Add GPU cooling

Manivannan Sadhasivam (49):
      arm64: dts: qcom: kaanapali: Fix the PCIe iommu-map entries
      arm64: dts: qcom: kodiak: Fix the PCIe iommu-map entries
      arm64: dts: qcom: sar2130p: Fix the PCIe iommu-map entries
      arm64: dts: qcom: sc8180x: Fix the PCIe iommu-map entries
      arm64: dts: qcom: sdm845: Fix the PCIe iommu-map entries
      arm64: dts: qcom: sm8150: Fix the PCIe iommu-map entries
      arm64: dts: qcom: sm8250: Fix the PCIe iommu-map entries
      arm64: dts: qcom: sm8350: Fix the PCIe iommu-map entries
      arm64: dts: qcom: sm8450: Fix the PCIe iommu-map entries
      arm64: dts: qcom: sm8550: Fix the PCIe iommu-map entries
      arm64: dts: qcom: sm8650: Fix the PCIe iommu-map entries
      arm64: dts: qcom: sm8750: Fix the PCIe iommu-map entries
      arm64: dts: qcom: talos: Fix the PCIe iommu-map entries
      arm64: dts: qcom: lemans: Fix the PCIe iommu-map entries
      arm64: dts: qcom: monaco: Fix the PCIe iommu-map entries
      arm64: dts: qcom: monaco-monza-som: Fix the PCIe iommu-map entries
      arm64: dts: qcom: monaco-evk-ifp-mezzanine: Fix the PCIe iommu-map=
 entries
      arm64: dts: qcom: lemans-evk-ifp-mezzanine: Fix the PCIe iommu-map=
 entries
      arm64: dts: qcom: qcs6490-radxa-dragon-q6a: Fix the PCIe iommu-map=
 entries
      arm64: dts: qcom: qcs6490-thundercomm-minipc-g1iot: Fix the PCIe i=
ommu-map entries
      arm64: dts: qcom: qcs6490-rb3gen2: Fix the PCIe iommu-map entries
      arm64: dts: qcom: qcs6490-rb3gen2-industrial-mezzanine: Fix the PC=
Ie iommu-map entries
      arm64: dts: qcom: sc8280xp-blackrock: Fix swapped USB QMP PHY vdda=
-phy/vdda-pll supplies
      arm64: dts: qcom: sa8540p: Fix swapped USB QMP PHY vdda-phy/vdda-p=
ll supplies
      arm64: dts: qcom: sdm845: Fix swapped USB QMP PHY vdda-phy/vdda-pl=
l supplies
      arm64: dts: qcom: sdm850: Fix swapped USB QMP PHY vdda-phy/vdda-pl=
l supplies
      arm64: dts: qcom: sm8150: Fix swapped USB QMP PHY vdda-phy/vdda-pl=
l supplies
      arm64: dts: qcom: sm8250: Fix swapped USB QMP PHY vdda-phy/vdda-pl=
l supplies
      arm64: dts: qcom: sm8350: Fix swapped USB QMP PHY vdda-phy/vdda-pl=
l supplies
      arm64: dts: qcom: sm8450: Fix swapped USB QMP PHY vdda-phy/vdda-pl=
l supplies
      arm64: dts: qcom: sm8550: Fix swapped USB QMP PHY vdda-phy/vdda-pl=
l supplies
      arm64: dts: qcom: qcs8550-aim300: Fix swapped USB QMP PHY vdda-phy=
/vdda-pll supplies
      arm64: dts: qcom: qcm6490: Fix swapped USB QMP PHY vdda-phy/vdda-p=
ll supplies
      arm64: dts: qcom: qcs6490: Fix swapped USB QMP PHY vdda-phy/vdda-p=
ll supplies
      arm64: dts: qcom: sm7225-fairphone-fp4: Fix swapped USB QMP PHY vd=
da-phy/vdda-pll supplies
      arm64: dts: qcom: sc7180: Fix swapped USB QMP PHY vdda-phy/vdda-pl=
l supplies
      arm64: dts: qcom: sc7280: Fix swapped USB QMP PHY vdda-phy/vdda-pl=
l supplies
      arm64: dts: qcom: sc8180x: Fix swapped USB QMP PHY vdda-phy/vdda-p=
ll supplies
      arm64: dts: qcom: hamoa: Fix swapped USB QMP PHY vdda-phy/vdda-pll=
 supplies
      arm64: dts: qcom: purwa: Fix swapped USB QMP PHY vdda-phy/vdda-pll=
 supplies
      arm64: dts: qcom: sm8650: Fix swapped USB QMP PHY vdda-phy/vdda-pl=
l supplies
      arm64: dts: qcom: sm8750: Fix swapped USB QMP PHY vdda-phy/vdda-pl=
l supplies
      arm64: dts: qcom: sar2130p: Fix swapped USB QMP PHY vdda-phy/vdda-=
pll supplies
      arm64: dts: qcom: kaanapali: Fix swapped USB QMP PHY vdda-phy/vdda=
-pll supplies
      arm64: dts: qcom: glymur: Fix swapped USB QMP PHY vdda-phy/vdda-pl=
l supplies
      arm64: dts: qcom: lemans: Fix swapped USB QMP PHY vdda-phy/vdda-pl=
l supplies
      arm64: dts: qcom: eliza-mtp: Fix swapped USB QMP PHY vdda-phy/vdda=
-pll supplies
      arm64: dts: qcom: sa8155p-adp: Fix swapped USB and UFS QMP PHY vdd=
a-phy/vdda-pll supplies
      arm64: dts: qcom: talos-evk: Fix swapped USB QMP PHY vdda-phy/vdda=
-pll supplies

Marc Zyngier (1):
      arm64: dts: realtek: Add EL2 virtual timer interrupt

Marek Vasut (5):
      arm64: dts: renesas: r8a78000: Enable application CPU cores via PS=
CI
      arm64: dts: renesas: r8a77965-salvator-x: Enable GPU support
      arm64: dts: renesas: r8a77965-salvator-xs: Enable GPU support
      arm64: dts: renesas: r8a77965-ulcb: Enable GPU support
      arm64: dts: renesas: Add soc: labels to soc nodes

Marius Dinu (1):
      ARM: dts: rockchip: add eeprom node to rk3288-tinker

Mark Tseng (1):
      arm64: dts: mediatek: mt8186: change CCI OPP scaling mapping

Markus Niebel (4):
      arm64: dts: imx91-tqma9131-mba91xxca: USB phy adjustments
      arm64: dts: add tqma9596la-mba95xxca
      dt-bindings: arm: add MBa93xxCA as mainboard for TQMa91xxCA and TQ=
Ma91xxLA SOM
      arm64: dts: add devicetree for TQMa91xx on MBa93xxCA

Martin Schmiedel (1):
      arm64: dts: imx93-tqma9352-mba93xxla-mini: Add LVDS overlay

Maulik Shah (1):
      arm64: dts: qcom: x1e80100: Add deepest idle state

Max Merchel (2):
      ARM: dts: imx6ul-tqma6ul: add nvmem-layout
      ARM: dts: imx6qdl-tqma6: add nvmem-layout

Meghana Malladi (1):
      arm64: dts: ti: k3-am64: Fix MDIO clock reference for ICSSG0 node

Michael Scott (1):
      arm64: dts: qcom: x1-dell-thena: mark l12b and l15b always-on

Michal Simek (8):
      arm64: dts: xilinx: drop bias-high-impedance on SDIO CD/WP pins
      arm: dts: xilinx: drop bias-high-impedance on SDIO CD/WP pins
      dt-bindings: xilinx: Remove EDK/Ethernet references
      dt-bindings: firmware: xilinx: Add missing example for ZynqMP
      dt-bindings: clock: versal-clk: Fix mio_clk index range in clock-n=
ames pattern
      dt-bindings: clock: Move xlnx,zynqmp-clk to its own schema
      dt-bindings: clock: versal-clk: Fix Versal NET clock validation
      arm64: versal-net: Switch Versal NET to firmware clock interface

Mike Hsieh (1):
      ARM: dts: aspeed: sanmiguel: fix PDB HSC shunt resistor

Mikko Perttunen (1):
      arm64: tegra: Add Host1x and VIC on Tegra264

Monish Chunara (1):
      arm64: dts: qcom: qcs615-ride: fix sdhc_2 vqmmc-supply for UHS-I m=
ode

Mukesh Ojha (38):
      arm64: dts: qcom: sdm845: Reduce OS PDC DRV span to 0x10000
      arm64: dts: qcom: sdm670: Reduce OS PDC DRV span to 0x10000
      arm64: dts: qcom: sc7180: Reduce OS PDC DRV span to 0x10000
      arm64: dts: qcom: sc7280: Reduce OS PDC DRV span to 0x10000
      arm64: dts: qcom: sc8180x: Reduce OS PDC DRV span to 0x10000
      arm64: dts: qcom: sm8150: Reduce OS PDC DRV span to 0x10000
      arm64: dts: qcom: sc8280xp: Reduce OS PDC DRV span to 0x10000
      arm64: dts: qcom: sm8250: Reduce OS PDC DRV span to 0x10000
      arm64: dts: qcom: sm8350: Reduce OS PDC DRV span to 0x10000
      arm64: dts: qcom: sm8450: Reduce OS PDC DRV span to 0x10000
      arm64: dts: qcom: sm8550: Reduce OS PDC DRV span to 0x10000
      arm64: dts: qcom: sm8650: Reduce OS PDC DRV span to 0x10000
      arm64: dts: qcom: sm4450: Reduce OS PDC DRV span to 0x10000
      arm64: dts: qcom: x1e80100: Reduce OS PDC DRV span to 0x10000
      arm64: dts: qcom: sm6350: Reduce OS PDC DRV span to 0x10000
      arm64: dts: qcom: sar2130p: Reduce OS PDC DRV span to 0x10000
      arm64: dts: qcom: talos: Reduce OS PDC DRV span to 0x10000
      arm64: dts: qcom: monaco: Reduce OS PDC DRV span to 0x10000
      arm64: dts: qcom: lemans: Reduce OS PDC DRV span to 0x10000
      arm64: dts: qcom: sdx75: Reduce OS PDC DRV span to 0x10000
      arm64: dts: qcom: milos: Reduce OS PDC DRV span to 0x10000
      arm64: dts: qcom: qdu1000: Reduce OS PDC DRV span to 0x10000
      arm64: dts: qcom: eliza: Reduce OS PDC DRV span to 0x10000
      arm64: dts: qcom: kaanapali: Switch SCMI perf protocol to use powe=
r-domain-cells
      dt-bindings: arm: qcom: Document Hawi SoC and its reference boards
      arm64: dts: qcom: kaanapali: Add minidump SRAM config to SCM node
      arm64: dts: qcom: sm8450: Add minidump SRAM config to SCM node
      arm64: dts: qcom: sa8775p: Add minidump SRAM config to SCM node
      arm64: dts: qcom: qcs8300: Add minidump SRAM config to SCM node
      arm64: dts: qcom: qdu1000: Add minidump SRAM config to SCM node
      arm64: dts: qcom: sm8550: Add minidump SRAM config to SCM node
      arm64: dts: qcom: sc7280: Add minidump SRAM config to SCM node
      arm64: dts: qcom: sm8350: Add minidump SRAM config to SCM node
      arm64: dts: qcom: sc7180: Add minidump SRAM config to SCM node
      arm64: dts: qcom: sm6350: Add minidump SRAM config to SCM node
      arm64: dts: qcom: sm6375: Add minidump SRAM config to SCM node
      arm64: dts: qcom: qcs615: Add minidump SRAM config to SCM node
      arm64: dts: qcom: sdm845: Add minidump SRAM config to SCM node

Navya Malempati (2):
      arm64: dts: qcom: monaco: Remove the little/big_cpu_sleep_0 idle s=
tates
      arm64: dts: qcom: lemans: Remove the gold_cpu_sleep idle state

Nazim Amirul (5):
      arm64: dts: socfpga: agilex5: Add per-channel interrupts to gmac0
      arm64: dts: socfpga: agilex5: Enable the SMMU
      arm64: dts: socfpga: agilex5: Add dma-coherent to XGMAC nodes
      dt-bindings: arm: altera: Add Agilex72 SoCFPGA compatible strings
      arm64: dts: socfpga: agilex72: Add initial device tree

Neil Armstrong (8):
      arm64: dts: qcom: sm8650: update the cpus capacity-dmips-mhz
      arm64: dts: qcom: sm8650: add CPU cache size properties
      arm64: dts: qcom: sm8650: fix soundwire ports properties
      arm64: dts: qcom: pmk8550: add VADC node
      arm64: dts: qcom: sm8550-qrd: add SPMI ADC channels and thermal no=
des
      arm64: dts: qcom: sm8550-hdk: add SPMI ADC channels and thermal no=
des
      arm64: dts: qcom: sm8650-qrd: add SPMI ADC channels and thermal no=
des
      arm64: dts: qcom: sm8650-hdk: add SPMI ADC channels and thermal no=
des

Nisarg Rajput (1):
      ARM: dts: allwinner: enable overlay support for sun8i-h2-plus pi b=
oards

Ondrej Jirman (1):
      arm64: dts: allwinner: sun50i-a64-pinephone: Fix mpu6050 mount mat=
rix

Oren Klopfer (1):
      Revert "arm64: dts: rockchip: Further describe the WiFi for the Pi=
nephone Pro"

Paul Gerber (3):
      dt-bindings: arm: fsl: add TQMa8MPxS board
      arm64: dts: freescale: add initial device tree for TQMa8MPQS with =
i.MX8MP
      arm64: dts: freescale: add LVDS overlays for TQMa8MPxS

Peng Fan (9):
      arm64: dts: imx8ulp: Add DMA channel properties and use eDMA flag =
macros
      arm64: dts: imx8ulp: Add I3C2 controller node
      arm64: dts: imx8ulp: Correct SRAM node address and size to cover f=
ull SSRAM P2
      arm64: dts: imx8ulp: Add assigned clock properties for LPUART nodes
      arm64: dts: imx8ulp-evk: Add gpio-keys node for power button
      arm64: dts: imx8ulp-9x9-evk: Rename model string to reflect die si=
ze
      arm64: dts: imx95-19x19-evk: Add CM7 node and related memory nodes
      arm64: dts: imx952-evk: Add CM7 node and related memory nodes
      arm64: dts: imx943-evk: Add CM7 and CM33S nodes

Pengyu Luo (3):
      arm64: dts: qcom: sc8280xp-x13s: Fix the drive-strength of mclk pin
      arm64: dts: qcom: sc8280xp: Add camera MCLK pinctrl
      arm64: dts: qcom: sc8280xp-x13s: Use predefined MCLK pinctrl

Per Larsson (2):
      arm64: dts: allwinner: a523: Add SPDIF output PH pin mux option
      arm64: dts: allwinner: a523: Enable SPDIF on X96QPRO+

Philipp Zabel (1):
      arm64: dts: imx8mp-frdm: Add missing HDMI DDC pinctrl

Potin Lai (2):
      ARM: dts: aspeed: sanmiguel: Fix FIO IOEXP interrupt pin
      ARM: dts: aspeed: sanmiguel: Fix PWRGD_RMC_N active-low hog config=
uration

Pradyot Kumar Nayak (3):
      arm64: dts: glymur-crd: Add reset GPIO to touchscreen node
      arm64: dts: qcom: glymur: add CPU capacity-dmips-mhz
      arm64: dts: qcom: glymur-crd: Add FocalTech ft3d81 touchscreen sup=
port

Prathamesh Shete (1):
      arm64: tegra: Add pinctrl nodes for Tegra264

Pufan Jin (2):
      dt-bindings: arm: rockchip: Add EmbedFire LubanCat 4 board
      arm64: dts: rockchip: Add EmbedFire LubanCat 4 board

Qiang Yu (2):
      arm64: dts: qcom: glymur: Add QREF regulator supplies to TCSR
      arm64: dts: qcom: mahua: Add QREF regulator supplies to TCSR

Quentin Schulz (2):
      arm64: dts: rockchip: fix eMMC reset polarity on PP-1516
      arm64: dts: rockchip: fix eMMC reset polarity on PX30 Ringneck

Rajendra Nayak (1):
      arm64: dts: qcom: glymur: Add GPU smmu node

Rakesh Kota (2):
      arm64: dts: qcom: Fix pm4125 vbus regulator compatible and constra=
ints
      arm64: dts: qcom: Update spmi-pmic-arb interrupt trigger for shikra

Ravi Hothi (2):
      arm64: dts: qcom: eliza: Add LPASS macro and SoundWire support
      arm64: dts: qcom: eliza-cqs-evk: Enable sound card support with WS=
A8845 and DMIC

Ricardo Pardini (1):
      arm64: dts: rockchip: fix regulator names on NanoPC-T6

Richard Acayan (1):
      arm64: dts: qcom: sdm670-google: add lpi reserved gpios

Richard Zhu (6):
      arm64: dts: imx94: Correct PCIe outbound address space configurati=
on
      arm64: dts: imx943: Correct PCIe outbound address space configurat=
ion
      arm64: dts: imx94: add PCIe Root Port node
      arm64: dts: imx943-evk: add PCIe root port node and according prop=
erties
      arm64: dts: imx943-evk: Remove 'supports-clkreq' from PCIe1
      arm64: dts: imx95: Add dma, intr, aer and pme interrupts for PCIe

Robert Marko (1):
      arm64: dts: microchip: lan969x: add QSPI nodes

Roger Quadros (3):
      arm: dts: ti: Add device tree support for PRU-ICSS on AM57xx
      arm: dts: ti: Add device tree support for PRU-ICSS on AM437x
      arm: dts: ti: Add device tree support for PRU-ICSS on AM335x

Roman Vivchar (1):
      ARM: dts: mediatek: mt6323: add AUXADC support

Rosen Penev (3):
      ARM: dts: helios4: add vcc-supply to EEPROM
      ARM: dts: helios4: add vcc-supply to GPIO expander
      ARM: dts: helios4: add SATA regulator supplies

Rudraksha Gupta (1):
      ARM: dts: qcom: msm8960: expressatt: Add coreriver,tc360-touchkey

Samuel Holland (2):
      dt-bindings: arm: rockchip: Add LincStation E1
      arm64: dts: rockchip: Add LincStation E1

Sanghoon Bae (1):
      arm64: dts: exynosautov920: Add hsi0 syscon node for PCIe PHY

Sasha Finkelstein (1):
      arm64: dts: apple: Add pmgr-misc nodes to t60xx

Sayantan Chakraborty (1):
      arm64: dts: qcom: shikra: Add DDR BWMON support

Shawn Guo (1):
      arm64: dts: qcom: Remove sa8775p-ride board

Shengjiu Wang (1):
      arm64: dts: imx8mp-ab2: Enable MU2 for DSP communication

Sherry Sun (10):
      arm64: dts: imx8mq-evk: add uart3 and bluetooth node
      arm64: dts: imx8mm-evk: Add power supply property to Root Port node
      arm64: dts: imx8mp-evk: Add power supply properties to Root Port n=
ode
      arm64: dts: imx8mq-evk: Add power supply properties to Root Port n=
ode
      arm64: dts: imx8dxl/qm/qxp: Add power supply properties to Root Po=
rt node
      arm64: dts: imx95: Move power supply properties to Root Port node
      ARM: dts: imx6qdl-sabresd: Add power supply property to Root Port =
node
      ARM: dts: imx6sx-sdb: Add power supply property to Root Port node
      arm64: dts: imx8ulp-evk: Enable LPUART6 for Bluetooth
      arm64: dts: imx8ulp-evk: Enable LPUART7

Shuwei Wu (2):
      cpufreq: dt-platdev: Add SpacemiT K1 SoC to the allowlist
      riscv: dts: spacemit: Add cpu scaling for K1 SoC

Sibi Sankar (4):
      arm64: dts: qcom: glymur-crd: Add Embedded controller node
      arm64: dts: qcom: x1-crd: Add Embedded controller node
      arm64: dts: qcom: hamoa-iot-evk: Add Embedded controller node
      arm64: dts: qcom: glymur: add SoCCP DT node

Srinivas Kandagatla (3):
      arm64: dts: qcom: Add Display Port audio on Arduino Monza
      arm64: dts: glymur: Add LPASS macro codecs and pinctrl
      arm64: dts: qcom: glymur-crd: add Audio sound card node

Stanislav Zaikin (3):
      dt-bindings: arm: qcom: Add SM7325 Xiaomi 12 Lite 5G (taoyao)
      arm64: dts: qcom: sm7325: Add Xiaomi 12 Lite 5G (taoyao) DTS
      arm64: dts: qcom: taoyao: Drop adsp_rpc_remote_heap_mem override

Stefano Radaelli (52):
      arm64: dts: imx8mp-var-som-symphony: add input keys
      arm64: dts: imx8mp-var-som-symphony: enable USB support
      arm64: dts: imx8mp-var-som-symphony: add TPM support
      arm64: dts: imx8mp-var-som-symphony: add external RTC
      arm64: dts: imx8mp-var-som-symphony: enable header UARTs
      arm64: dts: imx8mm-var-som-symphony: add wakeup sources
      arm64: dts: imx8mm-var-som-symphony: keep RGB_SEL low
      arm64: dts: imx8mp-var-som-symphony: enable PCIe
      arm64: dts: imx8mp-var-som-symphony: add HDMI support
      arm64: dts: imx8mp-var-som-symphony: add capacitive touchscreen
      arm64: dts: imx8mp-var-som-symphony: enable ECSPI2
      arm64: dts: imx8mp-var-som-symphony: keep RGB_SEL low
      arm64: dts: imx8mp-var-som-symphony: enable PWM1
      arm64: dts: imx8mp-var-som-symphony: enable CAN
      arm64: dts: imx8mp-var-som-symphony: add second Ethernet port
      arm64: dts: freescale: imx8mp-var-som: add I2C1 bus recovery GPIOs
      arm64: dts: freescale: imx95-var-dart: enable NETC block control
      arm64: dts: imx95-var-dart: wm8904: Add INL1 as DMICDAT1
      dt-bindings: arm: fsl: add Variscite DART-MX8M PLUS Boards
      arm64: dts: freescale: Add support for Variscite DART-MX8M-PLUS
      arm64: dts: imx8mp-var-dart: Add support for Variscite Sonata board
      arm64: dts: freescale: imx9-var-dart-sonata: fix Ethernet PHY conf=
iguration
      dt-bindings: arm: fsl: add Variscite DART-MX8M-MINI Boards
      arm64: dts: freescale: Add support for Variscite DART-MX8M-MINI
      arm64: dts: imx8mm-var-dart: Add support for Variscite Sonata board
      dt-bindings: arm: ti: Add bindings for Variscite VAR-SOM-AM62
      arm64: dts: ti: Add support for Variscite VAR-SOM-AM62
      arm64: dts: ti: var-som-am62: Add support for Variscite Symphony B=
oard
      arm64: dts: ti: var-som-am62p: fix Ethernet PHY configuration
      arm64: dts: ti: var-som-am62p: update audio codec configuration
      arm64: dts: am62p5-var-som-symphony: add touchscreen support
      arm64: dts: am62p5-var-som-symphony: add TPM support
      arm64: dts: freescale: imx8mn-var-som: Move UART4 description to S=
ymphony
      arm64: dts: freescale: imx8mn-var-som: move uSD support to carrier=
 boards
      arm64: dts: freescale: imx8mn-var-som: Align fsl,pins tables
      arm64: dts: freescale: imx8mn-var-som: Update FEC support with Max=
Linear PHY
      arm64: dts: freescale: imx8mn-var-som: Add support for WM8904 audi=
o codec
      arm64: dts: freescale: imx8mn-var-som: Add MCP251xFD CAN controller
      arm64: dts: freescale: imx8mn-var-som: Rework WiFi/BT and add lega=
cy dts
      arm64: dts: freescale: imx8mn-var-som: drop duplicate USB OTG node
      arm64: dts: freescale: imx8mn-var-som: enable FlexSPI interface
      arm64: dts: imx8mn-var-som-symphony: Add TPM2 support
      arm64: dts: imx8mn-var-som-symphony: Enable I2C4
      arm64: dts: imx8mn-var-som-symphony: add wakeup sources
      arm64: dts: imx8mn-var-som-symphony: keep RGB_SEL low
      arm64: dts: imx8mn-var-som-symphony: enable PWM1
      arm64: dts: imx8mn-var-som-symphony: Disable internal RTC
      dt-bindings: arm: fsl: add Variscite VAR-SOM-MX8 QuadMax Boards
      arm64: dts: freescale: Add support for Variscite VAR-SOM-MX8 QuadM=
ax
      arm64: dts: imx8qm-var-som: Add support for Variscite Symphony boa=
rd
      arm64: dts: imx8qm-var-som-symphony: enable expansion header UART
      arm64: dts: imx95-var-dart-sonata: enable in-band status for SFP

Sumit Gupta (1):
      arm64: tegra: Populate CPU and L2 cache nodes on Tegra264

Suneel Garapati (1):
      arm64: tegra: Add GTE nodes for Tegra264

Sven Peter (1):
      Merge patch series "Initial Apple M3 Pro, Max and Ultra device tre=
es"

Swati Agarwal (2):
      arm64: dts: qcom: lemans-evk: Rename hd3ss3220_ instance for prima=
ry port controller
      arm64: dts: qcom: lemans-evk: Enable secondary USB controller in h=
ost mode

Taniya Das (2):
      dt-bindings: clock: qcom: Add EVA clock and reset controller for G=
lymur SoC
      arm64: dts: qcom: glymur: Add EVA clock controller node

Teguh Sobirin (1):
      arm64: dts: qcom: sm8750: Add UART15

Thierry Reding (3):
      dt-bindings: gpu: host1x: Fix email address
      Merge branch 'for-7.3/dt-bindings' into for-7.3/arm64/dt
      arm64: tegra: Properly sort devices on Tegra264

Thomas Bonnefille (1):
      riscv: dts: thead: Add TH1520 I2C nodes

Thomas Richard (1):
      ARM: dts: ti: var-som-om44: Add USB Ethernet controller node

Tomer Maimon (4):
      arm: dts: nuvoton: npcm7xx: Drop bogus FIU memory reg-names
      arm: dts: nuvoton: npcm7xx: Drop redundant FIU clock-names
      arm64: dts: nuvoton: npcm845: Drop redundant timer clock-names
      arm64: dts: nuvoton: npcm845: Reorder timer0 and PECI nodes

Tom=C3=A1=C5=A1 Macholda (1):
      arm64: dts: turris-mox: fix usb3 phys

Troy Mitchell (1):
      riscv: dts: spacemit: k3: add i2s0-i2s5 nodes

Tze Yee Ng (1):
      arm64: dts: socfpga: use consistent QSPI boot partition label

Val Packett (1):
      arm64: dts: qcom: sm7325: Add Motorola Edge 30 (dubai) DTS

Vic B (1):
      arm64: dts: rockchip: fix label of sys_led for nanopi-r4s

Vidhu Sarwal (1):
      ARM: dts: ti: Fix typos in comments

Vinayak Katoch (2):
      arm64: dts: qcom: glymur: Add memory-region for audio PD
      arm64: dts: qcom: sm8250: Add memory-region for audio PD

Vishnu Santhosh (1):
      arm64: dts: qcom: shikra: Add SMP2P nodes

Vitor Soares (10):
      arm64: dts: ti: k3-am69-aquila: Add Toradex DSI to HDMI Adapter
      arm64: dts: ti: k3-am69-aquila: Add DSI to LVDS adapter with 10.1"=
 display
      arm64: dts: ti: k3-am69-aquila: Add Toradex Capacitive Touch Displ=
ay 10.1" DSI with adapter
      arm64: dts: ti: k3-am69-aquila: Add Toradex Capacitive Touch Displ=
ay 7" DSI with adapter
      arm64: dts: ti: k3-am69-aquila: Add Toradex Capacitive Touch Displ=
ay 10.1" DSI
      arm64: dts: ti: k3-am69-aquila: Add Toradex Capacitive Touch Displ=
ay 7" DSI
      arm64: dts: ti: k3-am69-aquila: Add Toradex OV5640 CSI cameras
      arm64: dts: ti: k3-am62p-verdin: Add NAU8822 Bridge Tied Load
      arm64: dts: ti: k3-am62p-verdin: Add Toradex OV5640 CSI Cameras
      arm64: dts: ti: k3-am62x-verdin: Share UART_4 MCU reservation over=
lay

Vladimir Oltean (3):
      arm64: dts: ls1028a: describe the Lynx 10G SerDes
      arm64: dts: ls1046a: describe the Lynx 10G SerDes blocks
      arm64: dts: ls208xa: describe the Lynx 10G SerDes blocks

Vladimir Zapolskiy (1):
      arm64: dts: qcom: sm8650: Assign CCI clock rates to 37.5MHz

Vsevolod Kozlov (1):
      arm64: dts: rockchip: fan speed control for FriendlyELEC CM3588 NAS

Wangao Wang (2):
      arm64: dts: qcom: purwa: Override Iris clocks and operating points
      arm64: dts: qcom: purwa-iot-som: enable video

Wei Deng (2):
      arm64: dts: qcom: lemans: Add compatible to the PCIe Root Port
      arm64: dts: qcom: lemans-evk: Describe the PCIe M.2 Key E connector

Wei Fang (1):
      arm64: dts: imx8ulp-evk: Change the values of some PCRs of ENET

William Bright (2):
      dt-bindings: vendor-prefixes: Add IMDT
      dt-bindings: arm: qcom: Document IMDT QCS8550 SBC/SoM

Wolfram Sang (3):
      arm64: dts: renesas: r8a779g0: Add MFIS node
      ARM: dts: renesas: r9a06g032: Describe SPI controllers
      ARM: dts: renesas: r9a06g032-rzn1d400-eb: Enable SPI-FRAM

Xianwei Zhao (1):
      arm64: dts: amlogic: add some device nodes for A9

Xilin Wu (2):
      arm64: dts: qcom: sc8280xp: Move PHY, PERST, and Wake GPIOs to PCI=
e port nodes
      arm64: dts: qcom: sc8280xp: Add reg and clocks for QoS configurati=
on

Xin Liu (1):
      arm64: dts: qcom: talos: Add EL2 overlay for talos-evk

Xin Xu (3):
      arm64: dts: qcom: sm8250-xiaomi-elish: Add pm8008 PMIC
      arm64: dts: qcom: sm8250: Add cam_mclk3_default pinctrl
      arm64: dts: qcom: sm8250-xiaomi-elish: Add ov8856 front camera

Xu Yang (4):
      arm64: dts: imx8mp-evk: add typec node
      arm64: dts: imx8mp-evk: add usb3_phy1 tuning properties
      arm64: dts: imx95: switch usb3 controller to flattened model
      arm64: dts: imx8mq-evk: add typec node

Xueyao An (1):
      arm64: dts: qcom: shikra: Add QUPv3 configuration

Xukai Wang (1):
      riscv: dts: canaan: Add clock definition for K230

Yanan He (4):
      dt-bindings: vendor-prefixes: add alientek
      dt-bindings: arm: rockchip: Add Alientek DLRV1126
      ARM: dts: rockchip: Add RV1126 I2C5
      ARM: dts: rockchip: Add Alientek DLRV1126

Yangyu Chen (4):
      dt-bindings: add Canaan K230 boards compatible strings
      dt-bindings: timer: Add Canaan K230 CLINT
      dt-bindings: interrupt-controller: Add Canaan K230 PLIC
      riscv: dts: add initial canmv-k230 and k230-evb dts

Yedaya Katsman (1):
      arm64: dts: qcom: sm6125-xiaomi-laurel-sprout: Fixup panel compati=
ble

Yixun Lan (1):
      riscv: dts: spacemit: k3: Enable SD card support

Yu-Chun Lin (1):
      arm64: dts: realtek: Add GPIO support for RTD1625

Ze Huang (1):
      riscv: dts: canaan: Add k230's pinctrl node

Zhengyu He (2):
      riscv: dts: spacemit: k3: Add QSPI support for Pico-ITX board
      riscv: dts: spacemit: add SPI controllers for K3

bui duc phuc (1):
      ARM: dts: renesas: r8a7740: Add FSI clocks

liyeshan (1):
      riscv: dts: spacemit: add K3 PDMA request numbers

 Documentation/devicetree/bindings/arm/altera.yaml  |    6 +
 Documentation/devicetree/bindings/arm/apple.yaml   |   37 +
 .../devicetree/bindings/arm/apple/apple,pmgr.yaml  |    2 +
 Documentation/devicetree/bindings/arm/fsl.yaml     |   36 +-
 .../bindings/arm/qcom,coresight-ctcu.yaml          |    4 +
 .../devicetree/bindings/arm/qcom-soc.yaml          |   92 +-
 Documentation/devicetree/bindings/arm/qcom.yaml    |  543 +++--
 .../devicetree/bindings/arm/rockchip.yaml          |   67 +
 .../bindings/arm/samsung/samsung-boards.yaml       |    6 +
 Documentation/devicetree/bindings/arm/sunxi.yaml   |    7 +
 Documentation/devicetree/bindings/arm/tegra.yaml   |    5 +
 Documentation/devicetree/bindings/arm/ti/k3.yaml   |    7 +
 .../devicetree/bindings/board/fsl,fpga-qixis.yaml  |    1 +
 .../devicetree/bindings/bus/fsl,spba-bus.yaml      |    4 +-
 .../devicetree/bindings/cache/qcom,llcc.yaml       |   63 +-
 .../bindings/clock/qcom,glymur-evacc.yaml          |   72 +
 .../devicetree/bindings/clock/qcom,rpmcc.yaml      |   65 +-
 .../devicetree/bindings/clock/qcom,shikra-gcc.yaml |   70 +
 .../bindings/clock/qcom,x1e80100-camcc.yaml        |    3 +
 .../devicetree/bindings/clock/xlnx,versal-clk.yaml |   93 +-
 .../devicetree/bindings/clock/xlnx,zynqmp-clk.yaml |   68 +
 .../bindings/display/fsl,ls1021a-dcu.yaml          |   22 +
 .../firmware/xilinx/xlnx,zynqmp-firmware.yaml      |   15 +-
 .../bindings/gpu/host1x/nvidia,tegra210-nvdec.yaml |    2 +-
 .../bindings/gpu/host1x/nvidia,tegra210-nvenc.yaml |    2 +-
 .../bindings/gpu/host1x/nvidia,tegra210-nvjpg.yaml |    2 +-
 .../bindings/gpu/host1x/nvidia,tegra234-nvdec.yaml |    2 +-
 .../devicetree/bindings/i2c/apple,i2c.yaml         |    2 +
 .../input/allwinner,sun4i-a10-lradc-keys.yaml      |    1 +
 .../devicetree/bindings/input/fsl,scu-key.yaml     |    4 +-
 .../bindings/interrupt-controller/apple,aic2.yaml  |   10 +-
 .../interrupt-controller/sifive,plic-1.0.0.yaml    |    1 +
 .../bindings/iommu/nvidia,tegra264-cmdqv.yaml      |    2 +-
 .../bindings/media/allwinner,sun4i-a10-ir.yaml     |    8 +-
 .../bindings/net/altr,socfpga-stmmac.yaml          |   46 +-
 .../bindings/power/apple,pmgr-pwrstate.yaml        |    2 +
 .../devicetree/bindings/pwm/apple,s5l-fpwm.yaml    |    2 +
 .../devicetree/bindings/riscv/canaan.yaml          |    8 +-
 .../devicetree/bindings/riscv/spacemit.yaml        |    5 +
 .../bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml |   39 +
 .../bindings/soc/mediatek/mediatek,mutex.yaml      |   17 +-
 .../devicetree/bindings/soc/sophgo/sophgo.yaml     |    4 +
 Documentation/devicetree/bindings/sram/sram.yaml   |    1 +
 .../devicetree/bindings/timer/sifive,clint.yaml    |    1 +
 .../devicetree/bindings/vendor-prefixes.yaml       |   14 +
 Documentation/devicetree/bindings/xilinx.txt       |   98 +-
 Documentation/process/maintainer-soc.rst           |    4 +
 MAINTAINERS                                        |    7 +
 arch/arm/boot/dts/allwinner/Makefile               |    5 +
 arch/arm/boot/dts/allwinner/sun4i-a10-gemei-g9.dts |    2 +-
 arch/arm/boot/dts/allwinner/sun4i-a10-inet1.dts    |    4 +-
 arch/arm/boot/dts/allwinner/sun4i-a10.dtsi         |    2 +-
 .../boot/dts/allwinner/sun8i-h3-nanopi-duo2.dts    |    4 +-
 .../allwinner/sun8i-t113s-netcube-dobermann.dts    |  149 ++
 .../dts/allwinner/sun8i-t113s-netcube-nagami.dtsi  |    2 +-
 arch/arm/boot/dts/arm/arm-realview-eb.dtsi         |    2 +-
 arch/arm/boot/dts/arm/arm-realview-pb1176.dts      |    2 +-
 arch/arm/boot/dts/arm/arm-realview-pb11mp.dts      |    6 +-
 arch/arm/boot/dts/arm/arm-realview-pbx.dtsi        |    6 +-
 arch/arm/boot/dts/arm/vexpress-v2p-ca15_a7.dts     |    4 +-
 arch/arm/boot/dts/armv7-m.dtsi                     |    2 +-
 .../dts/aspeed/aspeed-bmc-facebook-sanmiguel.dts   |   14 +-
 .../aspeed/aspeed-bmc-inventec-transformers.dts    |  480 ++--
 arch/arm/boot/dts/aspeed/aspeed-bmc-opp-vesnin.dts |    2 +-
 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi            |    2 +-
 .../dts/broadcom/bcm47094-linksys-panamera.dts     |    2 +-
 arch/arm/boot/dts/intel/ixp/intel-ixp4xx.dtsi      |   10 -
 .../boot/dts/intel/socfpga/socfpga_arria10.dtsi    |    2 +-
 arch/arm/boot/dts/marvell/armada-370.dtsi          |    8 +-
 arch/arm/boot/dts/marvell/armada-388-helios4.dts   |   13 +
 arch/arm/boot/dts/marvell/armada-xp-gp.dts         |   14 +-
 arch/arm/boot/dts/marvell/kirkwood-b3.dts          |    4 +-
 .../marvell/kirkwood-netgear_readynas_duo_v2.dts   |    2 +-
 arch/arm/boot/dts/marvell/kirkwood-ns2-common.dtsi |    2 +-
 arch/arm/boot/dts/marvell/kirkwood-nsa320.dts      |    4 +-
 .../boot/dts/marvell/kirkwood-openblocks_a6.dts    |    2 +-
 .../boot/dts/marvell/kirkwood-openblocks_a7.dts    |    2 +-
 arch/arm/boot/dts/marvell/kirkwood-ts419.dtsi      |    2 +-
 .../boot/dts/marvell/orion5x-lacie-d2-network.dts  |    2 +-
 .../marvell/orion5x-maxtor-shared-storage-2.dts    |    2 +-
 arch/arm/boot/dts/mediatek/mt6323.dtsi             |    5 +
 arch/arm/boot/dts/mediatek/mt8127.dtsi             |    2 +-
 arch/arm/boot/dts/microchip/at91-kizbox3-hs.dts    |    8 +-
 .../boot/dts/microchip/at91-kizbox3_common.dtsi    |    2 +-
 .../boot/dts/microchip/at91-sama5d27_som1_ek.dts   |    8 +-
 arch/arm/boot/dts/microchip/at91-sama5d2_icp.dts   |    8 +-
 arch/arm/boot/dts/microchip/at91rm9200ek.dts       |    2 +-
 arch/arm/boot/dts/microchip/lan966x-pcb8291.dts    |    2 +-
 .../boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi   |    9 +-
 arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts  |    2 +-
 arch/arm/boot/dts/nxp/imx/imx53-ard.dts            |    2 +-
 arch/arm/boot/dts/nxp/imx/imx53-smd.dts            |    1 -
 arch/arm/boot/dts/nxp/imx/imx6dl-plym2m.dts        |    4 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-sabresd.dtsi     |    2 +
 arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6a.dtsi      |   10 +
 arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6b.dtsi      |   10 +
 arch/arm/boot/dts/nxp/imx/imx6sx-sdb.dtsi          |    2 +
 arch/arm/boot/dts/nxp/imx/imx6ul-isiot.dtsi        |    1 -
 .../boot/dts/nxp/imx/imx6ul-tqma6ul-common.dtsi    |   10 +
 .../boot/dts/nxp/imx/imx6ull-engicam-microgea.dtsi |    2 -
 arch/arm/boot/dts/nxp/imx/imx7d-pico.dtsi          |   23 +
 arch/arm/boot/dts/nxp/ls/ls1021a-iot.dts           |    4 +-
 arch/arm/boot/dts/nxp/ls/ls1021a-moxa-uc-8410a.dts |   29 +-
 arch/arm/boot/dts/nxp/ls/ls1021a-qds.dts           |    4 +-
 arch/arm/boot/dts/nxp/ls/ls1021a-twr.dts           |    3 +-
 arch/arm/boot/dts/qcom/Makefile                    |    2 +
 arch/arm/boot/dts/qcom/msm8226-motorola-titan.dts  |  350 +++
 .../dts/qcom/msm8926-sony-xperia-yukon-eagle.dts   |  407 ++++
 arch/arm/boot/dts/qcom/pm8921.dtsi                 |   12 +
 arch/arm/boot/dts/qcom/qcom-apq8064-pins.dtsi      |    2 +-
 arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi           |    4 +-
 arch/arm/boot/dts/qcom/qcom-mdm9615-wp8548.dtsi    |    2 +-
 .../dts/qcom/qcom-msm8960-samsung-expressatt.dts   |   54 +
 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi           |    2 +-
 arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts  |   94 +-
 arch/arm/boot/dts/qcom/qcom-sdx55-t55.dts          |    2 -
 .../boot/dts/qcom/qcom-sdx55-telit-fn980-tlb.dts   |    2 -
 arch/arm/boot/dts/qcom/qcom-sdx55.dtsi             |    3 +
 arch/arm/boot/dts/qcom/qcom-sdx65-mtp.dts          |    2 +-
 arch/arm/boot/dts/renesas/r8a7740.dtsi             |   12 +-
 .../arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dts |   25 +
 arch/arm/boot/dts/renesas/r9a06g032.dtsi           |   84 +
 arch/arm/boot/dts/rockchip/Makefile                |    1 +
 arch/arm/boot/dts/rockchip/rk3188-radxarock.dts    |    2 +-
 arch/arm/boot/dts/rockchip/rk3288-evb-act8846.dts  |    2 +-
 arch/arm/boot/dts/rockchip/rk3288-evb.dtsi         |    2 +-
 .../dts/rockchip/rk3288-firefly-reload-core.dtsi   |    2 +-
 arch/arm/boot/dts/rockchip/rk3288-firefly.dtsi     |    2 +-
 arch/arm/boot/dts/rockchip/rk3288-tinker.dtsi      |    5 +
 arch/arm/boot/dts/rockchip/rv1103b-omega4-evb.dts  |    2 +-
 .../dts/rockchip/rv1126-alientek-clrv1126f.dtsi    |  291 +++
 .../boot/dts/rockchip/rv1126-alientek-dlrv1126.dts |  256 ++
 arch/arm/boot/dts/rockchip/rv1126-pinctrl.dtsi     |   10 +
 arch/arm/boot/dts/rockchip/rv1126.dtsi             |   17 +-
 arch/arm/boot/dts/samsung/exynos5250-manta.dts     |   41 +-
 arch/arm/boot/dts/sigmastar/mstar-infinity2m.dtsi  |   20 +-
 arch/arm/boot/dts/st/spear1340-evb.dts             |    2 +-
 arch/arm/boot/dts/st/spear13xx.dtsi                |    4 -
 arch/arm/boot/dts/st/spear320.dtsi                 |    2 +-
 arch/arm/boot/dts/st/ste-dbx5x0.dtsi               |    2 +-
 arch/arm/boot/dts/st/ste-href.dtsi                 |    2 +-
 arch/arm/boot/dts/st/ste-snowball.dts              |    2 +-
 arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dts  |    2 +-
 arch/arm/boot/dts/st/ste-ux500-samsung-janice.dts  |    2 +-
 arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dts    |    2 +-
 arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dts  |    2 +-
 arch/arm/boot/dts/st/stih407-family.dtsi           |    2 +-
 arch/arm/boot/dts/st/stm32mp135f-dk.dts            |    2 +-
 arch/arm/boot/dts/ti/davinci/da850-lcdk.dts        |    2 +-
 arch/arm/boot/dts/ti/omap/Makefile                 |    4 +
 .../dts/ti/omap/am335x-icev2-prueth-overlay.dtso   |  156 ++
 arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi           |   15 +-
 arch/arm/boot/dts/ti/omap/am3517-evm.dts           |    2 +-
 arch/arm/boot/dts/ti/omap/am4372.dtsi              |   11 +
 arch/arm/boot/dts/ti/omap/am437x-idk-evm.dts       |  103 +-
 arch/arm/boot/dts/ti/omap/am437x-l4.dtsi           |    2 +-
 arch/arm/boot/dts/ti/omap/am57-pruss.dtsi          |   11 +
 arch/arm/boot/dts/ti/omap/am571x-idk.dts           |    8 +-
 arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dts  |    2 +-
 arch/arm/boot/dts/ti/omap/am572x-idk.dts           |   10 +-
 arch/arm/boot/dts/ti/omap/am574x-idk.dts           |   10 +-
 arch/arm/boot/dts/ti/omap/am57xx-idk-common.dtsi   |   61 +
 arch/arm/boot/dts/ti/omap/dm8148-evm.dts           |    4 +-
 arch/arm/boot/dts/ti/omap/dm814x.dtsi              |    2 +-
 arch/arm/boot/dts/ti/omap/dm816x-clocks.dtsi       |    2 +-
 arch/arm/boot/dts/ti/omap/dm816x.dtsi              |    2 +-
 arch/arm/boot/dts/ti/omap/dra7-l4.dtsi             |    4 +-
 .../boot/dts/ti/omap/motorola-mapphone-common.dtsi |   10 +-
 arch/arm/boot/dts/ti/omap/omap2430.dtsi            |    2 +-
 arch/arm/boot/dts/ti/omap/omap3-cm-t3x30.dtsi      |    2 +-
 arch/arm/boot/dts/ti/omap/omap3-n950-n9.dtsi       |    2 +-
 .../boot/dts/ti/omap/omap3-overo-common-lcd35.dtsi |    2 +-
 .../boot/dts/ti/omap/omap3-overo-common-lcd43.dtsi |    2 +-
 arch/arm/boot/dts/ti/omap/omap3.dtsi               |    2 +-
 arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dts  |   13 +-
 arch/arm/boot/dts/ti/omap/omap4-l4.dtsi            |    2 +-
 arch/arm/boot/dts/ti/omap/omap4-panda-es.dts       |    2 +-
 arch/arm/boot/dts/ti/omap/omap4-var-som-om44.dtsi  |   14 +
 arch/arm/boot/dts/ti/omap/omap5-l4.dtsi            |    6 +-
 arch/arm/boot/dts/vt8500/wm8505.dtsi               |    4 +-
 arch/arm/boot/dts/vt8500/wm8650.dtsi               |    8 +-
 arch/arm/boot/dts/vt8500/wm8750.dtsi               |  110 +-
 arch/arm/boot/dts/vt8500/wm8850.dtsi               |   56 +-
 arch/arm/boot/dts/xilinx/zynq-cc108.dts            |    4 +-
 arch/arm/boot/dts/xilinx/zynq-ebaz4205.dts         |    1 -
 arch/arm/boot/dts/xilinx/zynq-zc702.dts            |    2 -
 arch/arm/boot/dts/xilinx/zynq-zc706.dts            |    2 -
 arch/arm64/boot/dts/allwinner/Makefile             |    1 +
 arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi     |   10 +
 .../allwinner/sun50i-a133-helperboard-core.dtsi    |  197 ++
 .../boot/dts/allwinner/sun50i-a133-helperboard.dts |  148 ++
 .../boot/dts/allwinner/sun50i-a64-pinephone.dtsi   |    4 +-
 .../boot/dts/allwinner/sun50i-a64-sopine.dtsi      |    2 +-
 .../allwinner/sun50i-h5-libretech-all-h5-cc.dts    |    2 +-
 .../boot/dts/allwinner/sun50i-h5-orangepi-pc2.dts  |    2 +-
 .../dts/allwinner/sun50i-h5-orangepi-zero-plus.dts |    2 +-
 .../dts/allwinner/sun50i-h616-orangepi-zero.dtsi   |    2 +-
 .../dts/allwinner/sun50i-h618-orangepi-zero2w.dts  |    2 +-
 arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi     |   43 +
 .../boot/dts/allwinner/sun55i-h728-x96qpro+.dts    |   30 +
 .../boot/dts/allwinner/sun55i-t527-avaota-a1.dts   |    8 +-
 .../boot/dts/allwinner/sun55i-t527-orangepi-4a.dts |    2 +-
 arch/arm64/boot/dts/amd/amd-overdrive-rev-b0.dts   |   78 +-
 arch/arm64/boot/dts/amd/amd-seattle-clks.dtsi      |   43 -
 arch/arm64/boot/dts/amd/amd-seattle-soc.dtsi       |   36 +-
 arch/arm64/boot/dts/amd/amd-seattle-xgbe-b.dtsi    |   84 -
 arch/arm64/boot/dts/amlogic/amlogic-a9.dtsi        |  140 ++
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi        |    5 +
 arch/arm64/boot/dts/amlogic/meson-a1.dtsi          |    5 +
 arch/arm64/boot/dts/amlogic/meson-axg-s400.dts     |    8 +
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi         |    5 +-
 arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts    |    2 +-
 arch/arm64/boot/dts/amlogic/meson-g12b-a311d.dtsi  |   38 +-
 .../boot/dts/amlogic/meson-gxl-s905d-sml5442tw.dts |    2 +-
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi         |    2 +-
 arch/arm64/boot/dts/apm/apm-shadowcat.dtsi         |    2 +-
 arch/arm64/boot/dts/apm/apm-storm.dtsi             |    2 +-
 arch/arm64/boot/dts/apple/Makefile                 |    7 +
 arch/arm64/boot/dts/apple/hwmon-common.dtsi        |   38 +
 arch/arm64/boot/dts/apple/hwmon-fan-dual.dtsi      |   23 +
 arch/arm64/boot/dts/apple/hwmon-fan.dtsi           |   17 +
 arch/arm64/boot/dts/apple/hwmon-laptop.dtsi        |   38 +
 arch/arm64/boot/dts/apple/hwmon-mini.dtsi          |   16 +
 arch/arm64/boot/dts/apple/t6001-j375c.dts          |    2 +
 arch/arm64/boot/dts/apple/t6001.dtsi               |    2 +
 arch/arm64/boot/dts/apple/t6002-j375d.dts          |    2 +
 arch/arm64/boot/dts/apple/t6002.dtsi               |    2 +
 arch/arm64/boot/dts/apple/t600x-die0.dtsi          |   11 +
 arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi     |    2 +
 arch/arm64/boot/dts/apple/t6020-j474s.dts          |    2 +
 arch/arm64/boot/dts/apple/t6021-j475c.dts          |    2 +
 arch/arm64/boot/dts/apple/t6021.dtsi               |    2 +
 arch/arm64/boot/dts/apple/t6022-j475d.dts          |    2 +
 arch/arm64/boot/dts/apple/t6022.dtsi               |    2 +
 arch/arm64/boot/dts/apple/t602x-die0.dtsi          |   11 +
 arch/arm64/boot/dts/apple/t602x-j474-j475.dtsi     |    2 +-
 arch/arm64/boot/dts/apple/t6030-j514s.dts          |   22 +
 arch/arm64/boot/dts/apple/t6030-j516s.dts          |   22 +
 arch/arm64/boot/dts/apple/t6030-pmgr.dtsi          | 1437 +++++++++++
 arch/arm64/boot/dts/apple/t6030.dtsi               |  524 ++++
 arch/arm64/boot/dts/apple/t6031-base.dtsi          |  297 +++
 arch/arm64/boot/dts/apple/t6031-die0.dtsi          |  197 ++
 arch/arm64/boot/dts/apple/t6031-dieX.dtsi          |  107 +
 arch/arm64/boot/dts/apple/t6031-gpio-pins.dtsi     |   53 +
 arch/arm64/boot/dts/apple/t6031-j514c.dts          |   18 +
 arch/arm64/boot/dts/apple/t6031-j516c.dts          |   18 +
 arch/arm64/boot/dts/apple/t6031-pmgr.dtsi          | 2400 +++++++++++++=
++++++
 arch/arm64/boot/dts/apple/t6031.dtsi               |   48 +
 arch/arm64/boot/dts/apple/t6032-j575d.dts          |   46 +
 arch/arm64/boot/dts/apple/t6032.dtsi               |  416 ++++
 arch/arm64/boot/dts/apple/t6034-j514m.dts          |   18 +
 arch/arm64/boot/dts/apple/t6034-j516m.dts          |   18 +
 arch/arm64/boot/dts/apple/t6034.dtsi               |   53 +
 arch/arm64/boot/dts/apple/t603x-j514-j516.dtsi     |   66 +
 arch/arm64/boot/dts/apple/t8103-j274.dts           |    2 +
 arch/arm64/boot/dts/apple/t8103-j293.dts           |    3 +
 arch/arm64/boot/dts/apple/t8103-j313.dts           |    2 +
 arch/arm64/boot/dts/apple/t8103.dtsi               |    5 +
 arch/arm64/boot/dts/apple/t8112-j413.dts           |    2 +
 arch/arm64/boot/dts/apple/t8112-j415.dts           |    2 +
 arch/arm64/boot/dts/apple/t8112-j473.dts           |    2 +
 arch/arm64/boot/dts/apple/t8112-j493.dts           |    3 +
 arch/arm64/boot/dts/apple/t8112.dtsi               |    5 +
 arch/arm64/boot/dts/broadcom/bcm2712.dtsi          |    2 +-
 arch/arm64/boot/dts/cix/sky1.dtsi                  |   14 +
 arch/arm64/boot/dts/exynos/Makefile                |    1 +
 arch/arm64/boot/dts/exynos/exynos2200-g0s.dts      |    2 +
 arch/arm64/boot/dts/exynos/exynos2200.dtsi         |   98 +
 arch/arm64/boot/dts/exynos/exynos5433-bus.dtsi     |   29 +
 arch/arm64/boot/dts/exynos/exynos5433-pinctrl.dtsi |    8 +-
 .../boot/dts/exynos/exynos5433-tm2-common.dtsi     |  169 +-
 arch/arm64/boot/dts/exynos/exynos5433-tmu.dtsi     |   49 +-
 arch/arm64/boot/dts/exynos/exynos5433.dtsi         |  570 +++--
 arch/arm64/boot/dts/exynos/exynos7-espresso.dts    |   13 +-
 .../arm64/boot/dts/exynos/exynos7-trip-points.dtsi |    7 +
 arch/arm64/boot/dts/exynos/exynos7.dtsi            |   58 +-
 arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts    |    4 +-
 arch/arm64/boot/dts/exynos/exynos7870.dtsi         |    9 +-
 .../boot/dts/exynos/exynos7885-jackpotlte.dts      |    3 +-
 arch/arm64/boot/dts/exynos/exynos7885.dtsi         |   21 +-
 arch/arm64/boot/dts/exynos/exynos850-e850-96.dts   |   13 +-
 arch/arm64/boot/dts/exynos/exynos850-pinctrl.dtsi  |    1 +
 arch/arm64/boot/dts/exynos/exynos850.dtsi          |   47 +-
 arch/arm64/boot/dts/exynos/exynos8855-pinctrl.dtsi |  574 +++++
 arch/arm64/boot/dts/exynos/exynos8855-smdk.dts     |   31 +
 arch/arm64/boot/dts/exynos/exynos8855.dtsi         |  209 ++
 arch/arm64/boot/dts/exynos/exynos8895-dreamlte.dts |    1 +
 arch/arm64/boot/dts/exynos/exynos8895.dtsi         |   56 +-
 arch/arm64/boot/dts/exynos/exynos9810.dtsi         |    9 +-
 arch/arm64/boot/dts/exynos/exynos990-c1s.dts       |    3 +-
 arch/arm64/boot/dts/exynos/exynos990-r8s.dts       |    3 +-
 .../boot/dts/exynos/exynos990-x1s-common.dtsi      |    3 +-
 arch/arm64/boot/dts/exynos/exynos990.dtsi          |    5 +-
 arch/arm64/boot/dts/exynos/exynosautov9-sadk.dts   |    9 +-
 arch/arm64/boot/dts/exynos/exynosautov9.dtsi       |   86 +-
 arch/arm64/boot/dts/exynos/exynosautov920-sadk.dts |    2 +
 arch/arm64/boot/dts/exynos/exynosautov920.dtsi     |   70 +
 arch/arm64/boot/dts/exynos/google/gs101-oriole.dts |    2 +
 .../boot/dts/exynos/google/gs101-pinctrl.dtsi      |    8 +-
 .../boot/dts/exynos/google/gs101-pixel-common.dtsi |   12 +-
 arch/arm64/boot/dts/exynos/google/gs101-raven.dts  |    2 +
 arch/arm64/boot/dts/exynos/google/gs101.dtsi       |   81 +-
 arch/arm64/boot/dts/freescale/Makefile             |   65 +
 arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi     |   29 +
 arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi     |   60 +
 arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi     |   58 +
 arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi     |   98 +
 .../boot/dts/freescale/fsl-lx2160a-bluebox3.dts    |    2 +-
 .../boot/dts/freescale/fsl-lx2160a-clearfog-cx.dts |    2 +-
 .../dts/freescale/fsl-lx2160a-clearfog-itx.dtsi    |    4 +
 .../boot/dts/freescale/fsl-lx2160a-half-twins.dts  |    4 +
 .../boot/dts/freescale/fsl-lx2160a-honeycomb.dts   |    2 +-
 .../boot/dts/freescale/fsl-lx2160a-pcie-mbvl.dtsi  |  176 ++
 arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dts  |    4 +
 .../arm64/boot/dts/freescale/fsl-lx2160a-rev1.dtsi |    9 +
 .../arm64/boot/dts/freescale/fsl-lx2160a-rev2.dtsi |  188 +-
 .../boot/dts/freescale/fsl-lx2160a-serdes.dtsi     |  167 ++
 .../boot/dts/freescale/fsl-lx2160a-tqmlx2160a.dtsi |    2 +-
 .../boot/dts/freescale/fsl-lx2162a-clearfog.dts    |    6 +-
 arch/arm64/boot/dts/freescale/fsl-lx2162a-qds.dts  |    2 +-
 .../boot/dts/freescale/fsl-lx2162a-serdes.dtsi     |   86 +
 arch/arm64/boot/dts/freescale/fsl-lx2162a.dtsi     |    9 +
 .../{fsl-lx2160a.dtsi =3D> fsl-lx216x.dtsi}          |  181 --
 .../boot/dts/freescale/fsl-lx216xa-pcie-gen3.dtsi  |  257 ++
 .../arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi |    2 +-
 arch/arm64/boot/dts/freescale/imx8-ss-audio.dtsi   |    8 +-
 arch/arm64/boot/dts/freescale/imx8dxl-evk.dts      |    3 +
 .../boot/dts/freescale/imx8mm-emtop-baseboard.dts  |  303 ++-
 arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi      |    2 +
 .../boot/dts/freescale/imx8mm-var-dart-sonata.dts  |  516 ++++
 arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi |  558 +++++
 .../boot/dts/freescale/imx8mm-var-som-symphony.dts |   12 +
 .../freescale/imx8mm-verdin-dev-nau8822-btl.dtso   |   14 +
 .../dts/freescale/imx8mm-verdin-dsi-to-hdmi.dtso   |   88 +
 ...-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtso |  104 +
 .../imx8mm-verdin-panel-cap-touch-10inch-dsi.dtso  |  129 +
 .../imx8mm-verdin-panel-cap-touch-7inch-dsi.dtso   |  129 +
 .../dts/freescale/imx8mm-verdin-uart4-mcu.dtso     |   14 +
 arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi   |   33 +
 .../boot/dts/freescale/imx8mn-rve-gateway.dts      |   48 +-
 .../freescale/imx8mn-var-som-symphony-legacy.dts   |   19 +
 .../boot/dts/freescale/imx8mn-var-som-symphony.dts |  162 +-
 .../freescale/imx8mn-var-som-wifi-brcm-legacy.dtsi |   19 +
 .../freescale/imx8mn-var-som-wifi-bt-iw61x.dtsi    |   46 +
 arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi  |  366 +--
 arch/arm64/boot/dts/freescale/imx8mp-ab2.dts       |    4 +
 .../boot/dts/freescale/imx8mp-evk-flexcan2.dtso    |   15 +
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts       |   97 +-
 arch/arm64/boot/dts/freescale/imx8mp-frdm.dts      |    2 +
 .../dts/freescale/imx8mp-nitrogen-smarc-som.dtsi   |   82 +-
 ...imx8mp-tqma8mpqs-mb-smarc-2-lvds-g133han01.dtso |   81 +
 ...8mp-tqma8mpqs-mb-smarc-2-lvds0-tm070jvhg33.dtso |   43 +
 ...8mp-tqma8mpqs-mb-smarc-2-lvds1-tm070jvhg33.dtso |   43 +
 .../dts/freescale/imx8mp-tqma8mpqs-mb-smarc-2.dts  |  380 +++
 .../arm64/boot/dts/freescale/imx8mp-tqma8mpqs.dtsi | 1178 +++++++++
 .../boot/dts/freescale/imx8mp-var-dart-sonata.dts  |  733 ++++++
 arch/arm64/boot/dts/freescale/imx8mp-var-dart.dtsi |  475 ++++
 .../boot/dts/freescale/imx8mp-var-som-symphony.dts |  389 ++-
 arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi  |   12 +-
 arch/arm64/boot/dts/freescale/imx8mp.dtsi          |    1 +
 arch/arm64/boot/dts/freescale/imx8mq-evk.dts       |   84 +
 .../boot/dts/freescale/imx8mq-librem5-devkit.dts   |    4 +-
 arch/arm64/boot/dts/freescale/imx8mq.dtsi          |   23 +
 arch/arm64/boot/dts/freescale/imx8qm-mek.dts       |    3 +
 arch/arm64/boot/dts/freescale/imx8qm-ss-audio.dtsi |   38 +
 arch/arm64/boot/dts/freescale/imx8qm-ss-dma.dtsi   |   15 +
 arch/arm64/boot/dts/freescale/imx8qm-ss-lsio.dtsi  |   21 +
 .../boot/dts/freescale/imx8qm-var-som-symphony.dts |  504 ++++
 arch/arm64/boot/dts/freescale/imx8qm-var-som.dtsi  |  531 ++++
 arch/arm64/boot/dts/freescale/imx8qm.dtsi          |    7 +
 arch/arm64/boot/dts/freescale/imx8qxp-mek.dts      |    3 +
 arch/arm64/boot/dts/freescale/imx8ulp-9x9-evk.dts  |   37 +-
 arch/arm64/boot/dts/freescale/imx8ulp-evk.dts      |   69 +-
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi         |   70 +-
 .../boot/dts/freescale/imx91-9x9-qsb-can1.dtso     |   48 +
 arch/arm64/boot/dts/freescale/imx91-9x9-qsb.dts    |  160 ++
 .../dts/freescale/imx91-tqma9131-mba91xxca.dts     |    4 +
 .../dts/freescale/imx91-tqma9131-mba93xxca.dts     |  937 ++++++++
 arch/arm64/boot/dts/freescale/imx91-tqma9131.dtsi  |    4 +-
 .../boot/dts/freescale/imx91-var-dart-sonata.dts   |   14 +-
 .../freescale/imx93-11x11-evk-dy1212w-4856.dtso    |   81 +
 .../boot/dts/freescale/imx93-kontron-osm-s.dtsi    |    4 +-
 .../dts/freescale/imx93-tqma9352-mba93xxca.dts     |   21 +
 .../imx93-tqma9352-mba93xxla-lvds-tm070jvhg33.dtso |   38 +
 .../freescale/imx93-tqma9352-mba93xxla-mini.dts    |   45 +
 .../dts/freescale/imx93-tqma9352-mba93xxla.dts     |   21 +
 .../boot/dts/freescale/imx93-var-dart-sonata.dts   |   14 +-
 arch/arm64/boot/dts/freescale/imx93.dtsi           |   39 +-
 arch/arm64/boot/dts/freescale/imx94.dtsi           |   20 +-
 arch/arm64/boot/dts/freescale/imx943-evk.dts       |  150 +-
 arch/arm64/boot/dts/freescale/imx943.dtsi          |   16 +-
 arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts  |    4 +-
 arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts  |   54 +-
 .../boot/dts/freescale/imx95-toradex-smarc.dtsi    |    1 +
 .../dts/freescale/imx95-tqma9596la-mba95xxca.dts   |  958 ++++++++
 .../arm64/boot/dts/freescale/imx95-tqma9596la.dtsi |  278 +++
 .../boot/dts/freescale/imx95-var-dart-sonata.dts   |    4 +-
 arch/arm64/boot/dts/freescale/imx95-var-dart.dtsi  |   10 +
 arch/arm64/boot/dts/freescale/imx95.dtsi           |   64 +-
 arch/arm64/boot/dts/freescale/imx952-evk.dts       |   50 +
 arch/arm64/boot/dts/freescale/s32g2.dtsi           |   27 +-
 arch/arm64/boot/dts/freescale/s32g3.dtsi           |   59 +-
 arch/arm64/boot/dts/hisilicon/hi3798cv200.dtsi     |    4 -
 arch/arm64/boot/dts/hisilicon/hip05.dtsi           |   14 +-
 arch/arm64/boot/dts/intel/Makefile                 |    1 +
 arch/arm64/boot/dts/intel/keembay-soc.dtsi         |    2 +-
 .../arm64/boot/dts/intel/socfpga_agilex3_socdk.dts |    2 +-
 arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi     |  112 +-
 .../arm64/boot/dts/intel/socfpga_agilex5_socdk.dts |    2 +-
 .../boot/dts/intel/socfpga_agilex5_socdk_013b.dts  |    4 +-
 .../dts/intel/socfpga_agilex5_socdk_modular.dts    |    2 +-
 arch/arm64/boot/dts/intel/socfpga_agilex72.dtsi    |  156 ++
 .../boot/dts/intel/socfpga_agilex72_socdk.dts      |   27 +
 arch/arm64/boot/dts/marvell/armada-3720-db.dts     |    2 +-
 .../boot/dts/marvell/armada-3720-turris-mox.dts    |    3 +-
 arch/arm64/boot/dts/marvell/cn9132-sr-cex7.dtsi    |    4 +-
 arch/arm64/boot/dts/mediatek/mt6359.dtsi           |    2 +-
 arch/arm64/boot/dts/mediatek/mt6795.dtsi           |    4 +-
 .../boot/dts/mediatek/mt8183-kukui-kodama.dtsi     |    6 +-
 .../dts/mediatek/mt8183-kukui-krane-sku176.dts     |    4 +-
 arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi     |    2 +
 arch/arm64/boot/dts/mediatek/mt8183.dtsi           |   22 +
 arch/arm64/boot/dts/mediatek/mt8186.dtsi           |  112 +-
 arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi    |    1 +
 arch/arm64/boot/dts/mediatek/mt8188.dtsi           |   33 +
 .../dts/mediatek/mt8192-asurada-spherion-r0.dts    |    4 +
 arch/arm64/boot/dts/mediatek/mt8192.dtsi           |   17 +
 arch/arm64/boot/dts/mediatek/mt8195.dtsi           |   37 +
 .../boot/dts/mediatek/mt8390-genio-common.dtsi     |   19 +-
 .../boot/dts/mediatek/mt8390-tungsten-smarc.dtsi   |    4 -
 .../boot/dts/mediatek/mt8395-genio-common.dtsi     |   17 +
 .../boot/dts/mediatek/mt8395-radxa-nio-12l.dts     |   17 +
 arch/arm64/boot/dts/microchip/lan9691.dtsi         |   33 +
 .../boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi   |   33 +-
 arch/arm64/boot/dts/nvidia/Makefile                |    1 +
 .../dts/nvidia/tegra194-lenovo-thinkedge-se70.dts  |  111 +
 arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts |    2 +-
 .../arm64/boot/dts/nvidia/tegra194-p3509-0000.dtsi |    2 +-
 .../boot/dts/nvidia/tegra234-p3737-0000+p3701.dtsi |    2 +-
 .../dts/nvidia/tegra234-p3740-0002+p3701-0008.dts  |    2 +-
 arch/arm64/boot/dts/nvidia/tegra234.dtsi           |   12 +-
 arch/arm64/boot/dts/nvidia/tegra264-p3834.dtsi     |    4 +
 arch/arm64/boot/dts/nvidia/tegra264.dtsi           |  579 ++++-
 arch/arm64/boot/dts/qcom/Makefile                  |   20 +-
 arch/arm64/boot/dts/qcom/agatti.dtsi               |    1 +
 arch/arm64/boot/dts/qcom/apq8016-sbc-usb-host.dtso |    2 +-
 arch/arm64/boot/dts/qcom/eliza-cqs-evk.dts         |  155 ++
 arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi        |  404 ++++
 arch/arm64/boot/dts/qcom/eliza-evk.dtsi            |  112 +
 arch/arm64/boot/dts/qcom/eliza-mtp.dts             |   48 +-
 arch/arm64/boot/dts/qcom/eliza.dtsi                |  338 ++-
 .../dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts  | 1269 ++++++++++
 arch/arm64/boot/dts/qcom/glymur-crd.dts            |  415 +---
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi           |  557 ++++-
 arch/arm64/boot/dts/qcom/glymur.dtsi               | 1136 ++++++++-
 arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts         |   16 +
 arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi        |   20 +-
 .../qcom/hamoa-lenovo-ideacentre-mini-01q8x10.dts  |   20 +-
 arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi          |  158 ++
 arch/arm64/boot/dts/qcom/hamoa.dtsi                |  304 ++-
 arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts     |    8 +-
 arch/arm64/boot/dts/qcom/ipq5018.dtsi              |   27 +-
 arch/arm64/boot/dts/qcom/ipq5332-rdp-common.dtsi   |   24 +-
 arch/arm64/boot/dts/qcom/ipq5332-rdp441.dts        |   16 +-
 arch/arm64/boot/dts/qcom/ipq5332.dtsi              |   53 +-
 arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts        |   12 +-
 arch/arm64/boot/dts/qcom/ipq5424.dtsi              |   24 +-
 arch/arm64/boot/dts/qcom/ipq6018.dtsi              |   15 +-
 arch/arm64/boot/dts/qcom/ipq8074-hk01.dts          |   10 +-
 arch/arm64/boot/dts/qcom/ipq8074-hk10.dtsi         |   10 +-
 arch/arm64/boot/dts/qcom/ipq8074.dtsi              |   14 +-
 .../arm64/boot/dts/qcom/ipq9574-rdp433-common.dtsi |   33 +-
 arch/arm64/boot/dts/qcom/ipq9574-rdp454.dts        |   80 +
 arch/arm64/boot/dts/qcom/ipq9574.dtsi              |   90 +-
 arch/arm64/boot/dts/qcom/kaanapali-mtp.dts         |   62 +-
 arch/arm64/boot/dts/qcom/kaanapali-qrd.dts         |   62 +-
 arch/arm64/boot/dts/qcom/kaanapali.dtsi            |  199 +-
 arch/arm64/boot/dts/qcom/kodiak.dtsi               |   49 +-
 arch/arm64/boot/dts/qcom/lemans-auto.dtsi          |  104 -
 arch/arm64/boot/dts/qcom/lemans-evk-camera.dtso    |    2 +-
 .../boot/dts/qcom/lemans-evk-ifp-mezzanine.dtso    |   22 +-
 arch/arm64/boot/dts/qcom/lemans-evk.dts            |  251 +-
 arch/arm64/boot/dts/qcom/lemans-pmics.dtsi         |   93 +
 arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi   |   12 +-
 arch/arm64/boot/dts/qcom/lemans.dtsi               |   68 +-
 arch/arm64/boot/dts/qcom/mahua-crd.dts             |   16 +
 arch/arm64/boot/dts/qcom/mahua.dtsi                |   13 +
 arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts   |   29 +-
 .../boot/dts/qcom/milos-nothing-asteroids.dts      |   38 -
 arch/arm64/boot/dts/qcom/milos.dtsi                |  292 ++-
 arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts  |  124 +-
 .../boot/dts/qcom/monaco-evk-ifp-mezzanine.dtso    |   22 +-
 arch/arm64/boot/dts/qcom/monaco-monza-som.dtsi     |   16 +-
 arch/arm64/boot/dts/qcom/monaco-pmics.dtsi         |   43 +
 arch/arm64/boot/dts/qcom/monaco.dtsi               |  114 +-
 .../arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts |  138 +-
 .../boot/dts/qcom/msm8976-longcheer-l9360.dts      |    4 +-
 arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dts |    2 +-
 arch/arm64/boot/dts/qcom/msm8996.dtsi              |   41 +
 .../boot/dts/qcom/msm8998-sony-xperia-yoshino.dtsi |    4 -
 arch/arm64/boot/dts/qcom/msm8998-xiaomi-sagit.dts  |    5 -
 arch/arm64/boot/dts/qcom/msm8998.dtsi              |   24 +-
 arch/arm64/boot/dts/qcom/pm4125.dtsi               |    2 +-
 arch/arm64/boot/dts/qcom/pm7550-eliza.dtsi         |   61 +
 arch/arm64/boot/dts/qcom/pm8010-kaanapali.dtsi     |   20 +
 arch/arm64/boot/dts/qcom/pm8010.dtsi               |   20 +
 arch/arm64/boot/dts/qcom/pm8550vs-d-eliza.dtsi     |   63 +
 arch/arm64/boot/dts/qcom/pm8550vs-g-eliza.dtsi     |   63 +
 arch/arm64/boot/dts/qcom/pmh0104-glymur.dtsi       |    2 +-
 arch/arm64/boot/dts/qcom/pmh0110-glymur.dtsi       |    2 +-
 arch/arm64/boot/dts/qcom/pmk8550-eliza.dtsi        |   87 +
 arch/arm64/boot/dts/qcom/pmk8550.dtsi              |   30 +
 arch/arm64/boot/dts/qcom/pmr735d-eliza.dtsi        |   63 +
 arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi        |   25 +-
 arch/arm64/boot/dts/qcom/purwa.dtsi                |   60 +
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts |   68 +-
 arch/arm64/boot/dts/qcom/qcm6490-idp.dts           |    4 +-
 .../boot/dts/qcom/qcm6490-particle-tachyon.dts     |   20 +-
 arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts   |   11 +-
 arch/arm64/boot/dts/qcom/qcom-adc5-gen3.h          |   88 +
 arch/arm64/boot/dts/qcom/qcs404.dtsi               |   16 +-
 arch/arm64/boot/dts/qcom/qcs615-ride.dts           |    6 +-
 .../boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts     |   38 +-
 .../qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso |   58 +-
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts       |   33 +-
 .../dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts  |   44 +-
 .../boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts |   24 +-
 .../boot/dts/qcom/qcs6490-vicharak-axon-mini.dts   | 1014 ++++++++
 arch/arm64/boot/dts/qcom/qcs8300-ride.dts          |    2 +-
 arch/arm64/boot/dts/qcom/qcs8550-aim300.dtsi       |    4 +-
 arch/arm64/boot/dts/qcom/qcs8550-rb5gen2.dts       | 1573 ++++++++++++
 arch/arm64/boot/dts/qcom/qdu1000.dtsi              |    7 +-
 arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts |    4 +-
 .../dts/qcom/qrb2210-rb1-vision-mezzanine.dtso     |    4 +-
 arch/arm64/boot/dts/qcom/qrb2210-rb1.dts           |    4 +-
 arch/arm64/boot/dts/qcom/qrb4210-rb2.dts           |    6 +
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts           |    8 +-
 arch/arm64/boot/dts/qcom/sa8155p-adp.dts           |    8 +-
 arch/arm64/boot/dts/qcom/sa8295p-adp.dts           |   48 +-
 arch/arm64/boot/dts/qcom/sa8540p-ride.dts          |   24 +-
 arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dts       |   17 -
 arch/arm64/boot/dts/qcom/sa8775p-ride.dts          |   17 -
 arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dts     |    4 +-
 arch/arm64/boot/dts/qcom/sar2130p.dtsi             |   10 +-
 arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dts   |    4 +-
 arch/arm64/boot/dts/qcom/sc7180-ecs-liva-qc710.dts |    4 +-
 arch/arm64/boot/dts/qcom/sc7180-idp.dts            |    4 +-
 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi       |    9 +-
 arch/arm64/boot/dts/qcom/sc7180.dtsi               |    7 +-
 .../boot/dts/qcom/sc7280-herobrine-lte-sku.dtsi    |    2 +
 arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi     |    5 +
 arch/arm64/boot/dts/qcom/sc7280-idp.dtsi           |    9 +-
 arch/arm64/boot/dts/qcom/sc7280-qcard.dtsi         |    4 +-
 .../arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts |   73 +-
 arch/arm64/boot/dts/qcom/sc8180x-primus.dts        |   72 +-
 arch/arm64/boot/dts/qcom/sc8180x.dtsi              |   18 +-
 arch/arm64/boot/dts/qcom/sc8280xp-crd.dts          |   28 +-
 .../boot/dts/qcom/sc8280xp-huawei-gaokun3.dts      |   14 +-
 .../dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts     |   38 +-
 .../boot/dts/qcom/sc8280xp-microsoft-arcata.dts    |  301 ++-
 .../boot/dts/qcom/sc8280xp-microsoft-blackrock.dts |   33 +-
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi             |  343 ++-
 arch/arm64/boot/dts/qcom/sdm632-motorola-ocean.dts |    2 +-
 arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi |    5 +
 arch/arm64/boot/dts/qcom/sdm670.dtsi               |    2 +-
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts         |    8 +-
 arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi |   12 +-
 arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi     |    7 +-
 arch/arm64/boot/dts/qcom/sdm845-mtp.dts            |   10 +-
 .../arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi |    4 +-
 .../boot/dts/qcom/sdm845-samsung-starqltechn.dts   |    6 +-
 arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts  |    6 +-
 .../dts/qcom/sdm845-xiaomi-beryllium-common.dtsi   |    6 +-
 arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts |    6 +-
 arch/arm64/boot/dts/qcom/sdm845.dtsi               |   74 +-
 .../dts/qcom/sdm850-huawei-matebook-e-2019.dts     |   10 +-
 .../boot/dts/qcom/sdm850-lenovo-yoga-c630.dts      |   10 +-
 arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dts   |   11 +-
 arch/arm64/boot/dts/qcom/sdx75.dtsi                |    2 +-
 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts        |   59 +
 arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi       |  236 ++
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts        |   59 +
 arch/arm64/boot/dts/qcom/shikra-evk.dtsi           |   14 +
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts        |   59 +
 arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi       |  258 ++
 arch/arm64/boot/dts/qcom/shikra.dtsi               | 2532 +++++++++++++=
+++++++
 arch/arm64/boot/dts/qcom/sm4450.dtsi               |    2 +-
 arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts    |    2 +-
 arch/arm64/boot/dts/qcom/sm6115.dtsi               |   65 +
 .../boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi |   66 +-
 .../boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts  |    2 +-
 arch/arm64/boot/dts/qcom/sm6125.dtsi               |  168 +-
 arch/arm64/boot/dts/qcom/sm6350.dtsi               |   24 +-
 arch/arm64/boot/dts/qcom/sm6375.dtsi               |    5 +
 arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts  |    9 +-
 .../dts/qcom/sm7325-motorola-dubai-common.dtsi     | 1454 +++++++++++
 .../boot/dts/qcom/sm7325-motorola-dubai-csot.dts   |   13 +
 .../boot/dts/qcom/sm7325-motorola-dubai-tianma.dts |   13 +
 arch/arm64/boot/dts/qcom/sm7325-motorola-dubai.dts |    3 -
 .../boot/dts/qcom/sm7325-nothing-spacewar.dts      |    2 -
 arch/arm64/boot/dts/qcom/sm7325-xiaomi-taoyao.dts  |  907 +++++++
 arch/arm64/boot/dts/qcom/sm8150-hdk.dts            |    8 +-
 .../boot/dts/qcom/sm8150-microsoft-surface-duo.dts |    4 +-
 arch/arm64/boot/dts/qcom/sm8150-mtp.dts            |    4 +-
 .../boot/dts/qcom/sm8150-sony-xperia-kumano.dtsi   |    4 +-
 arch/arm64/boot/dts/qcom/sm8150.dtsi               |   10 +-
 arch/arm64/boot/dts/qcom/sm8250-hdk.dts            |    8 +-
 arch/arm64/boot/dts/qcom/sm8250-mtp.dts            |    8 +-
 .../boot/dts/qcom/sm8250-sony-xperia-edo.dtsi      |    4 +-
 .../boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi  |  155 +-
 arch/arm64/boot/dts/qcom/sm8250-xiaomi-pipa.dts    |    4 +-
 arch/arm64/boot/dts/qcom/sm8250.dtsi               |   69 +-
 arch/arm64/boot/dts/qcom/sm8350-hdk.dts            |   19 +-
 .../dts/qcom/sm8350-microsoft-surface-duo2.dts     |   10 +-
 arch/arm64/boot/dts/qcom/sm8350-mtp.dts            |   10 +-
 .../boot/dts/qcom/sm8350-sony-xperia-sagami.dtsi   |    7 +-
 arch/arm64/boot/dts/qcom/sm8350.dtsi               |   99 +-
 arch/arm64/boot/dts/qcom/sm8450-hdk.dts            |    4 +-
 arch/arm64/boot/dts/qcom/sm8450-qrd.dts            |    4 +-
 .../boot/dts/qcom/sm8450-sony-xperia-nagara.dtsi   |    4 +-
 arch/arm64/boot/dts/qcom/sm8450.dtsi               |   51 +-
 arch/arm64/boot/dts/qcom/sm8550-hdk.dts            |  285 ++-
 arch/arm64/boot/dts/qcom/sm8550-mtp.dts            |    4 +-
 arch/arm64/boot/dts/qcom/sm8550-qrd.dts            |  285 ++-
 .../dts/qcom/sm8550-sony-xperia-yodo-pdx234.dts    |    4 +-
 arch/arm64/boot/dts/qcom/sm8550.dtsi               |   41 +-
 .../boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts      |    4 +-
 arch/arm64/boot/dts/qcom/sm8650-hdk.dts            |  284 ++-
 arch/arm64/boot/dts/qcom/sm8650-mtp.dts            |    4 +-
 arch/arm64/boot/dts/qcom/sm8650-qrd.dts            |  284 ++-
 arch/arm64/boot/dts/qcom/sm8650.dtsi               |  143 +-
 arch/arm64/boot/dts/qcom/sm8750-mtp.dts            |    4 +-
 arch/arm64/boot/dts/qcom/sm8750-qrd.dts            |    4 +-
 arch/arm64/boot/dts/qcom/sm8750.dtsi               |  270 ++-
 arch/arm64/boot/dts/qcom/smb2370.dtsi              |    2 +
 arch/arm64/boot/dts/qcom/talos-evk-som.dtsi        |   14 +-
 arch/arm64/boot/dts/qcom/talos.dtsi                |  151 +-
 arch/arm64/boot/dts/qcom/x1-asus-vivobook-s15.dtsi |   20 +-
 arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi  |   20 +-
 arch/arm64/boot/dts/qcom/x1-crd.dtsi               |   36 +-
 arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi        |   18 +-
 arch/arm64/boot/dts/qcom/x1-hp-omnibook-x14.dtsi   |   12 +-
 arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi  |    8 +-
 arch/arm64/boot/dts/qcom/x1e001de-devkit.dts       |   20 +-
 .../dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi    |   20 +-
 .../boot/dts/qcom/x1e80100-dell-xps13-9345.dts     |   16 +-
 .../dts/qcom/x1e80100-honor-magicbook-art-14.dts   | 1341 +++++++++++
 .../boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts  |   12 +-
 .../dts/qcom/x1e80100-medion-sprchrgd-14-s1.dts    |   16 +-
 .../boot/dts/qcom/x1e80100-microsoft-romulus.dtsi  |   16 +-
 arch/arm64/boot/dts/qcom/x1e80100-qcp.dts          |   20 +-
 .../boot/dts/qcom/x1p42100-asus-vivobook-s15.dts   |    1 +
 .../boot/dts/qcom/x1p42100-asus-zenbook-a14.dtsi   |    1 +
 arch/arm64/boot/dts/qcom/x1p42100-crd.dts          |    1 +
 .../boot/dts/qcom/x1p42100-hp-omnibook-x14.dts     |    1 +
 .../boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts |   21 +-
 .../boot/dts/qcom/x1p42100-microsoft-sp12in.dts    | 1194 +++++++++
 arch/arm64/boot/dts/realtek/kent.dtsi              |   41 +-
 arch/arm64/boot/dts/realtek/rtd16xx.dtsi           |    3 +-
 arch/arm64/boot/dts/renesas/r8a774a1.dtsi          |    2 +-
 arch/arm64/boot/dts/renesas/r8a774b1.dtsi          |    2 +-
 arch/arm64/boot/dts/renesas/r8a774e1.dtsi          |    2 +-
 arch/arm64/boot/dts/renesas/r8a77960.dtsi          |    2 +-
 arch/arm64/boot/dts/renesas/r8a77961.dtsi          |    2 +-
 .../arm64/boot/dts/renesas/r8a77965-salvator-x.dts |    4 +
 .../boot/dts/renesas/r8a77965-salvator-xs.dts      |    4 +
 arch/arm64/boot/dts/renesas/r8a77965-ulcb.dts      |    4 +
 arch/arm64/boot/dts/renesas/r8a77965.dtsi          |    2 +-
 arch/arm64/boot/dts/renesas/r8a77970.dtsi          |    2 +-
 arch/arm64/boot/dts/renesas/r8a77980.dtsi          |    2 +-
 arch/arm64/boot/dts/renesas/r8a77995.dtsi          |    2 +-
 arch/arm64/boot/dts/renesas/r8a779g0.dtsi          |   17 +
 arch/arm64/boot/dts/renesas/r8a78000.dtsi          |   32 +
 arch/arm64/boot/dts/renesas/r9a08g046.dtsi         |   69 +
 arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts |   78 +
 arch/arm64/boot/dts/renesas/r9a09g047.dtsi         |  525 +++-
 arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts |  114 +-
 arch/arm64/boot/dts/renesas/r9a09g056.dtsi         |   22 +-
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi         |  160 +-
 .../boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts    |   18 +
 .../boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts    |  144 +-
 .../boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts    |  144 +-
 arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi   |   44 +
 .../boot/dts/renesas/rzt2h-n2h-evk-common.dtsi     |   14 +
 arch/arm64/boot/dts/rockchip/Makefile              |   12 +
 arch/arm64/boot/dts/rockchip/px30-cobra.dtsi       |    2 +-
 .../px30-engicam-px30-core-ctouch2-of10.dts        |    1 -
 arch/arm64/boot/dts/rockchip/px30-pp1516.dtsi      |    2 +-
 .../rockchip/px30-ringneck-haikou-video-demo.dtso  |   10 +-
 arch/arm64/boot/dts/rockchip/px30-ringneck.dtsi    |    2 +-
 arch/arm64/boot/dts/rockchip/rk3308-roc-cc.dts     |    2 +-
 .../boot/dts/rockchip/rk3399-gru-chromebook.dtsi   |    3 +-
 .../arm64/boot/dts/rockchip/rk3399-nanopi-r4s.dtsi |   10 +-
 .../boot/dts/rockchip/rk3399-pinephone-pro.dts     |   18 -
 .../arm64/boot/dts/rockchip/rk3399-puma-haikou.dts |    2 +-
 .../arm64/boot/dts/rockchip/rk3399-roc-pc-plus.dts |   67 +
 arch/arm64/boot/dts/rockchip/rk3399-rock960.dtsi   |    2 +-
 .../boot/dts/rockchip/rk3399-vicharak-vaaman.dts   |  458 ++++
 .../boot/dts/rockchip/rk3528-hinlink-h28k.dts      |  318 +++
 .../boot/dts/rockchip/rk3566-bigtreetech-cb2.dtsi  |    2 +-
 .../dts/rockchip/rk3566-onething-edge-cube.dts     |    2 +-
 arch/arm64/boot/dts/rockchip/rk3566-radxa-cm3.dtsi |    2 +-
 .../boot/dts/rockchip/rk3568-9tripod-x3568-v4.dts  |   60 +-
 .../boot/dts/rockchip/rk3568-anbernic-rg-ds.dts    |    8 +-
 .../dts/rockchip/rk3568-graperain-g3568-v2.dts     |  940 ++++++++
 .../boot/dts/rockchip/rk3568-lincstation-e1.dts    | 1000 ++++++++
 .../dts/rockchip/rk3576-anbernic-rg-vita-pro.dts   | 1283 ++++++++++
 .../boot/dts/rockchip/rk3576-armsom-cm5-io.dts     |  384 +++
 .../arm64/boot/dts/rockchip/rk3576-armsom-cm5.dtsi |  566 +++++
 .../boot/dts/rockchip/rk3576-lckfb-tspi-3m.dts     |  997 ++++++++
 arch/arm64/boot/dts/rockchip/rk3576.dtsi           |   28 +
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi      |    4 +-
 arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi     |    4 +-
 .../rockchip/rk3588-friendlyelec-cm3588-nas.dts    |   31 +
 arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi |   14 +-
 .../rk3588-rock-5b-plus-radxa-cam4k-cam0.dtso      |    2 +
 .../rk3588-rock-5b-plus-radxa-cam4k-cam1.dtso      |    2 +
 .../boot/dts/rockchip/rk3588-tiger-haikou.dts      |    2 +-
 .../boot/dts/rockchip/rk3588-vicharak-axon.dts     |  842 +++++++
 .../boot/dts/rockchip/rk3588-vicharak-vaaman2.dts  |  535 +++++
 .../boot/dts/rockchip/rk3588-youyeetoo-yy3588.dts  | 1180 +++++++++
 .../arm64/boot/dts/rockchip/rk3588s-lubancat-4.dts |  785 ++++++
 .../boot/dts/rockchip/rk3588s-orangepi-5-5b.dtsi   |  256 ++
 .../boot/dts/rockchip/rk3588s-orangepi-5-pro.dts   |  358 +++
 .../arm64/boot/dts/rockchip/rk3588s-orangepi-5.dts |    6 +-
 .../boot/dts/rockchip/rk3588s-orangepi-5.dtsi      |  263 +-
 .../boot/dts/rockchip/rk3588s-orangepi-5b.dts      |    2 +-
 .../boot/dts/rockchip/rk3588s-radxa-cm5-io.dts     |   19 +
 arch/arm64/boot/dts/rockchip/rk3588s-roc-pc.dts    |   29 +-
 arch/arm64/boot/dts/sophgo/Makefile                |    1 +
 arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-s.dts  |  244 ++
 arch/arm64/boot/dts/st/stm32mp257f-ev1.dts         |    4 +-
 arch/arm64/boot/dts/tesla/fsd-evb.dts              |    8 +-
 arch/arm64/boot/dts/tesla/fsd.dtsi                 |  121 +-
 arch/arm64/boot/dts/ti/Makefile                    |  108 +-
 ...-am625-beagleplay-lincolntech-lcd185-panel.dtso |  162 ++
 .../ti/k3-am625-sk-microtips-mf101hie-panel.dtso   |  121 +
 .../boot/dts/ti/k3-am625-var-som-symphony.dts      |  555 +++++
 arch/arm64/boot/dts/ti/k3-am625-var-som.dtsi       |  483 ++++
 ...v-mezzanine-panel-cap-touch-10inch-lvds-v2.dtso |  109 +
 ...rdin-dsi-to-lvds-v2-panel-cap-touch-10inch.dtso |  143 ++
 ...m625-verdin-panel-cap-touch-10inch-lvds-v2.dtso |  129 +
 .../dts/ti/k3-am625-verdin-rpi-display-2-7in.dtso  |  101 +
 arch/arm64/boot/dts/ti/k3-am62a7-sk.dts            |    4 +
 arch/arm64/boot/dts/ti/k3-am62l3-beaglebadge.dts   |  657 +++++
 arch/arm64/boot/dts/ti/k3-am62l3-evm.dts           |    1 +
 .../boot/dts/ti/k3-am62p5-var-som-symphony.dts     |   43 +
 arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi      |   35 +-
 .../dts/ti/k3-am62p5-verdin-dev-nau8822-btl.dtso   |   14 +
 .../boot/dts/ti/k3-am62p5-verdin-ov5640-24mhz.dtso |   17 +
 .../arm64/boot/dts/ti/k3-am62p5-verdin-ov5640.dtsi |   72 +
 .../arm64/boot/dts/ti/k3-am62p5-verdin-ov5640.dtso |   18 +
 ...rt4-mcu.dtso =3D> k3-am62x-verdin-uart4-mcu.dtso} |    2 +-
 arch/arm64/boot/dts/ti/k3-am64-main.dtsi           |    2 +-
 .../boot/dts/ti/k3-am642-tqma64xxl-mbax4xxl.dts    |    1 +
 arch/arm64/boot/dts/ti/k3-am642-tqma64xxl.dtsi     |    1 +
 .../boot/dts/ti/k3-am6548-iot2050-advanced-sm.dts  |    2 +-
 .../dts/ti/k3-am67a-beagley-ai-csi0-imx219.dtso    |  118 +
 .../dts/ti/k3-am67a-beagley-ai-csi1-imx219.dtso    |  118 +
 arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts     |   68 +
 .../boot/dts/ti/k3-am68-phyboard-izar-pwm-fan.dtso |   74 +
 ...-aquila-adapter-panel-cap-touch-10inch-dsi.dtso |  155 ++
 ...9-aquila-adapter-panel-cap-touch-7inch-dsi.dtso |  155 ++
 arch/arm64/boot/dts/ti/k3-am69-aquila-clover.dts   |    2 +-
 .../dts/ti/k3-am69-aquila-csi1-ov5640-24mhz.dtso   |   18 +
 .../boot/dts/ti/k3-am69-aquila-csi1-ov5640.dtsi    |   76 +
 .../boot/dts/ti/k3-am69-aquila-csi1-ov5640.dtso    |   19 +
 .../dts/ti/k3-am69-aquila-csi2-ov5640-24mhz.dtso   |   18 +
 .../boot/dts/ti/k3-am69-aquila-csi2-ov5640.dtsi    |   76 +
 .../boot/dts/ti/k3-am69-aquila-csi2-ov5640.dtso    |   19 +
 .../boot/dts/ti/k3-am69-aquila-dsi-to-hdmi.dtso    |  115 +
 ...-aquila-dsi-to-lvds-panel-cap-touch-10inch.dtso |  142 ++
 .../k3-am69-aquila-panel-cap-touch-10inch-dsi.dtso |  158 ++
 .../k3-am69-aquila-panel-cap-touch-7inch-dsi.dtso  |  158 ++
 arch/arm64/boot/dts/ti/k3-j721e-sk.dts             |    2 +-
 arch/arm64/boot/dts/xilinx/versal-net-clk.dtsi     |  345 ++-
 arch/arm64/boot/dts/xilinx/versal-net.dtsi         |    4 +-
 arch/arm64/boot/dts/xilinx/xlnx-versal-clk.h       |  123 +
 arch/arm64/boot/dts/xilinx/xlnx-versal-net-clk.h   |   74 +
 arch/arm64/boot/dts/xilinx/xlnx-versal-net-power.h |   38 +
 .../arm64/boot/dts/xilinx/xlnx-versal-net-resets.h |   53 +
 arch/arm64/boot/dts/xilinx/xlnx-versal-power.h     |   55 +
 arch/arm64/boot/dts/xilinx/xlnx-versal-resets.h    |  106 +
 .../boot/dts/xilinx/zynqmp-sck-kv-g-revA.dtso      |   41 +-
 .../boot/dts/xilinx/zynqmp-sck-kv-g-revB.dtso      |    1 -
 .../boot/dts/xilinx/zynqmp-zc1751-xm015-dc1.dts    |    4 -
 .../boot/dts/xilinx/zynqmp-zc1751-xm019-dc5.dts    |    2 -
 arch/arm64/boot/dts/xilinx/zynqmp-zcu100-revC.dts  |    1 -
 arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revA.dts  |    2 -
 arch/arm64/boot/dts/xilinx/zynqmp-zcu104-revA.dts  |    1 -
 arch/arm64/boot/dts/xilinx/zynqmp-zcu104-revC.dts  |    1 -
 arch/arm64/boot/dts/xilinx/zynqmp-zcu106-revA.dts  |    2 -
 arch/arm64/boot/dts/xilinx/zynqmp-zcu111-revA.dts  |    1 -
 arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi  |    6 +
 arch/riscv/boot/dts/canaan/Makefile                |    2 +
 arch/riscv/boot/dts/canaan/k230-canmv.dts          |  343 +++
 arch/riscv/boot/dts/canaan/k230-evb.dts            |   39 +
 arch/riscv/boot/dts/canaan/k230-pinctrl.h          |   18 +
 arch/riscv/boot/dts/canaan/k230.dtsi               |  167 ++
 arch/riscv/boot/dts/sophgo/Makefile                |    2 +
 arch/riscv/boot/dts/sophgo/cv180x.dtsi             |   20 +-
 arch/riscv/boot/dts/sophgo/sg2000-milkv-duo-s.dts  |  244 ++
 arch/riscv/boot/dts/sophgo/sg2000.dtsi             |   53 +
 .../riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts |  121 +
 arch/riscv/boot/dts/spacemit/Makefile              |    1 +
 .../riscv/boot/dts/spacemit/k1-bananapi-cm6-io.dts |  177 ++
 arch/riscv/boot/dts/spacemit/k1-bananapi-cm6.dtsi  |  217 ++
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts    |   43 +-
 arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts  |   43 +-
 arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts     |    6 +-
 arch/riscv/boot/dts/spacemit/k1-opp.dtsi           |  105 +
 arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts   |   46 +-
 arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts   |    4 +-
 arch/riscv/boot/dts/spacemit/k1-pdma.h             |   56 +
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi       |   24 +-
 arch/riscv/boot/dts/spacemit/k1.dtsi               |   12 +-
 arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts     |   33 +
 arch/riscv/boot/dts/spacemit/k3-com260.dtsi        |   38 +-
 arch/riscv/boot/dts/spacemit/k3-pdma.h             |   83 +
 arch/riscv/boot/dts/spacemit/k3-pico-itx.dts       |  117 +-
 arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi       |   88 +
 arch/riscv/boot/dts/spacemit/k3.dtsi               |  121 +-
 arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts  |  141 +-
 arch/riscv/boot/dts/thead/th1520.dtsi              |   53 +-
 drivers/cpufreq/cpufreq-dt-platdev.c               |    2 +
 include/dt-bindings/arm/qcom,ids.h                 |    1 +
 include/dt-bindings/clock/qcom,glymur-camcc.h      |  122 +
 include/dt-bindings/clock/qcom,glymur-evacc.h      |   38 +
 include/dt-bindings/clock/qcom,shikra-gcc.h        |  263 ++
 829 files changed, 65511 insertions(+), 5390 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,glymur-=
evacc.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,shikra-=
gcc.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/xlnx,zynqmp-=
clk.yaml
 create mode 100644 arch/arm/boot/dts/allwinner/sun8i-t113s-netcube-dobe=
rmann.dts
 create mode 100644 arch/arm/boot/dts/qcom/msm8226-motorola-titan.dts
 create mode 100644 arch/arm/boot/dts/qcom/msm8926-sony-xperia-yukon-eag=
le.dts
 create mode 100644 arch/arm/boot/dts/rockchip/rv1126-alientek-clrv1126f=
.dtsi
 create mode 100644 arch/arm/boot/dts/rockchip/rv1126-alientek-dlrv1126.=
dts
 create mode 100644 arch/arm/boot/dts/ti/omap/am335x-icev2-prueth-overla=
y.dtso
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-a133-helperboar=
d-core.dtsi
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-a133-helperboar=
d.dts
 delete mode 100644 arch/arm64/boot/dts/amd/amd-seattle-clks.dtsi
 delete mode 100644 arch/arm64/boot/dts/amd/amd-seattle-xgbe-b.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/hwmon-common.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/hwmon-fan-dual.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/hwmon-fan.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/hwmon-laptop.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/hwmon-mini.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t6030-j514s.dts
 create mode 100644 arch/arm64/boot/dts/apple/t6030-j516s.dts
 create mode 100644 arch/arm64/boot/dts/apple/t6030-pmgr.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t6030.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t6031-base.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t6031-die0.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t6031-dieX.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t6031-gpio-pins.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t6031-j514c.dts
 create mode 100644 arch/arm64/boot/dts/apple/t6031-j516c.dts
 create mode 100644 arch/arm64/boot/dts/apple/t6031-pmgr.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t6031.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t6032-j575d.dts
 create mode 100644 arch/arm64/boot/dts/apple/t6032.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t6034-j514m.dts
 create mode 100644 arch/arm64/boot/dts/apple/t6034-j516m.dts
 create mode 100644 arch/arm64/boot/dts/apple/t6034.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t603x-j514-j516.dtsi
 create mode 100644 arch/arm64/boot/dts/exynos/exynos8855-pinctrl.dtsi
 create mode 100644 arch/arm64/boot/dts/exynos/exynos8855-smdk.dts
 create mode 100644 arch/arm64/boot/dts/exynos/exynos8855.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/fsl-lx2160a-pcie-mbvl.=
dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/fsl-lx2160a-rev1.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/fsl-lx2160a-serdes.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/fsl-lx2162a-serdes.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/fsl-lx2162a.dtsi
 rename arch/arm64/boot/dts/freescale/{fsl-lx2160a.dtsi =3D> fsl-lx216x.=
dtsi} (86%)
 create mode 100644 arch/arm64/boot/dts/freescale/fsl-lx216xa-pcie-gen3.=
dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-var-dart-sonata=
.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-verdin-dev-nau8=
822-btl.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-verdin-dsi-to-h=
dmi.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-verdin-dsi-to-l=
vds-panel-cap-touch-10inch.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-verdin-panel-ca=
p-touch-10inch-dsi.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-verdin-panel-ca=
p-touch-7inch-dsi.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-verdin-uart4-mc=
u.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mn-var-som-symphon=
y-legacy.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mn-var-som-wifi-br=
cm-legacy.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mn-var-som-wifi-bt=
-iw61x.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-evk-flexcan2.dt=
so
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-tqma8mpqs-mb-sm=
arc-2-lvds-g133han01.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-tqma8mpqs-mb-sm=
arc-2-lvds0-tm070jvhg33.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-tqma8mpqs-mb-sm=
arc-2-lvds1-tm070jvhg33.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-tqma8mpqs-mb-sm=
arc-2.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-tqma8mpqs.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-var-dart-sonata=
.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-var-dart.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qm-var-som-symphon=
y.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qm-var-som.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx91-9x9-qsb-can1.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx91-tqma9131-mba93xx=
ca.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-11x11-evk-dy1212=
w-4856.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xx=
la-lvds-tm070jvhg33.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-tqma9596la-mba95=
xxca.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-tqma9596la.dtsi
 create mode 100644 arch/arm64/boot/dts/intel/socfpga_agilex72.dtsi
 create mode 100644 arch/arm64/boot/dts/intel/socfpga_agilex72_socdk.dts
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra194-lenovo-thinkedge=
-se70.dts
 create mode 100644 arch/arm64/boot/dts/qcom/eliza-cqs-evk.dts
 create mode 100644 arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/eliza-evk.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3=
607oa.dts
 delete mode 100644 arch/arm64/boot/dts/qcom/lemans-auto.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/pm7550-eliza.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/pm8550vs-d-eliza.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/pm8550vs-g-eliza.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/pmk8550-eliza.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/pmr735d-eliza.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/qcom-adc5-gen3.h
 create mode 100644 arch/arm64/boot/dts/qcom/qcs6490-vicharak-axon-mini.=
dts
 create mode 100644 arch/arm64/boot/dts/qcom/qcs8550-rb5gen2.dts
 delete mode 100644 arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dts
 delete mode 100644 arch/arm64/boot/dts/qcom/sa8775p-ride.dts
 create mode 100644 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
 create mode 100644 arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
 create mode 100644 arch/arm64/boot/dts/qcom/shikra-evk.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
 create mode 100644 arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/shikra.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sm7325-motorola-dubai-commo=
n.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sm7325-motorola-dubai-csot.=
dts
 create mode 100644 arch/arm64/boot/dts/qcom/sm7325-motorola-dubai-tianm=
a.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sm7325-xiaomi-taoyao.dts
 create mode 100644 arch/arm64/boot/dts/qcom/x1e80100-honor-magicbook-ar=
t-14.dts
 create mode 100644 arch/arm64/boot/dts/qcom/x1p42100-microsoft-sp12in.d=
ts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3399-vicharak-vaaman.=
dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3528-hinlink-h28k.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3568-graperain-g3568-=
v2.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3568-lincstation-e1.d=
ts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3576-anbernic-rg-vita=
-pro.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5-io.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5.dtsi
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3576-lckfb-tspi-3m.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-vicharak-axon.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-vicharak-vaaman2=
.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-youyeetoo-yy3588=
.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588s-lubancat-4.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-5b.d=
tsi
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-pro.=
dts
 create mode 100644 arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-s.dts
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-beagleplay-lincolnte=
ch-lcd185-panel.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-sk-microtips-mf101hi=
e-panel.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-var-som-symphony.dts
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-var-som.dtsi
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-verdin-dev-mezzanine=
-panel-cap-touch-10inch-lvds-v2.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-verdin-dsi-to-lvds-v=
2-panel-cap-touch-10inch.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-verdin-panel-cap-tou=
ch-10inch-lvds-v2.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-verdin-rpi-display-2=
-7in.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62l3-beaglebadge.dts
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62p5-verdin-dev-nau8822-=
btl.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62p5-verdin-ov5640-24mhz=
.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62p5-verdin-ov5640.dtsi
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62p5-verdin-ov5640.dtso
 rename arch/arm64/boot/dts/ti/{k3-am625-verdin-uart4-mcu.dtso =3D> k3-a=
m62x-verdin-uart4-mcu.dtso} (69%)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am67a-beagley-ai-csi0-imx2=
19.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am67a-beagley-ai-csi1-imx2=
19.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am68-phyboard-izar-pwm-fan=
.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am69-aquila-adapter-panel-=
cap-touch-10inch-dsi.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am69-aquila-adapter-panel-=
cap-touch-7inch-dsi.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am69-aquila-csi1-ov5640-24=
mhz.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am69-aquila-csi1-ov5640.dt=
si
 create mode 100644 arch/arm64/boot/dts/ti/k3-am69-aquila-csi1-ov5640.dt=
so
 create mode 100644 arch/arm64/boot/dts/ti/k3-am69-aquila-csi2-ov5640-24=
mhz.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am69-aquila-csi2-ov5640.dt=
si
 create mode 100644 arch/arm64/boot/dts/ti/k3-am69-aquila-csi2-ov5640.dt=
so
 create mode 100644 arch/arm64/boot/dts/ti/k3-am69-aquila-dsi-to-hdmi.dt=
so
 create mode 100644 arch/arm64/boot/dts/ti/k3-am69-aquila-dsi-to-lvds-pa=
nel-cap-touch-10inch.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am69-aquila-panel-cap-touc=
h-10inch-dsi.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am69-aquila-panel-cap-touc=
h-7inch-dsi.dtso
 create mode 100644 arch/arm64/boot/dts/xilinx/xlnx-versal-clk.h
 create mode 100644 arch/arm64/boot/dts/xilinx/xlnx-versal-net-clk.h
 create mode 100644 arch/arm64/boot/dts/xilinx/xlnx-versal-net-power.h
 create mode 100644 arch/arm64/boot/dts/xilinx/xlnx-versal-net-resets.h
 create mode 100644 arch/arm64/boot/dts/xilinx/xlnx-versal-power.h
 create mode 100644 arch/arm64/boot/dts/xilinx/xlnx-versal-resets.h
 create mode 100644 arch/riscv/boot/dts/canaan/k230-canmv.dts
 create mode 100644 arch/riscv/boot/dts/canaan/k230-evb.dts
 create mode 100644 arch/riscv/boot/dts/canaan/k230-pinctrl.h
 create mode 100644 arch/riscv/boot/dts/canaan/k230.dtsi
 create mode 100644 arch/riscv/boot/dts/sophgo/sg2000-milkv-duo-s.dts
 create mode 100644 arch/riscv/boot/dts/sophgo/sg2000.dtsi
 create mode 100644 arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts
 create mode 100644 arch/riscv/boot/dts/spacemit/k1-bananapi-cm6-io.dts
 create mode 100644 arch/riscv/boot/dts/spacemit/k1-bananapi-cm6.dtsi
 create mode 100644 arch/riscv/boot/dts/spacemit/k1-opp.dtsi
 create mode 100644 arch/riscv/boot/dts/spacemit/k1-pdma.h
 create mode 100644 arch/riscv/boot/dts/spacemit/k3-pdma.h
 create mode 100644 include/dt-bindings/clock/qcom,glymur-camcc.h
 create mode 100644 include/dt-bindings/clock/qcom,glymur-evacc.h
 create mode 100644 include/dt-bindings/clock/qcom,shikra-gcc.h
