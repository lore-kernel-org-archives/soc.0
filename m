Received: from fhigh-b7-smtp.messagingengine.com (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB4242E719B
	for <soc@lists.linux.dev>; Fri,  5 Dec 2025 18:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764959310; cv=none; b=Bmb2rFCCWQ7jx6+yhqQnMVSB0waVggvprMdV21YDcIAT2vJXU7KZJvpont5JOGfK/43daFzuQd3Bvy/DEWHsyYzrOTnnCEoLF4hDEaVgmhtZNn63JBeBURgPMswzZrgTOJoXAzhzJS7Ml6I6E7ge/AW9uIV+6HCgb2/2aAD5LxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764959310; c=relaxed/simple;
	bh=Fx3BPYnRzLxCtkCmaPO3bL3Yl77nkVaR9n0QuwhKrQw=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=bS8stEktX/GEi6MMbJEMzOivCA/C0RGVHMWj+rrAnDr5edbgdkgz1E7xeDW5bgT3c6SQYBQSvNYErqynAY//8NWBXDUonBb2B3eH3wUCI7tKdo/8M76Fonnwt1tN4X3WChfgwfRG4hgZM6hyvWubZj2SYw5CE/mzbclrPiZ0bIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=B1HBKCjq; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Xiyt2paB; arc=none smtp.client-ip=202.12.124.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="B1HBKCjq";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Xiyt2paB"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 1CF4B7A016B;
	Fri,  5 Dec 2025 13:28:24 -0500 (EST)
Received: from phl-imap-17 ([10.202.2.105])
  by phl-compute-04.internal (MEProxy); Fri, 05 Dec 2025 13:28:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1764959303;
	 x=1765045703; bh=EVXxh8JSdY78lpZ216K84fM76WI3eu1sRjXnM4bb0Gw=; b=
	B1HBKCjqkt5kjte0QddkJiT5cZhEASyW35RLl59ml4Jk31yUHfWG/cv1ol7++qEL
	ISAnFW+o/gJdkmCxshX2p5kqKY7OqerBb3ipWjiSGFFmOHDJAMeW660m7Cfbbo7M
	pbwJ17USTReDlRwD0cH0RUxssH/rTi039wsL/rt6lL2lW8g8SC05LBXbqiNCUNnf
	j9sUuFTQYsVW3F8WtTFyoF5dYEeHE97hlyTHWZfNmwJVH0qARirAaH/ISwDFmCbX
	Z9l46CI0eVHFw3aLQ8+Q3LUd0hbnRNBOIdymqt8tuoN2xxMTj/oF6dWuWHKJEhFl
	Fh7G/jQ4+zJy/6jf7eFeWQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1764959303; x=
	1765045703; bh=EVXxh8JSdY78lpZ216K84fM76WI3eu1sRjXnM4bb0Gw=; b=X
	iyt2paBaoV5Gk3jxsPpvPEu99OWcjMpt2qnrpDCRIWOvFlM8DaQCww4FdDVKPdoH
	/49s8TazForV2sWSVn79he1KjmvSfYpRYj7kGbl1dkCaLbBton/BupP0UDSKD29q
	T1v3BfGRdRKcaRWyiTmsstJzdBfZVJC6d3yAYifeL6b6Ebe+nJwuTZeXcYIabnXH
	ZRIlHVoYkllw2oF1XLVYTkxDL/0fENV5NF3OddsS2waYNrK2sHhQw7QFV6BaXJ3v
	58pVKDR9oviZphAgkz26J0Yw6pB57vg9QfdYNW7RoMnDVw+wYoylEbLufWVFwohh
	gC4vNMygkDjtRCYhwS8UA==
X-ME-Sender: <xms:RyQzacgQ6L70Ukd4EOatUNYPpQgY10KhPT4D19iixlaEijRpJCMRdA>
    <xme:RyQzaf2o0YviozSl6cbxEjS-HpePp2yEjKE-mvnDtzb9xZYIsJ5dAAJek298tsN8X
    txqMHgk-onXGzGBbsxtEmtjht02atu-8Nnmp1ObcxT-PFsJeN_tJBQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeltdelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    epofggfffhvfevkfgjfhfutgfgsehtqhertdertdejnecuhfhrohhmpedftehrnhguuceu
    vghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvghrnh
    epledvleeivddvhfeuhedvffefteejgeehtdekkefgkeetjeffkeeggfeitdehgfefnecu
    ffhomhgrihhnpehkvghrnhgvlhdrohhrghdpghhithhlrggsrdgtohhmpdhgihhthhhusg
    drtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhm
    pegrrhhnugesrghrnhgusgdruggvpdhnsggprhgtphhtthhopeegpdhmohguvgepshhmth
    hpohhuthdprhgtphhtthhopehtohhrvhgrlhgusheslhhinhhugidqfhhouhhnuggrthhi
    ohhnrdhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsth
    hsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepshhotgeslhhishhtshdrlhhi
    nhhugidruggvvhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvg
    hrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:RyQzaWMvsKwVzjZWmxnNgkAn8Ss1Phv782wd65ulJsGsVjTmGiTTVQ>
    <xmx:RyQzab0FCHa1nyJ8A9bVLASsRdIVtf_2FIo88xkSH_vnAm1uHuDddg>
    <xmx:RyQzaVnS4EkoG6BqRf3KwfyjXNutkmcB4zW5mfdAZZ3GG92B_s8UNg>
    <xmx:RyQzaSWwYg-9t-ge1BoTnotgpGFRiC1FxfuMTKkkjH8_Cp8-zysdIw>
    <xmx:RyQzaf16TCCAtXgsUU0WB6izTYk6BX2tmfiCAIWqM99kVfHbaZmwOXXQ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id BF41AC4006B; Fri,  5 Dec 2025 13:28:23 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: Am9m4lpOTbR7
Date: Fri, 05 Dec 2025 19:28:03 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
Cc: soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Message-Id: <52068d9c-d677-4fa6-8ced-6a7fb190a935@app.fastmail.com>
In-Reply-To: <334684ec-5796-47a4-b9f4-96c60f449634@app.fastmail.com>
References: <334684ec-5796-47a4-b9f4-96c60f449634@app.fastmail.com>
Subject: [GIT PULL 3/6] soc: devicetree updates for 6.19
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The following changes since commit dcb6fa37fd7bc9c3d2b066329b0d27dedf8be=
caa:

  Linux 6.18-rc3 (2025-10-26 15:59:49 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-d=
t-6.19

for you to fetch changes up to 79edb7f596db99c01b25c1deebeffede6b48b505:

  Merge tag 'samsung-dt-6.19' of https://git.kernel.org/pub/scm/linux/ke=
rnel/git/krzk/linux into soc/dt (2025-12-05 15:32:21 +0100)

----------------------------------------------------------------
soc: devicetree updates for 6.19

Three new SoCs got added in existing arm64 chip families:

 - Renesas R-Car X5H (R8A78000) is a new generation of automotive SoCs,
   based on 16 Cortex-A720 (Armv9.2) cores, which makes the the currently
   highest-perforance embedded SoC.

 - TI AM62L is a new variant of the AM62 family of industrial SoCs, this
   one comes without a GPU.

 - Qualcomm MSM8937 (Snapdragon 430) is an older mobile phone chip based
   on Cortex-A53, and closely related to MSM8917 (Snapdragn 425), which =
we
   already support.

In addition, there are a good number of newly supported machines
across SoC families:

 - Two Aspeed AST2600 (Cortex-A7) based BMC setups for large servers

 - Mobile Phones and tables based on Mediatek MT6582, Nvidia Tegra124,
   Qualcomm MSM8937 and Qualcomm MSM8939,

 - Two Laptops based on Qualcomm SoCs: one using the older sdm850, the
   other using x1p42100.

 - One Router based on Rockchips RK3568

 - 24 variants of the Enclustra Mercury system-on-module, all based on
   32-bit Intel/Altera SocFPGA chips, plus two boards using 64-bit
   SocFPGA Agilex chips..

 - 30 industrial/embedded boards and single-board computers, using
   various chips from NXP, Rockchips, Mediatek, TI, Amlogic, Qualcomm,
   Spacemit, and Starfive.

In total there are 783 commits here, the majority of these improving
hardware support and cleaning up devicetree files across the tree, with
the majority of the changes going into the Qualcomm, NXP, Renesas and
Rockchips platforms.

----------------------------------------------------------------
Aaron Kling (12):
      dt-bindings: arm: tegra: Document Jetson Nano Devkits
      arm64: tegra: Add Tegra186 pin controllers
      arm64: tegra: Add NVIDIA Jetson Nano 2GB Developer Kit support
      dt-bindings: devfreq: tegra30-actmon: Add Tegra124 fallback for Te=
gra210
      arm64: tegra: Add ACTMON on Tegra210
      arm64: tegra: Add interconnect properties for Tegra210
      arm64: tegra: Add OPP tables on Tegra210
      arm64: tegra: Enable NVDEC and NVENC on Tegra210
      arm64: tegra: Add reserved-memory node for P3450
      arm64: tegra: Add reserved-memory node for P2180
      arm64: tegra: Set USB Micro-B port to OTG mode on P3450
      arm64: tegra: Remove OTG ID GPIO from Jetson TX2 NX

Adrian Ng Ho Yin (3):
      arm64: dts: socfpga: agilex5: Add L2 and L3 cache
      arm64: dts: socfpga: agilex5: Add SMMU-V3-PMCG nodes
      arm64: dts: intel: agilex5: Add Altera compatible for I3C controll=
ers

Ahmad Fatoum (1):
      ARM: dts: stm32: lxa: drop unnecessary vusb_d/a-supply

Aleksandrs Vinarskis (4):
      dt-bindings: arm: qcom: Add Asus Zenbook A14 UX3407QA LCD/OLED var=
iants
      arm64: dts: qcom: Rework X1-based Asus Zenbook A14's displays
      arm64: dts: qcom: x1e80100-asus-zenbook-a14: Enable WiFi, Bluetooth
      arm64: dts: qcom: sc8280xp-x13s: enable camera privacy indicator

Alex Elder (4):
      riscv: dts: spacemit: enable the i2c8 adapter
      riscv: dts: spacemit: define fixed regulators
      riscv: dts: spacemit: define regulator constraints
      riscv: dts: spacemit: enable K1 SoC QSPI on BPI-F3

Alexander Kurz (1):
      ARM: dts: imx53: enable PMIC RTC on imx53-qsrb

Alexander Martinz (4):
      arm64: dts: qcom: qcm6490-shift-otter: Fix sorting and indentation
      arm64: dts: qcom: qcm6490-shift-otter: Remove thermal zone polling=
 delays
      arm64: dts: qcom: qcm6490-shift-otter: Add missing reserved-memory
      arm64: dts: qcom: qcm6490-shift-otter: Enable venus node

Alexander Stein (20):
      arm64: dts: tqma8mpql-mba8mpxl: Add MicIn routing
      ARM: dts: omap: am335x-tqma335x/mba335x: Fix MicIn routing
      arm64: dts: imx95-tqma9596sa: reduce maximum FlexSPI frequency to =
66MHz
      arm64: dts: imx95-tqma9596sa: increase flexspi slew rate
      arm64: dts: imx95-tqma9596sa: move flexcan pinctrl to SOM
      arm64: dts: imx95-tqma9596sa: move lpspi3 pinctrl to SOM
      arm64: dts: imx95-tqma9596sa: move sai config to SOM
      arm64: dts: imx95-tqma9596sa: move pcie config to SOM
      arm64: dts: imx95-tqma9596sa: update pcie config
      arm64: dts: imx95-tqma9596sa: remove superfluous pinmux for flexspi
      arm64: dts: imx95-tqma9596sa: remove superfluous pinmux for i2c
      arm64: dts: imx95-tqma9596sa: remove superfluous pinmux for usdhci
      arm64: dts: imx95-tqma9596sa: add gpio bus recovery for i2c
      arm64: dts: imx95-tqma9596sa: whitespace fixes
      arm64: dts: imx95-tqma9596sa-mb-smarc-2: Add MicIn routing
      arm64: dts: imx95-tqma9596sa-mb-smarc-2: mark LPUART1 as reserved
      arm64: dts: mba8mx: Add MicIn routing
      arm64: dts: mba8xx: Add MicIn routing
      arm64: dts: mb-smarc-2: Add MicIn routing
      arm64: dts: freescale: tqma9352: Add vcc-supply for spi-nor

Alexandre Belloni (1):
      ARM: dts: imx6q-evi: fix rtc compatible

Alexey Klimov (3):
      arm64: dts: qcom: qcm2290: add APR and its services
      arm64: dts: qcom: qcm2290: add LPASS LPI pin controller
      arm64: dts: qcom: qrb2210-rb1: add HDMI/I2S audio playback support

Andreas Kemnade (1):
      ARM: dts: imx: e70k02: add sy7636

Andr=C3=A9 Draszik (1):
      arm64: dts: exynos: gs101-pixel-common: add node for s2mpg10 / clo=
ck

Aniket Limaye (1):
      arm64: dts: ti: k3-j784s4: Fix I2C pinmux pull configuration

Antonio Borneo (1):
      arm64: dts: st: Add I/O sync to eth pinctrl in stm32mp25-pinctrl.d=
tsi

Antony Kurniawan Soemardi (7):
      arm64: dts: qcom: pmi8950: Add missing VADC channels
      arm64: dts: qcom: pmi8950: Fix VADC channel scaling factors
      ARM: dts: qcom: msm8960: reorder nodes and properties
      ARM: dts: qcom: msm8960: inline qcom-msm8960-pins.dtsi
      ARM: dts: qcom: msm8960: add I2C nodes for gsbi10 and gsbi12
      ARM: dts: qcom: msm8960: add I2C nodes for gsbi1 and gsbi8
      ARM: dts: qcom: msm8960: rename msmgpio node to tlmm

Aradhya Bhatia (2):
      arm64: dts: ti: k3-am62: Add support for AM625 OLDI IO Control
      arm64: dts: ti: k3-am625: Add OLDI support

Arnd Bergmann (33):
      Merge tag 'pxa1908-dt-for-6.19' of https://gitlab.com/pxa1908-main=
line/linux into soc/dt
      Merge tag 'aspeed-6.19-devicetree-0' of https://git.kernel.org/pub=
/scm/linux/kernel/git/bmc/linux into soc/dt
      Merge tag 'renesas-dts-for-v6.19-tag1' of git://git.kernel.org/pub=
/scm/linux/kernel/git/geert/renesas-devel into soc/dt
      Merge tag 'thead-dt-for-v6.19' of git://git.kernel.org/pub/scm/lin=
ux/kernel/git/fustini/linux into soc/dt
      Merge tag 'samsung-dt64-6.19' of https://git.kernel.org/pub/scm/li=
nux/kernel/git/krzk/linux into soc/dt
      Merge tag 'mtk-dts32-for-v6.19' of https://git.kernel.org/pub/scm/=
linux/kernel/git/mediatek/linux into soc/dt
      Merge tag 'mtk-dts64-for-v6.19' of https://git.kernel.org/pub/scm/=
linux/kernel/git/mediatek/linux into soc/dt
      Merge tag 'spacemit-dt-for-6.19-1' of https://github.com/spacemit-=
com/linux into soc/dt
      Merge tag 'renesas-dts-for-v6.19-tag2' of git://git.kernel.org/pub=
/scm/linux/kernel/git/geert/renesas-devel into soc/dt
      Merge tag 'tegra-for-6.19-dt-bindings' of git://git.kernel.org/pub=
/scm/linux/kernel/git/tegra/linux into soc/dt
      Merge tag 'tegra-for-6.19-arm-dt' of git://git.kernel.org/pub/scm/=
linux/kernel/git/tegra/linux into soc/dt
      Merge tag 'tegra-for-6.19-arm64-dt' of git://git.kernel.org/pub/sc=
m/linux/kernel/git/tegra/linux into soc/dt
      Merge tag 'sunxi-dt-for-6.19' of https://git.kernel.org/pub/scm/li=
nux/kernel/git/sunxi/linux into soc/dt
      Merge tag 'imx-dt-6.19' of https://git.kernel.org/pub/scm/linux/ke=
rnel/git/shawnguo/linux into soc/dt
      Merge tag 'imx-dt64-6.19' of https://git.kernel.org/pub/scm/linux/=
kernel/git/shawnguo/linux into soc/dt
      Merge tag 'socfpga_dts_updates_for_v6.19' of git://git.kernel.org/=
pub/scm/linux/kernel/git/dinguyen/linux into soc/dt
      Merge tag 'ti-k3-dt-for-v6.19' of https://git.kernel.org/pub/scm/l=
inux/kernel/git/ti/linux into soc/dt
      Merge tag 'at91-dt-6.19' of https://git.kernel.org/pub/scm/linux/k=
ernel/git/at91/linux into soc/dt
      Merge tag 'omap-for-v6.19/dt-signed' of git://git.kernel.org/pub/s=
cm/linux/kernel/git/khilman/linux-omap into soc/dt
      Merge tag 'qcom-arm32-for-6.19' of https://git.kernel.org/pub/scm/=
linux/kernel/git/qcom/linux into soc/dt
      Merge tag 'qcom-arm64-for-6.19' of https://git.kernel.org/pub/scm/=
linux/kernel/git/qcom/linux into soc/dt
      Merge tag 'v6.19-rockchip-dts32-1' of git://git.kernel.org/pub/scm=
/linux/kernel/git/mmind/linux-rockchip into soc/dt
      Merge tag 'v6.19-rockchip-dts64-1' of git://git.kernel.org/pub/scm=
/linux/kernel/git/mmind/linux-rockchip into soc/dt
      Merge tag 'stm32-dt-for-v6.19-1' of git://git.kernel.org/pub/scm/l=
inux/kernel/git/atorgue/stm32 into soc/dt
      Merge tag 'cix-dt-v6.19-rc1' of git://git.kernel.org/pub/scm/linux=
/kernel/git/peter.chen/cix into soc/dt
      Merge tag 'riscv-sophgo-dt-for-v6.19' of https://github.com/sophgo=
/linux into soc/dt
      Merge tag 'mvebu-dt64-6.19-1' of git://git.kernel.org/pub/scm/linu=
x/kernel/git/gclement/mvebu into soc/dt
      Merge tag 'ti-k3-dt-for-v6.19-part2' of https://git.kernel.org/pub=
/scm/linux/kernel/git/ti/linux into soc/dt
      Merge tag 'imx-bindings-6.19' of https://git.kernel.org/pub/scm/li=
nux/kernel/git/shawnguo/linux into soc/dt
      Merge tag 'v6.19-rockchip-dts64-2' of git://git.kernel.org/pub/scm=
/linux/kernel/git/mmind/linux-rockchip into soc/dt
      Merge tag 'amlogic-arm64-dt-for-v6.19' of https://git.kernel.org/p=
ub/scm/linux/kernel/git/amlogic/linux into soc/dt
      Merge tag 'riscv-dt-for-v6.19' of https://git.kernel.org/pub/scm/l=
inux/kernel/git/conor/linux into soc/dt
      Merge tag 'samsung-dt-6.19' of https://git.kernel.org/pub/scm/linu=
x/kernel/git/krzk/linux into soc/dt

Aurelien Jarno (3):
      riscv: dts: spacemit: enable the i2c2 adapter on BPI-F3
      riscv: dts: spacemit: add 24c02 eeprom on BPI-F3
      riscv: dts: spacemit: add i2c aliases on BPI-F3

Barnab=C3=A1s Cz=C3=A9m=C3=A1n (2):
      dt-bindings: arm: qcom: Add Xiaomi Redmi 3S
      arm64: dts: qcom: Add Xiaomi Redmi 3S

Bartosz Bilas (1):
      arm64: dts: mediatek: mt8370-grinn-genio-510-sbc: Add Grinn GenioS=
BC-510

Bence Cs=C3=B3k=C3=A1s (1):
      ARM: dts: imx53-usbarmory: Replace license text comment with SPDX =
identifier

Bjorn Andersson (5):
      Merge branch '20250919-sm6350-mdss-reset-v1-1-48dcac917c73@fairpho=
ne.com' into arm64-for-6.19
      Merge branch '20251014-qcom_ipq5424_nsscc-v7-2-081f4956be02@quicin=
c.com' into HEAD
      Merge branch 'arm64-fixes-for-6.18' into HEAD
      arm64: dts: qcom: qcs6490-rb3gen2: Rename vph-pwr regulator node
      Revert "arm64: dts: qcom: sc7280: Increase config size to 256MB fo=
r ECAM feature"

Boon Khai Ng (1):
      arm64: dts: agilex5: Add GMAC0 node for NAND daughter card

Bryan Brattlof (1):
      dt-bindings: arm: ti: Add binding for AM62L SoCs

Bryan Hinton (2):
      arm64: dts: mediatek: mt7981b: add labels for UART0/1/2 nodes
      arm64: dts: mediatek: mt7981b: OpenWrt One: set console UART to 11=
5200

Casey Connolly (2):
      arm64: dts: qcom: qcm6490-shift-otter: Enable flash LED
      arm64: dts: qcom: sdm845-oneplus: Update compatbible and add DDIC =
supplies

Chaoyi Chen (1):
      arm64: dts: rockchip: Enable DisplayPort for rk3588-evb2

Charan Pedumuru (3):
      arm: dts: ti: omap: am335x-pepper: Fix vmmc-supply property typo
      arm: dts: ti: omap: Drop unnecessary properties for SDHCI node
      dt-bindings: mmc: ti,omap2430-sdhci: convert to DT schema

Chen Wang (4):
      riscv: sophgo: dts: add PCIe controllers for SG2042
      riscv: sophgo: dts: enable PCIe for PioneerBox
      riscv: sophgo: dts: enable PCIe for SG2042_EVB_V1.X
      riscv: sophgo: dts: enable PCIe for SG2042_EVB_V2.0

Chen-Yu Tsai (11):
      arm64: dts: allwinner: a523: Add GMAC200 ethernet controller
      arm64: dts: allwinner: a527: cubie-a5e: Enable second Ethernet port
      arm64: dts: allwinner: t527: avaota-a1: enable second Ethernet port
      arm64: dts: allwinner: t527: orangepi-4a: Enable Ethernet port
      dt-bindings: dma: allwinner,sun50i-a64-dma: Add compatibles for A5=
23
      arm64: dts: allwinner: a523: Add DMA controller device nodes
      arm64: dts: allwinner: a523: Add device node for SPDIF block
      arm64: dts: allwinner: a523: Add device nodes for I2S controllers
      arm64: dts: allwinner: a523: Add I2S2 pins on PI pin group
      arm64: dts: allwinner: a523: Add SPDIF TX pin on PB and PI pins
      arm64: dts: mediatek: mt8195: Fix address range for JPEG decoder c=
ore 1

Chris Morgan (10):
      arm64: dts: rockchip: enable NPU on Gameforce Ace
      arm64: dts: rockchip: Add device type for Indiedroid Nova.
      arm64: dts: rockchip: enable NPU on Indiedroid Nova
      arm64: dts: rockchip: Enable HS400 for Indiedroid Nova
      arm64: dts: rockchip: Fix DMA for Indiedroid Nova Bluetooth
      arm64: dts: rockchip: Enable USB-C DP Alt for Indiedroid Nova
      arm64: dts: rockchip: Add clk32k_in for Indiedroid Nova
      arm64: dts: rockchip: Define regulator for pcie2x1l2 on Indiedroid=
 Nova
      arm64: dts: rockchip: Correct pinctrl for pcie for Indiedroid Nova
      arm64: dts: rockchip: Add host wake pin for wifi on Indiedroid Nova

Christian Hewitt (2):
      dt-bindings: arm: amlogic: add support for Tanix TX9 Pro
      arm64: dts: meson: add initial device-tree for Tanix TX9 Pro

Christian Marangi (1):
      ARM: dts: mediatek: drop wrong syscon hifsys compatible for MT2701=
/7623

Chukun Pan (9):
      arm64: dts: rockchip: fixes regulator for 100ASK DshanPi A1
      arm64: dts: rockchip: fixes ethernet for 100ASK DshanPi A1
      arm64: dts: rockchip: fixes vcc3v3_s0 supply for 100ASK DshanPi A1
      arm64: dts: rockchip: fixes audio for 100ASK DshanPi A1
      arm64: dts: rockchip: remove mmc max-frequency for 100ASK DshanPi =
A1
      arm64: dts: rockchip: add mmc aliases for 100ASK DshanPi A1
      arm64: dts: rockchip: enable button for 100ASK DshanPi A1
      arm64: dts: rockchip: enable USB for 100ASK DshanPi A1
      arm64: dts: rockchip: enable RTC for 100ASK DshanPi A1

Claudiu Beznea (3):
      arm64: dts: renesas: r9a08g045: Add TSU node
      arm64: dts: renesas: r9a08g045: Add USB support
      arm64: dts: renesas: rzg3s-smarc: Enable USB support

Coia Prant (5):
      dt-bindings: vendor-prefixes: Add 9Tripod
      dt-bindings: arm: rockchip: Add 9Tripod X3568 series
      arm64: dts: rockchip: Add devicetree for the 9Tripod X3568 v4
      arm64: dts: rockchip: clean up devicetree for 9Tripod X3568 v4
      arm64: dts: rockchip: fix PCIe 3.3V regulator voltage on 9Tripod X=
3568 v4

Conor Dooley (5):
      riscv: dts: microchip: enable qspi adc/mmc-spi-slot on BeagleV Fire
      MAINTAINERS: add Conor to StarFive entry
      MAINTAINERS: remove patchwork from RISC-V MISC SOC SUPPORT
      MAINTAINERS: add tree to RISC-V Microchip entry
      MAINTAINERS: degrade RISC-V MISC SOC SUPPORT to Odd Fixes

Cosmin Tanislav (3):
      arm64: dts: renesas: r9a09g077: Add ADCs support
      arm64: dts: renesas: r9a09g087: Add ADCs support
      arm64: dts: renesas: rzt2h/rzn2h-evk: Enable ADCs

Cristian Cozzolino (8):
      ARM: dts: mediatek: mt6582: move MMIO devices under soc node
      ARM: dts: mediatek: mt6582: sort nodes and properties
      ARM: dts: mediatek: mt6582: remove compatible property from root n=
ode
      ARM: dts: mediatek: mt6582: add mt6582 compatible to timer
      ARM: dts: mediatek: mt6582: add clock-names property to uart nodes
      ARM: dts: mediatek: mt6582: add enable-method property to cpus
      dt-bindings: arm: mediatek: Add MT6582 yarisxl
      ARM: dts: mediatek: add basic support for Alcatel yarisxl board

Dang Huynh (1):
      arm64: dts: qcom: Add initial support for MSM8937

Daniel Golle (4):
      arm64: dts: mediatek: mt7622: add 'soc-uuid' cell to efuse
      arm64: dts: mediatek: mt7986a: add 'soc-uuid' cell to efuse
      arm64: dts: mediatek: mt7981b: add 'soc-uuid' cell to efuse
      arm64: dts: mediatek: mt7988a: add 'soc-uuid' cell to efuse

Daniel Hsu (1):
      ARM: dts: aspeed: harma: Add MCTP I2C controller node

Dario Binacchi (1):
      ARM: dts: imx28-amarula-rmm: add I2S audio

David Heidelberg (4):
      arm64: dts: qcom: sdm845: Define guard pages within the rmtfs regi=
on
      arm64: dts: qcom: sdm845-oneplus: Group panel pinctrl
      arm64: dts: qcom: sdm845-oneplus: Implement panel sleep pinctrl
      arm64: dts: qcom: sdm845-oneplus: Describe TE gpio

Denzeel Oliva (1):
      arm64: dts: exynos990: Add sysreg nodes for PERIC0 and PERIC1

Dinh Nguyen (5):
      arm64: dts: socfpga: move sdmmc-ecc to the base DTSI file
      arm64: dts: socfpga: stratix10-swvp: fix dtbs_check warnings swvp
      arm64: dts: socfpga: agilex: fix dtbs_check warning for clock mana=
ger
      arm64: dts: socfpga: agilex: fix dtbs_check warning for NAND
      arm64: dts: socfpga: agilex5: fix CHECK_DTBS warning for NAND

Diogo Ivo (2):
      arm64: tegra: Add Tegra210 NVJPG power-domain node
      arm64: tegra: Add NVJPG node for Tegra210 platforms

Dmitry Baryshkov (26):
      arm64: dts: qcom: lemans: move USB PHYs to a proper place
      arm64: dts: qcom: lemans: add refgen regulator and use it for DSI
      arm64: dts: qcom: sc7180: add refgen regulator and use it for DSI
      arm64: dts: qcom: sc7280: add refgen regulator and use it for DSI
      arm64: dts: qcom: sc8180x: add refgen regulator and use it for DSI
      arm64: dts: qcom: sdm670: add refgen regulator and use it for DSI
      arm64: dts: qcom: sdm845: add refgen regulator and use it for DSI
      arm64: dts: qcom: sm6350: add refgen regulator and use it for DSI
      arm64: dts: qcom: sm8150: add refgen regulator and use it for DSI
      arm64: dts: qcom: sm8250: add refgen regulator and use it for DSI
      arm64: dts: qcom: qcs8300: add refgen regulator
      arm64: dts: qcom: sc8280xp: add refgen regulator
      arm64: dts: qcom: sm6375: add refgen regulator
      arm64: dts: qcom: rename qcs8300 to monaco
      arm64: dts: qcom: rename x1e80100 to hamoa
      arm64: dts: qcom: rename sm6150 to talos
      arm64: dts: qcom: sdm670: create common zap-shader node
      arm64: dts: qcom: sdm845: create common zap-shader node
      arm64: dts: qcom: sc8180x: create common zap-shader node
      arm64: dts: qcom: sc8280xp: create common zap-shader node
      arm64: dts: qcom: sm8250: drop duplicate memory-region defs
      arm64: dts: qcom: sc7180: add gpu_zap_shader label
      arm64: dts: qcom: add gpu_zap_shader label
      arm64: dts: qcom: rename qcm2290 to agatti
      arm64: dts: qcom: rename sc7280 to kodiak
      arm64: dts: qcom: rename x1p42100 to purwa

Dominik Haller (1):
      arm64: dts: ti: k3-am68-phycore-som: Add pmic label

Duje Mihanovi=C4=87 (10):
      arm64: dts: marvell: samsung,coreprimevelte: Add backlight
      arm64: dts: marvell: samsung,coreprimevelte: Correct CD GPIO
      arm64: dts: marvell: samsung,coreprimevelte: Enable eMMC
      arm64: dts: marvell: pxa1908: Add PWMs
      arm64: dts: marvell: samsung,coreprimevelte: Add vibrator
      arm64: dts: marvell: pxa1908: Move ramoops to SoC dtsi
      arm64: dts: marvell: samsung,coreprimevelte: Drop some reserved me=
mory
      arm64: dts: marvell: samsung,coreprimevelte: Fill in memory node
      arm64: dts: marvell: samsung,coreprimevelte: Add USB connector
      arm64: dts: marvell: pxa1908: Add power domains

Dzmitry Sankouski (2):
      arm64: dts: qcom: sdm845-starqltechn: remove (address|size)-cells
      arm64: dts: qcom: sdm845-starqltechn: fix max77705 interrupts

E Shattow (1):
      dts: starfive: jh7110-common: split out mmc0 reset pins from commo=
n into boards

Eddie James (4):
      dt-bindings: arm: aspeed: add IBM Balcones board
      dt-bindings: arm: aspeed: add IBM Bonnell board
      ARM: dts: aspeed: Add Balcones system
      ARM: dts: aspeed: Fix max31785 fan properties

Eric Gon=C3=A7alves (1):
      arm64: dts: qcom: sm8250-samsung-common: correct reserved pins

Erikas Bitovtas (2):
      dt-bindings: arm: qcom: Add Asus ZenFone 2 Laser/Selfie
      arm64: dts: qcom: msm8939-asus-z00t: add initial device tree

FUKAUMI Naoki (7):
      arm64: dts: rockchip: Fix USB Type-C host mode for Radxa ROCK 5B+/=
5T
      arm64: dts: rockchip: Switch microSD card detect to gpio on Radxa =
ROCK 5 ITX/5C
      arm64: dts: rockchip: Remove sdmmc max-frequency for Radxa ROCK 5 =
ITX/5B/5B+/5T
      arm64: dts: rockchip: Move the EEPROM to correct I2C bus on Radxa =
ROCK 5A
      arm64: dts: rockchip: Add eeprom vcc-supply for Radxa ROCK 5A
      arm64: dts: rockchip: Add eeprom vcc-supply for Radxa ROCK 3C
      arm64: dts: rockchip: Use default-state for power LED for Radxa bo=
ards

Fabio Estevam (1):
      dt-bindings: soc: imx-iomuxc-gpr: Document the CSI mux

Fenglin Wu (1):
      arm64: dts: qcom: x1e80100-crd: Add charge limit nvmem

Fong, Yan Kei (4):
      arm64: dts: socfpga: n5x: Add 4-bit SPI bus width
      arm64: dts: socfpga: stratix10: Add 4-bit SPI bus width
      arm64: dts: socfpga: agilex: Add 4-bit SPI bus width
      arm64: dts: socfpga: agilex5: Add 4-bit SPI bus width

Frank Li (44):
      arm64: dts: fsl-lx2160a: include rev2 chip's dts
      ARM: dts: imx6: rename stmpgpio to gpio
      ARM: dts: imx6: rename touch-thermal0 to touch-0-thermal
      ARM: dts: imx6: rename m95m02 to eeprom
      ARM: dts: imx6qdl-ts4900: rename ngpio to ngpios
      ARM: dts: imx6: remove gpio suffix for regulator
      ARM: dts: imx6: change voltage-divider's io-channel-cells to 1
      ARM: dts: imx6: remove pinctrl-name if pinctrl-0 doesn't exist
      ARM: dts: imx6-tbs2910: rename ir_recv to ir-receiver
      ARM: dts: imx6q-utilite-pro: add missing required property for pci
      ARM: dts: imx6ull-phytec-tauri: remove extra space before jedec,sp=
i-nor
      ARM: dts: imx6qdl-nitrogen6_max: rename i2c<n>mux to i2c
      ARM: dts: imx: add power-supply for lcd panel
      ARM: dts: imx6ull-dhcom-pdk2: rename power-supply to vcc-supply fo=
r touchscreen
      ARM: dts: imx: remove redundant linux,phandle
      ARM: dts: imx6qdl-skov-cpu fix typo interrupt
      ARM: dts: imx6q-cm-fx6.dts: add supplies for wm8731
      ARM: dts: Add bus type for parallel ov5640
      ARM: dts: add device_type for memory node
      ARM: dts: remove undocumented clock-names for ov5642
      ARM: dts: imx7ulp: remove bias-pull-up
      arm64: dts: layerscape: add dma-coherent for usb node
      arm64: dts: imx8dxl-evk: add bt information for lpuart1
      arm64: dts: imx8dxl-evk: add state_100mhz and state_200mhz for usd=
hc
      arm64: dts: imx8-ss-conn: add fsl,tuning-step for usdhc1 and usdhc2
      arm64: dts: imx8-ss-conn: add missed clock enet_2x_txclk for fec[1=
,2]
      arm64: dts: imx8dxl-ss-conn: delete usb3_lpcg node
      arm64: dts: imx8: add vdd-supply and vddio-supply for fsl,mpl3115
      ARM: dts: imx: add vdd-supply and vddio-supply for fsl,mpl3115
      arm64: dts: imx8qm-mek: add state_100mhz and state_200mhz for usdhc
      arm64: dts: imx8qm-mek: assign double SD bus frequency for usdhc1
      arm64: dts: imx8qm-mek: add lpuart1 and bluetooth node
      arm64: dts: imx8qm: add label thermal_zones
      arm64: dts: imx8qm-mek: add pmic thermal-zones
      arm64: dts: imx8qm-mek: add usbotg1 and related nodes
      arm64: dts: imx8qm-mek: replace space with tab
      arm64: dts: imx8qxp: add MAC address in ocotp
      arm64: dts: imx8qxp: add wakeup source for power-key
      arm64: dts: imx8qxp-mek: add state_100mhz and state_200mhz for usd=
hc
      arm64: dts: imx8qxp-mek: update usdhc1 clock to 400Mhz
      arm64: dts: imx8qxp-mek: add flexspi and flash
      arm64: dts: imx8qxp-mek: add phandle ocotp mac-address for fec
      arm64: dts: imx8qxp-mek: add fec2 support
      arm64: dts: imx8qxp-mek: change space with tab

Frank Wunderlich (5):
      dt-bindings: arm: mediatek: add BPI-R4 Pro board
      arm64: dts: mediatek: mt7988: Disable 2.5G phy and enable at board=
 layer
      arm64: dts: mediatek: mt7988: Add devicetree for BananaPi R4 Pro
      arm64: dts: mediatek: mt7988a-bpi-r4-pro: Add PCIe overlays
      arm64: dts: mediatek: mt7988a-bpi-r4pro: Add mmc overlays

Fred Chen (7):
      ARM: dts: aspeed: santabarbara: Add blank lines between nodes for =
readability
      ARM: dts: aspeed: santabarbara: Add sensor support for extension b=
oards
      ARM: dts: aspeed: santabarbara: Enable MCTP for frontend NIC
      ARM: dts: aspeed: santabarbara: Add bmc_ready_noled Led
      ARM: dts: aspeed: santabarbara: Add gpio line name
      ARM: dts: aspeed: santabarbara: Add AMD APML interface support
      ARM: dts: aspeed: santabarbara: Add eeprom device node for PRoT mo=
dule

Gary Yang (1):
      arm64: dts: cix: Add pinctrl nodes for sky1

Gatien Chevallier (5):
      ARM: dts: stm32: add iwdg1 node in stm32mp131.dtsi
      ARM: dts: stm32: add the ARM SMC watchdog in stm32mp131.dtsi
      ARM: dts: stm32: enable the ARM SMC watchdog node in stm32mp135f-dk
      ARM: dts: stm32: add the IWDG2 interrupt line in stm32mp131.dtsi
      arm64: dts: st: set RIFSC as an access controller on stm32mp21x pl=
atforms

Gaurav Kohli (1):
      arm64: dts: qcom: lemans-evk: Enable AMC6821 fan controller

Geert Uytterhoeven (16):
      ARM: dts: renesas: r7s72100: Move interrupt-parent to root node
      ARM: dts: renesas: r7s9210: Remove duplicate interrupt-parent
      ARM: dts: renesas: r8a7742: Move interrupt-parent to root node
      ARM: dts: renesas: r8a7743: Move interrupt-parent to root node
      ARM: dts: renesas: r8a7744: Move interrupt-parent to root node
      ARM: dts: renesas: r8a7745: Move interrupt-parent to root node
      ARM: dts: renesas: r8a77470: Move interrupt-parent to root node
      ARM: dts: renesas: r8a7790: Move interrupt-parent to root node
      ARM: dts: renesas: r8a7791: Move interrupt-parent to root node
      ARM: dts: renesas: r8a7792: Move interrupt-parent to root node
      ARM: dts: renesas: r8a7793: Move interrupt-parent to root node
      ARM: dts: renesas: r8a7794: Move interrupt-parent to root node
      ARM: dts: renesas: r9a06g032: Move interrupt-parent to root node
      arm64: dts: renesas: v3msk: Enable watchdog timer
      ARM: dts: am33xx: Add missing serial console speed
      Merge tag 'renesas-r8a779a0-dt-binding-defs-tag2' into renesas-dts=
-for-v6.19

George Kelly (1):
      ARM: dts: ti/omap: fix incorrect compatible string in internal eep=
rom node

Gergo Koteles (1):
      arm64: dts: qcom: sdm845-oneplus: Correct gpio used for slider

Griffin Kroah-Hartman (3):
      arm64: dts: qcom: qcm6490-fairphone-fp5: Add vibrator support
      arm64: dts: qcom: qcm6490-fairphone-fp5: Enable CCI pull-up
      arm64: dts: qcom: qcm6490-fairphone-fp5: Add UW cam actuator

Guido G=C3=BCnther (1):
      arm64: dts: qcom: sdm845-shift-axolotl: Drop address and size cell=
s from panel

Guillaume La Roque (1):
      arm64: dts: amlogic: meson-g12b: Fix L2 cache reference for S922X =
CPUs

Hai Pham (2):
      arm64: dts: renesas: Add R8A78000 SoC support
      arm64: dts: renesas: r8a78000: Add initial Ironhide board support

Haibo Chen (1):
      arm64: dts: imx: correct the flexspi compatible string to match wi=
th yaml

Hal Feng (5):
      dt-bindings: riscv: Add StarFive JH7110S SoC and VisionFive 2 Lite=
 board
      riscv: dts: starfive: jh7110-common: Move out some nodes to the bo=
ard dts
      riscv: dts: starfive: Add common board dtsi for VisionFive 2 Lite =
variants
      riscv: dts: starfive: Add VisionFive 2 Lite board device tree
      riscv: dts: starfive: Add VisionFive 2 Lite eMMC board device tree

Han Gao (3):
      riscv: dts: thead: add xtheadvector to the th1520 devicetree
      riscv: dts: thead: add ziccrse for th1520
      riscv: dts: thead: add zfh for th1520

Hans Zhang (2):
      arm64: dts: cix: Add PCIe Root Complex on sky1
      arm64: dts: cix: Enable PCIe on the Orion O6 board

Haotien Hsu (2):
      dt-bindings: usb: Add wake-up support for Tegra234 XUSB host contr=
oller
      arm64: tegra: Add interrupts for Tegra234 USB wake events

Heiko Stuebner (12):
      dt-bindings: clock: rk3568: Add SCMI clock ids
      Merge branch 'v6.19-shared/clkids' into v6.19-armsoc/dts64
      arm64: dts: rockchip: use SCMI clock id for cpu clock on rk356x
      arm64: dts: rockchip: add missing clocks for cpu cores on rk356x
      arm64: dts: rockchip: use SCMI clock id for gpu clock on rk356x
      arm64: dts: rockchip: move cpu_thermal node to the correct position
      arm64: dts: rockchip: describe mcu eeprom cells on rk3568-ts433
      arm64: dts: rockchip: move common qnap tsx33 parts to dtsi
      dt-bindings: arm: rockchip: add TS233 to RK3568-based QNAP NAS dev=
ices
      arm64: dts: rockchip: add QNAP TS233 devicetree
      arm64: dts: rockchip: Add power-domain to RK3368 DSI controller
      arm64: dts: rockchip: Add power-domain to RK3368 VOP controller

Hendrik Hamerlinck (1):
      riscv: dts: spacemit: add UART pinctrl combinations

Herve Codina (Schneider Electric) (1):
      ARM: dts: renesas: r9a06g032: Add the ADC device

Hrushikesh Salunke (3):
      arm64: dts: ti: k3-j784s4-evm-pcie0-pcie1-ep: Add boot phase tag t=
o "pcie1_ep"
      arm64: dts: ti: k3-j784s4-j742s2-evm-common: Add bootph-all tag to=
 SERDES0
      arm64: dts: ti: k3-j784s4-j742s2-evm-common: Add bootph-all tag to=
 "pcie1_ctrl"

Hsun Lai (2):
      dt-bindings: arm: rockchip: Add 100ASK DShanPi A1
      arm64: dts: rockchip: add DTs for 100ASK DShanPi A1

Icenowy Zheng (2):
      dt-bindings: riscv: starfive: add xunlong,orangepi-rv
      riscv: dts: starfive: add Orange Pi RV

Igor Belwon (1):
      arm64: dts: mediatek: Add MT6878 pinmux macro header file

Ioana Ciornei (6):
      dt-bindings: fsl,fpga-qixis-i2c: add support for LX2160ARDB FPGA
      dt-bindings: fsl,fpga-qixis: describe the gpio child node found on=
 LS1046AQDS
      arm64: dts: lx2160a-rdb: describe the QIXIS FPGA and two child GPI=
O controllers
      arm64: dts: ls1046a-qds: describe the FPGA based GPIO controller
      arm64: dts: lx2160a-rdb: fully describe the two SFP+ cages
      arm64: dts: ls1046a-qds: describe the two on-board SFP+ cages

Jan Petrous (OSS) (1):
      arm64: dts: freescale: Add GMAC Ethernet for S32G2 EVB and RDB2 an=
d S32G3 RDB3

Jan Remmet (5):
      arm64: dts: imx8mm-phyboard-polis: Use GPL-2.0-or-later OR MIT
      arm64: dts: imx8mm-phyboard-polis: move mipi bridge to som
      arm64: dts: imx8mm-phyboard-polis-peb-av-10: reorder properties to=
 match dts coding style
      arm64: dts: imx8mm-phyboard-polis-peb-av-10: split display configu=
ration
      arm64: dts: imx8mm-phyboard-polis-peb-av-10-ph128800t006

Jason-JH Lin (1):
      arm64: dts: mediatek: Add GCE header for MT8196

Jie Gan (1):
      arm64: dts: qcom: kodiak: add coresight nodes

Jihed Chaibi (3):
      ARM: dts: omap3: beagle-xm: Correct obsolete TWL4030 power compati=
ble
      ARM: dts: omap3: n900: Correct obsolete TWL4030 power compatible
      ARM: dts: stm32: stm32mp157c-phycore: Fix STMPE811 touchscreen nod=
e properties

Jingzhou Zhu (2):
      dt-bindings: arm: qcom: Document Huawei MateBook E 2019
      arm64: dts: qcom: Add support for Huawei MateBook E 2019

Joel Selvaraj (1):
      arm64: dts: qcom: sdm845-shift-axolotl: fix touchscreen properties

Johan Jonker (5):
      ARM: dts: rockchip: Adapt tps65910 nodes on RK3066 boards
      ARM: dts: rockchip: Remove mshc aliases from RK3288
      ARM: dts: rockchip: Add spi_flash label to rk3288-veyron
      ARM: dts: rockchip: move edp assigned-clocks to edp node on rk3288
      arm64: dts: rockchip: correct assigned-clock-rates spelling on 2 b=
oards

John Madieu (1):
      arm64: dts: renesas: r9a09g047: Add TSU node

Jonas Rebmann (2):
      dt-bindings: arm: fsl: Add Protonic PRT8ML
      arm64: dts: add Protonic PRT8ML board

Jonathan Albrieux (1):
      arm64: dts: qcom: msm8916-longcheer-l8910: Add touchscreen

Josua Mayer (2):
      Revert "arm64: dts: marvell: cn9132-clearfog: fix multi-lane pci x=
2 and x4 ports"
      clk: mvebu: cp110 add CLK_IGNORE_UNUSED to pcie_x10, pcie_x11 & pc=
ie_x4

Joy Zou (2):
      arm64: dts: imx95-15x15-evk: add fan-supply property for pwm-fan
      arm64: dts: imx8: add edma error interrupt support

Jo=C3=A3o Paulo Gon=C3=A7alves (3):
      dt-bindings: arm: ti: add Toradex Aquila AM69
      arm64: dts: ti: am69-aquila: Add Clover
      dt-bindings: arm: fsl: add Toradex SMARC iMX95

Julien Massot (1):
      arm64: dts: mt8183: Rename nodes to match audiosys DT schema

Jun Guo (2):
      arm64: dts: cix: add DT nodes for SPI
      arm64: dts: cix: add a compatible string for the cix sky1 SoC

Karel Balej (3):
      arm64: dts: samsung,coreprimevelte: add PMIC
      arm64: dts: samsung,coreprimevelte: add touchscreen
      arm64: dts: samsung,coreprimevelte: add SDIO

Kathiravan Thirumoorthy (1):
      arm64: dts: qcom: ipq5424: correct the TF-A reserved memory to 512K

Kaustabh Chakraborty (7):
      arm64: dts: exynos7870-a2corelte: add bus-width to mmc0 node
      arm64: dts: exynos7870-j6lte: add bus-width to mmc0 node
      arm64: dts: exynos7870-on7xelte: add bus-width to mmc0 node
      arm64: dts: exynos7870: add DSI support
      arm64: dts: exynos7870-on7xelte: enable display panel support
      arm64: dts: exynos7870-a2corelte: enable display panel support
      arm64: dts: exynos7870-j6lte: enable display panel support

Keke Li (1):
      dts: arm64: amlogic: Add ISP related nodes for C3

Kevin Tung (2):
      dt-bindings: arm: aspeed: add Meta Yosemite5 board
      ARM: dts: aspeed: yosemite5: Add Meta Yosemite5 BMC

Khairul Anuar Romli (5):
      dt-bindings: mtd: cdns,hp-nfc: Add iommu property
      dt-bindings: dma: snps,dw-axi-dmac: Add iommu property
      arm64: dts: socfpga: agilex5: Add SMMU nodes
      dt-bindings: firmware: svc: Add IOMMU support for Agilex5
      arm64: dts: socfpga: Add Agilex5 SVC node with memory region

Kieran Bingham (1):
      arm64: dts: freescale: debix-som-a-bmb-08: Enable HDMI output

Konrad Dybcio (7):
      dt-bindings: clock: qcom,x1e80100-gcc: Add missing USB4 clocks/res=
ets
      arm64: dts: qcom: x1e80100: Extend the gcc input clock list
      arm64: dts: qcom: x1e80100: Describe the full 'link' region of DP =
hosts
      arm64: dts: qcom: x1e80100: Move CPU idle states to their respecti=
ve PSCI PDs
      arm64: dts: qcom: sdm845-starqltechn: Fix i2c-gpio node name
      arm64: dts: qcom: lemans: Align ethernet interconnect-names with s=
chema
      arm64: dts: qcom: sdx75: Fix the USB interrupt entry order

Krishna Chaitanya Chundru (6):
      arm64: dts: qcom: sc7280: Increase config size to 256MB for ECAM f=
eature
      arm64: dts: qcom: sm8750-mtp: move PCIe GPIOs to pcieport0 node
      arm64: dts: qcom: sm8450: Add opp-level to indicate PCIe data rates
      arm64: dts: qcom: sm8550: Add opp-level to indicate PCIe data rates
      arm64: dts: qcom: sm8650: Add opp-level to indicate PCIe data rates
      arm64: dts: qcom: x1e80100: Add opp-level to indicate PCIe data ra=
tes

Krishna Kurapati (5):
      arm64: dts: qcom: x1e80100: Fix compile warnings for USB HS contro=
ller
      arm64: dts: qcom: x1e80100: Add missing quirk for HS only USB cont=
roller
      arm64: dts: qcom: lemans: Add missing quirk for HS only USB contro=
ller
      arm64: dts: qcom: sdx75: Flatten usb controller node
      arm64: dts: qcom: sdx75: Add missing usb-role-switch property

Krzysztof Kozlowski (5):
      Merge branch 'for-v6.19/clk-dt-bindings' into next/dt64
      arm64: tegra: Add default GIC address cells on Tegra132
      arm64: tegra: Add default GIC address cells on Tegra186
      arm64: tegra: Add default GIC address cells on Tegra194
      arm64: tegra: Add default GIC address cells on Tegra210

Kuninori Morimoto (26):
      arm64: dts: renesas: r8a774a1: Move interrupt-parent to root node
      arm64: dts: renesas: r8a774b1: Move interrupt-parent to root node
      arm64: dts: renesas: r8a774c0: Move interrupt-parent to root node
      arm64: dts: renesas: r8a774e1: Move interrupt-parent to root node
      arm64: dts: renesas: r8a77951: Move interrupt-parent to root node
      arm64: dts: renesas: r8a77960: Move interrupt-parent to root node
      arm64: dts: renesas: r8a77961: Move interrupt-parent to root node
      arm64: dts: renesas: r8a77965: Move interrupt-parent to root node
      arm64: dts: renesas: r8a77970: Move interrupt-parent to root node
      arm64: dts: renesas: r8a77980: Move interrupt-parent to root node
      arm64: dts: renesas: r8a77990: Move interrupt-parent to root node
      arm64: dts: renesas: r8a77995: Move interrupt-parent to root node
      arm64: dts: renesas: r8a779a0: Move interrupt-parent to root node
      arm64: dts: renesas: r8a779f0: Move interrupt-parent to root node
      arm64: dts: renesas: r8a779g0: Move interrupt-parent to root node
      arm64: dts: renesas: r8a779h0: Move interrupt-parent to root node
      arm64: dts: renesas: r9a07g043u: Move interrupt-parent to root node
      arm64: dts: renesas: r9a07g044: Move interrupt-parent to root node
      arm64: dts: renesas: r9a07g054: Move interrupt-parent to root node
      arm64: dts: renesas: r9a08g045: Move interrupt-parent to root node
      arm64: dts: renesas: r9a09g011: Move interrupt-parent to root node
      arm64: dts: renesas: r9a09g047: Move interrupt-parent to root node
      arm64: dts: renesas: r9a09g056: Move interrupt-parent to root node
      arm64: dts: renesas: r9a09g057: Move interrupt-parent to root node
      arm64: dts: renesas: r9a09g077: Move interrupt-parent to root node
      arm64: dts: renesas: r9a09g087: Move interrupt-parent to root node

Lad Prabhakar (9):
      arm64: dts: renesas: r9a09g057: Add Cortex-A55 PMU node
      arm64: dts: renesas: r9a09g056: Add Cortex-A55 PMU node
      arm64: dts: renesas: r9a09g077: Add Cortex-A55 PMU node
      arm64: dts: renesas: r9a09g087: Add Cortex-A55 PMU node
      arm64: dts: renesas: r9a09g077: Add ETHSS node
      arm64: dts: renesas: r9a09g087: Add ETHSS node
      arm64: dts: renesas: r9a09g077: Add GMAC nodes
      arm64: dts: renesas: r9a09g087: Add GMAC nodes
      arm64: dts: renesas: rzt2h-n2h-evk: Enable Ethernet support

Laurent Pinchart (4):
      arm64: dts: renesas: aistarvision-mipi-adapter-2.1: Drop clock-fre=
quency from camera sensor node
      arm64: dts: renesas: rzg2l-smarc: Drop clock-frequency from camera=
 sensor node
      arm64: dts: imx8mp: Specify the number of channels for CSI-2 recei=
vers
      arm64: dts: imx8mp-debix-model-a: Fix ethernet PHY address

Laurentiu Mihalcea (2):
      arm64: dts: imx8mp: convert 'aips5' to 'aipstz5'
      arm64: dts: imx8mp: make 'dsp' node depend on 'aips5'

Le Qi (1):
      arm64: dts: qcom: hamoa-iot-evk: Fix 4-speaker playback support

Leo Wang (2):
      ARM: dts: aspeed: clemente: add shunt-resistor-micro-ohms for LM50=
66i
      ARM: dts: aspeed: clemente: Add HDD LED GPIO

Li Liu (2):
      arm64: dts: qcom: Add display support for QCS615
      arm64: dts: qcom: Add display support for QCS615 RIDE board

Liangbin Lian (3):
      dt-bindings: vendor-prefixes: Document LinkEase
      dt-bindings: arm: rockchip: Add LinkEase EasePi R1
      arm64: dts: rockchip: add LinkEase EasePi R1

Loic Poulain (1):
      arm64: dts: qcom: qcm2290: Fix camss register prop ordering

Longbin Li (3):
      dt-bindings: soc: sophgo: add TOP syscon for CV18XX/SG200X series =
SoC
      riscv: dts: sophgo: Add syscon node for cv18xx
      riscv: dts: sophgo: Add USB support for cv18xx

Lothar Rubusch (11):
      ARM: dts: socfpga: add Enclustra boot-mode dtsi
      ARM: dts: socfpga: add Enclustra base-board dtsi
      ARM: dts: socfpga: add Enclustra Mercury SA1
      dt-bindings: altera: add Enclustra Mercury SA1
      ARM: dts: socfpga: add Enclustra Mercury+ SA2
      dt-bindings: altera: add binding for Mercury+ SA2
      ARM: dts: socfpga: add Mercury AA1 variants
      dt-bindings: altera: add Mercury AA1 variants
      ARM: dts: socfpga: removal of generic PE1 dts
      dt-bindings: altera: removal of generic PE1 dts
      ARM: dts: socfpga: add Enclustra SoM dts files

Louis-Alexis Eyraud (2):
      arm64: dts: mediatek: mt8365: Add GPU support
      arm64: dts: mediatek: mt8365-evk: Enable GPU support

Luca Weiss (12):
      dt-bindings: clock: dispcc-sm6350: Add MDSS_CORE & MDSS_RSCC resets
      arm64: dts: qcom: sm6350: Add MDSS_CORE reset to mdss
      arm64: dts: qcom: sm8250: Add MDSS_CORE reset to mdss
      arm64: dts: qcom: qcm6490-fairphone-fp5: Add supplies to simple-fb=
 node
      arm64: dts: qcom: qcm6490-fairphone-fp5: Add VTOF_LDO_2P8 regulator
      arm64: dts: qcom: qcm6490-fairphone-fp5: Use correct compatible fo=
r audiocc
      arm64: dts: qcom: qcm6490-shift-otter: Use correct compatible for =
audiocc
      arm64: dts: qcom: sm7325-nothing-spacewar: Use correct compatible =
for audiocc
      arm64: dts: qcom: qcm6490-shift-otter: Enable RGB LED
      arm64: dts: qcom: sm6350: Fix wrong order of freq-table-hz for UFS
      arm64: dts: qcom: sm6350: Add OPP table support to UFSHC
      arm64: dts: qcom: sm6350: Add interconnect support to UFS

Luo Jie (5):
      dt-bindings: clock: Add "#interconnect-cells" property in IPQ9574 =
example
      dt-bindings: interconnect: Add Qualcomm IPQ5424 NSSNOC IDs
      dt-bindings: clock: gcc-ipq5424: Add definition for GPLL0_OUT_AUX
      dt-bindings: clock: qcom: Add NSS clock controller for IPQ5424 SoC
      arm64: dts: qcom: ipq5424: Add NSS clock controller node

Macpaul Lin (3):
      dt-bindings: arm64: mediatek: add mt8395-evk-ufs board
      arm64: dts: mediatek: mt8395-genio-1200-evk: Move common parts to =
dtsi
      arm64: dts: mediatek: add device-tree for Genio 1200 EVK UFS board

Manikanta Mylavarapu (1):
      arm64: dts: qcom: ipq5424: add cooling maps for CPU thermal zones

Manivannan Sadhasivam (1):
      arm64: dts: amlogic: Fix the register name of the 'DBI' region

Marco Felsch (2):
      dt-bindings: arm: fsl: add Skov Rev.C HDMI support
      arm64: dts: imx8mp-skov: add Rev.C HDMI support

Marek Szyprowski (4):
      ARM: dts: samsung: universal_c210: turn off SDIO WLAN chip during =
system suspend
      ARM: dts: samsung: exynos4210-i9100: turn off SDIO WLAN chip durin=
g system suspend
      ARM: dts: samsung: exynos4210-trats: turn off SDIO WLAN chip durin=
g system suspend
      ARM: dts: samsung: exynos4412-midas: turn off SDIO WLAN chip durin=
g system suspend

Marek Vasut (9):
      arm64: dts: renesas: sparrow-hawk: Add overlay for RPi Display 2
      arm64: dts: renesas: sparrow-hawk: Add overlay for Argon40 fan HAT
      dt-bindings: arm: imx: document i.MX 95 Verdin Evaluation Kit (EVK)
      arm64: dts: freescale: add initial support for i.MX 95 Verdin Eval=
uation Kit (EVK)
      arm64: dts: renesas: r8a77960: Add GX6250 GPU node
      arm64: dts: renesas: r8a77961: Add GX6250 GPU node
      arm64: dts: renesas: sparrow-hawk: Fix full-size DP connector node=
 name and labels
      arm64: dts: renesas: r8a77965: Add GE7800 GPU node
      arm64: dts: imx8mp: Add missing LED enumerators for DH electronics=
 i.MX8M Plus DHCOM on PDK2

Markus Niebel (5):
      arm64: dts: imx95-tqma9596sa: fix TPM5 pinctrl node name
      arm64: dts: imx95-tqma9596sa: move USDHC2 config to SOM
      arm64: dts: imx95-tqma9596sa: add EEPROM pagesize
      arm64: dts: imx95-tqma9596sa-mb-smarc-2: remove superfluous line
      arm64: dts: imx95-tqma9596sa-mb-smarc-2: add aliases for SPI

Markus Schneider-Pargmann (TI.com) (6):
      arm64: dts: ti: k3-am62: Define possible system states
      arm64: dts: ti: k3-am62a: Define possible system states
      arm64: dts: ti: k3-am62p: Define possible system states
      arm64: dts: ti: k3-am62-lp-sk: Set wakeup-source system-states
      arm64: dts: ti: k3-am62a7-sk: Set wakeup-source system-states
      arm64: dts: ti: k3-am62p5-sk: Set wakeup-source system-states

Martin Kepplinger-Novakovi=C4=87 (2):
      arm64: dts: imx8mp: add idle cooling devices to cpu core
      arm64: dts: imx8mp: add cpuidle cooling device to the alert trip p=
oint

Mateusz Koza (1):
      arm64: dts: mediatek: mt8390-genio-700-evk: Add Grinn GenioSBC-700

Mathew McBride (2):
      dt-bindings: embedded-controller: add Traverse Ten64 board control=
ler
      arm64: dts: ten64: add board controller binding

Matthias Schiffer (4):
      dt-bindings: omap: add AM335x-based TQMa335x SOM and MBa335x board
      ARM: dts: omap: AM33xx: add cpu label
      ARM: dts: omap: Add support for TQMa335x/MBa335x
      arm64: dts: ti: k3-am642-tqma64xxl: add boot phase tags

Max Krummenacher (5):
      arm64: dts: imx8-apalis: cleanup todo
      arm64: dts: imx8-apalis: add thermal nodes
      arm64: dts: imx8-apalis: specify adc reference voltage regulator
      arm64: dts: imx8qm-apalis: add pwm used by the backlight
      arm64: dts: freescale: add Toradex SMARC iMX95

Mehdi Djait (1):
      arm64: dts: rockchip: add the vip node to px30

Michael Opdenacker (7):
      riscv: dts: spacemit: add Ethernet and PDMA to OrangePi RV2
      dt-bindings: riscv: spacemit: Add OrangePi R2S board
      riscv: dts: spacemit: Add OrangePi R2S board device tree
      dt-bindings: arm: rockchip: merge Asus Tinker and Tinker S
      dt-bindings: arm: rockchip: Add Asus Tinker Board 3/3S
      arm64: dts: rockchip: Add Asus Tinker Board 3 and 3S device tree
      arm64: dts: rockchip: Enable i2c2 on Orange Pi 3B

Michael Riesch (1):
      arm64: dts: rockchip: add vicap node to rk356x

Michael Walle (7):
      arm64: dts: ti: k3-j722s-evm: explicitly use PLL1_HSDIV6 audio ref=
clk
      arm64: dts: ti: k3-j722s-main: fix the audio refclk source
      dt-bindings: arm: ti: Add Kontron SMARC-sAM67 module
      arm64: dts: ti: Add support for Kontron SMARC-sAM67
      arm64: dts: ti: sa67: add overlay for the ADS2 carrier
      arm64: dts: ti: k3-am62p-j722s-common-main: move audio_refclk here
      arm64: dts: ti: sa67: add build time dtb for overlays

Michal Vok=C3=A1=C4=8D (2):
      ARM: dts: imx6dl-yapp43: Enable pwm-beeper on boards with speaker
      ARM: dts: imx6dl-yapp4: Model the RGB LED as a single multi-led pa=
rt

Michal Wilczynski (2):
      riscv: dts: thead: Add PWM controller node
      riscv: dts: thead: Add PWM fan and thermal control

Mikhail Kshevetskiy (1):
      arm64: dts: mediatek: mt7986-bpi-r3: Change fan PWM value for mid =
speed

Nathan Chancellor (1):
      ARM: dts: omap: am335x-mba335x: Fix stray '/*' in comment

Neil Armstrong (1):
      arm64: dts: qcom: sm8650: set ufs as dma coherent

Nicolas Ferre (3):
      ARM: dts: microchip: sama7d65: fix uart fifo size to 32
      ARM: dts: microchip: sama7g5: fix uart fifo size to 32
      ARM: dts: microchip: sama5d2: fix spi flexcom fifo size to 32

Niklas Cassel (1):
      arm64: tegra: Add pinctrl definitions for pcie-ep nodes

Niklas S=C3=B6derlund (3):
      ARM: dts: renesas: koelsch: Update ADV7180 binding
      dt-bindings: clock: r8a779a0: Add ZG core clock
      arm64: dts: renesas: r8a779a0: Add GE7800 GPU node

Nino Zhang (1):
      arm64: tegra: Fix APB DMA controller node name

Niravkumar L Rabara (6):
      arm64: dts: socfpga: agilex5: add VGIC maintenance interrupt
      dt-bindings: intel: Add Agilex5 SoCFPGA 013b board
      arm64: dts: socfpga: agilex5: add support for 013b board
      dt-bindings: intel: Add Agilex3 SoCFPGA board
      arm64: dts: socfpga: add Agilex3 board
      arm64: dts: socfpga: agilex5: update qspi partitions for 013b board

N=C3=ADcolas F. R. A. Prado (1):
      arm64: dts: mediatek: mt8395-genio-1200-evk: Describe CPU supplies

Ovidiu Panait (4):
      arm64: dts: renesas: r9a09g057: Add TSU nodes
      arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Add NMI pushbutton su=
pport
      arm64: dts: renesas: r9a09g057: Add RTC node
      arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Enable RTC

Paresh Bhagat (4):
      arm64: dts: ti: k3-am62d2-evm: Fix regulator properties
      arm64: dts: ti: k3-am62d2-evm: Fix PMIC padconfig
      arm64: dts: ti: k3-am62d2-evm: Enable PMIC
      arm64: dts: ti: k3-am62d2-evm: Remove unused ospi0 chip select pins

Parth Pancholi (1):
      arm64: dts: ti: Add Aquila AM69 Support

Patrice Chotard (1):
      arm64: dts: st: Add memory-region-names property for stm32mp257f-e=
v1

Pengyu Luo (1):
      arm64: dts: qcom: sc8280xp: Fix shifted GPI DMA channels

Peter Griffin (3):
      arm64: dts: exynos: gs101: add sysreg_misc and sysreg_hsi0 nodes
      arm64: dts: exynos: gs101: fix clock module unit reg sizes
      arm64: dts: exynos: gs101: fix sysreg_apm reg property

Praveen Talari (1):
      arm64: dts: qcom: qrb2210-rb1: Fix UART3 wakeup IRQ storm

Primoz Fiser (6):
      arm64: dts: freescale: imx93-phyboard-nash: Add USB vbus regulators
      arm64: dts: freescale: imx93-phyboard-segin: Add USB vbus regulato=
rs
      dt-bindings: arm: fsl: Add PHYTEC phyBOARD-Segin-i.MX91 board
      arm64: dts: freescale: Add phyBOARD-Segin-i.MX91 support
      arm64: dts: freescale: imx93-phyboard-nash: Add jtag overlay
      arm64: dts: freescale: imx93-phyboard-nash: Add pwm-fan overlay

Raghav Sharma (2):
      arm64: dts: exynosautov920: add CMU_M2M clock DT nodes
      arm64: dts: exynosautov920: add CMU_MFC clock DT nodes

Rakesh Kota (2):
      arm64: dts: qcom: qcs6490-rb3gen2: Update regulator settings
      arm64: dts: qcom: lemans-evk: Add resin key code for PMM8654AU

Randolph Sapp (1):
      arm64: dts: ti: k3-am62p: Fix memory ranges for GPU

Raviteja Laggyshetty (1):
      arm64: dts: qcom: qcs615: Add OSM l3 interconnect provider node an=
d CPU OPP tables to scale DDR/L3

Raymond Hackley (2):
      arm64: dts: qcom: msm8916-samsung-rossa: Move touchscreen to commo=
n device tree
      ARM: dts: qcom: msm8226-samsung-ms013g: add simple-framebuffer

Ren=C3=A9 Rebe (1):
      riscv: dts: sifive: unmatched: Add PWM controlled fans

Richard Genoud (1):
      arm64: dts: allwinner: h616: add NAND controller

Richard Zhu (14):
      arm64: dts: imx95-15x15-evk: Add supports-clkreq property to PCIe =
M.2 port
      arm64: dts: imx95-19x19-evk: Add supports-clkreq property to PCIe =
M.2 port
      arm64: dts: imx8mm-evk: Add supports-clkreq property to PCIe M.2 p=
ort
      arm64: dts: imx8mp-evk: Add supports-clkreq property to PCIe M.2 p=
ort
      arm64: dts: imx8mq-evk: Add supports-clkreq property to PCIe M.2 p=
ort
      arm64: dts: imx8qm-mek: Add supports-clkreq property to PCIe M.2 p=
ort
      arm64: dts: imx8qxp-mek: Add supports-clkreq property to PCIe M.2 =
port
      arm64: dts: imx8dxl-evk: Add vpcie3v3aux regulator for PCIe M.2 co=
nnector
      arm64: dts: imx8mp-evk: Add vpcie3v3aux regulator for PCIe M.2 con=
nector
      arm64: dts: imx8mq-evk: Add vpcie3v3aux regulator for PCIe M.2 con=
nector
      arm64: dts: imx8qm-mek: Add vpcie3v3aux regulator for PCIe M.2 con=
nector
      arm64: dts: imx8qxp-mek: Add vpcie3v3aux regulator for PCIe M.2 co=
nnector
      arm64: dts: imx95-15x15-evk: Add vpcie3v3aux regulator for PCIe M.=
2 connector
      arm64: dts: imx95-19x19-evk: Add vpcie3v3aux regulator for PCIe[0,=
1]

Rob Herring (Arm) (3):
      arm64/arm: dts: marvell: Rename "nand-rb" pinctrl node names
      arm64: dts: ti: Add missing applied DT overlay targets
      arm64: dts: sprd: sc9860: Simplify clock nodes

Sai Sree Kartheek Adivi (1):
      arm64: dts: ti: k3-am642-evm: Add DMA support for TSCADC

Sarthak Garg (1):
      arm64: dts: qcom: sm8550: Limit max SD HS mode frequency by default

Sebastian Reichel (1):
      arm64: dts: rockchip: add eMMC CQE support for rk3588

Shawn Lin (1):
      arm64: dts: rockchip: Remove sdmmc max-frequency on RK3588S EVB1 b=
oard

Shengjiu Wang (2):
      arm64: dts: imx8mp: Add hdmi parallel audio interface node
      arm64: dts: imx8mp-evk: enable hdmi_pai device

Shenwei Wang (1):
      arm64: dts: imx8: add default clock rate for usdhc

Sherry Sun (1):
      arm64: dts: imx8qxp-mek: Add lpuart1 to support the M.2 PCIE9098 b=
luetooth

Shiva Tripathi (1):
      arm64: dts: ti: k3-am62: Add RNG node

Shubhi Garg (1):
      arm64: tegra: Add device-tree node for NVVRS RTC

Siddharth Vadapalli (7):
      arm64: dts: ti: k3-*: Replace rgmii-rxid with rgmii-id for CPSW po=
rts
      arm64: dts: ti: k3-am62: disable "cpsw3g" in SoC file and enable i=
n board file
      arm64: dts: ti: k3-am65: disable "mcu_cpsw" in SoC file and enable=
 in board file
      arm64: dts: ti: k3-j7200: disable "mcu_cpsw" in SoC file and enabl=
e in board file
      arm64: dts: ti: k3-j721e: disable "mcu_cpsw" in SoC file and enabl=
e it in board file
      arm64: dts: ti: k3-j721s2: disable "mcu_cpsw" in SoC file and enab=
le in board files
      arm64: dts: ti: k3-j721e-sk: Fix pinmux for pin Y1 used by power r=
egulator

Sjoerd Simons (4):
      arm64: dts: mediatek: mt7981b: Configure UART0 pinmux
      arm64: dts: mediatek: mt7981b: Add reserved memory for TF-A
      arm64: dts: mediatek: mt7981b-openwrt-one: Enable SPI NOR
      arm64: dts: mediatek: mt7981b-openwrt-one: Enable software leds

Stefan Eichenberger (2):
      arm64: dts: imx8-apalis: rename wifi regulator
      arm64: dts: imx8-apalis: use startup-delay-us for wifi regulator

Stefan Prisacariu (1):
      ARM: dts: imx6qdl: make VAR-SOM SoM SoC-agnostic

Stefano Radaelli (7):
      arm64: dts: ti: var-som-am62p: Refactor IPC configuration into com=
mon dtsi
      arm64: dts: ti: var-som-am62p: Add support for WM8904 audio codec
      arm64: dts: ti: var-som-am62p: Add support for ADS7846 touchscreen
      arm64: dts: freescale: imx93-var-som: Add WiFi and Bluetooth suppo=
rt
      arm64: dts: freescale: imx93-var-som: Add PMIC support
      arm64: dts: freescale: imx93-var-som: Add support for WM8904 audio=
 codec
      arm64: dts: freescale: imx93-var-som: Add support for ADS7846 touc=
hscreen

Steffen Trumtrar (2):
      dt-bindings: arm: fsl: add compatible for Skov i.MX8MP variant
      arm64: dts: imx8mp-skov: support new 10" panel board

Svyatoslav Ryhel (8):
      dt-bindings: display: tegra: document EPP, ISP, MPE and TSEC for T=
egra114+
      ARM: tegra: Add missing HOST1X device nodes on Tegra114
      ARM: tegra: Add missing HOST1X device nodes on Tegra124
      ARM: tegra: add CSI nodes for Tegra20 and Tegra30
      dt-bindings: display: tegra: Document Tegra20 and Tegra30 CSI
      arm64: tegra: Drop redundant clock and reset names from TSEC node
      arm64: tegra: Move avdd-dsi-csi-supply into CSI node
      ARM: tegra: Add device-tree for Xiaomi Mi Pad (A0101)

Teresa Remmet (3):
      arm64: dts: imx8mm-phyboard-polis-rdk: Add USB1 OC pin configurati=
on
      arm64: dts: imx8mm-phygate-tauri-l: Update pad ctl for USB OC pin
      arm64: dts: imx8mm-phyboard-polis-peb-av-10: Fix audio codec reset=
 pin ctl

Thierry Reding (3):
      dt-bindings: power: Add power domain IDs for Tegra264
      Merge branch 'for-6.19/dt-bindings' into for-6.19/arm64/dt
      arm64: tegra: Move HDA into the correct bus

Tianling Shen (2):
      dt-bindings: arm: rockchip: Add FriendlyElec NanoPi R76S
      arm64: dts: rockchip: Add devicetree for the FriendlyElec NanoPi R=
76S

Tim Harvey (7):
      arm64: dts: freescale: imx8mp-venice-gw7905-2x: remove duplicate u=
sdhc1 props
      arm64: dts: imx8m{m,n,p}-venice: disable unused clk output for TI =
PHY
      arm64: dts: imx8mp-venice-gw702x: reduce RGMII CLK drive strength
      arm64: dts: imx8mm-venice-gw700x: reduce RGMII CLK drive strength
      arm64: dts: imx8mm-venice-gw72xx: remove unused sdhc1 pinctrl
      arm64: dts: imx8mp-venice-gw702x: remove off-board uart
      arm64: dts: imx8mp-venice-gw702x: remove off-board sdhc1

Tingguo Cheng (2):
      arm64: dts: qcom: qcs8300-pmics: Remove 'allow-set-time' property
      arm64: dts: qcom: lemans-pmics: enable rtc

Torsten Duwe (1):
      arm64: dts: rockchip: enable HDMI audio on Rock 5 ITX

Troy Mitchell (4):
      dt-bindings: riscv: spacemit: add MusePi Pro board
      riscv: dts: spacemit: add MusePi Pro board device tree
      riscv: dts: spacemit: reorder i2c2 node
      riscv: dts: spacemit: define all missing I2C controller nodes

Tudor Ambarus (4):
      dt-bindings: firmware: google,gs101-acpm-ipc: add ACPM clocks
      arm64: dts: exynos: gs101: add #clock-cells to the ACPM protocol n=
ode
      arm64: dts: exynos: gs101: add CPU clocks
      arm64: dts: exynos: gs101: add OPPs

Val Packett (2):
      arm64: dts: qcom: x1-dell-thena: Add missing pinctrl for eDP HPD
      arm64: dts: qcom: x1-dell-thena: remove dp data-lanes

Valentine Burley (1):
      arm64: dts: qcom: apq8096-db820c: Specify zap shader location

Vignesh Raghavendra (3):
      arm64: dts: ti: k3-am62l: add initial infrastructure
      arm64: dts: ti: k3-am62l: add initial reference board file
      arm64: dts: ti: k3-am62l: Fix unit address of cbass_wakeup

Viken Dadhaniya (3):
      arm64: dts: qcom: qcs6490-rb3gen2: Add firmware-name to QUPv3 nodes
      arm64: dts: qcom: lemans-evk: Add firmware-name to QUPv3 nodes
      arm64: dts: qcom: monaco-evk: Add firmware-name to QUPv3 nodes

Vladimir Zapolskiy (3):
      arm64: dts: qcom: sm8550: Add description of MCLK pins
      arm64: dts: qcom: sm8550-qrd: Enable CAMSS and S5K3M5 camera sensor
      arm64: dts: qcom: sm8550-hdk: Add SM8550-HDK Rear Camera Card over=
lay

Wadim Egorov (1):
      arm64: dts: ti: Enable build testing of PHYTEC board overlays

WeiHao Li (3):
      arm64: dts: rockchip: Add display subsystem for RK3368
      arm64: dts: rockchip: Add D-PHY for RK3368
      arm64: dts: rockchip: Add DSI for RK3368

Wenmeng Liu (1):
      arm64: dts: qcom: lemans-evk-camera: Add DT overlay

Wesley Cheng (3):
      arm64: dts: qcom: sm8750: Add USB support to SM8750 SoCs
      arm64: dts: qcom: sm8750: Add USB support for SM8750 MTP platform
      arm64: dts: qcom: sm8750: Add USB support for SM8750 QRD platform

Wojciech Slenska (2):
      arm64: dts: qcom: qcm2290: Fix uart3 QUP interconnect
      arm64: dts: qcom: qcm2290: Add uart1 and uart5 nodes

Wolfram Sang (21):
      arm64: dts: renesas: v3[mh]sk: Remove wrong sound property in HDMI=
 encoder node
      arm64: dts: renesas: eagle-function-expansion: Add eMMC support
      arm64: dts: renesas: r8a77951: Add SWDT node
      arm64: dts: renesas: r8a77960: Add SWDT node
      arm64: dts: renesas: r8a77961: Add SWDT node
      arm64: dts: renesas: r8a77965: Add SWDT node
      arm64: dts: renesas: r8a77970: Add SWDT node
      arm64: dts: renesas: r8a77990: Add SWDT node
      arm64: dts: renesas: r8a77995: Add SWDT node
      arm64: dts: renesas: salvator-common: Mark SWDT as reserved
      arm64: dts: renesas: ulcb: Mark SWDT as reserved
      arm64: dts: renesas: draak: Mark SWDT as reserved
      arm64: dts: renesas: ebisu: Mark SWDT as reserved
      arm64: dts: renesas: eagle/v3msk: Mark SWDT as reserved
      ARM: dts: renesas: gose: Remove superfluous port property
      arm64: dts: renesas: r8a779a0: Add SWDT node
      arm64: dts: renesas: r8a779f0: Add SWDT node
      arm64: dts: renesas: r8a779g0: Add SWDT node
      arm64: dts: renesas: r8a779h0: Add SWDT node
      ARM: dts: renesas: r9a06g032-rzn1d400-db: Drop invalid #cells prop=
erties
      ARM: dts: renesas: kzm9g: Name interrupts for accelerometer

Xianwei Zhao (7):
      dts: arm64: amlogic: add a5 pinctrl node
      arm64: dts: amlogic: s6: add ao secure node
      arm64: dts: amlogic: s7: add ao secure node
      arm64: dts: amlogic: s7d: add ao secure node
      arm64: dts: Add gpio_intc node for Amlogic S6 SoCs
      arm64: dts: Add gpio_intc node for Amlogic S7 SoCs
      arm64: dts: Add gpio_intc node for Amlogic S7D SoCs

Xilin Wu (2):
      dt-bindings: arm: qcom: Add Radxa Dragon Q6A
      arm64: dts: qcom: qcs6490: Introduce Radxa Dragon Q6A

Xin Liu (1):
      arm64: dts: qcom: qcs615-ride: Update 'model' string for qcs615 ri=
de

Xu Yang (1):
      arm64: dts: imx94: add DDR Perf Monitor node

Xueyao An (1):
      arm64: dts: qcom: HAMOA-IOT-SOM: Unreserve GPIOs blocking SPI11 ac=
cess

Yannic Moog (4):
      arm64: dts: im8mp-phy{board,core}: update license
      arm64: dts: imx8mp pollux: add display overlays
      arm64: dts: imx8mp pollux: add expansion board overlay
      arm64: dts: imx8mp pollux: add displays for expansion board

Yao Zi (3):
      arm64: dts: rockchip: Add PCIe Gen2x1 controller for RK3528
      arm64: dts: rockchip: Enable PCIe controller on Radxa E20C
      riscv: dts: thead: Add reset controllers of more subsystems for TH=
1520

Yegor Yefremov (3):
      ARM: dts: omap: rework Baltos LED nodes
      ARM: dts: ti: omap: am335x-baltos: add a regulator for the mPCIe s=
lot
      ARM: dts: am335x-netcom-plus-2xx: add missing GPIO labels

Yu Zhang(Yuriy) (1):
      arm64: dts: qcom: qcs615-ride: Set drive strength for wlan-en-stat=
e pin

Zane Li (1):
      ARM: dts: aspeed: yosemite4: allocate ramoops for kernel panic

Zixian Zeng (4):
      riscv: dts: sophgo: Add SPI NOR node for SG2042
      riscv: dts: sophgo: Enable SPI NOR node for PioneerBox
      riscv: dts: sophgo: Enable SPI NOR node for SG2042_EVB_V1
      riscv: dts: sophgo: Enable SPI NOR node for SG2042_EVB_V2

hongyu.chen1 (3):
      arm64: dts: amlogic: s6: add power domain controller node
      arm64: dts: amlogic: s7: add power domain controller node
      arm64: dts: amlogic: s7d: add power domain controller node

sheetal (1):
      arm64: tegra: Add Tegra264 audio support

 Documentation/devicetree/bindings/arm/altera.yaml  |   24 +-
 Documentation/devicetree/bindings/arm/amlogic.yaml |    1 +
 .../devicetree/bindings/arm/aspeed/aspeed.yaml     |    3 +
 Documentation/devicetree/bindings/arm/fsl.yaml     |   17 +
 .../devicetree/bindings/arm/intel,socfpga.yaml     |    7 +
 .../devicetree/bindings/arm/mediatek.yaml          |    8 +
 Documentation/devicetree/bindings/arm/qcom.yaml    |   17 +-
 .../devicetree/bindings/arm/rockchip.yaml          |   39 +-
 Documentation/devicetree/bindings/arm/tegra.yaml   |    5 +
 Documentation/devicetree/bindings/arm/ti/k3.yaml   |   15 +
 Documentation/devicetree/bindings/arm/ti/omap.yaml |    7 +
 .../bindings/board/fsl,fpga-qixis-i2c.yaml         |   58 +
 .../devicetree/bindings/board/fsl,fpga-qixis.yaml  |   10 +
 .../bindings/clock/qcom,ipq9574-nsscc.yaml         |   63 +-
 .../bindings/clock/qcom,x1e80100-gcc.yaml          |   62 +-
 .../bindings/devfreq/nvidia,tegra30-actmon.yaml    |   13 +-
 .../display/tegra/nvidia,tegra114-tsec.yaml        |   68 +
 .../bindings/display/tegra/nvidia,tegra20-csi.yaml |  138 +
 .../bindings/display/tegra/nvidia,tegra20-epp.yaml |   14 +-
 .../bindings/display/tegra/nvidia,tegra20-isp.yaml |   15 +-
 .../bindings/display/tegra/nvidia,tegra20-mpe.yaml |   18 +-
 .../bindings/dma/allwinner,sun50i-a64-dma.yaml     |    5 +-
 .../devicetree/bindings/dma/snps,dw-axi-dmac.yaml  |    3 +
 .../traverse,ten64-controller.yaml                 |   40 +
 .../bindings/firmware/google,gs101-acpm-ipc.yaml   |   11 +
 .../bindings/firmware/intel,stratix10-svc.yaml     |   15 +
 .../devicetree/bindings/mmc/sdhci-omap.txt         |   43 -
 .../devicetree/bindings/mmc/ti,omap2430-sdhci.yaml |  169 ++
 .../devicetree/bindings/mtd/cdns,hp-nfc.yaml       |    3 +
 .../devicetree/bindings/riscv/spacemit.yaml        |    2 +
 .../devicetree/bindings/riscv/starfive.yaml        |    7 +
 .../bindings/soc/imx/fsl,imx-iomuxc-gpr.yaml       |   16 +
 .../soc/sophgo/sophgo,cv1800b-top-syscon.yaml      |   80 +
 .../bindings/usb/nvidia,tegra234-xusb.yaml         |   31 +-
 .../devicetree/bindings/vendor-prefixes.yaml       |    4 +
 MAINTAINERS                                        |    9 +-
 arch/arm/boot/dts/aspeed/Makefile                  |    2 +
 .../dts/aspeed/aspeed-bmc-facebook-clemente.dts    |    9 +-
 .../boot/dts/aspeed/aspeed-bmc-facebook-harma.dts  |    8 +
 .../aspeed/aspeed-bmc-facebook-santabarbara.dts    |  919 +++++-
 .../dts/aspeed/aspeed-bmc-facebook-yosemite4.dts   |   14 +
 .../dts/aspeed/aspeed-bmc-facebook-yosemite5.dts   | 1067 +++++++
 .../boot/dts/aspeed/aspeed-bmc-ibm-balcones.dts    |  609 ++++
 .../arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dts |    4 -
 .../arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dts |    8 -
 .../arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dts |   12 -
 arch/arm/boot/dts/aspeed/aspeed-bmc-opp-tacoma.dts |   36 -
 arch/arm/boot/dts/aspeed/ibm-power11-dual.dtsi     |  779 +++++
 arch/arm/boot/dts/aspeed/ibm-power11-quad.dtsi     |  769 +----
 arch/arm/boot/dts/intel/socfpga/Makefile           |   25 +-
 .../intel/socfpga/socfpga_arria10_mercury_aa1.dtsi |  143 +-
 .../socfpga_arria10_mercury_aa1_pe1_emmc.dts       |   16 +
 .../socfpga_arria10_mercury_aa1_pe1_qspi.dts       |   16 +
 .../socfpga_arria10_mercury_aa1_pe1_sdmmc.dts      |   16 +
 .../socfpga_arria10_mercury_aa1_pe3_emmc.dts       |   16 +
 .../socfpga_arria10_mercury_aa1_pe3_qspi.dts       |   16 +
 .../socfpga_arria10_mercury_aa1_pe3_sdmmc.dts      |   16 +
 .../socfpga_arria10_mercury_aa1_st1_emmc.dts       |   16 +
 .../socfpga_arria10_mercury_aa1_st1_qspi.dts       |   16 +
 .../socfpga_arria10_mercury_aa1_st1_sdmmc.dts      |   16 +
 .../intel/socfpga/socfpga_arria10_mercury_pe1.dts  |   55 -
 .../socfpga/socfpga_cyclone5_mercury_sa1.dtsi      |  143 +
 .../socfpga_cyclone5_mercury_sa1_pe1_emmc.dts      |   16 +
 .../socfpga_cyclone5_mercury_sa1_pe1_qspi.dts      |   16 +
 .../socfpga_cyclone5_mercury_sa1_pe1_sdmmc.dts     |   16 +
 .../socfpga_cyclone5_mercury_sa1_pe3_emmc.dts      |   16 +
 .../socfpga_cyclone5_mercury_sa1_pe3_qspi.dts      |   16 +
 .../socfpga_cyclone5_mercury_sa1_pe3_sdmmc.dts     |   16 +
 .../socfpga_cyclone5_mercury_sa1_st1_emmc.dts      |   16 +
 .../socfpga_cyclone5_mercury_sa1_st1_qspi.dts      |   16 +
 .../socfpga_cyclone5_mercury_sa1_st1_sdmmc.dts     |   16 +
 .../socfpga/socfpga_cyclone5_mercury_sa2.dtsi      |  146 +
 .../socfpga_cyclone5_mercury_sa2_pe1_qspi.dts      |   16 +
 .../socfpga_cyclone5_mercury_sa2_pe1_sdmmc.dts     |   16 +
 .../socfpga_cyclone5_mercury_sa2_pe3_qspi.dts      |   16 +
 .../socfpga_cyclone5_mercury_sa2_pe3_sdmmc.dts     |   16 +
 .../socfpga_cyclone5_mercury_sa2_st1_qspi.dts      |   16 +
 .../socfpga_cyclone5_mercury_sa2_st1_sdmmc.dts     |   16 +
 .../socfpga_enclustra_mercury_bootmode_emmc.dtsi   |   12 +
 .../socfpga_enclustra_mercury_bootmode_qspi.dtsi   |    8 +
 .../socfpga_enclustra_mercury_bootmode_sdmmc.dtsi  |    8 +
 .../socfpga/socfpga_enclustra_mercury_pe1.dtsi     |   33 +
 .../socfpga/socfpga_enclustra_mercury_pe3.dtsi     |   55 +
 .../socfpga/socfpga_enclustra_mercury_st1.dtsi     |   15 +
 arch/arm/boot/dts/marvell/armada-38x.dtsi          |    2 +-
 arch/arm/boot/dts/marvell/armada-xp-98dx3236.dtsi  |    2 +-
 arch/arm/boot/dts/mediatek/Makefile                |    1 +
 arch/arm/boot/dts/mediatek/mt2701.dtsi             |    2 +-
 .../boot/dts/mediatek/mt6582-alcatel-yarisxl.dts   |   61 +
 arch/arm/boot/dts/mediatek/mt6582.dtsi             |  142 +-
 arch/arm/boot/dts/mediatek/mt7623.dtsi             |    3 +-
 arch/arm/boot/dts/microchip/sama5d2.dtsi           |   10 +-
 arch/arm/boot/dts/microchip/sama7d65.dtsi          |    6 +-
 arch/arm/boot/dts/microchip/sama7g5.dtsi           |    4 +-
 arch/arm/boot/dts/nvidia/Makefile                  |    3 +-
 arch/arm/boot/dts/nvidia/tegra114.dtsi             |   64 +
 arch/arm/boot/dts/nvidia/tegra124-xiaomi-mocha.dts | 2790 +++++++++++++=
++++
 arch/arm/boot/dts/nvidia/tegra124.dtsi             |   64 +
 arch/arm/boot/dts/nvidia/tegra20.dtsi              |   19 +-
 arch/arm/boot/dts/nvidia/tegra30.dtsi              |   24 +-
 arch/arm/boot/dts/nxp/imx/e70k02.dtsi              |   25 +-
 arch/arm/boot/dts/nxp/imx/imx53-ppd.dts            |    2 +
 arch/arm/boot/dts/nxp/imx/imx53-qsrb.dts           |    1 +
 arch/arm/boot/dts/nxp/imx/imx53-usbarmory.dts      |   39 +-
 .../boot/dts/nxp/imx/imx6dl-aristainetos2_7.dts    |    1 +
 arch/arm/boot/dts/nxp/imx/imx6dl-b1x5v2.dtsi       |    3 +-
 arch/arm/boot/dts/nxp/imx/imx6dl-lanmcu.dts        |    8 +
 arch/arm/boot/dts/nxp/imx/imx6dl-plym2m.dts        |    4 +-
 arch/arm/boot/dts/nxp/imx/imx6dl-prtvt7.dts        |    8 +-
 arch/arm/boot/dts/nxp/imx/imx6dl-qmx6.dtsi         |    1 +
 arch/arm/boot/dts/nxp/imx/imx6dl-victgo.dts        |   10 +-
 arch/arm/boot/dts/nxp/imx/imx6dl-yapp4-common.dtsi |   44 +-
 arch/arm/boot/dts/nxp/imx/imx6dl-yapp4-lynx.dts    |    8 +
 .../arm/boot/dts/nxp/imx/imx6dl-yapp43-common.dtsi |   63 +-
 arch/arm/boot/dts/nxp/imx/imx6q-bosch-acc.dts      |    1 +
 arch/arm/boot/dts/nxp/imx/imx6q-bx50v3.dtsi        |    4 +
 arch/arm/boot/dts/nxp/imx/imx6q-cm-fx6.dts         |   34 +-
 arch/arm/boot/dts/nxp/imx/imx6q-dmo-edmqmx6.dts    |   10 +-
 arch/arm/boot/dts/nxp/imx/imx6q-evi.dts            |   12 +-
 arch/arm/boot/dts/nxp/imx/imx6q-icore-ofcap10.dts  |    1 +
 arch/arm/boot/dts/nxp/imx/imx6q-icore-ofcap12.dts  |    1 +
 arch/arm/boot/dts/nxp/imx/imx6q-pistachio.dts      |    3 +-
 arch/arm/boot/dts/nxp/imx/imx6q-prti6q.dts         |    8 +
 arch/arm/boot/dts/nxp/imx/imx6q-tbs2910.dts        |    2 +-
 arch/arm/boot/dts/nxp/imx/imx6q-utilite-pro.dts    |    5 +-
 .../boot/dts/nxp/imx/imx6q-var-mx6customboard.dts  |    1 +
 arch/arm/boot/dts/nxp/imx/imx6q-yapp4-pegasus.dts  |    8 +
 arch/arm/boot/dts/nxp/imx/imx6qdl-colibri.dtsi     |    2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw560x.dtsi      |    1 -
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw5903.dtsi      |    2 -
 arch/arm/boot/dts/nxp/imx/imx6qdl-nit6xlite.dtsi   |    1 +
 .../boot/dts/nxp/imx/imx6qdl-nitrogen6_max.dtsi    |    9 +-
 .../boot/dts/nxp/imx/imx6qdl-nitrogen6_som2.dtsi   |    3 +
 arch/arm/boot/dts/nxp/imx/imx6qdl-nitrogen6x.dtsi  |    2 +
 arch/arm/boot/dts/nxp/imx/imx6qdl-sabrelite.dtsi   |    5 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-sabresd.dtsi     |   11 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-skov-cpu.dtsi    |    2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-ts4900.dtsi      |    2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-tx6-mb7.dtsi     |    3 +
 arch/arm/boot/dts/nxp/imx/imx6qdl-var-som.dtsi     |    3 -
 .../boot/dts/nxp/imx/imx6qp-yapp4-pegasus-plus.dts |    8 +
 arch/arm/boot/dts/nxp/imx/imx6sl-tolino-vision.dts |    1 -
 .../arm/boot/dts/nxp/imx/imx6sl-tolino-vision5.dts |   24 +
 .../arm/boot/dts/nxp/imx/imx6sll-kobo-librah2o.dts |   24 +
 arch/arm/boot/dts/nxp/imx/imx6sx-sdb.dtsi          |    2 +-
 arch/arm/boot/dts/nxp/imx/imx6ul-14x14-evk.dtsi    |    8 +
 arch/arm/boot/dts/nxp/imx/imx6ul-isiot.dtsi        |   12 +-
 arch/arm/boot/dts/nxp/imx/imx6ul-pico-dwarf.dts    |    2 +
 arch/arm/boot/dts/nxp/imx/imx6ull-dhcom-pdk2.dts   |    2 +-
 .../arm/boot/dts/nxp/imx/imx6ull-phytec-tauri.dtsi |    2 +-
 arch/arm/boot/dts/nxp/imx/imx7d-nitrogen7.dts      |    8 +
 arch/arm/boot/dts/nxp/imx/imx7d-pico-dwarf.dts     |    2 +
 arch/arm/boot/dts/nxp/imx/imx7d-sdb.dts            |    2 +
 arch/arm/boot/dts/nxp/imx/imx7s-warp.dts           |    9 +
 arch/arm/boot/dts/nxp/imx/imx7ulp-evk.dts          |    1 -
 arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dts    |   50 +
 .../boot/dts/qcom/qcom-msm8226-samsung-ms013g.dts  |   31 +-
 arch/arm/boot/dts/qcom/qcom-msm8960-cdp.dts        |   10 +-
 arch/arm/boot/dts/qcom/qcom-msm8960-pins.dtsi      |   61 -
 .../dts/qcom/qcom-msm8960-samsung-expressatt.dts   |   12 +-
 .../boot/dts/qcom/qcom-msm8960-sony-huashan.dts    |    2 +-
 arch/arm/boot/dts/qcom/qcom-msm8960.dtsi           |  746 +++--
 arch/arm/boot/dts/renesas/r7s72100.dtsi            |    4 +-
 arch/arm/boot/dts/renesas/r7s9210.dtsi             |    1 -
 arch/arm/boot/dts/renesas/r8a7742.dtsi             |   26 +-
 arch/arm/boot/dts/renesas/r8a7743.dtsi             |   14 +-
 arch/arm/boot/dts/renesas/r8a7744.dtsi             |   14 +-
 arch/arm/boot/dts/renesas/r8a7745.dtsi             |   14 +-
 arch/arm/boot/dts/renesas/r8a77470.dtsi            |   14 +-
 arch/arm/boot/dts/renesas/r8a7790.dtsi             |   26 +-
 arch/arm/boot/dts/renesas/r8a7791-koelsch.dts      |   34 +-
 arch/arm/boot/dts/renesas/r8a7791.dtsi             |   14 +-
 arch/arm/boot/dts/renesas/r8a7792.dtsi             |   14 +-
 arch/arm/boot/dts/renesas/r8a7793-gose.dts         |    1 -
 arch/arm/boot/dts/renesas/r8a7793.dtsi             |   14 +-
 arch/arm/boot/dts/renesas/r8a7794.dtsi             |   14 +-
 .../arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dts |    2 -
 arch/arm/boot/dts/renesas/r9a06g032.dtsi           |   13 +-
 arch/arm/boot/dts/renesas/sh73a0-kzm9g.dts         |    1 +
 arch/arm/boot/dts/rockchip/rk3066a-bqcurie2.dts    |   34 +-
 arch/arm/boot/dts/rockchip/rk3066a-marsboard.dts   |   34 +-
 arch/arm/boot/dts/rockchip/rk3066a-rayeager.dts    |   35 +-
 arch/arm/boot/dts/rockchip/rk3288-veyron.dtsi      |    2 +-
 arch/arm/boot/dts/rockchip/rk3288.dtsi             |    9 +-
 arch/arm/boot/dts/samsung/exynos4210-i9100.dts     |    1 +
 arch/arm/boot/dts/samsung/exynos4210-trats.dts     |    1 +
 .../boot/dts/samsung/exynos4210-universal_c210.dts |    1 +
 arch/arm/boot/dts/samsung/exynos4412-midas.dtsi    |    1 +
 arch/arm/boot/dts/st/stm32mp131.dtsi               |   17 +
 arch/arm/boot/dts/st/stm32mp135f-dk.dts            |    5 +
 .../arm/boot/dts/st/stm32mp153c-lxa-fairytux2.dtsi |    3 -
 .../dts/st/stm32mp157c-phycore-stm32mp15-som.dtsi  |    8 +-
 arch/arm/boot/dts/st/stm32mp15xc-lxa-tac.dtsi      |    3 -
 arch/arm/boot/dts/ti/omap/Makefile                 |    1 +
 arch/arm/boot/dts/ti/omap/am335x-baltos-leds.dtsi  |    6 +-
 arch/arm/boot/dts/ti/omap/am335x-baltos.dtsi       |   17 +
 arch/arm/boot/dts/ti/omap/am335x-bone-common.dtsi  |    4 +-
 arch/arm/boot/dts/ti/omap/am335x-boneblue.dts      |    2 +-
 arch/arm/boot/dts/ti/omap/am335x-chiliboard.dts    |    2 +-
 arch/arm/boot/dts/ti/omap/am335x-evm.dts           |    2 +-
 arch/arm/boot/dts/ti/omap/am335x-evmsk.dts         |    2 +-
 arch/arm/boot/dts/ti/omap/am335x-guardian.dts      |    2 +-
 arch/arm/boot/dts/ti/omap/am335x-icev2.dts         |    2 +-
 arch/arm/boot/dts/ti/omap/am335x-mba335x.dts       |  633 ++++
 arch/arm/boot/dts/ti/omap/am335x-myirtech-myd.dts  |    2 +-
 .../boot/dts/ti/omap/am335x-netcom-plus-2xx.dts    |    8 +-
 .../arm/boot/dts/ti/omap/am335x-osd3358-sm-red.dts |    2 +-
 arch/arm/boot/dts/ti/omap/am335x-pdu001.dts        |    2 +-
 arch/arm/boot/dts/ti/omap/am335x-pepper.dts        |    2 +-
 arch/arm/boot/dts/ti/omap/am335x-pocketbeagle.dts  |    2 +-
 .../ti/omap/am335x-sancloud-bbe-extended-wifi.dts  |    1 -
 arch/arm/boot/dts/ti/omap/am335x-sl50.dts          |    2 +-
 arch/arm/boot/dts/ti/omap/am335x-tqma335x.dtsi     |  270 ++
 arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi           |    2 -
 arch/arm/boot/dts/ti/omap/am33xx.dtsi              |    3 +-
 arch/arm/boot/dts/ti/omap/am4372.dtsi              |    1 -
 arch/arm/boot/dts/ti/omap/am437x-l4.dtsi           |    2 -
 arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dts  |    2 -
 arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dts  |    1 -
 arch/arm/boot/dts/ti/omap/omap3-beagle-xm.dts      |    2 +-
 arch/arm/boot/dts/ti/omap/omap3-n900.dts           |    2 +-
 arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi     |   52 +
 arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi     |  204 ++
 .../boot/dts/allwinner/sun55i-a527-cubie-a5e.dts   |   28 +-
 .../boot/dts/allwinner/sun55i-t527-avaota-a1.dts   |   26 +-
 .../boot/dts/allwinner/sun55i-t527-orangepi-4a.dts |   23 +
 arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi  |    9 +
 .../boot/dts/altera/socfpga_stratix10_socdk.dts    |   15 +-
 .../dts/altera/socfpga_stratix10_socdk_nand.dts    |   13 -
 .../boot/dts/altera/socfpga_stratix10_swvp.dts     |    3 -
 arch/arm64/boot/dts/amlogic/Makefile               |    1 +
 arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi        |   90 +
 .../boot/dts/amlogic/amlogic-c3-c308l-aw419.dts    |   84 +
 arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi        |   88 +
 arch/arm64/boot/dts/amlogic/amlogic-s6.dtsi        |   28 +
 arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi        |   28 +
 arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi       |   28 +
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi         |    4 +-
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi  |    2 +-
 arch/arm64/boot/dts/amlogic/meson-g12b.dtsi        |    4 +-
 arch/arm64/boot/dts/amlogic/meson-gxm-tx9-pro.dts  |   90 +
 arch/arm64/boot/dts/cix/sky1-orion-o6.dts          |   52 +
 arch/arm64/boot/dts/cix/sky1-pinfunc.h             |  401 +++
 arch/arm64/boot/dts/cix/sky1.dtsi                  |  156 +
 .../arm64/boot/dts/exynos/exynos7870-a2corelte.dts |   58 +-
 arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts    |   39 +-
 arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dts |   58 +-
 arch/arm64/boot/dts/exynos/exynos7870.dtsi         |   84 +
 arch/arm64/boot/dts/exynos/exynos990.dtsi          |   12 +
 arch/arm64/boot/dts/exynos/exynosautov920.dtsi     |   26 +
 .../boot/dts/exynos/google/gs101-pixel-common.dtsi |    7 +
 arch/arm64/boot/dts/exynos/google/gs101.dtsi       |  315 +-
 arch/arm64/boot/dts/freescale/Makefile             |   32 +
 arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi     |    3 +-
 arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi     |    8 +-
 arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi     |    9 +-
 arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dts  |   52 +
 arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi     |    9 +-
 .../arm64/boot/dts/freescale/fsl-ls1088a-ten64.dts |    4 +
 arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi     |    8 +-
 arch/arm64/boot/dts/freescale/fsl-lx2160a-qds.dts  |    2 +-
 arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dts  |   80 +-
 arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi     |    8 +-
 arch/arm64/boot/dts/freescale/fsl-lx2162a-qds.dts  |    2 +-
 .../arm64/boot/dts/freescale/imx8-apalis-eval.dtsi |    5 +-
 .../boot/dts/freescale/imx8-apalis-ixora-v1.1.dtsi |    5 +-
 .../boot/dts/freescale/imx8-apalis-ixora-v1.2.dtsi |    5 +-
 .../arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi |   51 +-
 arch/arm64/boot/dts/freescale/imx8-ss-audio.dtsi   |    6 +-
 arch/arm64/boot/dts/freescale/imx8-ss-conn.dtsi    |   20 +-
 arch/arm64/boot/dts/freescale/imx8-ss-dma.dtsi     |    6 +-
 arch/arm64/boot/dts/freescale/imx8dxl-evk.dts      |   14 +-
 arch/arm64/boot/dts/freescale/imx8dxl-ss-adma.dtsi |    9 +-
 arch/arm64/boot/dts/freescale/imx8dxl-ss-conn.dtsi |    1 +
 arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi      |    1 +
 ...8mm-phyboard-polis-peb-av-10-etml1010g3dra.dtso |   44 +
 ...x8mm-phyboard-polis-peb-av-10-ph128800t006.dtso |   44 +
 .../freescale/imx8mm-phyboard-polis-peb-av-10.dtsi |  189 ++
 .../freescale/imx8mm-phyboard-polis-peb-av-10.dtso |  234 +-
 .../imx8mm-phyboard-polis-peb-eval-01.dtso         |    3 +-
 .../dts/freescale/imx8mm-phyboard-polis-rdk.dts    |   11 +-
 .../boot/dts/freescale/imx8mm-phycore-som.dtsi     |   28 +-
 .../boot/dts/freescale/imx8mm-phygate-tauri-l.dts  |    2 +-
 .../boot/dts/freescale/imx8mm-venice-gw700x.dtsi   |    3 +-
 .../boot/dts/freescale/imx8mm-venice-gw72xx.dtsi   |   11 -
 .../boot/dts/freescale/imx8mm-venice-gw7902.dts    |    1 +
 .../boot/dts/freescale/imx8mn-venice-gw7902.dts    |    1 +
 arch/arm64/boot/dts/freescale/imx8mp-aipstz.h      |   33 +
 .../boot/dts/freescale/imx8mp-debix-model-a.dts    |    4 +-
 .../dts/freescale/imx8mp-debix-som-a-bmb-08.dts    |   47 +
 .../arm64/boot/dts/freescale/imx8mp-dhcom-pdk2.dts |    4 +
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts       |    6 +
 .../imx8mp-phyboard-pollux-etml1010g3dra.dtso      |   44 +
 ...mp-phyboard-pollux-peb-av-10-etml1010g3dra.dtso |   45 +
 ...8mp-phyboard-pollux-peb-av-10-ph128800t006.dtso |   45 +
 .../imx8mp-phyboard-pollux-peb-av-10.dtsi          |  198 ++
 .../imx8mp-phyboard-pollux-peb-av-10.dtso          |    9 +
 .../imx8mp-phyboard-pollux-ph128800t006.dtso       |   45 +
 .../dts/freescale/imx8mp-phyboard-pollux-rdk.dts   |   52 +-
 .../boot/dts/freescale/imx8mp-phycore-som.dtsi     |    3 +-
 arch/arm64/boot/dts/freescale/imx8mp-prt8ml.dts    |  504 ++++
 .../boot/dts/freescale/imx8mp-skov-revc-hdmi.dts   |    8 +
 .../imx8mp-skov-revc-jutouch-jt101tm023.dts        |   79 +
 .../dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts    |    7 +
 .../boot/dts/freescale/imx8mp-venice-gw702x.dtsi   |   54 +-
 .../boot/dts/freescale/imx8mp-venice-gw72xx.dtsi   |   11 -
 .../boot/dts/freescale/imx8mp-venice-gw74xx.dts    |    1 +
 arch/arm64/boot/dts/freescale/imx8mp.dtsi          |   81 +-
 arch/arm64/boot/dts/freescale/imx8mq-evk.dts       |    3 +
 .../boot/dts/freescale/imx8qm-apalis-v1.1.dtsi     |   10 +-
 arch/arm64/boot/dts/freescale/imx8qm-apalis.dtsi   |    2 -
 arch/arm64/boot/dts/freescale/imx8qm-mek.dts       |  156 +-
 arch/arm64/boot/dts/freescale/imx8qm-ss-audio.dtsi |    6 +-
 arch/arm64/boot/dts/freescale/imx8qm-ss-dma.dtsi   |    3 +-
 arch/arm64/boot/dts/freescale/imx8qm.dtsi          |    2 +-
 arch/arm64/boot/dts/freescale/imx8qxp-mek.dts      |  176 +-
 arch/arm64/boot/dts/freescale/imx8qxp.dtsi         |    9 +
 .../boot/dts/freescale/imx91-phyboard-segin.dts    |  345 +++
 .../boot/dts/freescale/imx91-phycore-som.dtsi      |  304 ++
 arch/arm64/boot/dts/freescale/imx91_93_common.dtsi |    2 +-
 .../dts/freescale/imx93-phyboard-nash-jtag.dtso    |   31 +
 .../dts/freescale/imx93-phyboard-nash-pwm-fan.dtso |   75 +
 .../boot/dts/freescale/imx93-phyboard-nash.dts     |   24 +
 .../boot/dts/freescale/imx93-phyboard-segin.dts    |   24 +
 arch/arm64/boot/dts/freescale/imx93-tqma9352.dtsi  |    1 +
 arch/arm64/boot/dts/freescale/imx93-var-som.dtsi   |  332 +-
 arch/arm64/boot/dts/freescale/imx94.dtsi           |    6 +
 arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts  |    3 +
 arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts  |    3 +
 .../boot/dts/freescale/imx95-19x19-verdin-evk.dts  |  695 +++++
 .../boot/dts/freescale/imx95-toradex-smarc-dev.dts |  277 ++
 .../boot/dts/freescale/imx95-toradex-smarc.dtsi    | 1155 +++++++
 .../dts/freescale/imx95-tqma9596sa-mb-smarc-2.dts  |   75 +-
 .../arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi |  153 +-
 arch/arm64/boot/dts/freescale/imx95.dtsi           |    2 +-
 arch/arm64/boot/dts/freescale/mba8mx.dtsi          |    7 +
 arch/arm64/boot/dts/freescale/mba8xx.dtsi          |    7 +
 arch/arm64/boot/dts/freescale/s32g2.dtsi           |   58 +-
 arch/arm64/boot/dts/freescale/s32g274a-evb.dts     |   18 +-
 arch/arm64/boot/dts/freescale/s32g274a-rdb2.dts    |   16 +
 arch/arm64/boot/dts/freescale/s32g3.dtsi           |   58 +-
 arch/arm64/boot/dts/freescale/s32g399a-rdb3.dts    |   18 +-
 .../boot/dts/freescale/tqma8xxs-mb-smarc-2.dtsi    |    7 +
 arch/arm64/boot/dts/intel/Makefile                 |    2 +
 arch/arm64/boot/dts/intel/socfpga_agilex.dtsi      |    1 +
 .../arm64/boot/dts/intel/socfpga_agilex3_socdk.dts |  132 +
 arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi     |  115 +-
 .../arm64/boot/dts/intel/socfpga_agilex5_socdk.dts |    2 +
 .../boot/dts/intel/socfpga_agilex5_socdk_013b.dts  |  126 +
 .../boot/dts/intel/socfpga_agilex5_socdk_nand.dts  |   18 +
 arch/arm64/boot/dts/intel/socfpga_agilex_socdk.dts |    2 +
 .../boot/dts/intel/socfpga_agilex_socdk_nand.dts   |    2 +-
 arch/arm64/boot/dts/intel/socfpga_n5x_socdk.dts    |    2 +
 arch/arm64/boot/dts/marvell/armada-70x0.dtsi       |    2 +-
 arch/arm64/boot/dts/marvell/armada-80x0.dtsi       |    2 +-
 arch/arm64/boot/dts/marvell/cn9130-db.dtsi         |    2 +-
 arch/arm64/boot/dts/marvell/cn9132-clearfog.dts    |   16 +-
 .../marvell/mmp/pxa1908-samsung-coreprimevelte.dts |  267 +-
 arch/arm64/boot/dts/marvell/mmp/pxa1908.dtsi       |   51 +-
 arch/arm64/boot/dts/mediatek/Makefile              |   11 +
 arch/arm64/boot/dts/mediatek/mt6878-pinfunc.h      | 1201 ++++++++
 arch/arm64/boot/dts/mediatek/mt7622.dtsi           |    4 +
 .../boot/dts/mediatek/mt7981b-openwrt-one.dts      |  150 +
 arch/arm64/boot/dts/mediatek/mt7981b.dtsi          |   35 +-
 .../boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts  |    2 +-
 arch/arm64/boot/dts/mediatek/mt7986a.dtsi          |    4 +
 .../dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dts   |    1 +
 .../mediatek/mt7988a-bananapi-bpi-r4-pro-4e.dts    |   16 +
 .../mediatek/mt7988a-bananapi-bpi-r4-pro-8x.dts    |   16 +
 .../mediatek/mt7988a-bananapi-bpi-r4-pro-cn15.dtso |   20 +
 .../mediatek/mt7988a-bananapi-bpi-r4-pro-cn18.dtso |   20 +
 .../mediatek/mt7988a-bananapi-bpi-r4-pro-emmc.dtso |   33 +
 .../mediatek/mt7988a-bananapi-bpi-r4-pro-sd.dtso   |   31 +
 .../dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtsi  |  534 ++++
 arch/arm64/boot/dts/mediatek/mt7988a.dtsi          |    7 +-
 arch/arm64/boot/dts/mediatek/mt8183.dtsi           |    4 +-
 arch/arm64/boot/dts/mediatek/mt8195.dtsi           |    2 +-
 arch/arm64/boot/dts/mediatek/mt8196-gce.h          |  612 ++++
 arch/arm64/boot/dts/mediatek/mt8365-evk.dts        |    9 +
 arch/arm64/boot/dts/mediatek/mt8365.dtsi           |   43 +-
 .../dts/mediatek/mt8370-grinn-genio-510-sbc.dts    |   20 +
 .../dts/mediatek/mt8390-grinn-genio-700-sbc.dts    |   20 +
 .../boot/dts/mediatek/mt8390-grinn-genio-sbc.dtsi  |  538 ++++
 .../boot/dts/mediatek/mt8390-grinn-genio-som.dtsi  |  210 ++
 .../dts/mediatek/mt8395-genio-1200-evk-ufs.dts     |   29 +
 .../boot/dts/mediatek/mt8395-genio-1200-evk.dts    | 1189 +-------
 .../boot/dts/mediatek/mt8395-genio-common.dtsi     | 1230 ++++++++
 arch/arm64/boot/dts/nvidia/Makefile                |    2 +
 arch/arm64/boot/dts/nvidia/tegra132.dtsi           |    3 +-
 .../dts/nvidia/tegra186-p3509-0000+p3636-0001.dts  |    1 -
 arch/arm64/boot/dts/nvidia/tegra186.dtsi           |   13 +
 arch/arm64/boot/dts/nvidia/tegra194-p3668.dtsi     |    1 +
 arch/arm64/boot/dts/nvidia/tegra194.dtsi           |    1 +
 arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi     |    6 +
 arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi     |    4 +-
 arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts |   12 +-
 arch/arm64/boot/dts/nvidia/tegra210-p3541-0000.dts |   59 +
 .../boot/dts/nvidia/tegra210-peripherals-opp.dtsi  |  135 +
 arch/arm64/boot/dts/nvidia/tegra210.dtsi           |   90 +-
 arch/arm64/boot/dts/nvidia/tegra234-p3701.dtsi     |   11 +
 arch/arm64/boot/dts/nvidia/tegra234-p3767.dtsi     |   15 +
 arch/arm64/boot/dts/nvidia/tegra234.dtsi           |   72 +-
 arch/arm64/boot/dts/nvidia/tegra264-p3971.dtsi     |  108 +
 arch/arm64/boot/dts/nvidia/tegra264.dtsi           | 3190 +++++++++++++=
+++++++
 arch/arm64/boot/dts/qcom/Makefile                  |   12 +
 .../boot/dts/qcom/{qcm2290.dtsi =3D> agatti.dtsi}    |  172 +-
 arch/arm64/boot/dts/qcom/apq8096-db820c.dts        |    4 +
 arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts         |   38 +-
 arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi        |    7 +-
 .../qcom/{x1e80100-pmics.dtsi =3D> hamoa-pmics.dtsi} |   20 +
 .../boot/dts/qcom/{x1e80100.dtsi =3D> hamoa.dtsi}    |  171 +-
 arch/arm64/boot/dts/qcom/ipq5424.dtsi              |   95 +-
 .../boot/dts/qcom/{sc7280.dtsi =3D> kodiak.dtsi}     |  300 ++
 arch/arm64/boot/dts/qcom/lemans-evk-camera.dtso    |  105 +
 arch/arm64/boot/dts/qcom/lemans-evk.dts            |   28 +
 arch/arm64/boot/dts/qcom/lemans-pmics.dtsi         |    9 +
 arch/arm64/boot/dts/qcom/lemans.dtsi               |  133 +-
 arch/arm64/boot/dts/qcom/monaco-evk.dts            |    6 +-
 .../qcom/{qcs8300-pmics.dtsi =3D> monaco-pmics.dtsi} |    1 -
 .../boot/dts/qcom/{qcs8300.dtsi =3D> monaco.dtsi}    |    7 +
 .../boot/dts/qcom/msm8916-longcheer-l8910.dts      |   46 +
 .../dts/qcom/msm8916-samsung-rossa-common.dtsi     |   22 +-
 arch/arm64/boot/dts/qcom/msm8916-samsung-rossa.dts |   20 -
 arch/arm64/boot/dts/qcom/msm8937-xiaomi-land.dts   |  381 +++
 arch/arm64/boot/dts/qcom/msm8937.dtsi              | 2133 +++++++++++++
 arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts     |  256 ++
 arch/arm64/boot/dts/qcom/msm8996-oneplus3.dts      |    6 +-
 arch/arm64/boot/dts/qcom/msm8996-oneplus3t.dts     |    6 +-
 arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dts |    6 +-
 arch/arm64/boot/dts/qcom/msm8996.dtsi              |    2 +-
 .../boot/dts/qcom/msm8996pro-xiaomi-natrium.dts    |    6 +-
 .../boot/dts/qcom/msm8996pro-xiaomi-scorpio.dts    |    6 +-
 arch/arm64/boot/dts/qcom/pmi8950.dtsi              |   14 +-
 .../boot/dts/qcom/{x1p42100.dtsi =3D> purwa.dtsi}    |    4 +-
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts |   51 +-
 arch/arm64/boot/dts/qcom/qcm6490-idp.dts           |    2 +-
 .../boot/dts/qcom/qcm6490-particle-tachyon.dts     |    2 +-
 arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts   |   82 +-
 arch/arm64/boot/dts/qcom/qcs615-ride.dts           |  155 +-
 .../boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts     | 1095 +++++++
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts       |   76 +-
 arch/arm64/boot/dts/qcom/qcs8300-ride.dts          |    4 +-
 arch/arm64/boot/dts/qcom/qrb2210-rb1.dts           |   65 +-
 arch/arm64/boot/dts/qcom/qrb4210-rb2.dts           |    6 +-
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts           |    7 +-
 arch/arm64/boot/dts/qcom/sa8295p-adp.dts           |   14 +-
 arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dts   |    9 +-
 arch/arm64/boot/dts/qcom/sc7180-el2.dtso           |    6 +-
 arch/arm64/boot/dts/qcom/sc7180-idp.dts            |    1 +
 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi       |    1 +
 arch/arm64/boot/dts/qcom/sc7180.dtsi               |   12 +
 arch/arm64/boot/dts/qcom/sc7280-idp.dtsi           |    4 +-
 arch/arm64/boot/dts/qcom/sc7280-qcard.dtsi         |    2 +-
 .../arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts |   12 +-
 arch/arm64/boot/dts/qcom/sc8180x-primus.dts        |    9 +-
 arch/arm64/boot/dts/qcom/sc8180x.dtsi              |   19 +
 arch/arm64/boot/dts/qcom/sc8280xp-crd.dts          |   12 +-
 arch/arm64/boot/dts/qcom/sc8280xp-el2.dtso         |    6 +-
 .../boot/dts/qcom/sc8280xp-huawei-gaokun3.dts      |   12 +-
 .../dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts     |   20 +-
 .../boot/dts/qcom/sc8280xp-microsoft-arcata.dts    |   12 +-
 .../boot/dts/qcom/sc8280xp-microsoft-blackrock.dts |   12 +-
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi             |  185 +-
 arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts   |    7 +-
 arch/arm64/boot/dts/qcom/sdm670.dtsi               |   14 +
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts         |    8 +-
 arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi     |   21 +-
 arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts      |    6 +-
 arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dts       |    6 +-
 arch/arm64/boot/dts/qcom/sdm845-mtp.dts            |    7 +-
 .../arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi |  138 +-
 arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts |    2 +-
 .../boot/dts/qcom/sdm845-samsung-starqltechn.dts   |   23 +-
 arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts  |   27 +-
 .../boot/dts/qcom/sdm845-sony-xperia-tama.dtsi     |    7 +-
 .../dts/qcom/sdm845-xiaomi-beryllium-common.dtsi   |    7 +-
 arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts |    7 +-
 arch/arm64/boot/dts/qcom/sdm845.dtsi               |   13 +
 .../dts/qcom/sdm850-huawei-matebook-e-2019.dts     |  971 ++++++
 .../boot/dts/qcom/sdm850-lenovo-yoga-c630.dts      |    9 +-
 arch/arm64/boot/dts/qcom/sdx75-idp.dts             |    6 +-
 arch/arm64/boot/dts/qcom/sdx75.dtsi                |   72 +-
 arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts    |    6 +-
 arch/arm64/boot/dts/qcom/sm6115.dtsi               |    2 +-
 arch/arm64/boot/dts/qcom/sm6115p-lenovo-j606f.dts  |    6 +-
 arch/arm64/boot/dts/qcom/sm6350.dtsi               |   59 +-
 arch/arm64/boot/dts/qcom/sm6375.dtsi               |    6 +
 .../boot/dts/qcom/sm7325-nothing-spacewar.dts      |    5 +
 arch/arm64/boot/dts/qcom/sm7325.dtsi               |    2 +-
 arch/arm64/boot/dts/qcom/sm8150.dtsi               |   12 +-
 arch/arm64/boot/dts/qcom/sm8250-mtp.dts            |    7 +-
 .../arm64/boot/dts/qcom/sm8250-samsung-common.dtsi |    3 +-
 .../boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi  |    7 +-
 arch/arm64/boot/dts/qcom/sm8250-xiaomi-pipa.dts    |    7 +-
 arch/arm64/boot/dts/qcom/sm8250.dtsi               |   13 +-
 arch/arm64/boot/dts/qcom/sm8350-hdk.dts            |    6 +-
 arch/arm64/boot/dts/qcom/sm8350.dtsi               |    2 +-
 arch/arm64/boot/dts/qcom/sm8450-hdk.dts            |    6 +-
 arch/arm64/boot/dts/qcom/sm8450.dtsi               |   57 +-
 .../boot/dts/qcom/sm8550-hdk-rear-camera-card.dtso |   91 +
 arch/arm64/boot/dts/qcom/sm8550-hdk.dts            |    6 +-
 arch/arm64/boot/dts/qcom/sm8550-mtp.dts            |    6 +-
 arch/arm64/boot/dts/qcom/sm8550-qrd.dts            |   52 +-
 arch/arm64/boot/dts/qcom/sm8550.dtsi               |  226 +-
 arch/arm64/boot/dts/qcom/sm8650-hdk.dts            |    6 +-
 arch/arm64/boot/dts/qcom/sm8650-qrd.dts            |    6 +-
 arch/arm64/boot/dts/qcom/sm8650.dtsi               |   83 +-
 arch/arm64/boot/dts/qcom/sm8750-mtp.dts            |   79 +-
 arch/arm64/boot/dts/qcom/sm8750-qrd.dts            |   73 +
 arch/arm64/boot/dts/qcom/sm8750.dtsi               |  161 +-
 .../boot/dts/qcom/{sm6150.dtsi =3D> talos.dtsi}      |  330 +-
 arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi  |    9 +-
 arch/arm64/boot/dts/qcom/x1-crd.dtsi               |    9 +-
 arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi        |    7 +-
 arch/arm64/boot/dts/qcom/x1e001de-devkit.dts       |   10 +-
 .../dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi    |   10 +-
 .../boot/dts/qcom/x1e80100-asus-vivobook-s15.dts   |   10 +-
 .../boot/dts/qcom/x1e80100-asus-zenbook-a14.dts    |  104 +-
 arch/arm64/boot/dts/qcom/x1e80100-crd.dts          |    2 +-
 .../qcom/x1e80100-dell-inspiron-14-plus-7441.dts   |    2 +-
 .../boot/dts/qcom/x1e80100-dell-latitude-7455.dts  |    2 +-
 .../boot/dts/qcom/x1e80100-dell-xps13-9345.dts     |   10 +-
 .../dts/qcom/x1e80100-hp-elitebook-ultra-g1q.dts   |    6 +-
 .../boot/dts/qcom/x1e80100-hp-omnibook-x14.dts     |    4 +-
 .../boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts  |   10 +-
 .../boot/dts/qcom/x1e80100-microsoft-romulus.dtsi  |   12 +-
 arch/arm64/boot/dts/qcom/x1e80100-qcp.dts          |   10 +-
 .../dts/qcom/x1p42100-asus-zenbook-a14-lcd.dts     |   62 +
 .../boot/dts/qcom/x1p42100-asus-zenbook-a14.dts    |  133 +-
 .../boot/dts/qcom/x1p42100-asus-zenbook-a14.dtsi   |  138 +
 arch/arm64/boot/dts/qcom/x1p42100-crd.dts          |    2 +-
 .../boot/dts/qcom/x1p42100-hp-omnibook-x14.dts     |    4 +-
 .../boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts |    4 +-
 arch/arm64/boot/dts/renesas/Makefile               |   11 +
 .../dts/renesas/aistarvision-mipi-adapter-2.1.dtsi |    1 -
 arch/arm64/boot/dts/renesas/draak.dtsi             |    5 +
 arch/arm64/boot/dts/renesas/ebisu.dtsi             |    5 +
 arch/arm64/boot/dts/renesas/r8a774a1.dtsi          |   22 +-
 arch/arm64/boot/dts/renesas/r8a774b1.dtsi          |   14 +-
 arch/arm64/boot/dts/renesas/r8a774c0.dtsi          |   14 +-
 arch/arm64/boot/dts/renesas/r8a774e1.dtsi          |   26 +-
 arch/arm64/boot/dts/renesas/r8a77951.dtsi          |   36 +-
 arch/arm64/boot/dts/renesas/r8a77960.dtsi          |   49 +-
 arch/arm64/boot/dts/renesas/r8a77961.dtsi          |   49 +-
 arch/arm64/boot/dts/renesas/r8a77965.dtsi          |   41 +-
 .../renesas/r8a77970-eagle-function-expansion.dtso |   17 +
 arch/arm64/boot/dts/renesas/r8a77970-eagle.dts     |    5 +
 arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts     |   11 +-
 arch/arm64/boot/dts/renesas/r8a77970.dtsi          |   24 +-
 arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dts     |    1 -
 arch/arm64/boot/dts/renesas/r8a77980.dtsi          |   22 +-
 arch/arm64/boot/dts/renesas/r8a77990.dtsi          |   24 +-
 arch/arm64/boot/dts/renesas/r8a77995.dtsi          |   22 +-
 arch/arm64/boot/dts/renesas/r8a779a0.dtsi          |   41 +-
 arch/arm64/boot/dts/renesas/r8a779f0.dtsi          |   24 +-
 arch/arm64/boot/dts/renesas/r8a779g0.dtsi          |   24 +-
 .../renesas/r8a779g3-sparrow-hawk-fan-argon40.dtso |   51 +
 .../r8a779g3-sparrow-hawk-rpi-display-2-5in.dtso   |   13 +
 .../r8a779g3-sparrow-hawk-rpi-display-2-7in.dtso   |   13 +
 .../r8a779g3-sparrow-hawk-rpi-display-2.dtsi       |   90 +
 .../boot/dts/renesas/r8a779g3-sparrow-hawk.dts     |    6 +-
 arch/arm64/boot/dts/renesas/r8a779h0.dtsi          |   24 +-
 arch/arm64/boot/dts/renesas/r8a78000-ironhide.dts  |   85 +
 arch/arm64/boot/dts/renesas/r8a78000.dtsi          |  787 +++++
 arch/arm64/boot/dts/renesas/r9a07g043u.dtsi        |   16 +-
 arch/arm64/boot/dts/renesas/r9a07g044.dtsi         |   14 +-
 arch/arm64/boot/dts/renesas/r9a07g054.dtsi         |   14 +-
 arch/arm64/boot/dts/renesas/r9a08g045.dtsi         |  179 +-
 arch/arm64/boot/dts/renesas/r9a09g011.dtsi         |   10 +-
 arch/arm64/boot/dts/renesas/r9a09g047.dtsi         |   60 +-
 arch/arm64/boot/dts/renesas/r9a09g056.dtsi         |   17 +-
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi         |  107 +-
 .../boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts    |   17 +
 arch/arm64/boot/dts/renesas/r9a09g077.dtsi         |  565 +++-
 .../boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts    |   98 +
 arch/arm64/boot/dts/renesas/r9a09g087.dtsi         |  568 +++-
 .../boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts    |  142 +
 .../boot/dts/renesas/rz-smarc-cru-csi-ov5645.dtsi  |    1 -
 arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi   |    4 -
 arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi       |   57 +
 .../boot/dts/renesas/rzt2h-n2h-evk-common.dtsi     |  149 +
 arch/arm64/boot/dts/renesas/salvator-common.dtsi   |    5 +
 arch/arm64/boot/dts/renesas/ulcb.dtsi              |    5 +
 arch/arm64/boot/dts/rockchip/Makefile              |    7 +
 arch/arm64/boot/dts/rockchip/px30.dtsi             |   12 +
 arch/arm64/boot/dts/rockchip/rk3308-rock-pi-s.dts  |    1 -
 arch/arm64/boot/dts/rockchip/rk3318-a95x-z2.dts    |    2 +-
 arch/arm64/boot/dts/rockchip/rk3328-evb.dts        |    2 +-
 arch/arm64/boot/dts/rockchip/rk3368.dtsi           |   75 +
 .../boot/dts/rockchip/rk3399-rock-4c-plus.dts      |    2 +-
 arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts |   12 +
 arch/arm64/boot/dts/rockchip/rk3528-rock-2a.dts    |    1 -
 arch/arm64/boot/dts/rockchip/rk3528.dtsi           |   56 +-
 .../boot/dts/rockchip/rk3566-orangepi-3b.dtsi      |    5 +
 arch/arm64/boot/dts/rockchip/rk3566-rock-3c.dts    |    1 +
 .../boot/dts/rockchip/rk3566-tinker-board-3.dts    |   13 +
 .../boot/dts/rockchip/rk3566-tinker-board-3.dtsi   |  278 ++
 .../boot/dts/rockchip/rk3566-tinker-board-3s.dts   |   30 +
 .../boot/dts/rockchip/rk3568-9tripod-x3568-v4.dts  |  880 ++++++
 arch/arm64/boot/dts/rockchip/rk3568-easepi-r1.dts  |  623 ++++
 arch/arm64/boot/dts/rockchip/rk3568-qnap-ts233.dts |  131 +
 arch/arm64/boot/dts/rockchip/rk3568-qnap-ts433.dts |  604 +---
 .../arm64/boot/dts/rockchip/rk3568-qnap-tsx33.dtsi |  608 ++++
 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi      |   51 +-
 .../boot/dts/rockchip/rk3576-100ask-dshanpi-a1.dts |  838 +++++
 .../arm64/boot/dts/rockchip/rk3576-nanopi-r76s.dts |  860 ++++++
 arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts    |    2 +-
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi      |    1 +
 arch/arm64/boot/dts/rockchip/rk3588-evb2-v10.dts   |   48 +
 arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts |   21 +-
 .../boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi   |   13 +-
 .../boot/dts/rockchip/rk3588-rock-5b-plus.dts      |    5 +
 arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts    |    4 +
 arch/arm64/boot/dts/rockchip/rk3588-rock-5t.dts    |    4 +
 arch/arm64/boot/dts/rockchip/rk3588s-evb1-v10.dts  |    1 -
 .../boot/dts/rockchip/rk3588s-gameforce-ace.dts    |   34 +
 .../boot/dts/rockchip/rk3588s-indiedroid-nova.dts  |  165 +-
 arch/arm64/boot/dts/rockchip/rk3588s-rock-5a.dts   |   25 +-
 arch/arm64/boot/dts/rockchip/rk3588s-rock-5c.dts   |    9 +
 arch/arm64/boot/dts/sprd/sc9860.dtsi               |   62 -
 arch/arm64/boot/dts/sprd/whale2.dtsi               |   54 +-
 arch/arm64/boot/dts/st/stm32mp211.dtsi             |    4 +-
 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi      |    4 +
 arch/arm64/boot/dts/st/stm32mp257f-ev1.dts         |    1 +
 arch/arm64/boot/dts/ti/Makefile                    |   49 +
 arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts           |   64 +
 arch/arm64/boot/dts/ti/k3-am62-main.dtsi           |   64 +
 arch/arm64/boot/dts/ti/k3-am62-phycore-som.dtsi    |    3 +-
 arch/arm64/boot/dts/ti/k3-am62-verdin-dev.dtsi     |    2 +-
 arch/arm64/boot/dts/ti/k3-am62-verdin-ivy.dtsi     |    2 +-
 arch/arm64/boot/dts/ti/k3-am62-verdin.dtsi         |    2 +-
 arch/arm64/boot/dts/ti/k3-am62.dtsi                |   22 +
 arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts     |    3 +-
 arch/arm64/boot/dts/ti/k3-am625-sk-common.dtsi     |    4 +-
 arch/arm64/boot/dts/ti/k3-am62a-main.dtsi          |   10 +
 arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi   |    2 +-
 arch/arm64/boot/dts/ti/k3-am62a.dtsi               |   27 +
 arch/arm64/boot/dts/ti/k3-am62a7-sk.dts            |   71 +-
 arch/arm64/boot/dts/ti/k3-am62d2-evm.dts           |  103 +-
 arch/arm64/boot/dts/ti/k3-am62l-main.dtsi          |  580 ++++
 arch/arm64/boot/dts/ti/k3-am62l-wakeup.dtsi        |  141 +
 arch/arm64/boot/dts/ti/k3-am62l.dtsi               |  118 +
 arch/arm64/boot/dts/ti/k3-am62l3-evm.dts           |  361 +++
 arch/arm64/boot/dts/ti/k3-am62l3.dtsi              |   67 +
 .../boot/dts/ti/k3-am62p-j722s-common-main.dtsi    |   18 +
 arch/arm64/boot/dts/ti/k3-am62p-main.dtsi          |   20 -
 arch/arm64/boot/dts/ti/k3-am62p-verdin-dev.dtsi    |    2 +-
 arch/arm64/boot/dts/ti/k3-am62p-verdin-ivy.dtsi    |    2 +-
 arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi        |    2 +-
 arch/arm64/boot/dts/ti/k3-am62p.dtsi               |   29 +-
 arch/arm64/boot/dts/ti/k3-am62p5-sk.dts            |   73 +-
 arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi      |  148 +-
 arch/arm64/boot/dts/ti/k3-am62x-phyboard-lyra.dtsi |    2 +-
 arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi     |    2 +-
 arch/arm64/boot/dts/ti/k3-am64-phycore-som.dtsi    |    2 +-
 arch/arm64/boot/dts/ti/k3-am642-evm.dts            |    7 +-
 arch/arm64/boot/dts/ti/k3-am642-sk.dts             |    4 +-
 .../boot/dts/ti/k3-am642-tqma64xxl-mbax4xxl.dts    |   20 +-
 arch/arm64/boot/dts/ti/k3-am642-tqma64xxl.dtsi     |   15 +-
 arch/arm64/boot/dts/ti/k3-am65-iot2050-common.dtsi |    4 -
 arch/arm64/boot/dts/ti/k3-am65-mcu.dtsi            |    2 +
 arch/arm64/boot/dts/ti/k3-am654-base-board.dts     |    3 +-
 arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts     |    2 +-
 .../boot/dts/ti/k3-am67a-kontron-sa67-ads2.dtso    |  146 +
 .../boot/dts/ti/k3-am67a-kontron-sa67-base.dts     | 1091 +++++++
 .../boot/dts/ti/k3-am67a-kontron-sa67-gbe1.dtso    |   26 +
 .../boot/dts/ti/k3-am67a-kontron-sa67-gpios.dtso   |   61 +
 .../dts/ti/k3-am67a-kontron-sa67-rtc-rv8263.dtso   |   31 +
 arch/arm64/boot/dts/ti/k3-am68-phyboard-izar.dts   |    3 +-
 arch/arm64/boot/dts/ti/k3-am68-phycore-som.dtsi    |    4 +-
 arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dts   |    3 +-
 arch/arm64/boot/dts/ti/k3-am69-aquila-clover.dts   |  451 +++
 arch/arm64/boot/dts/ti/k3-am69-aquila-dev.dts      |  576 ++++
 arch/arm64/boot/dts/ti/k3-am69-aquila.dtsi         | 1840 +++++++++++
 arch/arm64/boot/dts/ti/k3-am69-sk.dts              |   10 +-
 .../boot/dts/ti/k3-j7200-common-proc-board.dts     |    3 +-
 arch/arm64/boot/dts/ti/k3-j7200-mcu-wakeup.dtsi    |    2 +
 arch/arm64/boot/dts/ti/k3-j721e-beagleboneai64.dts |    3 +-
 .../boot/dts/ti/k3-j721e-common-proc-board.dts     |    3 +-
 .../boot/dts/ti/k3-j721e-evm-gesi-exp-board.dtso   |    8 +-
 arch/arm64/boot/dts/ti/k3-j721e-mcu-wakeup.dtsi    |    2 +
 arch/arm64/boot/dts/ti/k3-j721e-sk.dts             |   15 +-
 .../boot/dts/ti/k3-j721s2-common-proc-board.dts    |    3 +-
 .../boot/dts/ti/k3-j721s2-evm-gesi-exp-board.dtso  |    2 +-
 arch/arm64/boot/dts/ti/k3-j721s2-mcu-wakeup.dtsi   |    2 +
 arch/arm64/boot/dts/ti/k3-j722s-evm.dts            |    7 +-
 arch/arm64/boot/dts/ti/k3-j722s-main.dtsi          |   18 -
 .../boot/dts/ti/k3-j784s4-evm-pcie0-pcie1-ep.dtso  |    1 +
 .../boot/dts/ti/k3-j784s4-j742s2-evm-common.dtsi   |   18 +-
 arch/arm64/boot/dts/ti/k3-pinctrl.h                |    2 +
 .../riscv/boot/dts/microchip/mpfs-beaglev-fire.dts |   96 +
 .../riscv/boot/dts/sifive/hifive-unmatched-a00.dts |   10 +
 arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dts   |    5 +
 arch/riscv/boot/dts/sophgo/cv180x.dtsi             |   42 +
 arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dts  |    5 +
 .../boot/dts/sophgo/sg2002-licheerv-nano-b.dts     |    5 +
 arch/riscv/boot/dts/sophgo/sg2042-evb-v1.dts       |   36 +
 arch/riscv/boot/dts/sophgo/sg2042-evb-v2.dts       |   24 +
 .../riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts |   36 +
 arch/riscv/boot/dts/sophgo/sg2042.dtsi             |  112 +
 arch/riscv/boot/dts/spacemit/Makefile              |    2 +
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts    |  172 ++
 arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts     |   79 +
 arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts   |   90 +
 arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts   |   52 +
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi       |  465 ++-
 arch/riscv/boot/dts/spacemit/k1.dtsi               |  122 +
 arch/riscv/boot/dts/starfive/Makefile              |    3 +
 arch/riscv/boot/dts/starfive/jh7110-common.dtsi    |   19 -
 .../dts/starfive/jh7110-deepcomputing-fml13v01.dts |   27 +
 arch/riscv/boot/dts/starfive/jh7110-milkv-mars.dts |   27 +
 .../boot/dts/starfive/jh7110-milkv-marscm-emmc.dts |    9 +
 .../boot/dts/starfive/jh7110-milkv-marscm-lite.dts |    1 +
 .../boot/dts/starfive/jh7110-milkv-marscm.dtsi     |   13 +
 .../riscv/boot/dts/starfive/jh7110-orangepi-rv.dts |   76 +
 .../boot/dts/starfive/jh7110-pine64-star64.dts     |   27 +
 .../jh7110-starfive-visionfive-2-lite-emmc.dts     |   22 +
 .../starfive/jh7110-starfive-visionfive-2-lite.dts |   20 +
 .../jh7110-starfive-visionfive-2-lite.dtsi         |  161 +
 .../dts/starfive/jh7110-starfive-visionfive-2.dtsi |   24 +
 arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts  |   67 +
 arch/riscv/boot/dts/thead/th1520.dtsi              |   72 +-
 drivers/clk/mvebu/cp110-system-controller.c        |   20 +
 include/dt-bindings/clock/google,gs101-acpm.h      |   26 +
 include/dt-bindings/clock/qcom,dispcc-sm6350.h     |    4 +
 include/dt-bindings/clock/qcom,ipq5424-gcc.h       |    3 +-
 include/dt-bindings/clock/qcom,ipq5424-nsscc.h     |   65 +
 include/dt-bindings/clock/qcom,x1e80100-gcc.h      |   61 +
 include/dt-bindings/clock/r8a779a0-cpg-mssr.h      |    1 +
 include/dt-bindings/clock/rk3568-cru.h             |    6 +
 include/dt-bindings/interconnect/qcom,ipq5424.h    |   33 +
 include/dt-bindings/power/nvidia,tegra264-bpmp.h   |   24 +
 include/dt-bindings/reset/qcom,ipq5424-nsscc.h     |   46 +
 733 files changed, 52143 insertions(+), 5692 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/tegra/nvid=
ia,tegra114-tsec.yaml
 create mode 100644 Documentation/devicetree/bindings/display/tegra/nvid=
ia,tegra20-csi.yaml
 create mode 100644 Documentation/devicetree/bindings/embedded-controlle=
r/traverse,ten64-controller.yaml
 delete mode 100644 Documentation/devicetree/bindings/mmc/sdhci-omap.txt
 create mode 100644 Documentation/devicetree/bindings/mmc/ti,omap2430-sd=
hci.yaml
 create mode 100644 Documentation/devicetree/bindings/soc/sophgo/sophgo,=
cv1800b-top-syscon.yaml
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemit=
e5.dts
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-balcones.dts
 create mode 100644 arch/arm/boot/dts/aspeed/ibm-power11-dual.dtsi
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_arria10_merc=
ury_aa1_pe1_emmc.dts
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_arria10_merc=
ury_aa1_pe1_qspi.dts
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_arria10_merc=
ury_aa1_pe1_sdmmc.dts
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_arria10_merc=
ury_aa1_pe3_emmc.dts
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_arria10_merc=
ury_aa1_pe3_qspi.dts
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_arria10_merc=
ury_aa1_pe3_sdmmc.dts
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_arria10_merc=
ury_aa1_st1_emmc.dts
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_arria10_merc=
ury_aa1_st1_qspi.dts
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_arria10_merc=
ury_aa1_st1_sdmmc.dts
 delete mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_arria10_merc=
ury_pe1.dts
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mer=
cury_sa1.dtsi
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mer=
cury_sa1_pe1_emmc.dts
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mer=
cury_sa1_pe1_qspi.dts
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mer=
cury_sa1_pe1_sdmmc.dts
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mer=
cury_sa1_pe3_emmc.dts
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mer=
cury_sa1_pe3_qspi.dts
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mer=
cury_sa1_pe3_sdmmc.dts
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mer=
cury_sa1_st1_emmc.dts
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mer=
cury_sa1_st1_qspi.dts
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mer=
cury_sa1_st1_sdmmc.dts
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mer=
cury_sa2.dtsi
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mer=
cury_sa2_pe1_qspi.dts
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mer=
cury_sa2_pe1_sdmmc.dts
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mer=
cury_sa2_pe3_qspi.dts
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mer=
cury_sa2_pe3_sdmmc.dts
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mer=
cury_sa2_st1_qspi.dts
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mer=
cury_sa2_st1_sdmmc.dts
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_enclustra_me=
rcury_bootmode_emmc.dtsi
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_enclustra_me=
rcury_bootmode_qspi.dtsi
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_enclustra_me=
rcury_bootmode_sdmmc.dtsi
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_enclustra_me=
rcury_pe1.dtsi
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_enclustra_me=
rcury_pe3.dtsi
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_enclustra_me=
rcury_st1.dtsi
 create mode 100644 arch/arm/boot/dts/mediatek/mt6582-alcatel-yarisxl.dts
 create mode 100644 arch/arm/boot/dts/nvidia/tegra124-xiaomi-mocha.dts
 delete mode 100644 arch/arm/boot/dts/qcom/qcom-msm8960-pins.dtsi
 create mode 100644 arch/arm/boot/dts/ti/omap/am335x-mba335x.dts
 create mode 100644 arch/arm/boot/dts/ti/omap/am335x-tqma335x.dtsi
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxm-tx9-pro.dts
 create mode 100644 arch/arm64/boot/dts/cix/sky1-pinfunc.h
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-=
peb-av-10-etml1010g3dra.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-=
peb-av-10-ph128800t006.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-=
peb-av-10.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-aipstz.h
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux=
-etml1010g3dra.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux=
-peb-av-10-etml1010g3dra.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux=
-peb-av-10-ph128800t006.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux=
-peb-av-10.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux=
-peb-av-10.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux=
-ph128800t006.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-prt8ml.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-skov-revc-hdmi.=
dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-skov-revc-jutou=
ch-jt101tm023.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx91-phyboard-segin.d=
ts
 create mode 100644 arch/arm64/boot/dts/freescale/imx91-phycore-som.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-phyboard-nash-jt=
ag.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-phyboard-nash-pw=
m-fan.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-19x19-verdin-evk=
.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-toradex-smarc-de=
v.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dt=
si
 create mode 100644 arch/arm64/boot/dts/intel/socfpga_agilex3_socdk.dts
 create mode 100644 arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_013b=
.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt6878-pinfunc.h
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4=
-pro-4e.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4=
-pro-8x.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4=
-pro-cn15.dtso
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4=
-pro-cn18.dtso
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4=
-pro-emmc.dtso
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4=
-pro-sd.dtso
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4=
-pro.dtsi
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8196-gce.h
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8370-grinn-genio-510-=
sbc.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8390-grinn-genio-700-=
sbc.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8390-grinn-genio-sbc.=
dtsi
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8390-grinn-genio-som.=
dtsi
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk-u=
fs.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra210-p3541-0000.dts
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra210-peripherals-opp.=
dtsi
 rename arch/arm64/boot/dts/qcom/{qcm2290.dtsi =3D> agatti.dtsi} (93%)
 rename arch/arm64/boot/dts/qcom/{x1e80100-pmics.dtsi =3D> hamoa-pmics.d=
tsi} (96%)
 rename arch/arm64/boot/dts/qcom/{x1e80100.dtsi =3D> hamoa.dtsi} (98%)
 rename arch/arm64/boot/dts/qcom/{sc7280.dtsi =3D> kodiak.dtsi} (97%)
 create mode 100644 arch/arm64/boot/dts/qcom/lemans-evk-camera.dtso
 rename arch/arm64/boot/dts/qcom/{qcs8300-pmics.dtsi =3D> monaco-pmics.d=
tsi} (98%)
 rename arch/arm64/boot/dts/qcom/{qcs8300.dtsi =3D> monaco.dtsi} (99%)
 create mode 100644 arch/arm64/boot/dts/qcom/msm8937-xiaomi-land.dts
 create mode 100644 arch/arm64/boot/dts/qcom/msm8937.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
 rename arch/arm64/boot/dts/qcom/{x1p42100.dtsi =3D> purwa.dtsi} (99%)
 create mode 100644 arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sdm850-huawei-matebook-e-20=
19.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sm8550-hdk-rear-camera-card=
.dtso
 rename arch/arm64/boot/dts/qcom/{sm6150.dtsi =3D> talos.dtsi} (92%)
 create mode 100644 arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14-l=
cd.dts
 create mode 100644 arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14.d=
tsi
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-fa=
n-argon40.dtso
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-rp=
i-display-2-5in.dtso
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-rp=
i-display-2-7in.dtso
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-rp=
i-display-2.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r8a78000-ironhide.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r8a78000.dtsi
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3566-tinker-board-3.d=
ts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3566-tinker-board-3.d=
tsi
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3566-tinker-board-3s.=
dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3568-9tripod-x3568-v4=
.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3568-easepi-r1.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3568-qnap-ts233.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3568-qnap-tsx33.dtsi
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3576-100ask-dshanpi-a=
1.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3576-nanopi-r76s.dts
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62l-main.dtsi
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62l-wakeup.dtsi
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62l.dtsi
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62l3-evm.dts
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62l3.dtsi
 create mode 100644 arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-ads2.dt=
so
 create mode 100644 arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-base.dts
 create mode 100644 arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-gbe1.dt=
so
 create mode 100644 arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-gpios.d=
tso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-rtc-rv8=
263.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am69-aquila-clover.dts
 create mode 100644 arch/arm64/boot/dts/ti/k3-am69-aquila-dev.dts
 create mode 100644 arch/arm64/boot/dts/ti/k3-am69-aquila.dtsi
 create mode 100644 arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
 create mode 100644 arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts
 create mode 100644 arch/riscv/boot/dts/starfive/jh7110-orangepi-rv.dts
 create mode 100644 arch/riscv/boot/dts/starfive/jh7110-starfive-visionf=
ive-2-lite-emmc.dts
 create mode 100644 arch/riscv/boot/dts/starfive/jh7110-starfive-visionf=
ive-2-lite.dts
 create mode 100644 arch/riscv/boot/dts/starfive/jh7110-starfive-visionf=
ive-2-lite.dtsi
 create mode 100644 include/dt-bindings/clock/google,gs101-acpm.h
 create mode 100644 include/dt-bindings/clock/qcom,ipq5424-nsscc.h
 create mode 100644 include/dt-bindings/power/nvidia,tegra264-bpmp.h
 create mode 100644 include/dt-bindings/reset/qcom,ipq5424-nsscc.h
