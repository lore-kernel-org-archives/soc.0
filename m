Received: from fhigh-b7-smtp.messagingengine.com (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B375B146A66
	for <soc@lists.linux.dev>; Thu, 16 Apr 2026 22:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776378237; cv=none; b=Do0MPjDHZ0J7K2YFRGQY62j2Gz0reMszdSq14fBwV5aRA7l2OVZRp1X+gPpRrMiHnGgseUM8TwZZehOTlmQq3f9okV9EhABR/taT2FzcAWWcfUOetZXSn1hxuMAPpbfuqHqUitIiqbVJa0mgdCxnMWHyBPaLjwOKtOhvHfUXa5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776378237; c=relaxed/simple;
	bh=MjGUMPjIAa3sSb3FMbc4XjCxcIEULsVx6Uz3EE2I8Ew=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=XoKdHJsLpIKBKbZgN+5BcveeBOa4mEwPPMO8UKYyeD4ucd5KHyt8OQVhDxFbBzLz/DQrO57AsosLWm12qPdJaKMoRuvAHJLQTlLmZknl4+yRD7zY8AwlMIqZ6dRbvnEW2RMprV2e/XZ7it6fZd+h9ZOlkWs7I5DSyswaPjnkImE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=OknL7Ub/; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=mpy4tomQ; arc=none smtp.client-ip=202.12.124.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="OknL7Ub/";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="mpy4tomQ"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 131427A02E2;
	Thu, 16 Apr 2026 18:23:51 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Thu, 16 Apr 2026 18:23:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1776378230;
	 x=1776464630; bh=BhsYHMlKy5QdLK1GLFCqI6sfK24qSunH8r2d6e3SHt0=; b=
	OknL7Ub/g5QCDTooVE0pZ6CuO/Xqklpgr8uEKTKxxRwhexhJbZ2NnYFVfsik9iZN
	jwblMdDMx2cxyJLwNDcuwPU7E7bV5OL4J456RP/TaAHgvQ6Kpn615Poqh5jXft+Q
	fXeKtD15rVNnoSZRBC5z8g+erAJ8+bGvP4ZLZX/f9VSkyfWgYbwp5WGOwu8audGF
	rAfRKJ4iZBKn0CbShfGkkENj4OHzbz4ISSpezdlYimsanTfvnEz5dOqCYEkdi9p+
	e3CE2khPZEft9NPx2YHCHgDvU0B4r3ugErG23cVB3GYEXVf0aBbSrOVWnuIB9V5s
	bu5KLZaap64QUuGdpagzHg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1776378230; x=
	1776464630; bh=BhsYHMlKy5QdLK1GLFCqI6sfK24qSunH8r2d6e3SHt0=; b=m
	py4tomQAmmiRpzwMmCf5ByfRlBmJ8uZH94g7HhWqxnY/Ogx4VRhaQdyQjA8XpX9I
	kfKxS9TwOSo3/LfBIliUEVCDB+BNDIR2hLRZu21GLVGPxrXmBzkC3ad4qdqBWPa4
	2v8Y4KLrk3XdPd+pSH1MXvJeOGOFX1UDgwhHU5QvzOa2TEHRYJqFUB4NFboh1HTn
	Pi8IjIKXM9hzlgfbplsk3/q/orjcVnt6Ny4IoQA+n+QohOCNTgL0EgRgo+AjE7CW
	aI6jgHIjGxRA/5RTTIb+9lhNwZh4R4ev7cs7/npXtrZiCdMDjTF9p4n9R5gJN+Gw
	WSlpc/jEodtzmlMZvcvcQ==
X-ME-Sender: <xms:dmHhacbgSIPvawgP1Hy7oTFKI0AJ9st2MwJ0aNlCggOI15CmCDQcGA>
    <xme:dmHhaSNsECYog3IZGrxZ8o8_njYkfY0mYcz4tssA2-NoAT8KNK9-Oq_PRPLA22gS5
    ipqGJCn1sYFzs_ptmgH4JEtfXpH7YvAYUqIwoMtRcXrHrrZslyOjg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdegkedulecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthhqredtredtjeenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpefgieethfevledvffeihfetgfeitdevffefvdegvdetkeeitdetkeehuefguedvhfen
    ucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdhgihhthhhusgdrtghomhdpfhhrrghnkh
    drlhhinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhep
    rghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepgedpmhhouggvpehsmhhtph
    houhhtpdhrtghpthhtohepthhorhhvrghlughssehlihhnuhigqdhfohhunhgurghtihho
    nhdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtsh
    drihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehsohgtsehlihhsthhsrdhlihhn
    uhigrdguvghvpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrh
    hnvghlrdhorhhg
X-ME-Proxy: <xmx:dmHhaWHW3iuW73Eh9fxTTGCDVEgkg2JeHsaTfikdoNhzcICcjyDHOw>
    <xmx:dmHhaeNTFb1O87q3Z4UBBmr6uAxhryapkL-XRpMLGodZXWGfqdKQYA>
    <xmx:dmHhaYc8yX2BaqJaUjzLuNW67FP0VbG2c4lakHiTa3lWat5Pfzv0xg>
    <xmx:dmHhabs5Jb9zM81RP8mmj0EZeHwG7hs6Vgez7hWxeJ9qiq8vq4W0Ag>
    <xmx:dmHhaVfNRowNVF7rUW3QI2FSUT554i8XKRRGfvNmRdYcZGu85f1nL25k>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 3793A700065; Thu, 16 Apr 2026 18:23:50 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Fri, 17 Apr 2026 00:22:48 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
Cc: soc@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Message-Id: <b3203b1d-4c1d-49b8-924e-c17cf6be7ec0@app.fastmail.com>
In-Reply-To: <c595dc8e-6367-4922-98ed-90bdd4c3c24f@app.fastmail.com>
References: <c595dc8e-6367-4922-98ed-90bdd4c3c24f@app.fastmail.com>
Subject: [GIT PULL 1/4] soc: dt changes for 7.1
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The following changes since commit 85c2601e2c2feb60980c7ca23de28c49472f6=
1f1:

  arm64: dts: renesas: r8a78000: Fix out-of-range SPI interrupt numbers =
(2026-03-06 13:15:21 +0100)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-d=
t-7.1

for you to fetch changes up to 41d7004ab4e521ccbd98793d7da55022796c463f:

  Merge tag 'ti-k3-dt-for-v7.1-part2' of ssh://gitolite.kernel.org/pub/s=
cm/linux/kernel/git/ti/linux into soc/dt (2026-04-14 18:43:28 +0200)

----------------------------------------------------------------
soc: dt changes for 7.1

A number of SoC platforms are adding modernized variants of their
already supported chips time, with a total of 12 new SoCs,
and two older SoC getting removed:

 - Qualcomm Glymur is a compute SoC using 18 Oryon-2 CPU cores
 - Qualcomm Mahua is a variant of Glymur with only 12 CPU cores, but
   largely identical.
 - Qualcomm Eliza is an embeded platform for mobile phone (SM7750) and I=
OT
   (QC7790S/M) workloads
 - Qualcomm IPQ5210 is a wireless networking SoC using Cortex-A53 cores
 - Qualcomm apq8084 and ipq806x had only rudimentary support but no
   actual products using them, so they are now gone.
 - Axis ARTPEC-9 is a follow-up to the ARTPEC-8 embedded SoC, using
   the Samsung SoC platform but now with Cortex-A55 cores
 - ARM Zena is a virtual platform in FVP using Cortex-A720AE cores, with
   additional versions planned to be merged in the future.
 - ARM corstone-1000-a320 is a reference platform for IOT, using low-end
   Cortex-A320 cores
 - Microchip LAN9691 is an updated 64-bit variant of the arm32 lan966x
   series of networking SoCs
 - Microchip PIC64GX is an embedded RISC-V chip using SIFIVE U54 CPU cor=
es
 - Rockchip RV1103B is the low-end 32-bit single-core vision processor
 - Renesas RZ/G3L (r9a08g046) is an industrial embedded chip using
   Cortex-A55 cores, similar to the G3E and G3S variants we already
   supported.
 - NXP S32N79 is an automotive SoC using Cortex-A78AE cores, a
   significant upgrade from the older S32V and S32G series

These all come with at least one reference board or an initial product
using these, in total there are 67 newly added boards. The ones for
already supported SoCs are:

 - Two more Aspeed BMC based boards
 - Three older tablets based on 32-bit OMAP4 and Exynos5 SoCs
 - One Set-top-box based on Allwinner H6
 - 22 additional industrial/embedded boards using 64-bit NXP i.MX8M
   or i.MX9 SoCs
 - 20 Qualcomm SoC based machines across all possible markets:
   workstation, gaming, laptop, phone, networking, reference, ...
 - Three more Rockchips rk35xx based boards
 - Four variants of the Toradex Verdin using TI AM62

Other notable bits are:

 - A cleanup for the 32-bit Tegra paz00 board moved the last
   board specific code on Tegra into equivalent dts syntax.
 - There continues to be a significant number of fixes for static
   checking of dtc syntax, but it feels like this is slowing down,
   hopefully getting into a state where most known issues are
   addressed
 - Additional hardware support for many existing boards across SoC
   families, notably Qualcomm, Broadcom, i.MX2, i.MX6, Rockchips,
   STM32, Mediatek, Tegra, TI and Microchip

----------------------------------------------------------------
Aaron Kling (1):
      arm64: dts: qcom: sm8550: Add ACD levels for GPU

Abel Vesa (13):
      dt-bindings: interconnect: OSM L3: Add Eliza EPSS L3 compatible
      dt-bindings: arm: qcom: Document Eliza SoC and its MTP board
      arm64: dts: qcom: Introduce Eliza Soc base dtsi
      arm64: dts: qcom: eliza: Enable Eliza MTP board support
      arm64: dts: qcom: glymur: Describe display-related nodes
      arm64: dts: qcom: glymur-crd: Enable eDP display support
      arm64: dts: qcom: glymur-crd: Enable keyboard, trackpad and touchs=
creen
      arm64: dts: qcom: glymur-crd: Enable WLAN and Bluetooth
      arm64: dts: qcom: eliza: Coding style clean-ups
      arm64: dts: qcom: eliza: Add missing CX power domain to GCC
      arm64: dts: qcom: eliza: Add missing msi-parent for UFS
      arm64: dts: qcom: milos: Add missing CX power domain to GCC
      arm64: dts: qcom: glymur-crd: Enable DisplayPort support

Adam Ford (1):
      arm64: dts: renesas: beacon-renesom: Remove LVDS Panel

Akari Tsuyukusa (3):
      arm64: dts: mediatek: mt6795: Fix gpio-ranges pin count
      arm64: dts: mediatek: mt7981b: Fix gpio-ranges pin count
      arm64: dts: mediatek: mt7986a: Fix gpio-ranges pin count

Alain Volmat (10):
      ARM: dts: stm32: add sram node within stm32mp151.dtsi
      ARM: dts: stm32: enable DCMI DMA-MDMA chaining on stm32mp157c-ev1.=
dts
      ARM: dts: stm32: update i2c nodes interrupt/dma in stm32mp151
      ARM: dts: stm32: update i2c nodes interrupt/wakeup-source in stm32=
mp131
      arm64: dts: st: update i2c nodes interrupt/wakeup-source in stm32m=
p251
      arm64: dts: st: update i2c nodes interrupt/wakeup-source in stm32m=
p231
      arm64: dts: st: add i2c2 pinmux nodes in stm32mp25-pinctrl.dtsi
      arm64: dts: st: disable DMA usage for i2c on stm32mp257f-ev1
      arm64: dts: st: describe i2c2 / i2c8 on stm32mp257f-dk
      arm64: dts: st: describe i2c2 / i2c8 on stm32mp235f-dk

Aleksandrs Vinarskis (1):
      arm64: dts: qcom: x1-asus-zenbook-a14: add HDMI port

Alexander Feilke (3):
      ARM: dts: imx7s: add boot phase properties
      ARM: dts: tqma7: add boot phase properties
      ARM: dts: imx7-mba7: Deassert BOOT_EN after boot

Alexander Koskovich (1):
      arm64: dts: qcom: sm8250: Add missing CPU7 3.09GHz OPP

Alexander Martinz (1):
      arm64: dts: qcom: sdm845-shift-axolotl: Enable TFA9890 codec

Alexander Stein (23):
      arm64: dts: tqma8mpql-mba8mpxl: Configure multiple queues on eqos
      arm64: dts: tqma8mpql-mba8mp-ras314: Configure multiple queues on =
eqos
      arm64: dts: imx8qm-ss-hsio: Wire up DMA IRQ for PCIe
      arm64: dts: tqma9352-mba93xx*: Change Ethernet PHY IRQ to IRQ_TYPE=
_LEVEL_LOW
      arm64: dts: tqma9352-mba91xxca: Change Ethernet PHY IRQ to IRQ_TYP=
E_LEVEL_LOW
      arm64: dts: imx91: Remove TMU's superfluous sensor ID
      arm64: dts: imx8mp-tqma8mpql-mba8mpxl-g133han01: Remove compatible=
 from overlay
      arm64: dts: imx8mp-tqma8mpql-mba8mpxl-tm070jvhg33: Remove compatib=
le from overlay
      arm64: dts: imx8mq-tqma8mq-mba8mx-tm070jvhg33: Remove compatible f=
rom overlay
      arm64: dts: imx8mn-tqma8mqnl-mba8mx-tm070jvhg33: Remove compatible=
 from overlay
      arm64: dts: imx8mm-tqma8mqml-mba8mx-tm070jvhg33: Remove compatible=
 from overlay
      arm64: dts: imx93-tqma9352-mba91xxca: Add parallel display overlay
      arm64: dts: imx93-tqma9352-mba91xxca: Add LVDS display overlay
      arm64: dts: imx91-tqma9131-mba91xxca: Add parallel display overlay
      arm64: dts: imx91-tqma9131-mba91xxca: Add LVDS display overlay
      arm64: dts: imx8mm: Explicitly set DSI_PHY_REF clock as a child of=
 CLK_24M
      arm64: dts: imx8mm-tqma8mqml-mba8mx: LVDS overlay: Reduce DSI burs=
t clock to 600Mhz
      arm64: dts: imx8mn-tqma8mqnl-mba8mx: LVDS overlay: Reduce DSI burs=
t clock to 600Mhz
      arm64: dts: imx95: Move funnel outside from soc
      arm64: dts: mba8mx: Add DSI->LVDS bridge IRQ
      arm64: dts: freescale: tqma8mqml/tqma8mxnl-mba8mx: Add dual-channe=
l LVDS overlay
      arm64: dts: imx8mp-tqma8mpql-mba8mp-ras314: add vcc supply for BT =
device
      arm64: dts: imx8mp-tqma8mpql: Add DT overlays to explicit list

Alexandre Marquet (2):
      dt-bindings: ARM: samsung: Add Google Manta (Nexus 10)
      ARM: dts: exynos: Add Google Manta (Nexus 10)

Alexey Charkov (1):
      arm64: dts: rockchip: Add analog audio switches to RK3576 EVB1

Amelie Delaunay (3):
      ARM: dts: stm32: fix misalignments in nodes of stm32mp151
      ARM: dts: stm32: fix misalignments in nodes of stm32mp131
      arm64: dts: st: omit unused pinctrl groups from stm32mp25 dtb files

Amir Dahan (1):
      arm64: dts: qcom: sdm845-lg-common: Add LEDs

Anand Moon (1):
      arm64: dts: rockchip: Enable PCIe CLKREQ# for RK3588 on Rock 5b-5b=
p-5t series

Andras Sebok (1):
      arm64: dts: exynos: add initial support for Samsung Galaxy J5

Andrej Picej (1):
      arm64: dts: imx93-phyboard-segin: Add peb-av-02 overlay

Andrew Davis (2):
      arm64: dts: ti: k3-j7200: Make MAIN domain system control bus a si=
mple-bus
      arm64: dts: ti: k3-j721s2: Make MAIN domain system control bus a s=
imple-bus

Andrew Goodbody (1):
      ARM: dts: omap: dm816x: Correct pinctrl register

Andr=C3=A9 Draszik (2):
      arm64: dts: exynos: gs101-pixel: add all S2MPG1x regulators
      arm64: dts: exynos: gs101-pixel-common: add Maxim MAX77759 fuel ga=
uge

Andy Yan (1):
      arm64: dts: rockchip: Add DisplayPort dt node for rk3576

Aniket Limaye (1):
      arm64: dts: ti: k3-j722s: Add main_i2c4 device node

Anirudh Srinivasan (4):
      dt-bindings: arm: aspeed: Add Asus Kommando IPMI card
      ARM: dts: aspeed: Add Asus Kommando IPMI card
      dt-bindings: arm: aspeed: Add Asrock Paul IPMI card
      ARM: dts: aspeed: Add Asrock Paul IPMI card

Annette Kobou (1):
      arm64: dts: imx8mp-kontron: Fix boot order for PMIC and RTC

Anurag Dutta (1):
      arm64: dts: ti: k3-j721s2-common-proc-board: Add QSPI flash partit=
ion details

Arnd Bergmann (16):
      Merge tag 'arm-soc/for-7.1/devicetree' of https://github.com/Broad=
com/stblinux into soc/dt
      Merge tag 'arm-soc/for-7.1/devicetree-arm64' of https://github.com=
/Broadcom/stblinux into soc/dt
      Merge tag 'samsung-dt64-7.1' of https://git.kernel.org/pub/scm/lin=
ux/kernel/git/krzk/linux into soc/dt
      Merge tag 'samsung-dt-7.1' of https://git.kernel.org/pub/scm/linux=
/kernel/git/krzk/linux into soc/dt
      Merge tag 'stm32-dt-for-7.1-1' of git://git.kernel.org/pub/scm/lin=
ux/kernel/git/atorgue/stm32 into soc/dt
      Merge tag 'renesas-dts-for-v7.1-tag2' of git://git.kernel.org/pub/=
scm/linux/kernel/git/geert/renesas-devel into soc/dt
      Merge tag 'cix-dt-v7.1-rc1' of git://git.kernel.org/pub/scm/linux/=
kernel/git/peter.chen/cix into soc/dt
      Merge tag 'thead-dt-for-v7.1-p2' of git://git.kernel.org/pub/scm/l=
inux/kernel/git/fustini/linux into soc/dt
      Merge tag 'socfpga_updates_for_v7.1_v2' of git://git.kernel.org/pu=
b/scm/linux/kernel/git/dinguyen/linux into soc/dt
      Merge tag 'hisi-arm64-dt-for-7.1' of https://github.com/hisilicon/=
linux-hisi into soc/dt
      Merge tag 'qcom-arm32-for-7.1' of https://git.kernel.org/pub/scm/l=
inux/kernel/git/qcom/linux into soc/dt
      Merge tag 'sunxi-dt-for-7.1' of https://git.kernel.org/pub/scm/lin=
ux/kernel/git/sunxi/linux into soc/dt
      Merge tag 'ti-k3-dt-for-v7.1' of https://git.kernel.org/pub/scm/li=
nux/kernel/git/ti/linux into soc/arm
      Merge tag 'v7.1-rockchip-dts64-2' of https://git.kernel.org/pub/sc=
m/linux/kernel/git/mmind/linux-rockchip into soc/arm
      Merge tag 'omap-for-v7.1/soc-signed' of git://git.kernel.org/pub/s=
cm/linux/kernel/git/khilman/linux-omap into soc/arm
      Merge tag 'qcom-arm64-for-7.1' of https://git.kernel.org/pub/scm/l=
inux/kernel/git/qcom/linux into soc/dt

Aurelien Jarno (7):
      riscv: dts: spacemit: drop incorrect pinctrl for combo PHY
      riscv: dts: spacemit: add LEDs for Milk-V Jupiter board
      riscv: dts: spacemit: add 24c04 eeprom on Milk-V Jupiter
      riscv: dts: spacemit: add i2c aliases on Milk-V Jupiter
      riscv: dts: spacemit: enable QSPI and add SPI NOR on Milk-V Jupiter
      riscv: dts: spacemit: enable USB 3 ports on Milk-V Jupiter
      riscv: dts: spacemit: enable PCIe ports on Milk-V Jupiter

Ayushi Makhija (2):
      arm64: dts: qcom: qcs8300: add Display Serial Interface device nod=
es
      arm64: dts: qcom: qcs8300-ride: add anx7625 DSI to DP bridge node

Barnab=C3=A1s Cz=C3=A9m=C3=A1n (16):
      arm64: dts: qcom: sm6125-xiaomi-ginkgo: Remove board-id
      arm64: dts: qcom: sm6125-xiaomi-ginkgo: Correct reserved memory ra=
nges
      arm64: dts: qcom: sm6125-xiaomi-ginkgo: Set memory-region for fram=
ebuffer
      arm64: dts: qcom: sm6125-xiaomi-ginkgo: Remove extcon
      arm64: dts: qcom: sm6125-xiaomi-ginkgo: Fix reserved gpio ranges
      dt-bindings: arm: qcom: Add Xiaomi Redmi Note 8T
      arm64: dts: qcom: Add Redmi Note 8T
      arm64: dts: qcom: msm8953-xiaomi-vince: correct wled ovp value
      arm64: dts: qcom: msm8937-xiaomi-land: correct wled ovp value
      arm64: dts: qcom: msm8953-xiaomi-daisy: fix backlight
      arm64: dts: qcom: msm8917-xiaomi-riva: Fix board-id for all bootlo=
ader
      arm64: dts: qcom: Make a common base from Redmi 5A
      arm64: dts: qcom: msm8917-xiaomi-wingtech: Add goodix touch
      dt-bindings: arm: qcom: Add Redmi 4A and Go
      arm64: dts: qcom: Add Redmi 4A
      arm64: dts: qcom: Add Redmi Go

Bartosz Golaszewski (1):
      arm64: dts: qcom: remove msm8996-v3.0.dtsi

Bhargav Joshi (1):
      arm64: dts: hisilicon: Rename dwmmc nodes to mmc

Biju Das (5):
      dt-bindings: clock: renesas,rzg2l-cpg: Document RZ/G3L SoC
      arm64: dts: renesas: Add initial DTSI for RZ/G3L SoC
      arm64: dts: renesas: Add initial support for RZ/G3L SMARC SoM
      arm64: dts: renesas: renesas-smarc2: Move usb3 nodes to board DTS
      arm64: dts: renesas: Add initial device tree for RZ/G3L SMARC EVK =
board

Biswapriyo Nath (5):
      arm64: dts: qcom: sm6125-xiaomi-ginkgo: Fix volume up button
      arm64: dts: qcom: sm6125: Add PRNG node
      arm64: dts: qcom: sm6125: Add debug UART node
      arm64: dts: qcom: sm6125-xiaomi-ginkgo: Enable debug UART
      arm64: dts: qcom: pm6125: Enable RTC by default

Bjorn Andersson (7):
      Merge branch '20260303034847.13870-2-val@packett.cool' into arm64-=
for-7.1
      Merge branch '20260311-eliza-clocks-v6-1-453c4cf657a2@oss.qualcomm=
.com' into HEAD
      Merge branch 'icc-eliza' of https://git.kernel.org/pub/scm/linux/k=
ernel/git/djakov/icc into HEAD
      Merge branch '20260318-ipq5210_boot_to_shell-v2-1-a87e27c37070@oss=
.qualcomm.com' into HEAD
      arm64: dts: qcom: qcs6490-rb3gen2: Enable uPD720201 and GL3590
      dt-bindings: arm: qcom: Document the Lenovo IdeaCentre Mini X
      arm64: dts: qcom: Add the Lenovo IdeaCentre Mini X

Canfeng Zhuang (2):
      arm64: dts: qcom: lemans-evk: enable UART0 for robot expansion boa=
rd
      arm64: dts: qcom: monaco-evk: enable UART6 for robot expansion boa=
rd

Carl Lee (1):
      ARM: dts: aspeed: anacapa: add NFC device

Casey Connolly (2):
      arm64: dts: qcom: sdm845-shift-axolotl: Enable sdcard
      arm64: dts: qcom: sdm845-shift-axolotl: Set higher touchscreen i2c=
 clock

Chaoyi Chen (4):
      dt-bindings: arm: rockchip: Add rk3576 evb2 board
      arm64: dts: rockchip: Add rk3576 evb2 board
      arm64: dts: rockchip: Fix sdmmc pwren pinctrl for rk3576-evb2
      arm64: dts: rockchip: Enable displayport for rk3576 evb2

Charan Pedumuru (2):
      arm: dts: microchip: remove unused #address-cells/#size-cells from=
 sam9x60 udc node
      arm: dts: ti: omap: align node patterns with established convention

Chen-Yu Tsai (10):
      arm64: dts: mediatek: mt8195-cherry: Disable xhci1 completely
      arm64: dts: mediatek: mt8195-cherry: add WiFi PCIe and BT USB powe=
r supplies
      arm64: dts: mediatek: mt8195-cherry-dojo: Describe M.2 M-key NVMe =
slot
      dt-bindings: leds: sun50i-a100: Add compatible for Allwinner A523 =
SoC
      arm64: dts: allwinner: sun55i-a523: Add LED controller
      arm64: dts: allwinner: sun55i-t527: avaota-a1: Enable LEDs
      arm64: dts: allwinner: sun55i-a523: Add pinmux for spi0 on PJ pins
      arm64: dts: allwinner: sun55i-t527: avaota-a1: Add SPI NAND
      arm64: dts: allwinner: sun50i-a64: add UART DMA channels
      arm64: dts: allwinner: sun50i-h6: add UART DMA channels

Chris Morgan (3):
      arm64: dts: rockchip: add Awinic aw87391 amplifiers for Anbernic R=
G-DS
      arm64: dts: rockchip: Correct Fan Supply for Gameforce Ace
      arm64: dts: rockchip: Correct Joystick Axes on Gameforce Ace

Christophe Parant (11):
      ARM: dts: stm32: phycore-stm32mp15: Rename device tree files
      ARM: dts: stm32: phyboard-sargas: Introduce SoM device tree
      dt-bindings: arm: stm32: Modify STM32MP15x Phytec board items types
      ARM: dts: stm32: Add new pinmux groups for phyboard-sargas and phy=
core
      ARM: dts: stm32: phyboard-sargas: Fix uart4 and sai2 pinctrl
      ARM: dts: stm32: phycore-stm32mp15: qspi: Fix memory map and pinct=
rl
      ARM: dts: stm32: phycore-stm32mp15: Add dummy memory-node
      ARM: dts: stm32: phyboard-sargas: Move aliases from dts to dtsi
      ARM: dts: stm32: phycore-stm32mp15: Disable optional SoM periphera=
ls
      ARM: dts: stm32: phyboard-sargas and phycore: Fix coding style iss=
ues
      ARM: dts: stm32: phyboard-sargas and phycore: Add optional interfa=
ces

Christopher Brown (1):
      arm64: dts: qcom: sdm845-lg-judyln: Add battery and charger

Christopher Obbard (1):
      arm64: dts: qcom: msm8996: fix indentation in sdhc2 node

Chukun Pan (2):
      riscv: dts: spacemit: Add 'linux,pci-domain' to PCIe nodes for K1
      riscv: dts: spacemit: reorder phy nodes for K1

Ciprian Marian Costea (2):
      arm64: dts: freescale: Add NXP S32N79 SoC support
      arm64: dts: freescale: Add NXP S32N79-RDB board support

Conor Dooley (3):
      riscv: dts: microchip: add pinctrl nodes for mpfs/icicle kit
      riscv: dts: microchip: add tsu clock to macb on mpfs
      riscv: dts: microchip: update mpfs gpio interrupts to better match=
 the SoC

Cosmin Tanislav (2):
      arm64: dts: renesas: r9a09g077: Wire up DMA support for SPI
      arm64: dts: renesas: r9a09g087: Wire up DMA support for SPI

Daniel Baluta (2):
      arm64: dts: imx8mp: Make MX8MP_I2C_DEFAULT independent on drive st=
rength
      arm64: dts: imx8mp-frdm: Use symbolic macros for IOMUXC_SW_PAD_CTL=
_PAD

Dario Binacchi (1):
      ARM: dts: imx6ull-engicam-microgea-bmm: set touchscreen glitch thr=
eshold

David Heidelberg (5):
      arm64: dts: qcom: sdm845: Introduce camera master clock pinctrl
      arm64: dts: rockchip: assign pipe clock to rk356x PCIe lanes
      arm64: dts: qcom: sdm845-xiaomi-beryllium: Mark l1a regulator as p=
owered during boot
      arm64: dts: qcom: sdm845-google: Describe Wi-Fi/BT properly
      arm64: dts: qcom: sdm845-oneplus: Describe Wi-Fi/BT properly

David Lechner (1):
      arm64: dts: mediatek: mt6359: give regulators unique names

Debbie Horsfall (3):
      dt-bindings: arm: Add Zena CSS compatibility
      arm64: dts: zena: Add support for Zena CSS
      arm64: dts: zena: Move SRAM into SoC and memory node out of SoC

Dhruva Gole (1):
      arm64: dts: ti: k3-am62l: support cpufreq scaling

Dinh Nguyen (1):
      dt-bindings: intel: Add Agilex5 SoCFPGA modular board

Diogo Ivo (1):
      arm64: tegra: smaug: Enable SPI-NOR flash

Dirk Chen (1):
      ARM: dts: aspeed: anacapa: Add retimer EEPROMs

Dmitry Baryshkov (20):
      dt-bindings: arm: qcom: add Dragonboard 820c using APQ8096SG SoC
      arm64: dts: qcom: add apq8096sg-db820c, AP8096SG variant of DB820c
      arm64: dts: qcom: correct RBR opp entry
      ARM: dts: qcom: drop apq8084 support
      arm64: dts: qcom: qrb2210-arduino-imola: describe DSI / DP bridge
      arm64: dts: qcom: hamoa: correct Iris corners for the MXC rail
      arm64: dts: qcom: lemans: correct Iris corners for the MXC rail
      arm64: dts: qcom: monaco: correct Iris corners for the MXC rail
      arm64: dts: qcom: sm8550: correct Iris corners for the MXC rail
      arm64: dts: qcom: sm8650: correct Iris corners for the MXC rail
      arm64: dts: qcom: sm8750: correct Iris corners for the MXC rail
      arm64: dts: qcom: qrb2210-rb1: describe WiFi/BT properly
      arm64: dts: qcom: qrb4210-rb2: describe WiFi/BT properly
      arm64: dts: qcom: sda660-ifc6560: describe WiFi/BT properly
      arm64: dts: qcom: sdm845-db845c: describe WiFi/BT properly
      arm64: dts: qcom: sm8150-hdk: describe WiFi/BT properly
      arm64: dts: qcom: sc7280-chrome-common: disable Venus
      arm64: dts: qcom: purwa: deduplicate thermal sensors with Hamoa
      arm64: dts: qcom: patch mahua thermal zones by label
      ARM: dts: qcom: msm8974: Drop RPM bus clocks

Dmitry Torokhov (1):
      ARM: tegra: paz00: Configure WiFi rfkill switch through device tree

Dominik Haller (5):
      arm64: dts: ti: k3-am68-phyboard-izar: Assign dss clocks
      arm64: dts: ti: k3-am68-phycore-som: Add DSI->LVDS bridge
      arm64: dts: ti: k3-am68-phyboard-izar: Add LVDS-Display
      arm64: dts: ti: k3-j721s2-main: Add DSI1
      arm64: dts: ti: k3-am68-phyboard-izar: Add PEB-AV-15 overlay

Eduard Bostina (1):
      arm64: dts: imx8mp-dhcom-pdk3: Use symbolic macro for IOMUXC_SAI2_=
TXC__GPIO4_IO25

Emanuele Ghidoli (2):
      arm64: dts: freescale: imx95-toradex-smarc: fix PMIC_SD2_VSEL labe=
l position
      arm64: dts: freescale: imx95-toradex-smarc: Support Cortex M7

Erikas Bitovtas (2):
      arm64: dts: qcom: msm8939-asus-z00t: add ambient light and proximi=
ty sensor
      arm64: dts: qcom: msm8939-asus-z00t: add regulators for ambient li=
ght and proximity sensor

Ernest Van Hoecke (5):
      arm64: dts: freescale: Add Verdin iMX95 support
      arm64: dts: freescale: imx95-verdin: Add Dahlia carrier board
      arm64: dts: freescale: imx95-verdin: Add Ivy carrier board
      arm64: dts: freescale: imx95-verdin: Add Mallow carrier board
      arm64: dts: freescale: imx95-verdin: Add Yavia carrier board

Fabian Pfitzner (1):
      arm64: dts: imx8mp-frdm: add sd, ethernet, wifi, usb and hdmi supp=
ort

Fabio Estevam (17):
      dt-bindings: clock: rockchip: Add RV1103B CRU support
      ARM: dts: rockchip: Remove rockchip,grf from rk3288 tsadc
      ARM: dts: rockchip: Move PHY reset to ethernet-phy node on rk3036 =
boards
      ARM: dts: rockchip: Fix RTC compatible on rk3288-phycore-rdk
      ARM: dts: rockchip: Use mount-matrix on rk3188-bqedison2qc
      ARM: dts: rockchip: Remove invalid regulator-property from rk3288-=
veyron
      ARM: dts: rockchip: Fix the Bluetooth node name on rk3288-veyron
      ARM: dts: rockchip: Fix the trackpad supply on rk3288-veyron-jerry
      ARM: dts: rockchip: Add missing the touchscreen interrupt on rk328=
8-phycore-rdk
      ARM: dts: rockchip: Fix RTC description on rk3288-firefly-reload
      ARM: dts: rockchip: Fix GMAC description n RK3288 boards
      ARM: dts: rockchip: Fix LED node names on rk3288-phycore-rdk
      ARM: dts: rockchip: Pass linux,code to the power key on rk3288-vey=
ron-pinky
      dt-bindings: soc: rockchip: grf: Add RV1103B compatibles
      ARM: dts: rockchip: Add support for RV1103B
      dt-bindings: arm: rockchip: Add Omega4 Evaluation board
      ARM: dts: rockchip: Add Onion Omega4 Evaluation Board

Fabrizio Castro (1):
      arm64: dts: renesas: r9a09g056: Remove wdt{0,2,3} nodes

Florin Leotescu (1):
      arm64: dts: imx943-evk: Add fan node and enable active cooling on =
A55

Francesco Dolcini (11):
      arm64: dts: imx8-apalis: Disable the audmix
      arm64: dts: imx8-apalis: Remove obsolete TODO comment
      arm64: dts: imx8-apalis: Fix LEDs name collision
      arm64: dts: ti: am62-verdin: Enable pullup for eMMC data pins
      dt-bindings: arm: ti: Add verdin am62/am62p zinnia board
      arm64: dts: ti: k3-am62-verdin: Fix SPI_1 GPIO CS pinctrl label
      arm64: dts: ti: k3-am62-verdin: Split UART_2 pinctrl group
      arm64: dts: ti: k3-am62-verdin: Add Zinnia
      arm64: dts: ti: k3-am62p-verdin: Split UART_2 pinctrl group
      arm64: dts: ti: k3-am62p-verdin: Add SPI_1_CS as GPIO
      arm64: dts: ti: k3-am62p-verdin: Add Zinnia

Frank Li (26):
      arm64: dts: imx8mm-evk: replace space with tab
      arm64: dts: imx8mp-evk: replace space with tab
      ARM: dts: imx35: rename emi to emi-bus to fix CHECK_DTBS warning
      ARM: dts: imx35: rename i2c clock-names to ipg
      ARM: dts: imx35: remove simple-bus 'usbphy'
      ARM: dts: imx51-ts4800: rename fpga@0 to fpga@0,0
      ARM: dts: imx51-babbage: rename at45db321d@1 to flash@1
      arm64: dts: imx8mp-beacon: remove fallback ethernet-phy-ieee802.3-=
c22
      ARM: dts: imx6qdl-sr-som-ti: use fixed-clock instead of clock-freq=
uency
      ARM: dts: imx53-smd: Add power supply node for fsl,sgtl5000
      ARM: dts: imx7s-warp: Remove data-lanes and clock-lanes for ov2680
      ARM: dts: imx: rename iomuxc to pinmux
      ARM: dts: imx: remove redundant intermediate node in pinmux hierar=
chy
      ARM: dts: imx27-eukrea: replace interrupts with interrupts-extended
      ARM: dts: imx27-eukrea-cpuimx27: rename uart8250 to serial
      ARM: dts: imx27: remove fsl,imx-osc26m from fixed-clock node
      ARM: dts: imx23: fix interrupt names for dma-controller@80024000
      ARM: dts: imx23/28: add "led-" prefix to LED subnodes
      ARM: dts: imx28: rename gpios-reset to reset-gpios of hx8357
      ARM: dts: imx28-sps1: remove undocumented fallback compatible "mr2=
5h256"
      ARM: dts: imx28-tx28: rename compatible to "edt,edt-ft5206"
      ARM: dts: imx28-tx28: remove undocumented aliases
      ARM: dts: imx6qdl: add label for system clocks
      ARM: dts: imx: add required clocks and clock-names for ccm
      ARM: dts: imx25: rename node name tcq to touchscreen
      ARM: dts: imx6sx: remove fallback compatible string fsl,imx28-lcdif

Frank Wunderlich (1):
      arm64: dts: mediatek: mt7988a-bpi-r4pro: fix model string

Franz Schnyder (2):
      arm64: dts: ti: k3-am69-aquila-dev: Fix DP regulator enable GPIO
      arm64: dts: ti: k3-am69-aquila-clover: Fix DP regulator enable GPIO

Frieder Schrempf (3):
      arm64: dts: imx8mp-kontron: Fix touch reset configuration on DL de=
vices
      arm64: dts: imx8mp-kontron: Drop vmmc-supply to fix SD card on SMA=
RC eval carrier
      arm64: dts: imx8mp-kontron: Use GPIO/IRQ defines in DL devicetree

Fugang Duan (1):
      arm64: dts: imx8mm-evk: add uart3 port

Gabor Juhos (1):
      arm64: dts: qcom: ipq9574: remove MP5496 regulator references from=
 SoC dtsi

Gary Yang (2):
      arm64: dts: cix: add support for cix sky1 resets
      arm64: dts: cix: Add scmi powerdomain nodes for sky1

Gatien Chevallier (5):
      arm: dts: stm32: introduce the debug bus for stm32mp1x platforms
      arm: dts: stm32: enable the debug bus on stm32mp1x boards
      arm: dts: stm32: enable CoreSight on stm32mp15xx-dkx boards
      arm: dts: stm32: enable CoreSight on the stm32mp157c-ev1 board
      arm: dts: stm32: enable CoreSight on the stm32mp135f-dk board

Gaurav Kohli (2):
      arm64: dts: qcom: hamoa-iot-evk: Update TSENS thermal zone configu=
ration
      arm64: dts: qcom: talos: Add GPU cooling

Geert Uytterhoeven (7):
      ARM: dts: renesas: r9a06g032-rzn1d400-db: Do not use underscores i=
n node names
      arm64: dts: renesas: rzt2h-rzn2h-evk: Fix GMAC pins sort order
      arm64: dts: qcom: Drop CPU masks from GICv3 PPI interrupts
      Merge tag 'renesas-r9a08g046-dt-binding-defs-tag1' into renesas-dt=
s-for-v7.1
      arm64: dts: fsl-ls1028a: Drop CPU masks from GICv3 PPI interrupts
      arm64: dts: freescale: imx: Drop CPU masks from GICv3 PPI interrup=
ts
      arm64: dts: intel: agilex5: Drop CPU masks from GICv3 PPI interrup=
ts

Gergo Koteles (1):
      arm64: dts: qcom: sdm845-oneplus: Add alert-slider

Gianluca Boiano (1):
      arm64: dts: qcom: sdm630: add SPI7 interface

Gopi Krishna Menon (1):
      ARM: dts: st: spear: remove undocumented thermal_flags property

Gopikrishna Garmidi (3):
      dt-bindings: arm: qcom: Document Mahua SoC and board
      arm64: dts: qcom: Commonize Glymur CRD DTSI
      arm64: dts: qcom: Add Mahua SoC and CRD

Gray Huang (2):
      dt-bindings: arm: rockchip: Add Khadas Edge 2L board
      arm64: dts: rockchip: Add Khadas Edge 2L board

Gregor Herburger (6):
      arm64: dts: broadcom: rp1: add i2c controller
      arm64: dts: broadcom: rp1: add csi nodes
      arm64: dts: broadcom: bcm2712: add camera backend node pispbe
      arm64: dts: broadcom: bcm2712-rpi-5-b: add pinctrl properties for =
csi i2cs
      arm64: dts: broadcom: bcm2712-d-rpi-5-b: add fixes for pinctrl/pin=
ctrl_aon
      arm64: dts: broadcom: bcm2712-d-rpi-5-b: update uart10 interrupt

Guodong Xu (2):
      riscv: dts: spacemit: Update PMIC supply properties for BPI-F3 and=
 Jupiter
      dt-bindings: riscv: Add Supm extension description

GyoungBo Min (1):
      dt-bindings: clock: Add ARTPEC-9 clock controller

Haibo Chen (2):
      arm64: dts: imx952: Add xspi node
      arm64: dts: imx952-evk: add MT35XU01G spi nor flash

Heiko Stuebner (11):
      arm64: dts: rockchip: Add port subnodes to RK356x SATA controllers
      arm64: dts: rockchip: add overlay for qnap-ts433 device revision
      arm64: dts: rockchip: add overlay for qnap-ts233 device revision
      arm64: dts: rockchip: add overlay for qnap-ts133 device revision
      arm64: dts: rockchip: use gated-fixed-clock for pcie-refclk on rk3=
588-jaguar
      arm64: dts: rockchip: use gated-fixed-clock for pcie-refclk on rk3=
588-tiger
      arm64: dts: rockchip: add pinctrl for clk-generator GPIO on rk3588=
-tiger
      arm64: dts: rockchip: Make Jaguar PCIe-refclk pin use pull-up conf=
ig
      Merge branch 'v7.1-shared/clkids' into v7.1-armsoc/dts32
      arm64: dts: rockchip: Enable OTP controller for RK3562
      arm64: dts: rockchip: Enable OTP controller for RK356x

Herve Codina (Schneider Electric) (2):
      ARM: dts: renesas: r9a06g032: Add support for CPU frequency scaling
      ARM: dts: r9a06g032: Add #address-cells to the GIC node

Hongyang Zhao (1):
      arm64: dts: qcom: qcs6490-rubikpi3: Use lt9611 DSI Port B

Hugh Cole-Baker (1):
      arm64: dts: rockchip: add pwm-fan for NanoPC-T6

Ian Ray (5):
      ARM: dts: imx: bx50v3: Configure switch PHY max-speed to 100Mbps
      ARM: dts: imx: bx50v3: Configure phy-mode to eliminate a warning
      ARM: dts: imx: b850v3: Use alphabetical sorting
      ARM: dts: imx: b850v3: Define GPIO line names
      ARM: dts: imx: b850v3: Disable unused usdhc4

Icenowy Zheng (3):
      riscv: dts: thead: add DPU and HDMI device tree nodes
      riscv: dts: thead: lichee-pi-4a: enable HDMI
      riscv: dts: thead: th1520: add coefficients to the PVT node

Inochi Amaoto (1):
      riscv: dts: spacemit: Add ethernet device for K3

Janaki Ramaiah Thota (1):
      arm64: dts: qcom: qcm6490-idp: add and enable BT node

Jens Glathe (3):
      dt-bindings: arm: qcom: Add ASUS Vivobook X1P42100 variant
      arm64: dts: qcom: x1-vivobook-s15: create a common dtsi for Hamoa =
and Purwa variants
      arm64: dts: qcom: x1-vivobook-s15: add Purwa-compatible device tree

Jie Gan (2):
      arm64: dts: qcom: talos: add ETR device
      arm64: dts: qcom: kaanapali: add coresight nodes

Jie Zhang (2):
      arm64: dts: qcom: talos: Add gpu and rgmu nodes
      arm64: dts: qcom: qcs615-ride: Enable Adreno 612 GPU

Jingyi Wang (4):
      arm64: dts: qcom: kaanapali: Add ADSP and CDSP for Kaanapali SoC
      arm64: dts: qcom: kaanapali-mtp: Enable ADSP and CDSP
      arm64: dts: qcom: kaanapali-qrd: Enable ADSP and CDSP
      arm64: dts: qcom: kaanapali: Duplicate whitespace cleanup

Jishnu Prakash (3):
      arm64: dts: qcom: kaanapali: Add PMIC devices
      arm64: dts: qcom: kaanapali-mtp: Add PMIC support
      arm64: dts: qcom: kaanapali-qrd: Add PMIC support

John Madieu (3):
      arm64: dts: renesas: r9a09g047: Add PCIe node
      arm64: dts: renesas: r9a09g047e57-smarc-som: Add PCIe reference cl=
ock
      arm64: dts: renesas: r9a09g047e57-smarc: Enable PCIe

Jon Hunter (1):
      arm64: tegra: Fix RTC aliases

Jonas Karlman (1):
      arm64: dts: rockchip: Enable OTP controller for RK3528

Josua Mayer (17):
      arm64: dts: imx8mp-hummingboard-pulse/cubox-m: fix vmmc gpio polar=
ity
      arm64: dts: imx8mp-hummingboard-pulse: fix mini-hdmi dsi port refe=
rence
      arm64: dts: imx8mp-sr-som: build dtbs with symbols for overlay sup=
port
      arm64: dts: freescale: add support for SolidRun i.MX8MP HummingBoa=
rd IIoT
      arm64: dts: imx8mp-hummingboard-iiot: add dt overlays for muxable =
ports
      arm64: dts: freescale: add support for solidrun solidsense-n8 board
      arm64: dts: freescale: add support for solidrun i.mx8mm som and evb
      arm64: dts: lx2160a-cex7/lx2162a-sr-som: fix usd-cd & gpio pinmux
      arm64: dts: lx2160a: change i2c0 (iic1) pinmux mask to one bit
      arm64: dts: lx2160a: remove duplicate pinmux nodes
      arm64: dts: lx2160a: rename pinmux nodes for readability
      arm64: dts: lx2160a: add sda gpio references for i2c bus recovery
      arm64: dts: lx2160a: change zeros to hexadecimal in pinmux nodes
      arm64: dts: lx2160a: complete pinmux for rcwsr12 configuration word
      arm64: dts: lx2160a-cex7: add rtc alias
      arm64: dts: lx2162a-sr-som: add crypto & rtc aliases, model
      arm64: dts: lx2162a-clearfog: set sfp connector leds function and =
source

Joy Zou (3):
      arm64: dts: imx95: Reserve eDMA channels 0-1 for V2X
      arm64: dts: imx95-evk: update the dma-channel-mask property
      arm64: dts: imx943: Add thermal support

Judith Mendez (3):
      arm64: dts: ti: k3-am62p5-sk: Disable MMC1 internal pulls on data =
pins
      arm64: dts: ti: k3-am62l3-evm: Disable MMC1 internal pulls on data=
 pins
      arm64: dts: ti: k3-am62-lp-sk: Enable internal pulls for MMC0 data=
 pins

Jun Yan (6):
      dt-bindings: vendor-prefixes: Add Shenzhen OneThing Technologies C=
o., Ltd.
      dt-bindings: arm: rockchip: Add OneThing Edge Cube series
      arm64: dts: rockchip: Add OneThing Edge Cube series
      dt-bindings: vendor-prefixes: Add Beijing Ultrapower Software Co.,=
 Ltd.
      dt-bindings: arm: sunxi: Add TaiqiCat (TQC) A01
      arm64: dts: allwinner: h6: Add TaiqiCat (TQC) A01 support

Jyothi Kumar Seerapu (1):
      arm64: dts: qcom: kaanapali: Add QUPv3 configuration for serial en=
gines

KancyJoe (1):
      arm64: dts: qcom: add basic devicetree for Ayaneo Pocket S2 gaming=
 console

Kathiravan Thirumoorthy (3):
      dt-bindings: clock: add Qualcomm IPQ5210 GCC
      dt-bindings: qcom: add ipq5210 boards
      arm64: dts: qcom: add IPQ5210 SoC and rdp504 board support

Kaustabh Chakraborty (2):
      dt-bindings: arm: samsung: add compatible for samsung-j7xelte
      dt-bindings: arm: samsung: add compatible for samsung-j5y17lte

Kendall Willis (10):
      arm64: dts: ti: k3-am62d2-evm: Set wakeup-source system-states
      arm64: dts: ti: k3-am62l: include WKUP_UART0 in wakeup peripheral =
window
      arm64: boot: dts: ti: k3-am62l-wakeup: create label for wkup_uart0=
 target-module
      arm64: boot: dts: ti: k3-am62l3-evm: define wkup_uart0 pins
      arm64: boot: dts: ti: k3-am62l3-evm: enable wkup_uart0_target node
      arm64: dts: ti: k3-am62x-sk-common: Enable Main UART wakeup
      arm64: dts: ti: k3-am62a7-sk: Enable Main UART wakeup
      arm64: dts: ti: k3-am62p5-sk: Enable Main UART wakeup
      arm64: dts: ti: k3-am62l3-evm: Enable Main UART wakeup
      arm64: dts: ti: k3-am62d2-evm: Enable Main UART wakeup

Konrad Dybcio (14):
      arm64: dts: qcom: talos: Add missing clock-names to GCC
      arm64: dts: qcom: kaanapali: Fix GIC_ITS range length
      arm64: dts: qcom: milos: Fix GIC_ITS range length
      arm64: dts: qcom: sm8450: Fix GIC_ITS range length
      arm64: dts: qcom: sm8550: Fix GIC_ITS range length
      arm64: dts: qcom: sm8650: Fix GIC_ITS range length
      arm64: dts: qcom: sm8750: Fix GIC_ITS range length
      arm64: dts: qcom: sc7180: Explicitly describe the IPA IMEM slice
      arm64: dts: qcom: sc7280: Explicitly describe the IPA IMEM slice
      arm64: dts: qcom: sdm845: Explicitly describe the IPA IMEM slice
      arm64: dts: qcom: sm6350: Explicitly describe the IPA IMEM slice
      arm64: dts: qcom: sm8350: Explicitly describe the IPA IMEM slice
      arm64: dts: qcom: sm8550: Explicitly describe the IPA IMEM slice
      arm64: dts: qcom: sm8650: Explicitly describe the IPA IMEM slice

Kory Maincent (TI) (2):
      ARM: dts: ti: Enable overlays for am335x BeagleBoard devicetrees
      ARM: dts: am335x: Add Seeed Studio BeagleBone HDMI cape overlay

Krishna Chaitanya Chundru (1):
      arm64: dts: qcom: kodiak: Fix PCIe1 PHY ref clock voting

Krishna Kurapati (3):
      arm64: dts: qcom: talos: Flatten usb controller nodes
      arm64: dts: qcom: talos: Mark usb controllers are wakeup capable d=
evices
      arm64: dts: qcom: hamoa/purwa: Flatten usb controller nodes

Krzysztof Kozlowski (44):
      ARM: dts: arm: Use lowercase hex
      arm64: dts: axis: artpec9: Fix missing soc unit address
      ARM: dts: exynos3250: Drop duplicated I2C address/size-cells
      ARM: dts: exynos4210-smdkv310: Drop duplicated I2C address/size-ce=
lls
      ARM: dts: exyons4412: Drop duplicated I2C address/size-cells
      arm64: dts: exynos7870: Move I2C address/size-cells to DTSI
      arm64: dts: exynos8895: Move I2C address/size-cells to DTSI
      Merge tag 'renesas-dts-for-v7.1-tag1' of https://git.kernel.org/pu=
b/scm/linux/kernel/git/geert/renesas-devel into soc/dt
      arm64: dts: qcom: x1-crd: add USB DisplayPort audio
      Merge tag 'v7.1-rockchip-dts64-1' of ssh://gitolite.kernel.org/pub=
/scm/linux/kernel/git/mmind/linux-rockchip into soc/dt
      arm64: dts: qcom: sm8750: Add display (MDSS) with Display CC
      arm64: dts: qcom: sm8750-mtp: Enable display
      arm64: dts: qcom: sm8750-mtp: Enable USB headset and Type-C access=
ory mode
      arm64: dts: qcom: sm8750-mtp: Enable DisplayPort over USB
      arm64: dts: qcom: msm8996: Drop redundant VSYNC pin state
      arm64: dts: qcom: msm8998: Drop redundant VSYNC pin state
      arm64: dts: qcom: sdm845-axolotl: Drop redundant VSYNC pin state
      arm64: dts: qcom: sm8550: Drop redundant VSYNC pin state
      arm64: dts: qcom: sm8650: Drop redundant VSYNC pin state
      arm64: dts: qcom: lemans-ride: Drop redundant non-controllable sup=
plies
      arm64: dts: qcom: qcs615-ride: Drop redundant non-controllable sup=
plies
      arm64: dts: qcom: qrb2210-rb1: Drop redundant non-controllable sup=
plies
      arm64: dts: qcom: qrb4210-rb2: Drop redundant non-controllable sup=
plies
      arm64: dts: qcom: qrb5165-rb5: Drop redundant non-controllable sup=
plies
      Merge tag 'thead-dt-for-v7.1' of https://git.kernel.org/pub/scm/li=
nux/kernel/git/fustini/linux into soc/dt
      Merge tag 'mtk-dts64-for-v7.1' of ssh://gitolite.kernel.org/pub/sc=
m/linux/kernel/git/mediatek/linux into soc/dt
      Merge tag 'mtk-dts32-for-v7.1' of ssh://gitolite.kernel.org/pub/sc=
m/linux/kernel/git/mediatek/linux into soc/dt
      Merge tag 'juno-updates-7.1' of https://git.kernel.org/pub/scm/lin=
ux/kernel/git/sudeep.holla/linux into soc/dt
      arm64: dts: qcom: eliza: Add thermal sensors
      Merge tag 'aspeed-7.1-devicetree-0' of ssh://gitolite.kernel.org/p=
ub/scm/linux/kernel/git/bmc/linux into soc/dt
      Merge tag 'nuvoton-arm64-7.1-devicetree-0' of ssh://gitolite.kerne=
l.org/pub/scm/linux/kernel/git/bmc/linux into soc/dt
      Merge tag 'tegra-for-7.1-arm-dt' of https://git.kernel.org/pub/scm=
/linux/kernel/git/tegra/linux into soc/dt
      Merge tag 'tegra-for-7.1-arm64-dt' of https://git.kernel.org/pub/s=
cm/linux/kernel/git/tegra/linux into soc/dt
      Merge tag 'imx-dt64-7.1' of https://git.kernel.org/pub/scm/linux/k=
ernel/git/frank.li/linux into soc/dt
      Merge tag 'at91-dt-7.1' of ssh://gitolite.kernel.org/pub/scm/linux=
/kernel/git/at91/linux into soc/dt
      Merge tag 'microchip-dt64-7.1' of ssh://gitolite.kernel.org/pub/sc=
m/linux/kernel/git/at91/linux into soc/dt
      Merge tag 'v7.1-rockchip-dts32-1' of ssh://gitolite.kernel.org/pub=
/scm/linux/kernel/git/mmind/linux-rockchip into soc/dt
      Merge tag 'v7.1-rockchip-dts32-2' of ssh://gitolite.kernel.org/pub=
/scm/linux/kernel/git/mmind/linux-rockchip into soc/dt
      Merge tag 'imx-dt-7.1' of https://git.kernel.org/pub/scm/linux/ker=
nel/git/frank.li/linux into soc/dt
      Merge tag 'riscv-dt-for-v7.1' of ssh://gitolite.kernel.org/pub/scm=
/linux/kernel/git/conor/linux into soc/dt
      Merge tag 'qcom-arm64-for-7.1-2' of ssh://gitolite.kernel.org/pub/=
scm/linux/kernel/git/qcom/linux into soc/dt
      Merge tag 'sunxi-dt-for-7.1-2' of ssh://gitolite.kernel.org/pub/sc=
m/linux/kernel/git/sunxi/linux into soc/dt
      Merge tag 'mvebu-dt-7.1-1' of https://git.kernel.org/pub/scm/linux=
/kernel/git/gclement/mvebu into soc/dt
      Merge tag 'ti-k3-dt-for-v7.1-part2' of ssh://gitolite.kernel.org/p=
ub/scm/linux/kernel/git/ti/linux into soc/dt

Lad Prabhakar (6):
      arm64: dts: renesas: r9a09g056: Add DMA support for RSPI channels
      arm64: dts: renesas: r9a09g057: Add DMA support for RSPI channels
      arm64: dts: renesas: r9a09g077m44-rzt2h-evk: Clarify SD0 power jum=
pers
      arm64: dts: renesas: r9a09g087m44-rzn2h-evk: Clarify SD0 power jum=
per setup
      arm64: dts: renesas: r9a09g087m44-rzn2h-evk: Add PHY interrupt sup=
port
      arm64: dts: renesas: r9a09g077m44-rzt2h-evk: Add PHY interrupt sup=
port

Laurentiu Mihalcea (2):
      arm64: dts: imx95: add AONMIX MQS node
      arm64: dts: imx95-15x15-frdm: support AONMIX MQS

Le Qi (1):
      arm64: dts: qcom: hamoa-evk: Add DP0/DP1 audio playback support

Linus Walleij (8):
      ARM: dts: bcm6878: Fix PL081 DMA block IRQ
      ARM: dts: bcm63138: Fix DMA IRQ
      ARM: dts: bcm6846: Add I2C bus block
      ARM: dts: bcm6855: Add I2C bus blocks
      ARM: dts: bcm6878: Add I2C bus block
      ARM: dts: bcm63138: Add I2C block
      ARM: dts: bcm63148: Add I2C block
      Merge tag 'spacemit-dt-for-7.1-1' of https://github.com/spacemit-c=
om/linux into soc/dt

Liu Ying (2):
      arm64: dts: imx93-9x9-qsb: Add ontat,kd50g21-40nt-a1 panel
      arm64: dts: imx8mp-evk: Specify ADV7535 register addresses

Loic Poulain (6):
      arm64: dts: qcom: monaco: Complete SDHC definition
      arm64: dts: qcom: monaco-evk: Enable SDHC1 for eMMC
      arm64: dts: qcom: monaco: Add HS/SS endpoints for USB1 controller
      arm64: dts: qcom: Add Monaco Monza SoM
      dt-bindings: arm: qcom: add Arduino Monza, VENTUNO Q
      arm64: dts: qcom: Add Arduino Monza (VENTUNO Q) board support

Louis-Alexis Eyraud (4):
      arm64: dts: mediatek: mt8395-genio-common: add mmc aliases
      arm64: dts: mediatek: mt8395-radxa-nio-12l: add mmc aliases
      arm64: dts: mediatek: mt8365-evk: add mmc aliases
      dt-bindings: arm: mediatek: audsys: fix formatting issues

Luca Leonardo Scorcia (1):
      arm64: dts: mt8167: Reorder nodes according to mmio address

Luca Weiss (13):
      arm64: dts: qcom: kodiak: Add I2S1 pinctrl definitions
      arm64: dts: qcom: milos: Sort pinctrl subnodes by pins
      arm64: dts: qcom: milos-fairphone-fp6: Add Hall Effect sensor
      arm64: dts: qcom: milos: Add fastrpc nodes
      arm64: dts: qcom: milos: add ADSP GPR
      arm64: dts: qcom: milos: Add LPASS LPI pinctrl node
      arm64: dts: qcom: sm7225-fairphone-fp4: Fix conflicting bias pinct=
rl
      arm64: dts: qcom: milos: Add UFS nodes
      arm64: dts: qcom: milos-fairphone-fp6: Enable UFS
      arm64: dts: qcom: milos: Add CCI busses
      arm64: dts: qcom: milos-fairphone-fp6: Add camera EEPROMs on CCI b=
usses
      arm64: dts: qcom: qcm6490-fairphone-fp5: Sort pinctrl nodes by pins
      arm64: dts: qcom: qcm6490-fairphone-fp5: Add front camera support

Lukas Bulwahn (1):
      MAINTAINERS: drop file entry in Marvell Kirkwood and Armada SOC su=
pport

Luke Wang (2):
      arm64: dts: imx91-11x11-evk: change usdhc tuning step for eMMC and=
 SD
      arm64: dts: imx93-11x11-evk: change usdhc tuning step for eMMC and=
 SD

Manaf Meethalavalappu Pallikunhi (2):
      arm64: dts: qcom: kaanapali: Add TSENS and thermal zones
      arm64: dts: qcom: sm8750: Enable TSENS and thermal zones

Manivannan Sadhasivam (1):
      arm64: dts: qcom: x1e80100: Add '#cooling-cells' for CPU nodes

Marc Olberding (1):
      ARM: dts: aspeed: Add 128M alt flash layout to NVIDIA MSX4

Marco Felsch (1):
      arm64: dts: imx93: Add parallel display output nodes

Marek Vasut (21):
      arm64: dts: renesas: sparrow-hawk: Mark OTP and HSCIF0 pins as boo=
tph-all
      arm64: dts: renesas: r8a77951: Describe PCIe root ports
      arm64: dts: renesas: r8a77960: Describe PCIe root ports
      arm64: dts: renesas: r8a77961: Describe PCIe root ports
      arm64: dts: renesas: r8a77965: Describe PCIe root ports
      arm64: dts: renesas: r8a77990: Describe PCIe root port
      arm64: dts: renesas: r8a77990: Add USB 3.0 PHY and USB3S0 clock no=
des
      arm64: dts: renesas: salvator-common: Describe PCIe/USB3.0 clock g=
enerator
      arm64: dts: renesas: ulcb: ulcb-kf: Describe PCIe/USB3.0 clock gen=
erator
      arm64: dts: renesas: ebisu: Describe PCIe/USB3.0 clock generator
      ARM: dts: stm32: Add DT overlays for DH STM32MP13xx/STM32MP15xx DH=
SOM
      arm64: dts: renesas: sparrow-hawk: Add overlay for WaveShare Displ=
ay 13.3"
      arm64: dts: renesas: Drop RTL8211E PHY C22 compatible strings
      arm64: dts: renesas: Drop RTL8211F PHY C22 compatible strings
      arm64: dts: renesas: Drop KSZ9131 PHY C22 compatible strings
      arm64: dts: renesas: Fix KSZ9131 PHY bogus txdv-skew-psec properti=
es
      ARM: dts: renesas: r8a7742-iwg21d-q7-dbcm-ca: Drop KSZ8081 PHY C22=
 compatible string
      ARM: dts: renesas: rza2mevb: Drop RTL8201F PHY C22 compatible stri=
ng
      ARM: dts: renesas: Drop KSZ8041 PHY C22 compatible strings
      ARM: dts: imx6ull-dhcor: Handle both 1DX and 1YN WiFi on i.MX6ULL =
DHCOR
      ARM: dts: imx: Add DT overlays for DH i.MX6 DHCOM SoM and boards

Markus Schneider-Pargmann (TI) (1):
      arm64: dts: ti: k3: Use memory-region-names for r5f

Martin Schmiedel (2):
      arm64: dts: freescale: add initial device tree for TQMa93xx/MBa93x=
xLA-MINI
      arm64: dts: freescale: imx93-tqma9352-mba93xxla-mini: Add WLAN/BT =
overlay

Maud Spierings (4):
      arm64: dts: imx8mm: Add pinctrl config definitions
      arm64: dts: freescale: add Ka-Ro Electronics tx8m-1610 COM
      arm64: dts: freescale: Add the GOcontroll Moduline IV
      arm64: dts: freescale: Add the GOcontroll Moduline Mini

Max McNamee (1):
      arm64: dts: qcom: msm8916-samsung-coreprimeltevzw: add device tree

Max Merchel (8):
      ARM: dts: imx6qdl-tqma6: add missing labels
      ARM: dts: imx6qdl: add boot phase properties
      ARM: dts: imx6qdl-tqma6: add boot phase properties
      ARM: dts: imx6qdl-mba6: add boot phase properties
      ARM: dts: imx6ul/imx6ull: add boot phase properties
      ARM: dts: imx6ul[l]-tqma6ul[l]: add boot phase properties
      ARM: dts: mba6ulx: add boot phase properties
      ARM: dts: tqma6ul[l]: correct spelling of TQ-Systems

Ma=C3=ADra Canal (1):
      arm64: dts: broadcom: bcm2712: Add V3D device node

Md Sadre Alam (4):
      arm64: dts: qcom: ipq5424: Add QPIC SPI NAND controller support
      arm64: dts: qcom: ipq5332: Add QPIC SPI NAND controller support
      arm64: dts: qcom: ipq5424-rdp466: Enable QPIC SPI NAND support
      arm64: dts: qcom: pq5332-rdp-common: Enable QPIC SPI NAND support

Meghana Malladi (1):
      arm64: dts: ti: k3-am642-evm: Add ICSSG0 overlay for dual EMAC sup=
port

Michael Riesch (1):
      arm64: dts: rockchip: enable vicap dvp on wolfvision pf5 io expand=
er

Michael Walle (3):
      arm64: dts: ti: remove the Kontron SMARC-sAM67
      dt-bindings: mfd: sl28cpld: Drop sa67mcu compatible
      dt-bindings: arm: ti: Drop Kontron SMARC-sAM67 module

Michal Piekos (1):
      arm64: dts: allwinner: enable h616 timer support

Mihai Sain (1):
      ARM: dts: microchip: sama7d65: add Cortex-A7 PMU node

Ming Wang (1):
      arm64: dts: rockchip: Fix Bluetooth stability on LCKFB TaiShan Pi

Miquel Raynal (1):
      ARM: dts: BCM5301X: Drop extra NAND controller compatible

Miquel Raynal (Schneider Electric) (1):
      ARM: dts: renesas: r9a06g032: Describe the QSPI controller

Mithil Bavishi (8):
      ARM: dts: twl6032: Add DTS file for TWL6032 PMIC
      dt-bindings: vendor-prefixes: Add Doestek
      dt-bindings: display: bridge: lvds-codec: add doestek,dtc34lm85am
      dt-bindings: display: panel-lvds: Add compatibles for Samsung LTN0=
70NL01 and LTN101AL03 panels
      ARM: dts: ti: omap: espresso-common: Add common device tree for Sa=
msung Galaxy Tab 2 series
      dt-bindings: omap: Add Samsung Galaxy Tab 2 7.0 and 10.1
      ARM: dts: ti: omap: samsung-espresso7: Add initial support for Gal=
axy Tab 2 7.0
      ARM: dts: ti: omap: samsung-espresso10: Add initial support for Ga=
laxy Tab 2 10.1

Mukesh Ojha (3):
      arm64: dts: qcom: lemans: disable zap-shader for EL2 configuration
      arm64: dts: qcom: monaco: Add EL2 overlay
      arm64: dts: qcom: talos: Add EL2 overlay

Neil Armstrong (3):
      dt-binding: vendor-prefixes: document the Ayaneo brand
      dt-bindings: arm: qcom: document the Ayaneo Pocket S2
      arm64: dts: qcom: sm8650: Add sound DAI prefix for DP

Ng Tze Yee (2):
      dt-bindings: altera: Add fallback compatible for Stratix 10 SoCDK =
eMMC variant
      arm64: dts: socfpga: stratix10: Add emmc support

Nihal Kumar Gupta (4):
      arm64: dts: qcom: monaco: Add CCI definitions
      arm64: dts: qcom: monaco: Add camera MCLK pinctrl
      arm64: dts: qcom: monaco-evk: Add camera AVDD regulators
      arm64: dts: qcom: monaco-evk-camera: Add DT overlay

Nora Schiffer (1):
      arm64: dts: freescale: imx8mp-tqma8mpql-mba8mp-ras314: fix UART1 R=
TS/CTS muxing

N=C3=ADcolas F. R. A. Prado (1):
      arm64: dts: mediatek: mt8365: Describe infracfg-nao as a pure sysc=
on

Odelu Kukatla (3):
      dt-bindings: interconnect: document the RPMh Network-On-Chip inter=
connect in Eliza SoC
      arm64: dts: qcom: qcs8300: Add clocks for QoS configuration
      arm64: dts: qcom: talos: Add clocks for QoS configuration

Olivier Moysan (1):
      ARM: dts: stm32: remove i2c dma properties in stm32mp157c-ev1

Ovidiu Panait (3):
      arm64: dts: renesas: r9a09g056: Add RTC node
      arm64: dts: renesas: r9a09g056n48-rzv2n-evk: Enable RTC
      arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Add versa3 clock gene=
rator node

Pankaj Patil (3):
      dt-bindings: arm: qcom: Document Glymur SoC and board
      arm64: dts: qcom: Introduce Glymur base dtsi
      arm64: dts: qcom: glymur: Enable Glymur CRD board support

Patrice Chotard (2):
      arm64: dts: st: add bsec support to stm32mp21
      arm64: dts: st: add bootph-all in bsec node to stm32mp215f-dk

Paul Adam (3):
      dt-bindings: vendor-prefixes: add WIKO SAS
      dt-bindings: arm: qcom: add wiko,chuppito compatible string
      arm64: dts: qcom: msm8916-wiko-chuppito: add initial devicetree

Paul Sajna (10):
      arm64: dts: qcom: sdm845-lg-common: Sort nodes and properties
      arm64: dts: qcom: sdm845-lg-judyln: Add firmware nodes, change path
      arm64: dts: qcom: sdm845-lg-judyp: Define firmware paths for judyp
      arm64: dts: qcom: sdm845-lg-common: Enable venus
      arm64: dts: qcom: sdm845-lg-common: Enable qups and their dma cont=
rollers
      arm64: dts: qcom: sdm845-lg: Add uarts and Bluetooth
      arm64: dts: qcom: sdm845-lg-judyln: Add lab/ibb
      arm64: dts: qcom: sdm845-lg-judyln: Add display panel
      arm64: dts: qcom: sdm845-lg: Add wifi nodes
      arm64: dts: qcom: sdm845-lg-common: Add chassis-type

Pedro Alves (1):
      arm64: dts: rockchip: configure hdmirx in Rock 5 ITX

Peng Fan (5):
      arm64: dts: imx94: Add V2X/ELE mailbox nodes
      arm64: dts: imx94: Add SCMI sensor/lmm/cpu nodes
      arm64: dts: imx943-evk: Add nxp,ctrl-ids for scmi_misc
      arm64: dts: imx943-evk: Add pf09/53 thermal zone
      ARM: dts: imx7ulp: Add CPU clock and OPP table support

Pengyu Luo (1):
      arm64: dts: qcom: sc8280xp: Add dsi nodes on SC8280XP

Petr Hodina (2):
      arm64: dts: qcom: sdm845-sony-xperia-tama: Correct uart instances
      arm64: dts: qcom: sdm845-sony-xperia-tama: Add bluetooth

Pierre-Henry Moussay (4):
      dt-bindings: timer: sifive,clint: add pic64gx compatibility
      dt-bindings: riscv: microchip: document the PIC64GX curiosity kit
      riscv: dts: microchip: add pic64gx and its curiosity kit
      riscv: dts: microchip: remove POLARFIRE mention in Makefile

Pradeep P V K (3):
      arm64: dts: qcom: hamoa: Add UFS nodes for x1e80100 SoC
      arm64: dts: qcom: hamoa-iot-evk: Enable UFS
      arm64: dts: qcom: purwa-iot-evk: Enable UFS

Pragnesh Papaniya (3):
      arm64: dts: qcom: glymur: Add glymur BWMONs
      arm64: dts: qcom: glymur: Add missing opp entry
      arm64: dts: qcom: mahua: Fix mahua bwmon

Prasad Kumpatla (2):
      arm64: dts: qcom: kaanapali: Add support for audio
      arm64: dts: qcom: kaanapali-mtp: Add audio support (WSA8845, WCD93=
95, DMIC)

Prathamesh Shete (1):
      arm64: tegra: Add Tegra264 GPIO controllers

Primoz Fiser (1):
      arm64: dts: freescale: imx93-phy{core,board}: Add i2c bus recovery

Qingqing Zhou (1):
      arm64: dts: qcom: talos: add the GPU SMMU node

Rafa=C5=82 Mi=C5=82ecki (2):
      ARM: dts: mediatek: mt7623: fix efuse fallback compatible
      ARM: dts: BCM5301X: Describe PCIe controllers fully

Raghav Sharma (1):
      arm64: dts: exynosautov920: add CMU_G3D clock DT nodes

Ranjani Vaidyanathan (1):
      arm64: dts: imx94: Update pin headers

Raphael Gallais-Pou (9):
      arm64: dts: st: add ltdc support on stm32mp231
      arm64: dts: st: add ltdc support on stm32mp235
      arm64: dts: st: add lvds support on stm32mp235
      arm64: dts: st: add clock-cells to syscfg node on stm32mp231
      arm64: dts: st: describe power supplies for stm32mp235f-dk board
      arm64: dts: st: enable display support on stm32mp235f-dk board
      arm64: dts: st: describe power supplies for stm32mp257f-dk board
      arm64: dts: st: enable display support on stm32mp257f-dk board
      arm64: defconfig: Enable STMicroelectronics STM32 display support

Rasmus Villemoes (2):
      arm64: dts: ti: k3-pinctrl: consistently use tabs for alignment
      arm64: dts: ti: k3-pinctrl: sort shift values numerically

Ravi Patel (2):
      dt-bindings: arm: axis: Add ARTPEC-9 alfred board
      arm64: dts: axis: Add ARTPEC-9 Alfred board support

Rayan Marzouk (1):
      arm64: dts: exynos: add initial support for Samsung Galaxy J7 (201=
6)

Raymond Hackley (2):
      arm64: dts: qcom: msm8916-samsung-fortuna: Move SM5504 from rossa =
and refactor MUIC
      dt-bindings: qcom: Document samsung,coreprimeltevzw

Riccardo Mereu (1):
      arm64: dts: qcom: arduino-imola: fix faulty spidev node

Richard Acayan (1):
      arm64: dts: qcom: sdm670: add llcc

Rob Herring (Arm) (9):
      ARM: dts: qcom: Drop unused .dtsi
      arm64: dts: broadcom: bcm2712: Move non simple-bus nodes to root l=
evel
      ARM: dts: broadcom: bcm2835-rpi: Move non simple-bus nodes to root=
 level
      dt-bindings: arm,corstone1000: Add "arm,corstone1000-a320-fvp"
      dt-bindings: npu: arm,ethos: Add "arm,corstone1000-ethos-u85"
      arm64: dts: arm/corstone1000: Move cpu nodes
      arm64: dts: arm/corstone1000: Move FVP peripherals to separate .dt=
si
      arm64: dts: arm/corstone1000: Add corstone-1000-a320
      arm64: dts: freescale: imx93: Add Ethos-U65 NPU and SRAM nodes

Robert Marko (4):
      arm64: dts: microchip: add LAN969x clock header file
      arm64: dts: microchip: add LAN969x support
      dt-bindings: arm: AT91: document EV23X71A board
      arm64: dts: microchip: add EV23X71A board

Robert Mazur (1):
      riscv: dts: thead: beaglev-ahead: enable HDMI output

Robin Murphy (5):
      arm64: dts: rockchip: Move RK3399 eDP pinctrl to boards
      arm64: dts: rockchip: Add overlay for FriendlyElec HD702E
      arm64: dts: rockchip: Clean up NanoPi-R2S Plus gmac2io
      arm64: dts: rockchip: Describe HDMI supplies for nanopi4 boards
      Revert "arm64: dts: rockchip: add SPDIF audio to Beelink A1"

Roger Shimizu (3):
      dt-bindings: arm: qcom: Add Thundercomm AI Mini PC G1 IoT
      arm64: dts: qcom: kodiak: Add missing usb-role-switch property
      arm64: dts: qcom: qcs6490: Add Thundercomm AI Mini PC G1 IoT

Rosen Penev (9):
      ARM: dts: BCM5301X: add root pcie bridges
      ARM: dts: BCM5301X: EA9200: set WAN MAC from nvram
      ARM: dts: BCM5301X: panamera: set WAN MAC from nvram
      ARM: dts: BCM5301X: AC3100: set WAN MAC from nvram
      ARM: dts: BCM5301X: AC5300: set WAN MAC from nvram
      ARM: dts: BCM5301X: EA9200: add WiFi button
      ARM: dts: BCM5301X: EA9200: add USB GPIOs
      ARM: dts: BCM5301X: EA9200: add LEDs
      ARM: dts: BCM5301X: EA9200: specify partitions

Ryan Wanner (2):
      ARM: dts: microchip: sama7d65: add LCD controller
      ARM: dts: microchip: sama7d65: add LVDS controller

Samuel Holland (2):
      arm64: dts: rockchip: Add battery and charger on rk3566-pinenote
      arm64: dts: rockchip: Enable GPU on rk3566-pinenote

Sarthak Garg (2):
      arm64: dts: qcom: hamoa-iot-evk: Add SDC2 node for hamoa iot evk b=
oard
      arm64: dts: qcom: purwa-iot-evk: Add SDC2 node for purwa iot evk b=
oard

Scott Murray (1):
      arm64: dts: renesas: sparrow-hawk: Add overlay for Olimex MIPI-HDM=
I adapter

Sebastian Reichel (2):
      arm64: dts: rockchip: Add SPDIF nodes to RK3576 device tree
      arm64: dts: rockchip: add SD/eMMC aliases for ArmSom Sige5

Shawn Lin (3):
      arm64: dts: rockchip: add node name for RK3588_PD_RKVDEC0/1 and RK=
3588_PD_VENC0/1
      arm64: dts: rockchip: Add supply for pd_rkvdec and pd_venc on rk33=
88-evbs
      arm64: dts: rockchip: Add mphy reset to ufshc node

Shengjiu Wang (7):
      arm64: dts: imx8mm-evk: correct the spdif compatible string
      arm64: dts: imx8mp-ab2: add support for NXP i.MX8MP audio board (v=
ersion 2)
      arm64: dts: imx952: Add audio device nodes
      arm64: dts: imx952-evk: Add sound-wm8962 support
      arm64: dts: imx952-evk: Add bt-sco sound card support
      arm64: dts: imx952-evk: Add PDM microphone sound card support
      arm64: dts: imx8dxl-evk: Use audio-graph-card2 for wm8960-2 and wm=
8960-3

Sherry Sun (16):
      arm64: dts: imx8mm-evk: add uart1 and bluetooth node
      arm64: dts: imx8mn-evk: add bluetooth dts node
      arm64: dts: imx8mp-evk: add bluetooth dts node
      arm64: dts: imx93-evk/qsb: add m2-pcm-level-shifter-hog to enable =
BT HFP
      arm64: dts: imx95-19x19-evk: enable lpuart5 for Bluetooth support
      arm64: dts: imx93-14x14-evk: enable lpuart5 for Bluetooth
      arm64: dts: imx943-evk: enable lpuart6 for Bluetooth
      arm64: dts: imx93: Extract common EVK description into shared dtsi
      arm64: dts: imx93: Move 11x11 EVK specific parts back to imx93-11x=
11-evk.dts
      arm64: dts: imx93: Add imx93w.dtsi for i.MX93 Wireless SiP
      arm64: dts: imx93: Add i.MX93 Wireless EVK board support
      arm64: dts: imx943-evk: add usdhc3 for SDIO WiFi support
      arm64: dts: imx8mp-evk: Enable pull select bit for PCIe regulator =
GPIO (M.2 W_DISABLE1)
      arm64: dts: imx8mp-evk: Add usdhc1 for SDIO WiFi support
      arm64: dts: imx91-11x11-evk: Add usdhc3 for SDIO WiFi support
      arm64: dts: imx95-15x15-evk: remove regulator-always-on for reg_m2=
_pwr

Shiva Tripathi (1):
      arm64: dts: ti: k3-am62l-main: Add RNG node

Sibi Sankar (2):
      dt-bindings: arm: cpus: Extend Qualcomm Oryon compatibles
      arm64: dts: qcom: glymur: Fix deprecated cpu compatibles

Siddharth Vadapalli (5):
      arm64: dts: ti: k3-am642-{evm,sk}: add ti,min-output-impedance
      arm64: dts: ti: k3-am654-base-board: add ti,min-output-impedance
      arm64: dts: ti: k3-j7200-common-proc-board: add ti,min-output-impe=
dance
      arm64: dts: ti: k3-j721e-common-proc-board: add ti,min-output-impe=
dance
      arm64: dts: ti: k3-am62a7-sk: Fix pin name in comment from M19 to =
N22

Srinivas Kandagatla (3):
      arm64: dts: qcom: monaco: Add missing usb-role-switch property
      arm64: dts: qcom: monaco: add dt entry for lpass lpi pinctrl
      arm64: dts: monaco: extend fastrpc compute cb

Stefano Radaelli (15):
      arm64: dts: freescale: imx8mm-var-som: Move UART4 description to S=
ymphony
      arm64: dts: freescale: imx8mm-var-som: Align fsl,pins tables
      arm64: dts: freescale: imx8mm-var-som: Update FEC support with Max=
Linear PHY
      arm64: dts: freescale: imx8mm-var-som: Add support for WM8904 audi=
o codec
      arm64: dts: freescale: imx8mm-var-som: Add MCP251xFD CAN controller
      arm64: dts: freescale: imx8mm-var-som: Rework WiFi/BT and add lega=
cy dts
      arm64: dts: imx8mm-var-som-symphony: Move USB configuration from S=
OM
      arm64: dts: imx8mm-var-som-symphony: Enable uSD on USDHC2
      arm64: dts: imx8mm-var-som-symphony: Add TPM2 support
      arm64: dts: imx8mm-var-som-symphony: Enable I2C4
      arm64: dts: imx8mm-var-som-symphony: Enable PCIe
      arm64: dts: freescale: Add support for Variscite DART-MX91
      arm64: dts: imx91-var-dart: Add support for Variscite Sonata board
      arm64: dts: freescale: Add support for Variscite DART-MX95
      arm64: dts: imx95-var-dart: Add support for Variscite Sonata board

Sudarshan Shetty (3):
      dt-bindings: arm: qcom: talos-evk: Add QCS615 Talos EVK SMARC plat=
form
      arm64: dts: qcom: talos/qcs615-ride: Fix inconsistent USB PHY node=
 naming
      arm64: dts: qcom: talos-evk: Add support for QCS615 talos evk board

SungMin Park (1):
      arm64: dts: exynos: axis: Add initial ARTPEC-9 SoC support

Sushrut Shree Trivedi (2):
      arm64: dts: qcom: qcs6490-rb3gen2-industrial-mezzanine: Add TC9563=
 PCIe switch node for PCIe0
      arm64: dts: qcom: qcs6490-rb3gen2-industrial-mezzanine: Add second=
 TC9563 PCIe switch node for PCIe1

Svyatoslav Ryhel (8):
      ARM: tegra: Add SOCTHERM support on Tegra114
      ARM: tn7: Adjust panel node
      ARM: tegra: lg-x3: Add panel and bridge nodes
      ARM: tegra: lg-x3: Add USB and power related nodes
      ARM: tegra: lg-x3: Add node for capacitive buttons
      ARM: tegra: Add ACTMON node to Tegra114 device tree
      ARM: tegra: Add External Memory Controller node on Tegra114
      ARM: tegra: transformers: Add connector node

Swati Agarwal (7):
      arm64: dts: qcom: monaco-evk: Enable GPIO expander interrupt for M=
onaco EVK
      arm64: dts: qcom: monaco: Add role-switch support and HS endpoint =
for secondary USB controller
      arm64: dts: qcom: monaco-evk: Enable the secondary USB controller
      arm64: dts: qcom: lemans-evk: Enable GPIO expander interrupt for L=
emans EVK
      arm64: dts: qcom: lemans-evk: Rename vbus regulator for Primary US=
B controller
      arm64: dts: qcom: lemans: Add role-switch support and HS endpoint =
for tertiary USB controller
      arm64: dts: qcom: lemans-evk: Enable the tertiary USB controller

Taniya Das (4):
      dt-bindings: clock: qcom: document the Eliza Global Clock Controll=
er
      dt-bindings: clock: qcom: Document the Eliza TCSR Clock Controller
      dt-bindings: clock: qcom-rpmhcc: Add RPMHCC for Eliza
      arm64: dts: qcom: kaanapali: Add support for MM clock controllers =
for Kaanapali

Thierry Reding (6):
      dt-bindings: pci: Document the NVIDIA Tegra264 PCIe controller
      Merge branch for-7.1/dt-bindings into for-7.1/pci
      arm64: tegra: Fix snps,blen properties
      arm64: tegra: Drop redundant clock and reset names for TSEC
      arm64: tegra: Add PCI controllers on Tegra264
      arm64: tegra: Add Jetson AGX Thor Developer Kit support

Thomas Richard (TI) (1):
      arm64: dts: ti: k3-j721s2: Use ti,j7200-padconf compatible

Tobias Heider (3):
      arm64: dts: qcom: add missing denali-oled.dtb to Makefile
      arm64: dts: qcom: fix remaining gpu_zap_shader labels
      arm64: dts: qcom: drop redundant zap-shader memory-region

Tomer Maimon (1):
      arm64: dts: nuvoton: drop unused syscon property from watchdog node

Tommaso Merciai (2):
      arm64: dts: renesas: r9a09g047: Add RSPI nodes
      arm64: dts: renesas: r9a09g047e57-smarc: Enable RSPI0

Umang Chheda (2):
      arm64: dts: qcom: monaco-evk: Add IFP Mezzanine
      arm64: dts: qcom: lemans-evk: Add IFP Mezzanine

Val Packett (7):
      dt-bindings: arm: qcom: Add ECS LIVA QC710
      arm64: dts: qcom: Add support for ECS LIVA QC710
      dt-bindings: clock: qcom,sm6115-dispcc: Define MDSS resets
      dt-bindings: clock: qcom,dispcc-sm6125: Define MDSS resets
      arm64: dts: qcom: sm6115: Add missing MDSS core reset
      arm64: dts: qcom: sm6125: Add missing MDSS core reset
      arm64: dts: qcom: kodiak: Add LPASS I2S2 pinctrl definitions

Varadarajan Narayanan (4):
      arm64: dts: qcom: ipq9574: Add details for eMMC
      arm64: dts: qcom: ipq9574-rdp433: Reorganize DTS to introduce eMMC=
 support
      dt-bindings: arm: qcom: Add IPQ9574 AL02-c2 and AL02-c7 eMMC varia=
nt
      arm64: dts: qcom: ipq9574: Enable eMMC variant

Viken Dadhaniya (1):
      arm64: dts: qcom: lemans: Correct QUP interrupt numbers

Vishnu Saini (1):
      arm64: dts: qcom: monaco-evk: add lt8713sx bridge with displayport

Vladimir Zapolskiy (7):
      arm64: dts: qcom: sm8550: Fix xo clock supply of platform SD host =
controller
      arm64: dts: qcom: sm8650: Fix xo clock supply of SD host controller
      arm64: dts: qcom: hamoa: Fix xo clock supply of platform SD host c=
ontroller
      arm64: dts: qcom: sm8450: Enable UHS-I SDR50 and SDR104 SD card mo=
des
      arm64: dts: qcom: sm8550: Enable UHS-I SDR50 and SDR104 SD card mo=
des
      arm64: dts: qcom: sm8650: Enable UHS-I SDR50 and SDR104 SD card mo=
des
      arm64: dts: qcom: sm8550-hdk: add support for the Display Card ove=
rlay

Wadim Egorov (1):
      arm64: dts: ti: k3-am62-phycore-som: Add 128MiB of global CMA

Wei Deng (1):
      arm64: dts: qcom: qcs8300-ride: Enable Bluetooth support

Wei Zhang (1):
      arm64: dts: qcom: qcs8300-ride: enable WLAN on qcs8300-ride

Wenmeng Liu (4):
      arm64: dts: qcom: talos: Add camss node
      arm64: dts: qcom: talos: Add CCI definitions
      arm64: dts: qcom: talos: Add camera MCLK pinctrl
      arm64: dts: qcom: talos-evk-camera: Add DT overlay

Wesley Cheng (2):
      arm64: dts: qcom: glymur: Add USB related nodes
      arm64: dts: qcom: glymur-crd: Enable USB support

Wig Cheng (2):
      arm64: dts: freescale: add pixpaper display overlay for i.MX93 FRDM
      arm64: dts: renesas: r9a09g057h48-kakip: Add pixpaper display over=
lay

Wolfram Sang (2):
      ARM: dts: renesas: r9a06g032-rzn1d400-db: Add QSPI node including =
NOR flash
      ARM: dts: renesas: r9a06g032-rzn1d400-db: Use interrupts for Micre=
l PHYs

Xilin Wu (3):
      arm64: dts: qcom: sm8550: Update EAS properties
      arm64: dts: qcom: pmk8550: Add PWM controller
      arm64: dts: qcom: sm8550: Add UART15

Xin Liu (2):
      arm64: dts: qcom: hamoa: Add EL2 overlay for hamoa-evk
      arm64: dts: qcom: hamoa: Add remoteproc IOMMUS in EL2 device trees

Xu Yang (5):
      arm64: dts: imx94: add USB nodes
      arm64: dts: imx943-evk: add Type-C and USB related nodes
      arm64: dts: freescale: imx8mp-moduline-display-106: add typec-powe=
r-opmode property
      arm64: dts: imx8qm-mek: switch Type-C connector power-role to dual
      arm64: dts: imx8qxp-mek: switch Type-C connector power-role to dual

Xueyao An (1):
      arm64: dts: qcom: hamoa-iot-som: Add firmware-name to QUPv3 nodes

Yanan Yang (1):
      arm64: dts: freescale: add NXP FRDM-IMX91S board support

Yedaya Katsman (1):
      arm64: dts: qcom: sm6125-xiaomi-laurel-sprout: Add Focaltech FT351=
8 touchscreen

Yijie Yang (4):
      arm64: dts: qcom: merge duplicate references to pmc8380_3_gpios
      dt-bindings: arm: qcom: Document PURWA-IOT-EVK board
      arm64: dts: qcom: Add PURWA-IOT-SOM platform
      arm64: dts: qcom: Add base PURWA-IOT-EVK board

Yixun Lan (9):
      riscv: dts: spacemit: pcie: fix missing power regulator
      riscv: dts: spacemit: adapt regulator node name to preferred form
      dt-bindings: serial: 8250: spacemit: fix clock property for K3 SoC
      riscv: dts: spacemit: k3: add clock tree
      riscv: dts: spacemit: k3: add pinctrl support
      riscv: dts: spacemit: k3: add GPIO support
      riscv: dts: spacemit: k3: add full resource to UART
      dts: riscv: spacemit: k3: Add i2c nodes
      dts: riscv: spacemit: k3: add P1 PMIC regulator tree

Yuanjie Yang (2):
      arm64: dts: qcom: kaanapali: add display hardware devices
      arm64: dts: qcom: kaanapali-mtp: Enable display DSI devices

Zichar Zhang (1):
      arm64: dts: cix: add FCH(S0)/S5 GPIO controllers for sky1

Zijun Hu (1):
      arm64: dts: qcom: kaanapali-mtp: Enable bluetooth and Wifi

bui duc phuc (2):
      ARM: dts: renesas: armadillo800eva: Enable SDHI1
      ARM: dts: renesas: armadillo800eva: Add wakeup-source to st1232

=E8=B0=A2=E8=87=B4=E9=82=A6 (XIE Zhibang) (1):
      arm64: dts: rockchip: Fix RK3562 EVB2 model name

 Documentation/devicetree/bindings/arm/altera.yaml  |    7 +
 .../devicetree/bindings/arm/arm,corstone1000.yaml  |   15 +-
 .../devicetree/bindings/arm/arm,vexpress-juno.yaml |   10 +
 .../devicetree/bindings/arm/aspeed/aspeed.yaml     |    2 +
 .../devicetree/bindings/arm/atmel-at91.yaml        |    6 +
 Documentation/devicetree/bindings/arm/axis.yaml    |    6 +
 Documentation/devicetree/bindings/arm/cpus.yaml    |    7 +
 .../bindings/arm/mediatek/mediatek,audsys.yaml     |   63 +-
 Documentation/devicetree/bindings/arm/qcom.yaml    |   47 +
 .../devicetree/bindings/arm/rockchip.yaml          |   20 +-
 .../bindings/arm/samsung/samsung-boards.yaml       |    3 +
 .../devicetree/bindings/arm/stm32/stm32.yaml       |    8 +-
 Documentation/devicetree/bindings/arm/sunxi.yaml   |    5 +
 Documentation/devicetree/bindings/arm/ti/k3.yaml   |    5 +-
 Documentation/devicetree/bindings/arm/ti/omap.yaml |    2 +
 .../bindings/clock/axis,artpec9-clock.yaml         |  232 +
 .../bindings/clock/qcom,ipq5210-gcc.yaml           |   62 +
 .../devicetree/bindings/clock/qcom,milos-gcc.yaml  |    9 +-
 .../devicetree/bindings/clock/qcom,rpmhcc.yaml     |    1 +
 .../bindings/clock/qcom,sm8550-tcsr.yaml           |    2 +
 .../bindings/clock/renesas,rzg2l-cpg.yaml          |   40 +-
 .../bindings/clock/rockchip,rv1126b-cru.yaml       |    1 +
 .../bindings/display/bridge/lvds-codec.yaml        |    1 +
 .../bindings/display/panel/panel-lvds.yaml         |    4 +
 .../embedded-controller/kontron,sl28cpld.yaml      |    7 +-
 .../bindings/interconnect/qcom,eliza-rpmh.yaml     |  142 +
 .../bindings/interconnect/qcom,osm-l3.yaml         |    1 +
 .../bindings/leds/allwinner,sun50i-a100-ledc.yaml  |    1 +
 .../devicetree/bindings/npu/arm,ethos.yaml         |    2 +-
 .../bindings/pci/nvidia,tegra264-pcie.yaml         |  149 +
 .../devicetree/bindings/riscv/extensions.yaml      |   27 +
 .../devicetree/bindings/riscv/microchip.yaml       |    7 +-
 Documentation/devicetree/bindings/serial/8250.yaml |    5 +-
 .../devicetree/bindings/soc/rockchip/grf.yaml      |    3 +
 .../devicetree/bindings/timer/sifive,clint.yaml    |    1 +
 .../devicetree/bindings/vendor-prefixes.yaml       |   10 +
 MAINTAINERS                                        |    1 -
 arch/arm/boot/dts/arm/arm-realview-eb.dtsi         |    2 +-
 arch/arm/boot/dts/arm/arm-realview-pb1176.dts      |    2 +-
 arch/arm/boot/dts/arm/arm-realview-pb11mp.dts      |    2 +-
 arch/arm/boot/dts/arm/arm-realview-pbx.dtsi        |    2 +-
 arch/arm/boot/dts/aspeed/Makefile                  |    2 +
 .../aspeed/aspeed-bmc-asrock-paul-ipmi-card.dts    |  131 +
 .../aspeed/aspeed-bmc-asus-kommando-ipmi-card.dts  |  117 +
 .../dts/aspeed/aspeed-bmc-facebook-anacapa.dts     |   22 +
 .../boot/dts/aspeed/aspeed-bmc-nvidia-msx4-bmc.dts |    1 +
 .../dts/aspeed/openbmc-flash-layout-128-alt.dtsi   |   32 +
 arch/arm/boot/dts/broadcom/bcm-ns.dtsi             |   58 +-
 arch/arm/boot/dts/broadcom/bcm2835-common.dtsi     |    7 +-
 arch/arm/boot/dts/broadcom/bcm2835-rpi.dtsi        |   16 +-
 .../boot/dts/broadcom/bcm4709-linksys-ea9200.dts   |  100 +
 .../boot/dts/broadcom/bcm4709-netgear-r8000.dts    |   73 +-
 .../boot/dts/broadcom/bcm47094-asus-rt-ac3100.dtsi |    7 +
 .../boot/dts/broadcom/bcm47094-asus-rt-ac5300.dts  |    3 +
 .../dts/broadcom/bcm47094-linksys-panamera.dts     |    7 +
 .../boot/dts/broadcom/bcm47094-luxul-xap-1610.dts  |   36 +-
 .../dts/broadcom/bcm47094-luxul-xwr-3150-v1.dts    |   36 +-
 arch/arm/boot/dts/broadcom/bcm63138.dtsi           |   11 +-
 arch/arm/boot/dts/broadcom/bcm63148.dtsi           |   11 +-
 arch/arm/boot/dts/broadcom/bcm6846.dtsi            |    9 +
 arch/arm/boot/dts/broadcom/bcm6855.dtsi            |   18 +
 arch/arm/boot/dts/broadcom/bcm6878.dtsi            |   11 +-
 arch/arm/boot/dts/mediatek/mt7623.dtsi             |    2 +-
 arch/arm/boot/dts/microchip/sam9x60.dtsi           |    2 -
 arch/arm/boot/dts/microchip/sama7d65.dtsi          |   40 +
 arch/arm/boot/dts/nvidia/tegra114-tn7.dts          |   13 +-
 arch/arm/boot/dts/nvidia/tegra114.dtsi             |  221 +
 arch/arm/boot/dts/nvidia/tegra20-paz00.dts         |    8 +
 arch/arm/boot/dts/nvidia/tegra30-asus-tf600t.dts   |   21 +-
 arch/arm/boot/dts/nvidia/tegra30-lg-p880.dts       |   23 +
 arch/arm/boot/dts/nvidia/tegra30-lg-p895.dts       |   33 +
 arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi        |  174 +-
 arch/arm/boot/dts/nxp/imx/Makefile                 |   37 +
 arch/arm/boot/dts/nxp/imx/imx1-ads.dts             |  108 +-
 arch/arm/boot/dts/nxp/imx/imx1-apf9328.dts         |   92 +-
 arch/arm/boot/dts/nxp/imx/imx1.dtsi                |    2 +-
 .../boot/dts/nxp/imx/imx25-eukrea-cpuimx25.dtsi    |   38 +-
 .../imx25-eukrea-mbimxsd25-baseboard-cmo-qvga.dts  |    6 +-
 .../nxp/imx/imx25-eukrea-mbimxsd25-baseboard.dts   |  134 +-
 arch/arm/boot/dts/nxp/imx/imx25-pdk.dts            |  190 +-
 arch/arm/boot/dts/nxp/imx/imx25.dtsi               |    4 +-
 arch/arm/boot/dts/nxp/imx/imx27-apf27.dts          |   58 +-
 arch/arm/boot/dts/nxp/imx/imx27-apf27dev.dts       |  194 +-
 .../boot/dts/nxp/imx/imx27-eukrea-cpuimx27.dtsi    |  244 +-
 .../nxp/imx/imx27-eukrea-mbimxsd27-baseboard.dts   |  196 +-
 arch/arm/boot/dts/nxp/imx/imx27-pdk.dts            |  132 +-
 .../dts/nxp/imx/imx27-phytec-phycard-s-rdk.dts     |   92 +-
 .../dts/nxp/imx/imx27-phytec-phycard-s-som.dtsi    |  174 +-
 .../boot/dts/nxp/imx/imx27-phytec-phycore-rdk.dts  |  206 +-
 .../boot/dts/nxp/imx/imx27-phytec-phycore-som.dtsi |  154 +-
 arch/arm/boot/dts/nxp/imx/imx27.dtsi               |    4 +-
 arch/arm/boot/dts/nxp/imx/imx31.dtsi               |    2 +-
 arch/arm/boot/dts/nxp/imx/imx35.dtsi               |   30 +-
 arch/arm/boot/dts/nxp/imx/imx51-babbage.dts        |    2 +-
 arch/arm/boot/dts/nxp/imx/imx51-ts4800.dts         |    2 +-
 arch/arm/boot/dts/nxp/imx/imx53-smd.dts            |   18 +
 arch/arm/boot/dts/nxp/imx/imx6dl-alti6p.dts        |    4 +-
 .../boot/dts/nxp/imx/imx6dl-eckelmann-ci4x10.dts   |    4 +-
 arch/arm/boot/dts/nxp/imx/imx6dl-lanmcu.dts        |    4 +-
 arch/arm/boot/dts/nxp/imx/imx6dl-plybas.dts        |    4 +-
 arch/arm/boot/dts/nxp/imx/imx6dl-plym2m.dts        |    4 +-
 arch/arm/boot/dts/nxp/imx/imx6dl-prtmvt.dts        |    4 +-
 arch/arm/boot/dts/nxp/imx/imx6dl-qmx6.dtsi         |    5 +-
 arch/arm/boot/dts/nxp/imx/imx6dl-victgo.dts        |    4 +-
 arch/arm/boot/dts/nxp/imx/imx6q-b450v3.dts         |    1 +
 arch/arm/boot/dts/nxp/imx/imx6q-b650v3.dts         |    1 +
 arch/arm/boot/dts/nxp/imx/imx6q-b850v3.dts         |   53 +-
 arch/arm/boot/dts/nxp/imx/imx6q-bx50v3.dtsi        |    4 +
 arch/arm/boot/dts/nxp/imx/imx6q-prtwd2.dts         |    4 +-
 ...mx6qdl-dhcom-overlay-panel-dpi-ch101olhlwh.dtsi |   75 +
 .../nxp/imx/imx6qdl-dhcom-overlay-panel-dpi.dtsi   |   61 +
 .../imx6qdl-dhcom-pdk2-overlay-497-200-x12.dtso    |   28 +
 ...dhcom-pdk2-overlay-505-200-x12-ch101olhlwh.dtso |   26 +
 .../imx6qdl-dhcom-pdk2-overlay-531-100-x21.dtso    |   32 +
 .../imx6qdl-dhcom-pdk2-overlay-531-100-x22.dtso    |   32 +
 .../imx6qdl-dhcom-pdk2-overlay-560-200-x12.dtso    |   39 +
 ...com-picoitx-overlay-626-100-x2-ch101olhlwh.dtso |    8 +
 arch/arm/boot/dts/nxp/imx/imx6qdl-dhcom-som.dtsi   |    6 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-mba6.dtsi        |   12 +
 arch/arm/boot/dts/nxp/imx/imx6qdl-skov-cpu.dtsi    |    4 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-sr-som-ti.dtsi   |    8 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6.dtsi       |   11 +
 arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6a.dtsi      |    5 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6b.dtsi      |    6 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi             |   24 +-
 arch/arm/boot/dts/nxp/imx/imx6sx.dtsi              |    4 +-
 .../boot/dts/nxp/imx/imx6ul-tqma6ul-common.dtsi    |   10 +
 arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ul2.dtsi     |    1 +
 .../boot/dts/nxp/imx/imx6ul-tqma6ul2l-mba6ulx.dts  |    4 +-
 arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ul2l.dtsi    |    1 +
 .../boot/dts/nxp/imx/imx6ul-tqma6ulx-common.dtsi   |    1 +
 .../boot/dts/nxp/imx/imx6ul-tqma6ulxl-common.dtsi  |    1 +
 arch/arm/boot/dts/nxp/imx/imx6ul.dtsi              |    7 +
 arch/arm/boot/dts/nxp/imx/imx6ull-dhcor-som.dtsi   |    4 +-
 .../dts/nxp/imx/imx6ull-engicam-microgea-bmm.dts   |    1 +
 arch/arm/boot/dts/nxp/imx/imx6ull-tqma6ull2.dtsi   |    1 +
 .../dts/nxp/imx/imx6ull-tqma6ull2l-mba6ulx.dts     |    2 +-
 arch/arm/boot/dts/nxp/imx/imx6ull-tqma6ull2l.dtsi  |    3 +-
 arch/arm/boot/dts/nxp/imx/imx6ull.dtsi             |    1 +
 arch/arm/boot/dts/nxp/imx/imx7-mba7.dtsi           |   13 +
 arch/arm/boot/dts/nxp/imx/imx7-tqma7.dtsi          |    5 +
 arch/arm/boot/dts/nxp/imx/imx7s-warp.dts           |    2 -
 arch/arm/boot/dts/nxp/imx/imx7s.dtsi               |    5 +
 arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi             |   28 +
 arch/arm/boot/dts/nxp/imx/mba6ulx.dtsi             |    6 +
 arch/arm/boot/dts/nxp/mxs/imx23-olinuxino.dts      |    2 +-
 arch/arm/boot/dts/nxp/mxs/imx23.dtsi               |    6 +-
 arch/arm/boot/dts/nxp/mxs/imx28-apf28dev.dts       |    2 +-
 arch/arm/boot/dts/nxp/mxs/imx28-apx4devkit.dts     |    2 +-
 arch/arm/boot/dts/nxp/mxs/imx28-cfa10036.dts       |    2 +-
 arch/arm/boot/dts/nxp/mxs/imx28-cfa10049.dts       |    2 +-
 arch/arm/boot/dts/nxp/mxs/imx28-cfa10055.dts       |    2 +-
 arch/arm/boot/dts/nxp/mxs/imx28-cfa10056.dts       |    2 +-
 arch/arm/boot/dts/nxp/mxs/imx28-duckbill-2-485.dts |    4 +-
 .../boot/dts/nxp/mxs/imx28-duckbill-2-enocean.dts  |    6 +-
 arch/arm/boot/dts/nxp/mxs/imx28-duckbill-2.dts     |    4 +-
 arch/arm/boot/dts/nxp/mxs/imx28-duckbill.dts       |    4 +-
 arch/arm/boot/dts/nxp/mxs/imx28-evk.dts            |    2 +-
 arch/arm/boot/dts/nxp/mxs/imx28-m28cu3.dts         |    4 +-
 arch/arm/boot/dts/nxp/mxs/imx28-sps1.dts           |    2 +-
 arch/arm/boot/dts/nxp/mxs/imx28-tx28.dts           |    9 +-
 arch/arm/boot/dts/qcom/Makefile                    |    2 -
 arch/arm/boot/dts/qcom/qcom-apq8084-ifc6540.dts    |   34 -
 arch/arm/boot/dts/qcom/qcom-apq8084-mtp.dts        |   23 -
 arch/arm/boot/dts/qcom/qcom-apq8084.dtsi           |  852 ---
 arch/arm/boot/dts/qcom/qcom-ipq8062-smb208.dtsi    |   37 -
 arch/arm/boot/dts/qcom/qcom-ipq8062.dtsi           |    8 -
 arch/arm/boot/dts/qcom/qcom-ipq8064-smb208.dtsi    |   37 -
 .../boot/dts/qcom/qcom-ipq8064-v2.0-smb208.dtsi    |   37 -
 arch/arm/boot/dts/qcom/qcom-ipq8065-smb208.dtsi    |   37 -
 arch/arm/boot/dts/qcom/qcom-ipq8065.dtsi           |    8 -
 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi           |   21 +-
 arch/arm/boot/dts/renesas/r7s9210-rza2mevb.dts     |    3 +-
 .../boot/dts/renesas/r8a7740-armadillo800eva.dts   |   32 +
 .../boot/dts/renesas/r8a7742-iwg21d-q7-dbcm-ca.dts |    3 +-
 arch/arm/boot/dts/renesas/r8a7743-sk-rzg1m.dts     |    3 +-
 arch/arm/boot/dts/renesas/r8a7745-sk-rzg1e.dts     |    3 +-
 arch/arm/boot/dts/renesas/r8a7790-lager.dts        |    3 +-
 arch/arm/boot/dts/renesas/r8a7790-stout.dts        |    3 +-
 arch/arm/boot/dts/renesas/r8a7791-koelsch.dts      |    3 +-
 arch/arm/boot/dts/renesas/r8a7791-porter.dts       |    3 +-
 arch/arm/boot/dts/renesas/r8a7793-gose.dts         |    3 +-
 arch/arm/boot/dts/renesas/r8a7794-alt.dts          |    3 +-
 arch/arm/boot/dts/renesas/r8a7794-silk.dts         |    3 +-
 .../arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dts |  111 +-
 arch/arm/boot/dts/renesas/r9a06g032.dtsi           |   48 +
 arch/arm/boot/dts/rockchip/Makefile                |    1 +
 arch/arm/boot/dts/rockchip/rk3036-evb.dts          |    4 +-
 arch/arm/boot/dts/rockchip/rk3036-kylin.dts        |    4 +-
 arch/arm/boot/dts/rockchip/rk3188-bqedison2qc.dts  |    2 +-
 .../boot/dts/rockchip/rk3288-firefly-reload.dts    |    3 +-
 arch/arm/boot/dts/rockchip/rk3288-phycore-rdk.dts  |   16 +-
 arch/arm/boot/dts/rockchip/rk3288-phycore-som.dtsi |    2 +-
 arch/arm/boot/dts/rockchip/rk3288-veyron-brain.dts |    2 -
 .../arm/boot/dts/rockchip/rk3288-veyron-fievel.dts |    5 +-
 arch/arm/boot/dts/rockchip/rk3288-veyron-jaq.dts   |    2 +-
 arch/arm/boot/dts/rockchip/rk3288-veyron-jerry.dts |    2 +-
 .../arm/boot/dts/rockchip/rk3288-veyron-mickey.dts |    2 -
 arch/arm/boot/dts/rockchip/rk3288-veyron-pinky.dts |    1 +
 arch/arm/boot/dts/rockchip/rk3288.dtsi             |    1 -
 arch/arm/boot/dts/rockchip/rv1103b-omega4-evb.dts  |   63 +
 arch/arm/boot/dts/rockchip/rv1103b-omega4.dtsi     |  147 +
 arch/arm/boot/dts/rockchip/rv1103b-pinctrl.dtsi    |  816 +++
 arch/arm/boot/dts/rockchip/rv1103b.dtsi            |  239 +
 arch/arm/boot/dts/samsung/Makefile                 |    1 +
 arch/arm/boot/dts/samsung/exynos3250-artik5.dtsi   |    2 -
 arch/arm/boot/dts/samsung/exynos3250-monk.dts      |    4 -
 arch/arm/boot/dts/samsung/exynos3250-rinato.dts    |    4 -
 arch/arm/boot/dts/samsung/exynos4210-smdkv310.dts  |    2 -
 .../boot/dts/samsung/exynos4412-itop-scp-core.dtsi |    2 -
 arch/arm/boot/dts/samsung/exynos4412-origen.dts    |    2 -
 arch/arm/boot/dts/samsung/exynos5250-manta.dts     |  564 ++
 arch/arm/boot/dts/st/Makefile                      |  129 +-
 arch/arm/boot/dts/st/spear13xx.dtsi                |    1 -
 arch/arm/boot/dts/st/stm32mp131.dtsi               |  156 +-
 arch/arm/boot/dts/st/stm32mp135f-dk.dts            |   24 +
 ...tm32mp13xx-dhcor-dhsbc-overlay-rb-tft32-v2.dtso |   85 +
 arch/arm/boot/dts/st/stm32mp15-pinctrl.dtsi        |  164 +
 arch/arm/boot/dts/st/stm32mp151.dtsi               |  236 +-
 arch/arm/boot/dts/st/stm32mp153.dtsi               |   68 +
 arch/arm/boot/dts/st/stm32mp157c-ev1.dts           |   59 +
 ...1-3.dts =3D> stm32mp157c-phyboard-sargas-rdk.dts} |   24 +-
 ...15xx-avenger96-overlay-644-100-x6-otm8009a.dtso |   61 +
 ...15xx-avenger96-overlay-644-100-x6-rpi7inch.dtso |   31 +
 .../stm32mp15xx-avenger96-overlay-fdcan1-x6.dtso   |   10 +
 .../stm32mp15xx-avenger96-overlay-fdcan2-x6.dtso   |   10 +
 ...m32mp15xx-avenger96-overlay-i2c1-eeprom-x6.dtso |   17 +
 ...m32mp15xx-avenger96-overlay-i2c2-eeprom-x6.dtso |   17 +
 .../stm32mp15xx-avenger96-overlay-ov5640-x7.dtso   |   89 +
 ...m32mp15xx-avenger96-overlay-spi2-eeprom-x6.dtso |   24 +
 .../stm32mp15xx-dhcom-drc02-overlay-wifi-rsi.dtso  |   10 +
 ...mp15xx-dhcom-overlay-panel-dpi-ch101olhlwh.dtsi |   75 +
 .../st/stm32mp15xx-dhcom-overlay-panel-dpi.dtsi    |   74 +
 ...stm32mp15xx-dhcom-pdk2-overlay-460-200-x11.dtso |   27 +
 ...stm32mp15xx-dhcom-pdk2-overlay-497-200-x12.dtso |   24 +
 ...dhcom-pdk2-overlay-505-200-x12-ch101olhlwh.dtso |   26 +
 ...stm32mp15xx-dhcom-pdk2-overlay-531-100-x21.dtso |   35 +
 ...stm32mp15xx-dhcom-pdk2-overlay-531-100-x22.dtso |   19 +
 ...stm32mp15xx-dhcom-pdk2-overlay-560-200-x12.dtso |   66 +
 ...xx-dhcom-pdk2-overlay-638-100-x12-rpi7inch.dtso |   28 +
 ...stm32mp15xx-dhcom-pdk2-overlay-672-100-x18.dtso |   13 +
 arch/arm/boot/dts/st/stm32mp15xx-dhcom-pdk2.dtsi   |   72 -
 ...com-picoitx-overlay-548-200-x2-mi0700s4t-6.dtso |   35 +
 ...m-picoitx-overlay-553-100-x2-tst043015cmhx.dtso |   35 +
 ...com-picoitx-overlay-626-100-x2-ch101olhlwh.dtso |    8 +
 .../boot/dts/st/stm32mp15xx-dhcor-avenger96.dtsi   |    6 -
 ...m32mp15xx-dhsom-overlay-panel-dsi-rpi7inch.dtsi |   97 +
 arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi          |   40 +
 .../boot/dts/st/stm32mp15xx-phyboard-sargas.dtsi   |  285 +
 ...2mp15-som.dtsi =3D> stm32mp15xx-phycore-som.dtsi} |  341 +-
 arch/arm/boot/dts/ti/omap/Makefile                 |   15 +
 .../boot/dts/ti/omap/am335x-bone-hdmi-00a0.dtso    |  157 +
 arch/arm/boot/dts/ti/omap/dm816x.dtsi              |    4 +-
 arch/arm/boot/dts/ti/omap/dra7-l4.dtsi             |    4 +-
 arch/arm/boot/dts/ti/omap/omap4-l4.dtsi            |    4 +-
 .../dts/ti/omap/omap4-samsung-espresso-common.dtsi |  744 ++
 .../boot/dts/ti/omap/omap4-samsung-espresso10.dts  |  101 +
 .../boot/dts/ti/omap/omap4-samsung-espresso7.dts   |   70 +
 arch/arm/boot/dts/ti/omap/omap5-l4.dtsi            |    2 +-
 arch/arm/boot/dts/ti/omap/twl6032.dtsi             |   77 +
 arch/arm/mach-tegra/Makefile                       |    2 -
 arch/arm/mach-tegra/board-paz00.c                  |   56 -
 arch/arm/mach-tegra/board.h                        |    2 -
 arch/arm/mach-tegra/tegra.c                        |    4 -
 arch/arm64/boot/dts/allwinner/Makefile             |    1 +
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi      |   10 +
 .../boot/dts/allwinner/sun50i-h6-taiqicat-a01.dts  |  361 +
 arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi       |    8 +
 arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi     |    9 +
 arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi     |   57 +
 .../boot/dts/allwinner/sun55i-t527-avaota-a1.dts   |   56 +
 arch/arm64/boot/dts/altera/Makefile                |    1 +
 .../boot/dts/altera/socfpga_stratix10_socdk.dts    |   67 +-
 .../boot/dts/altera/socfpga_stratix10_socdk.dtsi   |   71 +
 .../dts/altera/socfpga_stratix10_socdk_emmc.dts    |   81 +
 arch/arm64/boot/dts/arm/Makefile                   |    2 +
 arch/arm64/boot/dts/arm/corstone1000-a320-fvp.dts  |   15 +
 arch/arm64/boot/dts/arm/corstone1000-a320.dtsi     |   91 +
 arch/arm64/boot/dts/arm/corstone1000-fvp.dts       |   96 +-
 arch/arm64/boot/dts/arm/corstone1000-fvp.dtsi      |   44 +
 arch/arm64/boot/dts/arm/corstone1000-mps3.dts      |   13 +
 arch/arm64/boot/dts/arm/corstone1000.dtsi          |   13 -
 arch/arm64/boot/dts/arm/zena-css-fvp.dts           |   63 +
 arch/arm64/boot/dts/arm/zena-css.dtsi              |  769 +++
 arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts |   14 +
 .../boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi    |   55 +-
 arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts   |   24 +
 arch/arm64/boot/dts/broadcom/bcm2712.dtsi          |   29 +-
 arch/arm64/boot/dts/broadcom/rp1-common.dtsi       |  105 +
 arch/arm64/boot/dts/cix/sky1-orion-o6.dts          |   28 +
 arch/arm64/boot/dts/cix/sky1-power.h               |   33 +
 arch/arm64/boot/dts/cix/sky1.dtsi                  |  152 +
 arch/arm64/boot/dts/exynos/Makefile                |    2 +
 arch/arm64/boot/dts/exynos/axis/Makefile           |    3 +-
 arch/arm64/boot/dts/exynos/axis/artpec9-alfred.dts |   36 +
 .../boot/dts/exynos/axis/artpec9-pinctrl.dtsi      |  115 +
 arch/arm64/boot/dts/exynos/axis/artpec9.dtsi       |  277 +
 .../arm64/boot/dts/exynos/exynos7870-a2corelte.dts |    9 -
 arch/arm64/boot/dts/exynos/exynos7870-j5y17lte.dts |  523 ++
 arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts    |    6 -
 arch/arm64/boot/dts/exynos/exynos7870-j7xelte.dts  |  494 ++
 arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dts |    9 -
 arch/arm64/boot/dts/exynos/exynos7870.dtsi         |   48 +
 arch/arm64/boot/dts/exynos/exynos8895-dreamlte.dts |    2 -
 arch/arm64/boot/dts/exynos/exynos8895.dtsi         |  128 +
 arch/arm64/boot/dts/exynos/exynosautov920.dtsi     |   13 +
 arch/arm64/boot/dts/exynos/google/gs101-oriole.dts |   22 +
 .../boot/dts/exynos/google/gs101-pixel-common.dtsi |  528 +-
 arch/arm64/boot/dts/exynos/google/gs101-raven.dts  |   18 +
 arch/arm64/boot/dts/freescale/Makefile             |   74 +
 arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi     |   15 +-
 .../arm64/boot/dts/freescale/fsl-lx2160a-cex7.dtsi |   10 +-
 .../dts/freescale/fsl-lx2160a-clearfog-itx.dtsi    |    2 +
 arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi     |  183 +-
 .../boot/dts/freescale/fsl-lx2162a-clearfog.dts    |   10 +
 .../boot/dts/freescale/fsl-lx2162a-sr-som.dtsi     |   19 +-
 .../arm64/boot/dts/freescale/imx8-apalis-eval.dtsi |    4 -
 .../boot/dts/freescale/imx8-apalis-ixora-v1.1.dtsi |   10 +-
 .../boot/dts/freescale/imx8-apalis-ixora-v1.2.dtsi |   10 +-
 arch/arm64/boot/dts/freescale/imx8dxl-evk.dts      |  114 +-
 arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi      |   78 +-
 .../dts/freescale/imx8mm-hummingboard-ripple.dts   |  335 +
 arch/arm64/boot/dts/freescale/imx8mm-pinfunc.h     |   33 +
 arch/arm64/boot/dts/freescale/imx8mm-sr-som.dtsi   |  393 ++
 .../imx8mm-tqma8mqml-mba8mx-lvds-g133han01.dtso    |   86 +
 .../imx8mm-tqma8mqml-mba8mx-lvds-tm070jvhg33.dtso  |    9 +-
 .../boot/dts/freescale/imx8mm-tqma8mqml-mba8mx.dts |    1 -
 .../imx8mm-tx8m-1610-moduline-iv-306-d.dts         |  799 +++
 .../imx8mm-tx8m-1610-moduline-mini-111.dts         |  687 ++
 .../arm64/boot/dts/freescale/imx8mm-tx8m-1610.dtsi |  444 ++
 .../freescale/imx8mm-var-som-symphony-legacy.dts   |   19 +
 .../boot/dts/freescale/imx8mm-var-som-symphony.dts |  214 +-
 .../freescale/imx8mm-var-som-wifi-brcm-legacy.dtsi |   12 +
 .../freescale/imx8mm-var-som-wifi-bt-iw61x.dtsi    |   45 +
 arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi  |  366 +-
 arch/arm64/boot/dts/freescale/imx8mm.dtsi          |   19 +-
 arch/arm64/boot/dts/freescale/imx8mn-evk.dtsi      |    4 +
 .../dts/freescale/imx8mn-solidsense-n8-compact.dts |  851 +++
 .../imx8mn-tqma8mqnl-mba8mx-lvds-tm070jvhg33.dtso  |    7 +-
 .../boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx.dts |    1 -
 arch/arm64/boot/dts/freescale/imx8mn.dtsi          |   11 +-
 arch/arm64/boot/dts/freescale/imx8mp-ab2.dts       |  912 +++
 .../arm64/boot/dts/freescale/imx8mp-beacon-kit.dts |    3 +-
 .../boot/dts/freescale/imx8mp-beacon-som.dtsi      |    3 +-
 arch/arm64/boot/dts/freescale/imx8mp-cubox-m.dts   |    2 +-
 .../arm64/boot/dts/freescale/imx8mp-dhcom-pdk3.dts |    2 +-
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts       |   98 +-
 arch/arm64/boot/dts/freescale/imx8mp-frdm.dts      |  538 +-
 ...hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtso |   67 +
 ...ummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtso |   97 +
 .../imx8mp-hummingboard-iiot-rs485-a.dtso          |   18 +
 .../imx8mp-hummingboard-iiot-rs485-b.dtso          |   18 +
 .../dts/freescale/imx8mp-hummingboard-iiot.dts     |  716 ++
 .../imx8mp-hummingboard-pulse-common.dtsi          |    2 +-
 .../imx8mp-hummingboard-pulse-mini-hdmi.dtsi       |   11 +-
 .../boot/dts/freescale/imx8mp-kontron-dl.dtso      |   26 +-
 .../boot/dts/freescale/imx8mp-kontron-osm-s.dtsi   |    6 +
 .../imx8mp-kontron-smarc-eval-carrier.dts          |    1 -
 arch/arm64/boot/dts/freescale/imx8mp-pinfunc.h     |    2 +-
 .../freescale/imx8mp-tqma8mpql-mba8mp-ras314.dts   |   72 +-
 .../imx8mp-tqma8mpql-mba8mpxl-lvds-g133han01.dtso  |    6 +-
 ...imx8mp-tqma8mpql-mba8mpxl-lvds-tm070jvhg33.dtso |    6 +-
 .../dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts    |   67 +
 ...x8p-ml81-moduline-display-106-av101hdt-a10.dtso |    1 +
 .../imx8mp-tx8p-ml81-moduline-display-106.dts      |   16 +-
 .../arm64/boot/dts/freescale/imx8mp-tx8p-ml81.dtsi |    8 +-
 arch/arm64/boot/dts/freescale/imx8mp.dtsi          |   11 +-
 .../imx8mq-tqma8mq-mba8mx-lvds-tm070jvhg33.dtso    |    6 +-
 arch/arm64/boot/dts/freescale/imx8qm-mek.dts       |   10 +-
 arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi  |    5 +-
 arch/arm64/boot/dts/freescale/imx8qxp-mek.dts      |   10 +-
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi         |    3 +-
 arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts  |   98 +
 .../boot/dts/freescale/imx91-11x11-frdm-s.dts      |  769 +++
 .../boot/dts/freescale/imx91-var-dart-sonata.dts   |  471 ++
 arch/arm64/boot/dts/freescale/imx91-var-dart.dtsi  |  468 ++
 arch/arm64/boot/dts/freescale/imx91.dtsi           |    2 +-
 arch/arm64/boot/dts/freescale/imx91_93_common.dtsi |   64 +-
 .../boot/dts/freescale/imx93-11x11-evk-common.dtsi |  861 +++
 arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts  |  855 +--
 .../dts/freescale/imx93-11x11-frdm-pixpaper.dtso   |   50 +
 arch/arm64/boot/dts/freescale/imx93-14x14-evk.dts  |   12 +
 .../imx93-9x9-qsb-ontat-kd50g21-40nt-a1.dtso       |  110 +
 arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts    |    6 +
 .../boot/dts/freescale/imx93-phyboard-nash.dts     |   12 +-
 .../freescale/imx93-phyboard-segin-peb-av-02.dtso  |  146 +
 .../boot/dts/freescale/imx93-phyboard-segin.dts    |   12 +-
 .../boot/dts/freescale/imx93-phycore-som.dtsi      |   12 +-
 .../imx93-tqma9352-mba91xxca-lvds-tm070jvhg33.dtso |   56 +
 .../imx93-tqma9352-mba91xxca-rgb-cdtech-dc44.dtso  |   66 +
 .../dts/freescale/imx93-tqma9352-mba91xxca.dts     |    4 +-
 .../dts/freescale/imx93-tqma9352-mba93xxca.dts     |    4 +-
 .../imx93-tqma9352-mba93xxla-mini-ezurio-wlan.dtso |   35 +
 .../freescale/imx93-tqma9352-mba93xxla-mini.dts    |  598 ++
 .../dts/freescale/imx93-tqma9352-mba93xxla.dts     |    4 +-
 arch/arm64/boot/dts/freescale/imx93.dtsi           |   36 +
 arch/arm64/boot/dts/freescale/imx93w-evk.dts       |   28 +
 arch/arm64/boot/dts/freescale/imx93w.dtsi          |  110 +
 arch/arm64/boot/dts/freescale/imx94-pinfunc.h      |   12 +
 arch/arm64/boot/dts/freescale/imx94.dtsi           |  127 +-
 arch/arm64/boot/dts/freescale/imx943-evk.dts       |  292 +
 arch/arm64/boot/dts/freescale/imx943.dtsi          |   64 +
 arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts  |    1 -
 arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts |   73 +
 .../boot/dts/freescale/imx95-19x19-evk-sof.dts     |    7 +-
 arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts  |    2 +-
 .../boot/dts/freescale/imx95-toradex-smarc.dtsi    |   49 +-
 .../boot/dts/freescale/imx95-var-dart-sonata.dts   |  595 ++
 arch/arm64/boot/dts/freescale/imx95-var-dart.dtsi  |  425 ++
 .../boot/dts/freescale/imx95-verdin-dahlia.dtsi    |  270 +
 .../arm64/boot/dts/freescale/imx95-verdin-dev.dtsi |  250 +
 .../arm64/boot/dts/freescale/imx95-verdin-ivy.dtsi |  515 ++
 .../boot/dts/freescale/imx95-verdin-mallow.dtsi    |  223 +
 .../dts/freescale/imx95-verdin-nonwifi-dahlia.dts  |   21 +
 .../dts/freescale/imx95-verdin-nonwifi-dev.dts     |   21 +
 .../dts/freescale/imx95-verdin-nonwifi-ivy.dts     |   21 +
 .../dts/freescale/imx95-verdin-nonwifi-mallow.dts  |   21 +
 .../dts/freescale/imx95-verdin-nonwifi-yavia.dts   |   21 +
 .../boot/dts/freescale/imx95-verdin-nonwifi.dtsi   |   16 +
 .../dts/freescale/imx95-verdin-wifi-dahlia.dts     |   21 +
 .../boot/dts/freescale/imx95-verdin-wifi-dev.dts   |   21 +
 .../boot/dts/freescale/imx95-verdin-wifi-ivy.dts   |   21 +
 .../dts/freescale/imx95-verdin-wifi-mallow.dts     |   21 +
 .../boot/dts/freescale/imx95-verdin-wifi-yavia.dts |   21 +
 .../boot/dts/freescale/imx95-verdin-wifi.dtsi      |   50 +
 .../boot/dts/freescale/imx95-verdin-yavia.dtsi     |  217 +
 arch/arm64/boot/dts/freescale/imx95-verdin.dtsi    | 1162 ++++
 arch/arm64/boot/dts/freescale/imx95.dtsi           |  109 +-
 arch/arm64/boot/dts/freescale/imx952-evk.dts       |  273 +
 arch/arm64/boot/dts/freescale/imx952.dtsi          |  232 +-
 arch/arm64/boot/dts/freescale/mba8mx.dtsi          |    4 +-
 arch/arm64/boot/dts/freescale/s32n79-rdb.dts       |   70 +
 arch/arm64/boot/dts/freescale/s32n79.dtsi          |  362 +
 arch/arm64/boot/dts/hisilicon/hi3660.dtsi          |    4 +-
 arch/arm64/boot/dts/hisilicon/hi3670.dtsi          |    4 +-
 arch/arm64/boot/dts/hisilicon/hi6220.dtsi          |    6 +-
 arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi     |    8 +-
 arch/arm64/boot/dts/mediatek/mt6359.dtsi           |    4 +-
 arch/arm64/boot/dts/mediatek/mt6795.dtsi           |    2 +-
 arch/arm64/boot/dts/mediatek/mt7981b.dtsi          |    2 +-
 arch/arm64/boot/dts/mediatek/mt7986a.dtsi          |    2 +-
 .../mediatek/mt7988a-bananapi-bpi-r4-pro-4e.dts    |    2 +-
 .../mediatek/mt7988a-bananapi-bpi-r4-pro-8x.dts    |    2 +-
 arch/arm64/boot/dts/mediatek/mt8167.dtsi           |   68 +-
 .../boot/dts/mediatek/mt8195-cherry-dojo-r1.dts    |   38 +
 arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi    |   58 +-
 arch/arm64/boot/dts/mediatek/mt8365-evk.dts        |    4 +-
 arch/arm64/boot/dts/mediatek/mt8365.dtsi           |    5 +-
 .../boot/dts/mediatek/mt8395-genio-common.dtsi     |    4 +-
 .../boot/dts/mediatek/mt8395-radxa-nio-12l.dts     |    4 +-
 arch/arm64/boot/dts/microchip/Makefile             |    1 +
 arch/arm64/boot/dts/microchip/clk-lan9691.h        |   24 +
 arch/arm64/boot/dts/microchip/lan9691.dtsi         |  488 ++
 arch/arm64/boot/dts/microchip/lan9696-ev23x71a.dts |  756 +++
 .../boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi   |    3 -
 arch/arm64/boot/dts/nvidia/Makefile                |    2 +
 arch/arm64/boot/dts/nvidia/tegra210-smaug.dts      |   12 +
 arch/arm64/boot/dts/nvidia/tegra210.dtsi           |    2 -
 arch/arm64/boot/dts/nvidia/tegra234-p3701.dtsi     |    1 +
 arch/arm64/boot/dts/nvidia/tegra234-p3767.dtsi     |    1 +
 arch/arm64/boot/dts/nvidia/tegra234.dtsi           |    6 +-
 .../dts/nvidia/tegra264-p4071-0000+p3834-0008.dts  |   11 +
 .../boot/dts/nvidia/tegra264-p4071-0000+p3834.dtsi |   12 +
 arch/arm64/boot/dts/nvidia/tegra264.dtsi           |  336 +-
 arch/arm64/boot/dts/qcom/Makefile                  |   63 +-
 arch/arm64/boot/dts/qcom/agatti.dtsi               |    8 +-
 arch/arm64/boot/dts/qcom/apq8096-db820c.dts        | 1126 +--
 arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi       | 1133 ++++
 arch/arm64/boot/dts/qcom/apq8096sg-db820c.dts      |   15 +
 arch/arm64/boot/dts/qcom/eliza-mtp.dts             |  407 ++
 arch/arm64/boot/dts/qcom/eliza.dtsi                | 1885 ++++++
 arch/arm64/boot/dts/qcom/glymur-crd.dts            |  433 ++
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi           |  697 ++
 arch/arm64/boot/dts/qcom/glymur.dtsi               | 7135 +++++++++++++=
+++++++
 arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts         |  141 +-
 arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi        |   30 +-
 .../qcom/hamoa-lenovo-ideacentre-mini-01q8x10.dts  | 1200 ++++
 arch/arm64/boot/dts/qcom/hamoa.dtsi                |  506 +-
 arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts        |   79 +
 arch/arm64/boot/dts/qcom/ipq5210.dtsi              |  311 +
 arch/arm64/boot/dts/qcom/ipq5332-rdp-common.dtsi   |   44 +
 arch/arm64/boot/dts/qcom/ipq5332-rdp442.dts        |   34 -
 arch/arm64/boot/dts/qcom/ipq5332.dtsi              |   33 +
 arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts        |   44 +-
 arch/arm64/boot/dts/qcom/ipq5424.dtsi              |   33 +
 arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi   |   66 +-
 arch/arm64/boot/dts/qcom/ipq9574-rdp418-emmc.dts   |   20 +
 arch/arm64/boot/dts/qcom/ipq9574-rdp418.dts        |   44 +-
 .../arm64/boot/dts/qcom/ipq9574-rdp433-common.dtsi |  121 +
 arch/arm64/boot/dts/qcom/ipq9574-rdp433-emmc.dts   |   20 +
 arch/arm64/boot/dts/qcom/ipq9574-rdp433.dts        |  114 +-
 arch/arm64/boot/dts/qcom/ipq9574-rdp449.dts        |    4 +
 arch/arm64/boot/dts/qcom/ipq9574-rdp453.dts        |    4 +
 arch/arm64/boot/dts/qcom/ipq9574-rdp454.dts        |    4 +
 arch/arm64/boot/dts/qcom/ipq9574.dtsi              |   13 +-
 arch/arm64/boot/dts/qcom/kaanapali-mtp.dts         |  571 +-
 arch/arm64/boot/dts/qcom/kaanapali-qrd.dts         |  106 +
 arch/arm64/boot/dts/qcom/kaanapali.dtsi            | 7116 +++++++++++++=
+++---
 arch/arm64/boot/dts/qcom/kodiak.dtsi               |  128 +-
 arch/arm64/boot/dts/qcom/lemans-el2.dtso           |    4 +
 .../boot/dts/qcom/lemans-evk-ifp-mezzanine.dtso    |  263 +
 arch/arm64/boot/dts/qcom/lemans-evk.dts            |  107 +-
 arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi   |   26 -
 arch/arm64/boot/dts/qcom/lemans.dtsi               |   37 +-
 arch/arm64/boot/dts/qcom/mahua-crd.dts             |   21 +
 arch/arm64/boot/dts/qcom/mahua.dtsi                |  299 +
 arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts   |   89 +-
 arch/arm64/boot/dts/qcom/milos.dtsi                |  669 +-
 arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts  |  466 ++
 arch/arm64/boot/dts/qcom/monaco-el2.dtso           |   29 +
 .../boot/dts/qcom/monaco-evk-camera-imx577.dtso    |   66 +
 .../boot/dts/qcom/monaco-evk-ifp-mezzanine.dtso    |  149 +
 arch/arm64/boot/dts/qcom/monaco-evk.dts            |  312 +-
 arch/arm64/boot/dts/qcom/monaco-monza-som.dtsi     |  323 +
 arch/arm64/boot/dts/qcom/monaco.dtsi               |  617 +-
 .../boot/dts/qcom/msm8216-samsung-fortuna3g.dts    |   18 +
 .../dts/qcom/msm8916-samsung-coreprimeltevzw.dts   |   44 +
 .../dts/qcom/msm8916-samsung-fortuna-common.dtsi   |   32 +-
 .../boot/dts/qcom/msm8916-samsung-gprimeltecan.dts |   15 +-
 .../dts/qcom/msm8916-samsung-grandprimelte.dts     |   18 +
 .../dts/qcom/msm8916-samsung-rossa-common.dtsi     |   19 -
 arch/arm64/boot/dts/qcom/msm8916-samsung-rossa.dts |   18 +
 arch/arm64/boot/dts/qcom/msm8916-wiko-chuppito.dts |  314 +
 arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts   |  310 +-
 arch/arm64/boot/dts/qcom/msm8917-xiaomi-rolex.dts  |   15 +
 arch/arm64/boot/dts/qcom/msm8917-xiaomi-tiare.dts  |   20 +
 .../boot/dts/qcom/msm8917-xiaomi-wingtech.dtsi     |  331 +
 arch/arm64/boot/dts/qcom/msm8937-xiaomi-land.dts   |    2 +-
 arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts     |   21 +
 arch/arm64/boot/dts/qcom/msm8953-xiaomi-daisy.dts  |    2 +-
 arch/arm64/boot/dts/qcom/msm8953-xiaomi-vince.dts  |    2 +-
 .../boot/dts/qcom/msm8996-oneplus-common.dtsi      |    9 +-
 arch/arm64/boot/dts/qcom/msm8996-v3.0.dtsi         |   63 -
 .../arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi |   11 +-
 arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dts |    2 +-
 arch/arm64/boot/dts/qcom/msm8996.dtsi              |    2 +-
 .../boot/dts/qcom/msm8996pro-xiaomi-natrium.dts    |    2 +-
 arch/arm64/boot/dts/qcom/msm8998-xiaomi-sagit.dts  |    9 +-
 arch/arm64/boot/dts/qcom/pm6125.dtsi               |    1 -
 arch/arm64/boot/dts/qcom/pm8010-kaanapali.dtsi     |   93 +
 arch/arm64/boot/dts/qcom/pmcx0102.dtsi             |  187 +
 arch/arm64/boot/dts/qcom/pmd8028-kaanapali.dtsi    |   62 +
 arch/arm64/boot/dts/qcom/pmh0101.dtsi              |   68 +
 arch/arm64/boot/dts/qcom/pmh0104-glymur.dtsi       |  144 +
 arch/arm64/boot/dts/qcom/pmh0104-kaanapali.dtsi    |   63 +
 arch/arm64/boot/dts/qcom/pmh0110-glymur.dtsi       |  144 +
 arch/arm64/boot/dts/qcom/pmh0110-kaanapali.dtsi    |  213 +
 arch/arm64/boot/dts/qcom/pmih0108-kaanapali.dtsi   |   68 +
 arch/arm64/boot/dts/qcom/pmk8550.dtsi              |   10 +
 arch/arm64/boot/dts/qcom/pmk8850.dtsi              |   70 +
 arch/arm64/boot/dts/qcom/pmr735d-kaanapali.dtsi    |   63 +
 arch/arm64/boot/dts/qcom/purwa-iot-evk.dts         | 1590 +++++
 arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi        |  677 ++
 arch/arm64/boot/dts/qcom/purwa.dtsi                |  590 +-
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts |  121 +-
 arch/arm64/boot/dts/qcom/qcm6490-idp.dts           |  169 +
 arch/arm64/boot/dts/qcom/qcs615-ride.dts           |   48 +-
 .../qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso |  269 +
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts       |   95 +-
 .../dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts  | 1093 +++
 .../boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts |    8 +-
 arch/arm64/boot/dts/qcom/qcs8300-ride.dts          |  336 +
 arch/arm64/boot/dts/qcom/qdu1000.dtsi              |   10 +-
 arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts |  126 +-
 arch/arm64/boot/dts/qcom/qrb2210-rb1.dts           |  105 +-
 arch/arm64/boot/dts/qcom/qrb4210-rb2.dts           |  105 +-
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts           |   39 +-
 arch/arm64/boot/dts/qcom/sc7180-ecs-liva-qc710.dts |  616 ++
 arch/arm64/boot/dts/qcom/sc7180.dtsi               |   10 +-
 arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi |   11 -
 arch/arm64/boot/dts/qcom/sc8180x.dtsi              |   12 +-
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi             |  444 +-
 .../arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts |   66 +-
 arch/arm64/boot/dts/qcom/sdm630.dtsi               |   42 +-
 arch/arm64/boot/dts/qcom/sdm670.dtsi               |   11 +
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts         |   69 +-
 arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi |   42 +-
 arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi     |  210 +-
 arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts      |  127 +-
 arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dts       |   28 +-
 .../arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi |  100 +-
 arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts  |   72 +-
 .../boot/dts/qcom/sdm845-sony-xperia-tama.dtsi     |   17 +-
 .../dts/qcom/sdm845-xiaomi-beryllium-common.dtsi   |    1 +
 arch/arm64/boot/dts/qcom/sdm845.dtsi               |   62 +
 arch/arm64/boot/dts/qcom/sdx75.dtsi                |    8 +-
 arch/arm64/boot/dts/qcom/sm4450.dtsi               |    8 +-
 arch/arm64/boot/dts/qcom/sm6115.dtsi               |   10 +-
 .../boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi |  313 +
 arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts  |  285 +-
 .../boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts  |   73 +
 arch/arm64/boot/dts/qcom/sm6125-xiaomi-willow.dts  |   15 +
 arch/arm64/boot/dts/qcom/sm6125.dtsi               |   36 +-
 arch/arm64/boot/dts/qcom/sm6350.dtsi               |   28 +-
 arch/arm64/boot/dts/qcom/sm6375.dtsi               |    8 +-
 arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts  |    4 +
 arch/arm64/boot/dts/qcom/sm8150-hdk.dts            |  141 +-
 arch/arm64/boot/dts/qcom/sm8150.dtsi               |    4 +-
 arch/arm64/boot/dts/qcom/sm8250.dtsi               |   21 +-
 arch/arm64/boot/dts/qcom/sm8350.dtsi               |   28 +-
 arch/arm64/boot/dts/qcom/sm8450.dtsi               |   17 +-
 .../boot/dts/qcom/sm8550-hdk-display-card.dtso     |  132 +
 arch/arm64/boot/dts/qcom/sm8550-mtp.dts            |   13 +-
 arch/arm64/boot/dts/qcom/sm8550-qrd.dts            |   13 +-
 arch/arm64/boot/dts/qcom/sm8550.dtsi               |  101 +-
 .../boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts      | 1551 +++++
 arch/arm64/boot/dts/qcom/sm8650-mtp.dts            |   13 +-
 arch/arm64/boot/dts/qcom/sm8650-qrd.dts            |   13 +-
 arch/arm64/boot/dts/qcom/sm8650.dtsi               |   78 +-
 arch/arm64/boot/dts/qcom/sm8750-mtp.dts            |  122 +
 arch/arm64/boot/dts/qcom/sm8750.dtsi               | 1345 +++-
 arch/arm64/boot/dts/qcom/smb2370.dtsi              |   45 +
 arch/arm64/boot/dts/qcom/talos-el2.dtso            |   25 +
 .../boot/dts/qcom/talos-evk-camera-imx577.dtso     |   63 +
 .../dts/qcom/talos-evk-lvds-auo,g133han01.dtso     |  127 +
 arch/arm64/boot/dts/qcom/talos-evk-som.dtsi        |  617 ++
 .../boot/dts/qcom/talos-evk-usb1-peripheral.dtso   |   27 +
 arch/arm64/boot/dts/qcom/talos-evk.dts             |  139 +
 arch/arm64/boot/dts/qcom/talos.dtsi                |  573 +-
 arch/arm64/boot/dts/qcom/x1-asus-vivobook-s15.dtsi | 1356 ++++
 arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi  |   91 +-
 arch/arm64/boot/dts/qcom/x1-crd.dtsi               |   50 +-
 arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi        |   18 +-
 arch/arm64/boot/dts/qcom/x1-el2.dtso               |    8 +
 arch/arm64/boot/dts/qcom/x1-hp-omnibook-x14.dtsi   |   18 +-
 arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi  |   19 +-
 arch/arm64/boot/dts/qcom/x1e001de-devkit.dts       |   18 +-
 .../dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi    |   18 +-
 .../boot/dts/qcom/x1e80100-asus-vivobook-s15.dts   | 1346 +---
 .../boot/dts/qcom/x1e80100-dell-xps13-9345.dts     |   12 +-
 .../boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts  |   18 +-
 .../dts/qcom/x1e80100-medion-sprchrgd-14-s1.dts    |   18 +-
 .../boot/dts/qcom/x1e80100-microsoft-romulus.dtsi  |   13 +-
 arch/arm64/boot/dts/qcom/x1e80100-qcp.dts          |   18 +-
 .../boot/dts/qcom/x1p42100-asus-vivobook-s15.dts   |   43 +
 .../boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts |   23 +-
 arch/arm64/boot/dts/renesas/Makefile               |   11 +
 .../boot/dts/renesas/beacon-renesom-baseboard.dtsi |   74 -
 .../arm64/boot/dts/renesas/beacon-renesom-som.dtsi |    3 +-
 arch/arm64/boot/dts/renesas/cat875.dtsi            |    3 +-
 arch/arm64/boot/dts/renesas/ebisu.dtsi             |   43 +-
 arch/arm64/boot/dts/renesas/hihope-rzg2-ex.dtsi    |    3 +-
 arch/arm64/boot/dts/renesas/r8a77951.dtsi          |   20 +
 arch/arm64/boot/dts/renesas/r8a77960.dtsi          |   20 +
 arch/arm64/boot/dts/renesas/r8a77961.dtsi          |   20 +
 arch/arm64/boot/dts/renesas/r8a77965.dtsi          |   20 +
 arch/arm64/boot/dts/renesas/r8a77990.dtsi          |   27 +
 .../r8a779g3-sparrow-hawk-olimex-dsi-hdmi.dtso     |   92 +
 .../r8a779g3-sparrow-hawk-ws-display-13in.dtso     |   88 +
 .../boot/dts/renesas/r8a779g3-sparrow-hawk.dts     |    5 +
 arch/arm64/boot/dts/renesas/r9a08g046.dtsi         |  212 +
 arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts |   37 +
 arch/arm64/boot/dts/renesas/r9a08g046l48.dtsi      |   13 +
 arch/arm64/boot/dts/renesas/r9a09g011-v2mevk2.dts  |    3 +-
 arch/arm64/boot/dts/renesas/r9a09g047.dtsi         |  153 +
 arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts |   38 +
 arch/arm64/boot/dts/renesas/r9a09g056.dtsi         |   58 +-
 .../boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts    |   12 +-
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi         |   21 +
 .../boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts    |   33 +-
 .../dts/renesas/r9a09g057h48-kakip-pixpaper.dtso   |   39 +
 arch/arm64/boot/dts/renesas/r9a09g077.dtsi         |   34 +
 .../boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts    |   71 +-
 arch/arm64/boot/dts/renesas/r9a09g087.dtsi         |   34 +
 .../boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts    |   71 +-
 arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi    |   12 +-
 arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi   |    6 +-
 arch/arm64/boot/dts/renesas/rzg2lc-smarc-som.dtsi  |    3 +-
 arch/arm64/boot/dts/renesas/rzg2ul-smarc-som.dtsi  |    6 +-
 arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi   |   21 +-
 arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi   |   20 +
 arch/arm64/boot/dts/renesas/salvator-common.dtsi   |   28 +-
 arch/arm64/boot/dts/renesas/ulcb-kf.dtsi           |   21 +-
 arch/arm64/boot/dts/renesas/ulcb.dtsi              |   13 +
 arch/arm64/boot/dts/rockchip/Makefile              |   23 +
 arch/arm64/boot/dts/rockchip/rk3328-a1.dts         |   23 -
 .../boot/dts/rockchip/rk3328-nanopi-r2s-plus.dts   |   17 -
 arch/arm64/boot/dts/rockchip/rk3399-base.dtsi      |    3 +-
 .../boot/dts/rockchip/rk3399-gru-chromebook.dtsi   |    2 +
 .../boot/dts/rockchip/rk3399-nanopc-t4-hd702e.dtso |   96 +
 arch/arm64/boot/dts/rockchip/rk3399-nanopi4.dtsi   |    2 +
 .../boot/dts/rockchip/rk3399-pinebook-pro.dts      |    2 -
 .../dts/rockchip/rk3399-sapphire-excavator.dts     |    2 +
 arch/arm64/boot/dts/rockchip/rk3528.dtsi           |   47 +
 arch/arm64/boot/dts/rockchip/rk3562-evb2-v10.dts   |    2 +-
 arch/arm64/boot/dts/rockchip/rk3562.dtsi           |   46 +
 arch/arm64/boot/dts/rockchip/rk3566-lckfb-tspi.dts |    4 +-
 .../dts/rockchip/rk3566-onething-edge-cube.dts     |  342 +
 arch/arm64/boot/dts/rockchip/rk3566-pinenote.dtsi  |   31 +
 .../dts/rockchip/rk3566-qnap-ts133-pcb-13.dtso     |   64 +
 .../boot/dts/rockchip/rk3568-anbernic-rg-ds.dts    |   44 +-
 .../dts/rockchip/rk3568-qnap-ts233-pcb-12-11.dtso  |   93 +
 .../dts/rockchip/rk3568-qnap-ts433-pcb-12-10.dtso  |  151 +
 .../rk3568-wolfvision-pf5-io-expander.dtso         |   20 +
 arch/arm64/boot/dts/rockchip/rk3568.dtsi           |   12 +-
 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi      |   79 +-
 .../boot/dts/rockchip/rk3576-armsom-sige5.dts      |    2 +
 arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts   |    1 +
 arch/arm64/boot/dts/rockchip/rk3576-evb2-v10.dts   | 1071 +++
 .../boot/dts/rockchip/rk3576-khadas-edge-2l.dts    |   34 +
 arch/arm64/boot/dts/rockchip/rk3576.dtsi           |  115 +-
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi      |    8 +-
 arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts   |   16 +
 arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts     |   21 +-
 arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi |   39 +
 arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts |   12 +
 .../boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi   |    6 +-
 arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi     |   27 +-
 arch/arm64/boot/dts/rockchip/rk3588s-evb1-v10.dts  |   16 +
 .../boot/dts/rockchip/rk3588s-gameforce-ace.dts    |   12 +-
 arch/arm64/boot/dts/st/stm32mp211.dtsi             |   16 +
 arch/arm64/boot/dts/st/stm32mp215f-dk.dts          |    4 +
 arch/arm64/boot/dts/st/stm32mp231.dtsi             |   31 +-
 arch/arm64/boot/dts/st/stm32mp235.dtsi             |   18 +
 arch/arm64/boot/dts/st/stm32mp235f-dk.dts          |  130 +
 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi      |   63 +-
 arch/arm64/boot/dts/st/stm32mp251.dtsi             |   24 +-
 arch/arm64/boot/dts/st/stm32mp257f-dk.dts          |  130 +
 arch/arm64/boot/dts/st/stm32mp257f-ev1.dts         |    6 +
 arch/arm64/boot/dts/ti/Makefile                    |   27 +-
 arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts           |   14 +-
 arch/arm64/boot/dts/ti/k3-am62-phycore-som.dtsi    |    7 +
 .../arm64/boot/dts/ti/k3-am62-ti-ipc-firmware.dtsi |    1 +
 arch/arm64/boot/dts/ti/k3-am62-verdin-zinnia.dtsi  |  493 ++
 arch/arm64/boot/dts/ti/k3-am62-verdin.dtsi         |   42 +-
 .../boot/dts/ti/k3-am625-verdin-nonwifi-zinnia.dts |   22 +
 .../boot/dts/ti/k3-am625-verdin-wifi-zinnia.dts    |   22 +
 .../boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi      |    2 +
 arch/arm64/boot/dts/ti/k3-am62a7-sk.dts            |   15 +-
 arch/arm64/boot/dts/ti/k3-am62d2-evm.dts           |   82 +-
 arch/arm64/boot/dts/ti/k3-am62l-main.dtsi          |    7 +
 arch/arm64/boot/dts/ti/k3-am62l-wakeup.dtsi        |    7 +-
 arch/arm64/boot/dts/ti/k3-am62l.dtsi               |    5 +-
 arch/arm64/boot/dts/ti/k3-am62l3-evm.dts           |   32 +-
 arch/arm64/boot/dts/ti/k3-am62l3.dtsi              |   47 +
 .../boot/dts/ti/k3-am62p-j722s-common-main.dtsi    |   13 +-
 .../boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi      |    2 +
 arch/arm64/boot/dts/ti/k3-am62p-verdin-zinnia.dtsi |  469 ++
 arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi        |   29 +-
 arch/arm64/boot/dts/ti/k3-am62p5-sk.dts            |   19 +-
 .../dts/ti/k3-am62p5-verdin-nonwifi-zinnia.dts     |   22 +
 .../boot/dts/ti/k3-am62p5-verdin-wifi-zinnia.dts   |   22 +
 arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi     |   13 +-
 .../arm64/boot/dts/ti/k3-am64-ti-ipc-firmware.dtsi |    4 +
 arch/arm64/boot/dts/ti/k3-am642-evm-icssg0.dtso    |  168 +
 arch/arm64/boot/dts/ti/k3-am642-evm.dts            |    1 +
 arch/arm64/boot/dts/ti/k3-am642-sk.dts             |    2 +
 .../arm64/boot/dts/ti/k3-am65-ti-ipc-firmware.dtsi |    2 +
 arch/arm64/boot/dts/ti/k3-am654-base-board.dts     |    1 +
 .../boot/dts/ti/k3-am67a-kontron-sa67-ads2.dtso    |  146 -
 .../boot/dts/ti/k3-am67a-kontron-sa67-base.dts     | 1091 ---
 .../boot/dts/ti/k3-am67a-kontron-sa67-gbe1.dtso    |   26 -
 .../boot/dts/ti/k3-am67a-kontron-sa67-gpios.dtso   |   61 -
 .../dts/ti/k3-am67a-kontron-sa67-rtc-rv8263.dtso   |   31 -
 .../k3-am68-phyboard-izar-lvds-ph128800t006.dtso   |  125 +
 .../dts/ti/k3-am68-phyboard-izar-peb-av-15.dtso    |  191 +
 arch/arm64/boot/dts/ti/k3-am68-phyboard-izar.dts   |   17 +
 arch/arm64/boot/dts/ti/k3-am68-phycore-som.dtsi    |   17 +
 arch/arm64/boot/dts/ti/k3-am69-aquila-clover.dts   |    2 +-
 arch/arm64/boot/dts/ti/k3-am69-aquila-dev.dts      |    2 +-
 .../boot/dts/ti/k3-j7200-common-proc-board.dts     |    1 +
 arch/arm64/boot/dts/ti/k3-j7200-main.dtsi          |    5 +-
 .../boot/dts/ti/k3-j7200-ti-ipc-firmware.dtsi      |    4 +
 .../boot/dts/ti/k3-j721e-common-proc-board.dts     |    1 +
 .../boot/dts/ti/k3-j721e-ti-ipc-firmware.dtsi      |    6 +
 .../boot/dts/ti/k3-j721s2-common-proc-board.dts    |   42 +
 arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi         |   50 +-
 arch/arm64/boot/dts/ti/k3-j721s2-mcu-wakeup.dtsi   |   12 +-
 .../boot/dts/ti/k3-j721s2-ti-ipc-firmware.dtsi     |    6 +
 arch/arm64/boot/dts/ti/k3-j722s-main.dtsi          |   13 +
 .../boot/dts/ti/k3-j722s-ti-ipc-firmware.dtsi      |    3 +
 arch/arm64/boot/dts/ti/k3-j722s.dtsi               |    3 +-
 .../k3-j784s4-j742s2-ti-ipc-firmware-common.dtsi   |    8 +
 arch/arm64/boot/dts/ti/k3-pinctrl.h                |   82 +-
 arch/arm64/configs/defconfig                       |    4 +
 arch/riscv/boot/dts/microchip/Makefile             |   17 +-
 .../riscv/boot/dts/microchip/mpfs-beaglev-fire.dts |   29 +
 arch/riscv/boot/dts/microchip/mpfs-disco-kit.dts   |   43 +-
 .../boot/dts/microchip/mpfs-icicle-kit-common.dtsi |   38 +-
 .../boot/dts/microchip/mpfs-icicle-kit-fabric.dtsi |   63 +
 arch/riscv/boot/dts/microchip/mpfs-m100pfsevp.dts  |   41 +-
 arch/riscv/boot/dts/microchip/mpfs-pinctrl.dtsi    |  167 +
 arch/riscv/boot/dts/microchip/mpfs-polarberry.dts  |   29 +
 arch/riscv/boot/dts/microchip/mpfs-sev-kit.dts     |   37 +-
 arch/riscv/boot/dts/microchip/mpfs-tysom-m.dts     |   35 +-
 arch/riscv/boot/dts/microchip/mpfs.dtsi            |   59 +-
 .../boot/dts/microchip/pic64gx-curiosity-kit.dts   |  165 +
 arch/riscv/boot/dts/microchip/pic64gx-pinctrl.dtsi |  177 +
 arch/riscv/boot/dts/microchip/pic64gx.dtsi         |  630 ++
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts    |   26 +-
 arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts  |  204 +-
 arch/riscv/boot/dts/spacemit/k1.dtsi               |  112 +-
 arch/riscv/boot/dts/spacemit/k3-pico-itx.dts       |  170 +
 arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi       |   69 +
 arch/riscv/boot/dts/spacemit/k3.dtsi               |  369 +-
 arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts |   25 +
 arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts  |   25 +
 arch/riscv/boot/dts/thead/th1520.dtsi              |   70 +
 include/dt-bindings/clock/axis,artpec9-clk.h       |  195 +
 include/dt-bindings/clock/qcom,dispcc-sm6125.h     |    6 +-
 include/dt-bindings/clock/qcom,eliza-gcc.h         |  210 +
 include/dt-bindings/clock/qcom,eliza-tcsr.h        |   17 +
 include/dt-bindings/clock/qcom,ipq5210-gcc.h       |  126 +
 include/dt-bindings/clock/qcom,sm6115-dispcc.h     |    7 +-
 include/dt-bindings/clock/renesas,r9a08g046-cpg.h  |  342 +
 include/dt-bindings/clock/rockchip,rv1103b-cru.h   |  220 +
 include/dt-bindings/interconnect/qcom,eliza-rpmh.h |  136 +
 include/dt-bindings/reset/qcom,ipq5210-gcc.h       |  127 +
 808 files changed, 81759 insertions(+), 12467 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/axis,artpec9=
-clock.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,ipq5210=
-gcc.yaml
 create mode 100644 Documentation/devicetree/bindings/interconnect/qcom,=
eliza-rpmh.yaml
 create mode 100644 Documentation/devicetree/bindings/pci/nvidia,tegra26=
4-pcie.yaml
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-paul-ipmi=
-card.dts
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-asus-kommando-ip=
mi-card.dts
 create mode 100644 arch/arm/boot/dts/aspeed/openbmc-flash-layout-128-al=
t.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6qdl-dhcom-overlay-pane=
l-dpi-ch101olhlwh.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6qdl-dhcom-overlay-pane=
l-dpi.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6qdl-dhcom-pdk2-overlay=
-497-200-x12.dtso
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6qdl-dhcom-pdk2-overlay=
-505-200-x12-ch101olhlwh.dtso
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6qdl-dhcom-pdk2-overlay=
-531-100-x21.dtso
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6qdl-dhcom-pdk2-overlay=
-531-100-x22.dtso
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6qdl-dhcom-pdk2-overlay=
-560-200-x12.dtso
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6qdl-dhcom-picoitx-over=
lay-626-100-x2-ch101olhlwh.dtso
 delete mode 100644 arch/arm/boot/dts/qcom/qcom-apq8084-ifc6540.dts
 delete mode 100644 arch/arm/boot/dts/qcom/qcom-apq8084-mtp.dts
 delete mode 100644 arch/arm/boot/dts/qcom/qcom-apq8084.dtsi
 delete mode 100644 arch/arm/boot/dts/qcom/qcom-ipq8062-smb208.dtsi
 delete mode 100644 arch/arm/boot/dts/qcom/qcom-ipq8062.dtsi
 delete mode 100644 arch/arm/boot/dts/qcom/qcom-ipq8064-smb208.dtsi
 delete mode 100644 arch/arm/boot/dts/qcom/qcom-ipq8064-v2.0-smb208.dtsi
 delete mode 100644 arch/arm/boot/dts/qcom/qcom-ipq8065-smb208.dtsi
 delete mode 100644 arch/arm/boot/dts/qcom/qcom-ipq8065.dtsi
 create mode 100644 arch/arm/boot/dts/rockchip/rv1103b-omega4-evb.dts
 create mode 100644 arch/arm/boot/dts/rockchip/rv1103b-omega4.dtsi
 create mode 100644 arch/arm/boot/dts/rockchip/rv1103b-pinctrl.dtsi
 create mode 100644 arch/arm/boot/dts/rockchip/rv1103b.dtsi
 create mode 100644 arch/arm/boot/dts/samsung/exynos5250-manta.dts
 create mode 100644 arch/arm/boot/dts/st/stm32mp13xx-dhcor-dhsbc-overlay=
-rb-tft32-v2.dtso
 rename arch/arm/boot/dts/st/{stm32mp157c-phycore-stm32mp1-3.dts =3D> st=
m32mp157c-phyboard-sargas-rdk.dts} (58%)
 create mode 100644 arch/arm/boot/dts/st/stm32mp15xx-avenger96-overlay-6=
44-100-x6-otm8009a.dtso
 create mode 100644 arch/arm/boot/dts/st/stm32mp15xx-avenger96-overlay-6=
44-100-x6-rpi7inch.dtso
 create mode 100644 arch/arm/boot/dts/st/stm32mp15xx-avenger96-overlay-f=
dcan1-x6.dtso
 create mode 100644 arch/arm/boot/dts/st/stm32mp15xx-avenger96-overlay-f=
dcan2-x6.dtso
 create mode 100644 arch/arm/boot/dts/st/stm32mp15xx-avenger96-overlay-i=
2c1-eeprom-x6.dtso
 create mode 100644 arch/arm/boot/dts/st/stm32mp15xx-avenger96-overlay-i=
2c2-eeprom-x6.dtso
 create mode 100644 arch/arm/boot/dts/st/stm32mp15xx-avenger96-overlay-o=
v5640-x7.dtso
 create mode 100644 arch/arm/boot/dts/st/stm32mp15xx-avenger96-overlay-s=
pi2-eeprom-x6.dtso
 create mode 100644 arch/arm/boot/dts/st/stm32mp15xx-dhcom-drc02-overlay=
-wifi-rsi.dtso
 create mode 100644 arch/arm/boot/dts/st/stm32mp15xx-dhcom-overlay-panel=
-dpi-ch101olhlwh.dtsi
 create mode 100644 arch/arm/boot/dts/st/stm32mp15xx-dhcom-overlay-panel=
-dpi.dtsi
 create mode 100644 arch/arm/boot/dts/st/stm32mp15xx-dhcom-pdk2-overlay-=
460-200-x11.dtso
 create mode 100644 arch/arm/boot/dts/st/stm32mp15xx-dhcom-pdk2-overlay-=
497-200-x12.dtso
 create mode 100644 arch/arm/boot/dts/st/stm32mp15xx-dhcom-pdk2-overlay-=
505-200-x12-ch101olhlwh.dtso
 create mode 100644 arch/arm/boot/dts/st/stm32mp15xx-dhcom-pdk2-overlay-=
531-100-x21.dtso
 create mode 100644 arch/arm/boot/dts/st/stm32mp15xx-dhcom-pdk2-overlay-=
531-100-x22.dtso
 create mode 100644 arch/arm/boot/dts/st/stm32mp15xx-dhcom-pdk2-overlay-=
560-200-x12.dtso
 create mode 100644 arch/arm/boot/dts/st/stm32mp15xx-dhcom-pdk2-overlay-=
638-100-x12-rpi7inch.dtso
 create mode 100644 arch/arm/boot/dts/st/stm32mp15xx-dhcom-pdk2-overlay-=
672-100-x18.dtso
 create mode 100644 arch/arm/boot/dts/st/stm32mp15xx-dhcom-picoitx-overl=
ay-548-200-x2-mi0700s4t-6.dtso
 create mode 100644 arch/arm/boot/dts/st/stm32mp15xx-dhcom-picoitx-overl=
ay-553-100-x2-tst043015cmhx.dtso
 create mode 100644 arch/arm/boot/dts/st/stm32mp15xx-dhcom-picoitx-overl=
ay-626-100-x2-ch101olhlwh.dtso
 create mode 100644 arch/arm/boot/dts/st/stm32mp15xx-dhsom-overlay-panel=
-dsi-rpi7inch.dtsi
 create mode 100644 arch/arm/boot/dts/st/stm32mp15xx-phyboard-sargas.dtsi
 rename arch/arm/boot/dts/st/{stm32mp157c-phycore-stm32mp15-som.dtsi =3D=
> stm32mp15xx-phycore-som.dtsi} (53%)
 create mode 100644 arch/arm/boot/dts/ti/omap/am335x-bone-hdmi-00a0.dtso
 create mode 100644 arch/arm/boot/dts/ti/omap/omap4-samsung-espresso-com=
mon.dtsi
 create mode 100644 arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.d=
ts
 create mode 100644 arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dts
 create mode 100644 arch/arm/boot/dts/ti/omap/twl6032.dtsi
 delete mode 100644 arch/arm/mach-tegra/board-paz00.c
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h6-taiqicat-a01=
.dts
 create mode 100755 arch/arm64/boot/dts/altera/socfpga_stratix10_socdk.d=
tsi
 create mode 100755 arch/arm64/boot/dts/altera/socfpga_stratix10_socdk_e=
mmc.dts
 create mode 100644 arch/arm64/boot/dts/arm/corstone1000-a320-fvp.dts
 create mode 100644 arch/arm64/boot/dts/arm/corstone1000-a320.dtsi
 create mode 100644 arch/arm64/boot/dts/arm/corstone1000-fvp.dtsi
 create mode 100644 arch/arm64/boot/dts/arm/zena-css-fvp.dts
 create mode 100644 arch/arm64/boot/dts/arm/zena-css.dtsi
 create mode 100644 arch/arm64/boot/dts/cix/sky1-power.h
 create mode 100644 arch/arm64/boot/dts/exynos/axis/artpec9-alfred.dts
 create mode 100644 arch/arm64/boot/dts/exynos/axis/artpec9-pinctrl.dtsi
 create mode 100644 arch/arm64/boot/dts/exynos/axis/artpec9.dtsi
 create mode 100644 arch/arm64/boot/dts/exynos/exynos7870-j5y17lte.dts
 create mode 100644 arch/arm64/boot/dts/exynos/exynos7870-j7xelte.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-hummingboard-ri=
pple.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-sr-som.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml-mba8m=
x-lvds-g133han01.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-tx8m-1610-modul=
ine-iv-306-d.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-tx8m-1610-modul=
ine-mini-111.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-tx8m-1610.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-var-som-symphon=
y-legacy.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-var-som-wifi-br=
cm-legacy.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-var-som-wifi-bt=
-iw61x.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mn-solidsense-n8-c=
ompact.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-ab2.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-hummingboard-ii=
ot-panel-dsi-WJ70N3TYJHMNG0.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-hummingboard-ii=
ot-panel-lvds-WF70A8SYJHLNGA.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-hummingboard-ii=
ot-rs485-a.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-hummingboard-ii=
ot-rs485-b.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-hummingboard-ii=
ot.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx91-11x11-frdm-s.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx91-var-dart-sonata.=
dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx91-var-dart.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-11x11-evk-common=
.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-11x11-frdm-pixpa=
per.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-9x9-qsb-ontat-kd=
50g21-40nt-a1.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-phyboard-segin-p=
eb-av-02.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-tqma9352-mba91xx=
ca-lvds-tm070jvhg33.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-tqma9352-mba91xx=
ca-rgb-cdtech-dc44.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xx=
la-mini-ezurio-wlan.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xx=
la-mini.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx93w-evk.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx93w.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.=
dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-var-dart.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-verdin-dahlia.dt=
si
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-verdin-dev.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-verdin-ivy.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-verdin-mallow.dt=
si
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-d=
ahlia.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-d=
ev.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-i=
vy.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-m=
allow.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-y=
avia.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi.d=
tsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-verdin-wifi-dahl=
ia.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-verdin-wifi-dev.=
dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-verdin-wifi-ivy.=
dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-verdin-wifi-mall=
ow.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-verdin-wifi-yavi=
a.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-verdin-wifi.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-verdin-yavia.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-verdin.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/s32n79-rdb.dts
 create mode 100644 arch/arm64/boot/dts/freescale/s32n79.dtsi
 create mode 100644 arch/arm64/boot/dts/microchip/clk-lan9691.h
 create mode 100644 arch/arm64/boot/dts/microchip/lan9691.dtsi
 create mode 100644 arch/arm64/boot/dts/microchip/lan9696-ev23x71a.dts
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra264-p4071-0000+p3834=
-0008.dts
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra264-p4071-0000+p3834=
.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/apq8096sg-db820c.dts
 create mode 100644 arch/arm64/boot/dts/qcom/eliza-mtp.dts
 create mode 100644 arch/arm64/boot/dts/qcom/eliza.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/glymur-crd.dts
 create mode 100644 arch/arm64/boot/dts/qcom/glymur-crd.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/glymur.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/hamoa-lenovo-ideacentre-min=
i-01q8x10.dts
 create mode 100644 arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts
 create mode 100644 arch/arm64/boot/dts/qcom/ipq5210.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/ipq9574-rdp418-emmc.dts
 create mode 100644 arch/arm64/boot/dts/qcom/ipq9574-rdp433-common.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/ipq9574-rdp433-emmc.dts
 create mode 100644 arch/arm64/boot/dts/qcom/lemans-evk-ifp-mezzanine.dt=
so
 create mode 100644 arch/arm64/boot/dts/qcom/mahua-crd.dts
 create mode 100644 arch/arm64/boot/dts/qcom/mahua.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
 create mode 100644 arch/arm64/boot/dts/qcom/monaco-el2.dtso
 create mode 100644 arch/arm64/boot/dts/qcom/monaco-evk-camera-imx577.dt=
so
 create mode 100644 arch/arm64/boot/dts/qcom/monaco-evk-ifp-mezzanine.dt=
so
 create mode 100644 arch/arm64/boot/dts/qcom/monaco-monza-som.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/msm8916-samsung-coreprimelt=
evzw.dts
 create mode 100644 arch/arm64/boot/dts/qcom/msm8916-wiko-chuppito.dts
 create mode 100644 arch/arm64/boot/dts/qcom/msm8917-xiaomi-rolex.dts
 create mode 100644 arch/arm64/boot/dts/qcom/msm8917-xiaomi-tiare.dts
 create mode 100644 arch/arm64/boot/dts/qcom/msm8917-xiaomi-wingtech.dtsi
 delete mode 100644 arch/arm64/boot/dts/qcom/msm8996-v3.0.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/pm8010-kaanapali.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/pmcx0102.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/pmd8028-kaanapali.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/pmh0101.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/pmh0104-glymur.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/pmh0104-kaanapali.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/pmh0110-glymur.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/pmh0110-kaanapali.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/pmih0108-kaanapali.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/pmk8850.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/pmr735d-kaanapali.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
 create mode 100644 arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-=
g1iot.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-ecs-liva-qc710.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common=
.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sm6125-xiaomi-willow.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sm8550-hdk-display-card.dtso
 create mode 100644 arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts
 create mode 100644 arch/arm64/boot/dts/qcom/smb2370.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/talos-el2.dtso
 create mode 100644 arch/arm64/boot/dts/qcom/talos-evk-camera-imx577.dtso
 create mode 100644 arch/arm64/boot/dts/qcom/talos-evk-lvds-auo,g133han0=
1.dtso
 create mode 100644 arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/talos-evk-usb1-peripheral.d=
tso
 create mode 100644 arch/arm64/boot/dts/qcom/talos-evk.dts
 create mode 100644 arch/arm64/boot/dts/qcom/x1-asus-vivobook-s15.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/x1p42100-asus-vivobook-s15.=
dts
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-ol=
imex-dsi-hdmi.dtso
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-ws=
-display-13in.dtso
 create mode 100644 arch/arm64/boot/dts/renesas/r9a08g046.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r9a08g046l48.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r9a09g057h48-kakip-pixpa=
per.dtso
 create mode 100644 arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3399-nanopc-t4-hd702e=
.dtso
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3566-onething-edge-cu=
be.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3566-qnap-ts133-pcb-1=
3.dtso
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3568-qnap-ts233-pcb-1=
2-11.dtso
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3568-qnap-ts433-pcb-1=
2-10.dtso
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3576-evb2-v10.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3576-khadas-edge-2l.d=
ts
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62-verdin-zinnia.dtsi
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-zinni=
a.dts
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-zinnia.d=
ts
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62p-verdin-zinnia.dtsi
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62p5-verdin-nonwifi-zinn=
ia.dts
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62p5-verdin-wifi-zinnia.=
dts
 create mode 100644 arch/arm64/boot/dts/ti/k3-am642-evm-icssg0.dtso
 delete mode 100644 arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-ads2.dt=
so
 delete mode 100644 arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-base.dts
 delete mode 100644 arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-gbe1.dt=
so
 delete mode 100644 arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-gpios.d=
tso
 delete mode 100644 arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-rtc-rv8=
263.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am68-phyboard-izar-lvds-ph=
128800t006.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am68-phyboard-izar-peb-av-=
15.dtso
 create mode 100644 arch/riscv/boot/dts/microchip/mpfs-pinctrl.dtsi
 create mode 100644 arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.=
dts
 create mode 100644 arch/riscv/boot/dts/microchip/pic64gx-pinctrl.dtsi
 create mode 100644 arch/riscv/boot/dts/microchip/pic64gx.dtsi
 create mode 100644 arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
 create mode 100644 include/dt-bindings/clock/axis,artpec9-clk.h
 create mode 100644 include/dt-bindings/clock/qcom,eliza-gcc.h
 create mode 100644 include/dt-bindings/clock/qcom,eliza-tcsr.h
 create mode 100644 include/dt-bindings/clock/qcom,ipq5210-gcc.h
 create mode 100644 include/dt-bindings/clock/renesas,r9a08g046-cpg.h
 create mode 100644 include/dt-bindings/clock/rockchip,rv1103b-cru.h
 create mode 100644 include/dt-bindings/interconnect/qcom,eliza-rpmh.h
 create mode 100644 include/dt-bindings/reset/qcom,ipq5210-gcc.h
