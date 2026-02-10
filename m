Received: from fout-b7-smtp.messagingengine.com (fout-b7-smtp.messagingengine.com [202.12.124.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C23832ABF6
	for <soc@lists.linux.dev>; Tue, 10 Feb 2026 17:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770743387; cv=none; b=ddCyJdstjV87JmMs56hscxuJWF1disUrvDL+h8g2qgwiDZW29/nH5mNXDHYJrQzDaH5p9TOq3DLXm8XGJnfLZ97aMRXXKVrPOYqSxRMMXqx5dFzSnLH3LunSobsVJtIOBZJO+pZ9s8MF6ans4LfyNhjWYEpmSZTlzDvZLL8lmXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770743387; c=relaxed/simple;
	bh=BwdWOOGBQ8jw8gRrasoQ9lm08QaU4R4/mgjv9DdKpfc=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=DNrp4QWG7uj0M6NiVMWoRG4ow4riAA1f94mOphFE2JzEnla4p43X1SITY2M+M99CCvjhn5jRUisomWwihYvT2MgbBYDrN5AieLX2ZBvtf3DitgwQtTHY5gowRdZsUZSO3701CyDjjdihXegQWAwhhZh7e4HSIYQxeRZRPpRYYmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=jlZPbAxb; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=fVpXCka9; arc=none smtp.client-ip=202.12.124.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="jlZPbAxb";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="fVpXCka9"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id CCFD11D0005E;
	Tue, 10 Feb 2026 12:09:41 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Tue, 10 Feb 2026 12:09:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1770743381;
	 x=1770829781; bh=v3RoFDzvZCN5n1iRUNYNe7no5Kb234W2QJDk9cM7Kwg=; b=
	jlZPbAxbk1LDKwbC2pgddUmS0jQ6jK5EbZWU6Vd4LQfxVDtFj/deA4HhYTNqOucw
	Z8hSGL4RXL0ge+fOfKYI+eA8NddFY3MbYadN9bs1+I0A1Qyk5fDlseqzyfrYZYq4
	p0GBsgP5yqwhrcoRQSZxAH4GbAA2GLagWLOjafdRdNkMpqDLl2iZ3aMPAgrk9df3
	iCJ94Wzcs7TTtDH+Mz/4eTnFQIqIQwkG4zy17+LfBDPNnVcBEX2qsRkWTKkfe1Sr
	NSvedcvBFlN8eiidbDxXKWT6cDg/ef+1DhWKUxgZoFzCo3AIxuHAGMYIOZDVrYat
	+Nz2T4762qSF6iLdwnffpA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1770743381; x=
	1770829781; bh=v3RoFDzvZCN5n1iRUNYNe7no5Kb234W2QJDk9cM7Kwg=; b=f
	VpXCka9YN2ePjqWMx39zkQdLImosfCHV41cZR77fCb135xuGVR3e+2KaPQ03Emvw
	oIF3g4sbxw0AFOHfABReBoJfNnb2uKS+DvAnWcGcvv3H1YgIA1/4TfJ684lptieR
	btKEugnVCdWhQGXMePyreGb2nLwunrIoS6y3NW7mpSQG4Jg74X4+G82IA+lR/Rth
	oiOL7M4JBaoKFnh74ju68QjNzmTM/sHLfJTamKyQWxQ6NLFm4saCru7jMrdGsBlR
	e+499rmos++AFbHGJe7EE3sZRhlK4m9VlnjwLTwHbrlPDdMDSppAUdckP4gZlD9X
	3Os87s11yGFEcKWBciYbw==
X-ME-Sender: <xms:VWaLaai5EDtBC20AGXF6TYTZvBsf2rdz0xxwJ90iIcgbs4iKEun9Nw>
    <xme:VWaLaV3QWt8XCcfwxxh4O11yZDVLFxDZm6a1ydi3jyWfDIQwmljWTLz-mDA5WIZ6A
    lV4XGDoxYYM64MeigXVbkP_4VjOtvkyrERerutclXAFrllno6szRrA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvtddtvdegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdejnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhepfeeugeekffevueegheeiheeiudekgeefhfffuedttedtffetleeuhfehteekkedv
    necuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpghhithhhuhgsrdgtohhmnecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhn
    uggsrdguvgdpnhgspghrtghpthhtohepgedpmhhouggvpehsmhhtphhouhhtpdhrtghpth
    htohepthhorhhvrghlughssehlihhnuhigqdhfohhunhgurghtihhonhdrohhrghdprhgt
    phhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvg
    grugdrohhrghdprhgtphhtthhopehsohgtsehlihhsthhsrdhlihhnuhigrdguvghvpdhr
    tghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:VWaLaUPIvoE_W0iSOou5XONbE90HlWcT-f8m8OsfasHGtWgqOfeq2Q>
    <xmx:VWaLaR1dGHlXDOeE6tHipJMUu93wSTfYKMT26eM0uRsouW85d_RxOg>
    <xmx:VWaLaTlG1hJBqSS1-V_oXBhNsku2hFbrSupqULGwLuic4_Kycaj_Uw>
    <xmx:VWaLaYVGgDguWnZ8AOTuzktni--JYs2LpoIgGx4f6-F9owAyRmtsbA>
    <xmx:VWaLabFEO_jXUxACTvDIWhm_LLSEqLwAx-zUDVd14BzLRfdvALFUfkiQ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 6AED7700065; Tue, 10 Feb 2026 12:09:41 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: AYfK9ZjhzOaF
Date: Tue, 10 Feb 2026 18:09:21 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
Cc: soc@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Message-Id: <a9a6b840-5a4f-4d27-8b34-da82657e5c9d@app.fastmail.com>
In-Reply-To: <a34ea40f-e0d3-459b-8233-9f87f6cd73e5@app.fastmail.com>
References: <a34ea40f-e0d3-459b-8233-9f87f6cd73e5@app.fastmail.com>
Subject: [GIT PULL 4/4] soc: devicetree updates for 7.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The following changes since commit f8f9c1f4d0c7a64600e2ca312dec824a0bc2f=
1da:

  Linux 6.19-rc3 (2025-12-28 13:24:26 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-d=
t-7.0

for you to fetch changes up to f51d34065de4f29fd237276a49cad06ac7356a55:

  Merge tag 'socfpga_dts_updates_for_v6.20_v3' of git://git.kernel.org/p=
ub/scm/linux/kernel/git/dinguyen/linux into soc/dt (2026-02-04 08:39:08 =
+0100)

----------------------------------------------------------------
soc: devicetree updates for 7.0

There are a handful of new SoCs this time, all of these are
more or less related to chips in a wider family:

 - SpacemiT Key Stone K3 is an 8-core risc-v chip, and the first
   widely available RVA23 implementation. Note that this is
   entirely unrelated with the similarly named Texas Instruments
   K3 chip family that follwed the TI Keystone2 SoC.

 - The Realtek Kent family of SoCs contains three chip models
   rtd1501s, rtd1861b and rtd1920s, and is related to their earlier
   Set-top-box and NAS products such as rtd1619, but is built
   on newer Arm Cortex-A78 cores.

 - The Qualcomm Milos family includes the Snapdragon 7s Gen 3
   (SM7635) mobile phone SoC built around Armv9 Kryo cores of the Arm
   Cortex-A720 generation. This one is used in the Fairphone Gen 6

 - Qualcomm Kaanapali is a new SoC based around eight high
   performance Oryon CPU cores

 - NXP i.MX8QP and i.MX952 are both feature reduced versions of
   chips we already support, i.e. the i.MX8QM and i.MX952, with
   fewer CPU cores and I/O interfaces.

As part of a cleanup, a number of SoC specific devicetree files got
removed because they did not have a single board using the .dtsi files
and they were never compile tested as a result: Samsung s3c6400,
ST spear320s, ST stm32mp21xc/stm32mp23xc/stm32mp25xc, Renesas
r8a779m0/r8a779m2/r8a779m4/r8a779m6/r8a779m7/r8a779m8/r8a779mb/
r9a07g044c1/r9a07g044l1/r9a07g054l1/r9a09g047e37, and TI am3703/am3715.
All of these could be restored easily if a new board gets merged.

Broadcom/Cavium/Marvell ThunderX2 gets removed along with its only
machine, as all remaining users are assumed to be using ACPI
based firmware.

A relatively small number of 43 boards get added this time, and
almost all of them for arm64. Aside from the reference boards for
the newly added SoCs, this includes:

 - Three server boards use 32-bit ASpeed BMCs

 - One more reference board for 32-bit Microchip LAN9668

 - 64-bit Arm single-board computers based on Amlogic s905y4,
   CIX sky1, NXP ls1028a/imx8mn/imx8mp/imx91/imx93/imx95,
   Qualcomm qcs6490/qrb2210 and Rockchip rk3568/rk3588s

 - Carrier board for SOMs using Intel agilex5, Marvell Armada 7020,
   NXP iMX8QP, Mediatek mt8370/mt8390 and rockchip rk3588

 - Two mobile phones using Snapdragon 845

 - A gaming device and a NAS box, both based on Rockchips rk356x

On top of the newly added boards and SoCs, there is a lot of
background activity going into cleanups, in particular towards
getting a warning-free dtc build, and the usual work on adding
support for more hardware on the previously added machines.

----------------------------------------------------------------
Abel Vesa (5):
      arm64: dts: qcom: x1e80100: Fix USB combo PHYs SS1 and SS2 ref clo=
cks
      arm64: dts: qcom: x1e80100: Add missing TCSR ref clock to the DP P=
HYs
      dt-bindings: watchdog: Document X1E80100 compatible
      arm64: dts: qcom: hamoa: Add the APSS watchdog
      arm64: dts: qcom: x1-el2: Enable the APSS watchdog

Abhash Kumar Jha (2):
      arm64: dts: ti: k3-j784s4-main.dtsi: Move c71_3 node to appropriat=
e order
      arm64: dts: ti: k3-j784s4-j742s2-main-common.dtsi: Refactor watchd=
og instances for j784s4

Abhinaba Rakshit (2):
      arm64: dts: qcom: lemans: add QCrypto node
      arm64: dts: qcom: monaco: add QCrypto node

Akhil P Oommen (2):
      arm64: dts: qcom: lemans-evk: Enable Adreno 663 GPU
      arm64: dts: qcom: lemans-ride: Enable Adreno 663 GPU

Alain Volmat (14):
      arm64: dts: st: add power-domains in all spi of stm32mp251.dtsi
      arm64: dts: st: add power-domains in all spi of stm32mp231.dtsi
      dt-bindings: i2c: st,stm32-i2c: add 'power-domains' property
      arm64: dts: st: add power-domains in all i2c of stm32mp251.dtsi
      arm64: dts: st: add power-domains in all i2c of stm32mp231.dtsi
      arm64: dts: st: enable i2c analog-filter in stm32mp251.dtsi
      arm64: dts: st: enable i2c analog-filter in stm32mp231.dtsi
      ARM: dts: stm32: add spi1 sleep state pinctrl on stm32mp157c-ev1
      dt-bindings: media: st: csi: add 'power-domains' property
      arm64: dts: st: add power-domain of csi in stm32mp251.dtsi
      arm64: dts: st: add power-domain of csi in stm32mp231.dtsi
      dt-bindings: media: st: dcmipp: add 'power-domains' property
      arm64: dts: st: add power-domain of dcmipp in stm32mp251.dtsi
      arm64: dts: st: add power-domain of dcmipp in stm32mp231.dtsi

Alex Bee (1):
      ARM: dts: rockchip: Add vdec node for RK3288

Alex Elder (2):
      riscv: dts: spacemit: Add a PCIe regulator
      riscv: dts: spacemit: PCIe and PHY-related updates

Alex Studer (1):
      riscv: dts: allwinner: d1: Add CPU thermal sensor and zone

Alex Wang (1):
      ARM: dts: aspeed: clemente: move hdd_led to its own gpio-leds group

Alexander Stein (15):
      arm64: dts: tqma8xxs: replace 0 with IMX_LPCG_CLK_0 for lpcg indic=
es
      arm64: dts: tqma8xxs-mb-smarc-2: replace 0 with IMX_LPCG_CLK_0 for=
 lpcg indices
      arm64: dts: tqmls1046a: Move BMAN/QMAN buffers to DRAM1 area
      arm64: dts: tqma8mpql-mba8mpxl: Adjust copyright text format
      arm64: dts: tqma8mpql-mba8mpxl: Fix Ethernet PHY IRQ support
      arm64: dts: tqma8mpql-mba8mpxl: Fix HDMI CEC pad control settings
      arm64: dts: tqma8mpql-mba8mpxl: Add HDMI audio output support
      arm64: dts: tqma8mpql-mba8mpxl: Configure IEEE 1588 event out sign=
al
      arm64: dts: tqma8mpql-mba8mp-ras314: Fix Ethernet PHY IRQ support
      arm64: dts: tqma8mpql-mba8mp-ras314: Fix HDMI CEC pad control sett=
ings
      arm64: dts: tqma8mpql-mba8mp-ras314: Add HDMI audio output support
      dt-bindings: power: fsl,imx-gpc: Document address-cells
      ARM: dts: imx6qdl: Add default GIC address cells
      arm64: dts: mb-smarc-2: Add PCIe support
      ARM: dts: tps65910: Add gpio & interrupt properties

Alexey Charkov (8):
      arm64: dts: rockchip: Add overlay for the PCIe slot on RK3576 EVB1
      arm64: dts: rockchip: enable UFS controller on FriendlyElec NanoPi=
 M5
      arm64: dts: rockchip: Use a readable audio card name on NanoPi M5
      arm64: dts: rockchip: Enable HDMI sound on FriendlyElec NanoPi M5
      arm64: dts: rockchip: Enable HDMI sound on Luckfox Core3576
      arm64: dts: rockchip: Enable HDMI sound on RK3576 EVB1
      arm64: dts: rockchip: Enable analog sound on RK3576 EVB1
      arm64: dts: rockchip: Explicitly request UFS reset pin on RK3576

Alexey Klimov (2):
      arm64: dts: qcom: sm8750: add memory node for adsp fastrpc
      arm64: dts: qcom: sm8750: add ADSP fastrpc-compute-cb nodes

Alexey Minnekhanov (1):
      arm64: dts: qcom: sdm630: Add missing MDSS reset

Andreas Kemnade (8):
      ARM: dts: imx: imx6sll: fix lcdif compatible
      ARM: dts: imx: imx6sll-kobo-clara2e: add regulator for EPD
      ARM: dts: imx: imx6sl: fix lcdif compatible
      ARM: dts: ti/omap: omap4-epson-embt2ws: add powerbutton
      ARM: dts: ti/omap: omap*: fix watchdog node names
      ARM: dts: imx: tolino-shine2: add tps65185
      ARM: dts: imx: e60k02: add tps65185
      arm64: dts: rockchip: Add TPS65185 for PineNote

Andrew Jeffery (6):
      ARM: dts: aspeed: Remove sdhci-drive-type property from AST2600 EVB
      ARM: dts: aspeed: Use specified wp-inverted property for AST2600 E=
VB
      ARM: dts: aspeed: Drop syscon compatible from EDAC in g6 dtsi
      ARM: dts: aspeed: g6: Drop unspecified aspeed,ast2600-udma node
      ARM: dts: aspeed: ast2600-evb: Tidy up A0 work-around for UART5
      ARM: dts: aspeed: g6: Drop clocks property from arm,armv7-timer

AngeloGioacchino Del Regno (25):
      arm64: dts: mediatek: mt8195: Add DPI1, HDMI, HDMI PHY/DDC nodes
      arm64: dts: mediatek: mt8188: Add DPI1, HDMI, HDMI PHY/DDC nodes
      arm64: dts: mediatek: mt8390-genio-common: Enable HDMI output
      arm64: dts: mediatek: mt8395-radxa-nio-12l: Enable HDMI output
      arm64: dts: mediatek: mt8173: Fix pinctrl node names and cleanup
      arm64: dts: mediatek: mt8183-evb: Fix dtbs_check warnings
      arm64: dts: mediatek: mt7981b-openwrt-one: Remove useless cells fr=
om flash@0
      arm64: dts: mediatek: mt8183-jacuzzi-pico6: Fix typo in pinmux node
      arm64: dts: mediatek: mt8183-pumpkin: Fix pinmux node names
      arm64: dts: mediatek: mt8173-elm: Fix bluetooth node name and reor=
der
      arm64: dts: mediatek: mt8173-elm: Fix dsi0 ports warning
      arm64: dts: mediatek: mt8173-elm: Remove regulators from thermal n=
ode
      arm64: dts: mediatek: mt8192-asurada: Remove unused clock-stretch-=
ns
      arm64: dts: mediatek: mt6795-xperia-m5: Add UHS pins for MMC1 and 2
      arm64: dts: mediatek: mt6331: Fix VCAM IO regulator name
      arm64: dts: mediatek: mt6795: Fix issues in SCPSYS node
      arm64: dts: mediatek: mt6795-xperia-m5: Rename PMIC leds node
      arm64: dts: mediatek: mt8173-evb: Add interrupts to DA9211 regulat=
or
      arm64: dts: mediatek: mt7986a: Change compatible for SafeXcel cryp=
to
      arm64: dts: mediatek: mt7981b-openwrt-one: Add address/size cells =
to eth
      arm64: dts: mediatek: mt8186-evb: Add vproc fixed regulator
      arm64: dts: mediatek: mt7988a: Fix PCI-Express T-PHY node address
      dt-bindings: arm: mediatek: audsys: Support mt8192-audsys variant
      arm64: dts: mediatek: mt8192: Rename mt8192-afe-pcm to audio-contr=
oller
      arm64: dts: marvell: Add SoC specific compatibles to SafeXcel cryp=
to

Anton D. Stavinskii (1):
      riscv: dts: sophgo: cv180x: fix USB dwc2 FIFO sizes

Arnd Bergmann (38):
      Merge tag 'arm-soc/for-6.19/devicetree-arm64' of https://github.co=
m/Broadcom/stblinux into soc/dt
      Merge tag 'aspeed-6.20-devicetree-0' of https://git.kernel.org/pub=
/scm/linux/kernel/git/bmc/linux into soc/dt
      Merge tag 'renesas-dts-for-v6.20-tag1' of git://git.kernel.org/pub=
/scm/linux/kernel/git/geert/renesas-devel into soc/dt
      Merge tag 'renesas-dt-bindings-for-v6.20-tag1' of git://git.kernel=
.org/pub/scm/linux/kernel/git/geert/renesas-devel into soc/dt
      Merge tag 'renesas-dts-for-v6.20-tag2' of git://git.kernel.org/pub=
/scm/linux/kernel/git/geert/renesas-devel into soc/dt
      Merge tag 'dt64-cleanup-6.20' of https://git.kernel.org/pub/scm/li=
nux/kernel/git/krzk/linux-dt into soc/dt
      Merge tag 'samsung-dt64-6.20' of https://git.kernel.org/pub/scm/li=
nux/kernel/git/krzk/linux into soc/dt
      Merge tag 'tegra-for-6.20-arm-dt' of git://git.kernel.org/pub/scm/=
linux/kernel/git/tegra/linux into soc/dt
      Merge tag 'tegra-for-6.20-arm64-dt' of git://git.kernel.org/pub/sc=
m/linux/kernel/git/tegra/linux into soc/dt
      Merge tag 'zynqmp-dt-for-6.20' of https://github.com/Xilinx/linux-=
xlnx into soc/dt
      Merge tag 'qcom-arm32-for-6.20' of https://git.kernel.org/pub/scm/=
linux/kernel/git/qcom/linux into soc/dt
      Merge tag 'qcom-arm64-for-6.20' of https://git.kernel.org/pub/scm/=
linux/kernel/git/qcom/linux into soc/dt
      Merge tag 'imx-dt-6.20' of https://git.kernel.org/pub/scm/linux/ke=
rnel/git/shawnguo/linux into soc/dt
      Merge tag 'tegra-for-6.20-dt-bindings-v2' of git://git.kernel.org/=
pub/scm/linux/kernel/git/tegra/linux into soc/dt
      Merge tag 'imx-bindings-6.20' of https://git.kernel.org/pub/scm/li=
nux/kernel/git/shawnguo/linux into soc/dt
      Merge tag 'imx-dt64-6.20' of https://git.kernel.org/pub/scm/linux/=
kernel/git/shawnguo/linux into soc/dt
      Merge tag 'stm32-dt-for-v6.20-1' of git://git.kernel.org/pub/scm/l=
inux/kernel/git/atorgue/stm32 into soc/dt
      Merge tag 'riscv-sophgo-dt-for-v6.20' of https://github.com/sophgo=
/linux into soc/dt
      Merge tag 'arm-soc/for-6.20/devicetree' of https://github.com/Broa=
dcom/stblinux into soc/dt
      Merge tag 'arm-soc/for-6.20/devicetree-arm64' of https://github.co=
m/Broadcom/stblinux into soc/dt
      Merge tag 'samsung-dt64-6.20-2' of https://git.kernel.org/pub/scm/=
linux/kernel/git/krzk/linux into soc/dt
      Merge tag 'spacemit-dt-for-6.20-1' of https://github.com/spacemit-=
com/linux into soc/dt
      Merge tag 'amlogic-arm64-dt-for-v6.20' of https://git.kernel.org/p=
ub/scm/linux/kernel/git/amlogic/linux into soc/dt
      Merge tag 'amlogic-arm-dt-for-v6.20' of https://git.kernel.org/pub=
/scm/linux/kernel/git/amlogic/linux into soc/dt
      Merge tag 'sunxi-dt-for-6.20' of https://git.kernel.org/pub/scm/li=
nux/kernel/git/sunxi/linux into soc/dt
      Merge tag 'omap-for-v6.20/dt-signed' of git://git.kernel.org/pub/s=
cm/linux/kernel/git/khilman/linux-omap into soc/dt
      Merge tag 'mtk-dts64-for-v6.20' of https://git.kernel.org/pub/scm/=
linux/kernel/git/mediatek/linux into soc/dt
      Merge tag 'mvebu-dt64-6.20-1' of git://git.kernel.org/pub/scm/linu=
x/kernel/git/gclement/mvebu into soc/dt
      Merge tag 'cix-dt-v6.20-rc1' of git://git.kernel.org/pub/scm/linux=
/kernel/git/peter.chen/cix into soc/dt
      Merge tag 'at91-dt-6.20' of https://git.kernel.org/pub/scm/linux/k=
ernel/git/at91/linux into soc/dt
      Merge tag 'cix-dt-binding-v6.20-rc1' of git://git.kernel.org/pub/s=
cm/linux/kernel/git/peter.chen/cix into soc/dt
      Merge tag 'v6.20-rockchip-dts32-2' of https://git.kernel.org/pub/s=
cm/linux/kernel/git/mmind/linux-rockchip into soc/dt
      Merge tag 'v6.20-rockchip-dts64-2' of https://git.kernel.org/pub/s=
cm/linux/kernel/git/mmind/linux-rockchip into soc/dt
      Merge tag 'qcom-arm64-for-6.20-2' of https://git.kernel.org/pub/sc=
m/linux/kernel/git/qcom/linux into soc/dt
      Merge tag 'qcom-arm32-for-6.20-2' of https://git.kernel.org/pub/sc=
m/linux/kernel/git/qcom/linux into soc/dt
      Merge tag 'riscv-dt-for-v6.20' of https://git.kernel.org/pub/scm/l=
inux/kernel/git/conor/linux into soc/dt
      Merge tag 'ti-k3-dt-for-v6.20' of https://git.kernel.org/pub/scm/l=
inux/kernel/git/ti/linux into soc/dt
      Merge tag 'socfpga_dts_updates_for_v6.20_v3' of git://git.kernel.o=
rg/pub/scm/linux/kernel/git/dinguyen/linux into soc/dt

Ashish Mhetre (2):
      dt-bindings: iommu: Add NVIDIA Tegra CMDQV support
      arm64: tegra: Add nodes for CMDQV

Barnab=C3=A1s Cz=C3=A9m=C3=A1n (3):
      dt-bindings: clock: gcc-msm8917: Add missing MDSS reset
      arm64: dts: qcom: msm8917: add reset for display subsystem
      arm64: dts: qcom: msm8937: add reset for display subsystem

Beleswar Padhi (2):
      arm64: dts: ti: k3-{j784s4-j742s2/j721s2}-mcu-wakeup: Add HSM M4F =
node
      arm64: dts: ti: k3-am62p-j722s-common-main: Add HSM M4F node

Biju Das (5):
      arm64: dts: renesas: r9a09g047: Add USB3 PHY/Host nodes
      arm64: dts: renesas: r9a09g047e57-smarc: Enable USB3HOST
      arm64: dts: renesas: r9a09g047: Add RSCI nodes
      arm64: dts: renesas: renesas-smarc2: Move aliases to board DTS
      arm64: dts: renesas: r9a09g047e57-smarc: Enable rsci{2,4,9} nodes

Bjorn Andersson (2):
      Merge branch '20260103-ufs_symbol_clk-v2-1-51828cc76236@oss.qualco=
mm.com' into arm64-for-6.20
      Merge branch '20251117-mdss-resets-msm8917-msm8937-v2-1-a7e9bbdaac=
96@mainlining.org' into HEAD

Casey Connolly (3):
      arm64: dts: qcom: sdm845-oneplus: Don't mark ts supply boot-on
      arm64: dts: qcom: sdm845-oneplus: Don't keep panel regulator alway=
s on
      arm64: dts: qcom: sdm845-oneplus: Mark l14a regulator as boot-on

Chancel Liu (7):
      arm64: dts: imx93-14x14-evk: Add bt-sco sound card support
      arm64: dts: imx93-14x14-evk: Add audio XCVR sound card
      arm64: dts: imx91-11x11-evk: Refine label and node name of WM8962
      arm64: dts: imx91-11x11-evk: Add bt-sco sound card support
      arm64: dts: imx91-11x11-evk: Add WM8962 sound card support
      arm64: dts: imx91-11x11-evk: Add PDM microphone sound card support
      arm64: dts: imx91-11x11-evk: Add audio XCVR sound card support

Charan Pedumuru (1):
      dt-bindings: mtd: nvidia,tegra20-nand: convert to DT schema

Chen-Yu Tsai (6):
      arm64: dts: allwinner: sun55i: Add SPI controllers
      arm64: dts: allwinner: t527: orangepi-4a: Enable SPI-NOR flash
      ARM: dts: allwinner: sun5i-a13-utoo-p66: delete "power-gpios" prop=
erty
      arm64: dts: mediatek: mt8188-geralt: drop firmware-name from first=
 SCP core
      arm64: dts: mediatek: mt8183-kukui: Clean up IT6505 regulator supp=
ly
      ARM: dts: allwinner: Replace status "failed" with "fail"

Chris Morgan (4):
      arm64: dts: rockchip: Add HDMI to Gameforce Ace
      dt-bindings: arm: rockchip: Add Anbernic RG-DS
      dt-bindings: input: touchscreen: goodix: Add "panel" property
      arm64: dts: rockchip: Add Anbernic RG-DS

Chukun Pan (5):
      arm64: dts: rockchip: remove rtc regulator for ArmSoM Sige5
      arm64: dts: rockchip: fix hp-det pin for ArmSoM Sige5
      arm64: dts: rockchip: enable saradc for ArmSoM Sige5
      arm64: dts: rockchip: Enable PCIe for ArmSoM Sige1
      riscv: dts: spacemit: Disable ETH PHY sleep mode for OrangePi

Claudiu Beznea (3):
      arm64: dts: renesas: r9a08g045: Add PCIe node
      arm64: dts: renesas: rzg3s-smarc-som: Add PCIe reference clock
      arm64: dts: renesas: rzg3s-smarc: Enable PCIe

Cl=C3=A9ment Le Goffic (2):
      arm64: dts: st: add LPDDR channel to stm32mp257f-dk board
      arm64: dts: st: add DDR channel to stm32mp257f-ev1 board

Conor Dooley (3):
      arm64: dts: xilinx: add soc-specific spi compatibles for zynqmp/ve=
rsal-net
      riscv: dts: microchip: fix mailbox description
      riscv: dts: microchip: convert clock and reset to use syscon

Cosmin Tanislav (15):
      arm64: dts: renesas: rzt2h-n2h-evk: Add note about SD1 1.8V modes
      arm64: dts: renesas: r9a09g077: Add SPI nodes
      arm64: dts: renesas: r9a09g087: Add SPI nodes
      arm64: dts: renesas: r9a09g077: Add ICU support
      arm64: dts: renesas: r9a09g087: Add ICU support
      arm64: dts: renesas: r9a09g077: Add DMAC support
      arm64: dts: renesas: r9a09g087: Add DMAC support
      arm64: dts: renesas: r9a09g077: Add OPP table
      arm64: dts: renesas: r9a09g087: Add OPP table
      arm64: dts: renesas: r9a09g077: Add TSU and thermal zones support
      arm64: dts: renesas: r9a09g087: Add TSU and thermal zones support
      arm64: dts: renesas: r9a09g077: Add GPIO IRQ support
      arm64: dts: renesas: r9a09g087: Add GPIO IRQ support
      arm64: dts: renesas: r9a09g077m44-rzt2h-evk: Add GPIO keys
      arm64: dts: renesas: r9a09g087m44-rzn2h-evk: Add GPIO keys

Cosmo Chou (7):
      ARM: dts: aspeed: bletchley: remove WDTRST1 assertion from wdt1
      ARM: dts: aspeed: bletchley: Use generic node names
      ARM: dts: aspeed: bletchley: Fix SPI GPIO property names
      ARM: dts: aspeed: bletchley: Remove unused pca9539 properties
      ARM: dts: aspeed: bletchley: Remove unused i2c13 property
      ARM: dts: aspeed: bletchley: Fix ADC vref property names
      ARM: dts: aspeed: bletchley: Remove try-power-role from connectors

Dale Whinham (1):
      arm64: dts: qcom: Add support for X1-based Surface Pro 11

Daniel Baluta (1):
      arm64: dts: imx93-11x11-frdm: Add MQS audio support

Daniel Hsu (1):
      ARM: dts: aspeed: harma: add fanboard presence sgpio

Daniel Schultz (3):
      arm64: dts: ti: k3-am62-phycore-som: Add bootphase tag to cpsw_mac=
_syscon
      arm64: dts: ti: k3-am62a-phycore-som: Add bootphase tag to cpsw_ma=
c_syscon
      arm64: dts: imx8mm: Add label to thermal-zones

David Heidelberg (8):
      arm64: dts: qcom: sdm845-oneplus: Update firmware paths
      arm64: dts: qcom: sdm845-axolotl: Update firmware paths
      arm64: dts: qcom: sdm845-samsung-starqltechn: Update firmware paths
      arm64: dts: qcom: sdm845-xiaomi-polaris: Update firmware paths
      dt-bindings: arm: qcom: Add Pixel 3 and 3 XL
      arm64: dts: qcom: Add support for Pixel 3 and Pixel 3 XL
      arm64: dts: qcom: sdm845-oneplus-enchilada: Sort nodes alphabetica=
lly
      arm64: dts: qcom: oneplus-enchilada: Specify i2c4 clock frequency

David Petry (1):
      arm64: dts: rockchip: Enable second HDMI output on CM3588

Detlev Casanova (2):
      arm64: dts: rockchip: Add the vdpu381 Video Decoders on RK3588
      arm64: dts: rockchip: Add the vdpu383 Video Decoder on rk3576

Dinh Nguyen (4):
      dt-bindings: arm: altera: combine Intel's SoCFPGA into altera.yaml
      dt-bindings: altera: document syscon as fallback for sys-mgr
      ARM: dts: socfpga: add #address-cells and #size-cells for sram node
      ARM: dts: socfpga: fix dtbs_check warning for fpga-region

Diogo Ivo (3):
      arm64: tegra: smaug: Enable DisplayPort via USB-C port
      arm64: tegra: smaug: Complete and enable tegra-udc node
      arm64: tegra: smaug: Add usb-role-switch support

Dmitry Baryshkov (11):
      arm64: dts: qcom: sdm630: fix gpu_speed_bin size
      arm64: dts: qcom: sm8150-hdk,mtp: specify ZAP firmware name
      arm64: dts: qcom: sm8250-hdk: specify ZAP firmware name
      arm64: dts: qcom: x1e80100-medion-sprchrgd-14-s1: correct firmware=
 paths
      arm64: dts: qcom: qrb4210-rb2: Fix UART3 wakeup IRQ storm
      arm64: dts: qcom: sdm845-db845c: drop CS from SPIO0
      arm64: dts: qcom: sdm845-db845c: specify power for WiFi CH1
      arm64: dts: qcom: sm8150: add uart13
      arm64: dts: qcom: agatti: enable FastRPC on the ADSP
      arm64: dts: qcom: switch to RPMPD_* indices
      ARM: dts: qcom: switch to RPMPD_* indices

Dylan Van Assche (3):
      arm64: dts: qcom: sdm845-oneplus: add ath10k calibration variant
      arm64: dts: qcom: sdm845-xiaomi-beryllium: Add ath10k calibration =
variant
      arm64: dts: qcom: sdm845-shift-axolotl: Add ath10k calibration var=
iant

E Shattow (3):
      dt-bindings: riscv: starfive: Append JH-7110 SoC compatible to Vis=
ionFive 2 Lite board
      riscv: dts: starfive: Append JH-7110 SoC compatible to VisionFive =
2 Lite board
      riscv: dts: starfive: Append JH-7110 SoC compatible to VisionFive =
2 Lite eMMC board

Elad Nachman (2):
      arm64: dts: a7k: add COM Express boards
      MAINTAINERS: Add Falcon DB

Encrow Thorne (1):
      riscv: dts: spacemit: add reset property

Eric Neulight (1):
      arm64: dts: amlogic: meson-sm1-odroid: Eliminate Odroid HC4 power =
glitches during boot.

Erikas Bitovtas (2):
      arm64: dts: qcom: msm8939-asus-z00t: add battery
      arm64: dts: qcom: msm8939-asus-z00t: add hall sensor

FUKAUMI Naoki (8):
      arm64: dts: rockchip: Add EEPROMs for Radxa ROCK 4 boards
      arm64: dts: rockchip: Add EEPROMs for Radxa rk35xx boards
      dt-bindings: arm: rockchip: fix description for Radxa CM3I
      dt-bindings: arm: rockchip: fix description for Radxa CM5
      arm64: dts: rockchip: Make eeprom read-only for Radxa ROCK 3C/5A/5C
      dt-bindings: arm: rockchip: Add Radxa CM3J on RPi CM4 IO Board
      arm64: dts: rockchip: Add Radxa CM3J
      arm64: dts: rockchip: Add Radxa CM3J on RPi CM4 IO Board

Fabian Pflug (2):
      dt-bindings: arm: fsl: add i.MX93 11x11 FRDM board
      arm64: dts: freescale: add support for NXP i.MX93 FRDM

Fedor Ross (1):
      arm64: dts: imx8mn: Add ifm VHIP4 EvalBoard v1 and v2

Francesco Dolcini (11):
      arm64: dts: ti: k3-am69-aquila-dev: Fix USB-C Sink PDO
      arm64: dts: ti: k3-am69-aquila-clover: Fix USB-C Sink PDO
      arm64: dts: ti: am62p-verdin: Fix SD regulator startup delay
      arm64: dts: freescale: imx8-apalis: Add ethernet alias
      arm64: dts: freescale: imx8mp-verdin: Remove obsolete TODO comments
      arm64: dts: freescale: imx8mp-verdin: enable hdmi_pai device
      arm64: dts: freescale: imx8mp-toradex-smarc: enable hdmi_pai device
      arm64: dts: imx8qm: Add CPU cluster labels
      arm64: dts: freescale: Add NXP i.MX8QP SoC dtsi
      arm64: dts: freescale: Add Apalis iMX8QP
      dt-bindings: arm: fsl: Add Apalis iMX8QP

Francesco Valla (2):
      arm64: dts: imx93-11x11-frdm: enable additional devices
      arm64: dts: imx91-11x11-frdm: fix CAN transceiver gpio

Frank Li (12):
      ARM: dts: lpc32xx: remove usb bus and elevate all children nodes
      ARM: dts: lpc3250-ea3250: add key- prefix for gpio-keys
      ARM: dts: lpc3250-phy3250: rename nodename at@0 to eeprom@0
      ARM: dts: lpc3250-phy3250: replace deprecated at25 properties with=
 new ones
      arm64: dts: imx8qm: add ddr perf device node
      arm64: dts: mba8xx: replace 0 with IMX_LPCG_CLK_0 for lpcg indices
      arm64: dts: imx8qxp-mek: Add sensors under i2c1 bus
      arm64: dts: imx8mp-evk: add camera ov5640 and related nodes
      arm64: dts: imx91: Add thermal-sensor and thermal-zone support
      ARM: dts: imx6qdl: add '#address-cells' and '#size-cells' for gpmi=
-nand
      ARM: dts: imx6sx: update gpmi #size-cells to 0
      ARM: dts: imx: move nand related property under nand@0

Frank Wunderlich (2):
      arm64: dts: mediatek: mt7986: add dtbs with applied overlays for b=
pi-r3
      arm64: dts: mediatek: mt7988: add dtbs with applied overlays for b=
pi-r4 (pro)

Fred Chen (2):
      ARM: dts: aspeed: santabarbara: Add swb IO expander and gpio line =
names
      ARM: dts: aspeed: santabarbara: Enable ipmb device for OCP debug c=
ard

Gary Bisson (5):
      dt-bindings: vendor-prefixes: Add Ezurio LLC
      dt-bindings: arm: mediatek: Add Ezurio Tungsten entries
      arm64: dts: mediatek: mt8188: switch mmc nodes to interrupts-exten=
ded
      arm64: dts: mediatek: add device tree for Tungsten 510 board
      arm64: dts: mediatek: add device tree for Tungsten 700 board

Gary Yang (2):
      dt-bindings: arm: cix: add OrangePi 6 Plus board
      arm64: dts: cix: Add OrangePi 6 Plus board support

Gaurav Kohli (6):
      arm64: dts: qcom: qcs8300: Enable TSENS support for QCS8300 SoC
      arm64: dts: qcom: lemans: Add GPU cooling
      arm64: dts: qcom: monaco: Enable cpufreq cooling devices
      arm64: dts: qcom: lemans: Enable cpufreq cooling devices
      arm64: dts: qcom: monaco-evk: Enable AMC6821 fan controller
      arm64: dts: qcom: qcs8300: Add GPU cooling

Geert Uytterhoeven (4):
      arm64: dts: renesas: r9a09g047e57-smarc: Remove duplicate SW_LCD_EN
      ARM: dts: renesas: r9a06g032: Add Ethernet switch interrupts
      riscv: dts: renesas: r9a07g043f: Move interrupt-parent to top node
      Merge tag 'renesas-r9a09g077-dt-binding-defs-tag6' into renesas-dt=
s-for-v6.20

Georg Gottleuber (6):
      dt-bindings: vendor-prefixes: Add prefix for TUXEDO Computers GmbH
      dt-bindings: arm: qcom: Add TUXEDO Computers device
      dt-bindings: vendor-prefixes: Add Medion AG
      dt-bindings: arm: qcom: Add Medion SPRCHRGD device
      arm64: dts: qcom: Add dts for Medion SPRCHRGD 14 S1
      firmware: qcom: scm: QSEECOM on Medion SPRCHRGD 14 S1

George Moussalem (1):
      arm64: dts: qcom: ipq5018: Remove tsens v1 fallback compatible

Gregor Herburger (1):
      arm64: dts: ls1028a: Add mbls1028a and mbls1028a-ind devicetrees

Guodong Xu (15):
      dt-bindings: riscv: update ratified version of h, svinval, svnapot=
, svpbmt
      dt-bindings: riscv: Add B ISA extension description
      dt-bindings: riscv: Add descriptions for Za64rs, Ziccamoa, Ziccif,=
 and Zicclsm
      dt-bindings: riscv: Add Ssccptr, Sscounterenw, Sstvala, Sstvecd, S=
su64xl
      dt-bindings: riscv: Add Sha and its comprised extensions
      riscv: dts: anlogic: dr1v90: Add "b" ISA extension
      riscv: dts: sophgo: sg2044: Add "b" ISA extension
      riscv: dts: spacemit: k1: Add "b" ISA extension
      dt-bindings: riscv: add SpacemiT X100 CPU compatible
      dt-bindings: timer: add SpacemiT K3 CLINT
      dt-bindings: interrupt-controller: add SpacemiT K3 APLIC
      dt-bindings: interrupt-controller: add SpacemiT K3 IMSIC
      dt-bindings: riscv: spacemit: add K3 and Pico-ITX board bindings
      riscv: dts: spacemit: add initial support for K3 SoC
      riscv: dts: spacemit: add K3 Pico-ITX board support

Haibo Chen (6):
      arm64: dts: imx943-evk: add flexcan support
      arm64: dts: imx93-9x9-qsb: add CAN support overlay file
      arm64: dts: imx94: add xspi device node
      arm64: dts: imx94: add mt35xu512aba spi nor support
      arm64: dts: imx952-evk: Change the usdhc1_200mhz drive strength to=
 DSE4
      arm64: dts: imx952-evk: Add flexcan support

Harini T (1):
      dt-bindings: watchdog: xlnx,versal-wwdt: Add optional power-domain=
s property

Harshal Dev (2):
      arm64: dts: qcom: x1e80100: Add crypto engine
      arm64: dts: qcom: x1e80100: add TRNG node

Hector Martin (3):
      arm64: dts: apple: t8103: Mark ATC USB AON domains as always-on
      arm64: dts: apple: t8103: Add nodes for integrated USB Type-C ports
      arm64: dts: apple: t8112: Add nodes for integrated USB Type-C ports

Heiko Stuebner (15):
      arm64: dts: rockchip: add gmac reset property to rk3368
      arm64: dts: rockchip: add mdio subnode to gmac on rk3368
      arm64: dts: rockchip: Correctly describe the ethernet phy on rk336=
8-lion
      arm64: dts: rockchip: enable NPU on rk3588-tiger
      arm64: dts: rockchip: enable NPU on rk3588-jaguar
      arm64: dts: rockchip: Move SoC include to individual QNAP TSx33 bo=
ards
      arm64: dts: rockchip: Fix the common combophy + SATA on QNAP TSx33=
 devices
      arm64: dts: rockchip: Move copy-key to TSx33 board files
      dt-bindings: arm: rockchip: add TS133 to RK356x-based QNAP NAS dev=
ices
      arm64: dts: rockchip: Add TS133 variant of the QNAP NAS series
      arm64: dts: rockchip: Use phandle for i2c_lvds_blc on rk3368-lion =
haikou
      arm64: dts: rockchip: Add HDMI node to RK3368
      arm64: dts: rockchip: Enable HDMI output on RK3368-Lion-Haikou
      arm64: dts: rockchip: Enable pwm1 on rk3368-lion-haikou
      arm64: dts: rockchip: Add the Video-Demo overlay for Lion Haikou

Herve Codina (Schneider Electric) (3):
      dt-bindings: soc: renesas: Document RZ/N1 GPIO Interrupt Multiplex=
er
      ARM: dts: r9a06g032: Add GPIO controllers
      ARM: dts: r9a06g032: Add support for GPIO interrupts

Hongyang Zhao (2):
      dt-bindings: arm: qcom: Add Thundercomm RUBIK Pi 3
      arm64: dts: qcom: Add qcs6490-rubikpi3 board dts

Horatiu Vultur (2):
      dt-bindings: arm: at91: add lan966 pcb8385 board
      ARM: dts: Add support for pcb8385

Inochi Amaoto (2):
      riscv: dts: sophgo: Move PLIC and CLINT node into CPU dtsi
      riscv: dts: sophgo: fix the node order of SG2042 peripheral

Jacky Bai (1):
      arm64: dts: imx8dxl-ss-ddr: Add DB (system interconnects) pmu supp=
ort for i.MX8DXL

Jagadeesh Kona (2):
      dt-bindings: mailbox: qcom: Document SM8750 CPUCP mailbox controll=
er
      arm64: dts: qcom: SM8750: Enable CPUFreq support

Janne Grunau (7):
      arm64: dts: apple: Add chassis-type property for all Macbooks
      arm64: dts: apple: Add chassis-type property for Apple desktop dev=
ices
      arm64: dts: apple: Add chassis-type property for Mac Pro
      arm64: dts: apple: Add chassis-type property for Apple iMacs
      arm64: dts: apple: t8112-j473: Keep the HDMI port powered on
      arm64: dts: apple: t8103: Add ps_pmp dependency to ps_gfx
      arm64: dts: apple: t60xx: Add nodes for integrated USB Type-C ports

Javier Martinez Canillas (3):
      riscv: dts: spacemit: Enable i2c8 adapter for Milk-V Jupiter
      riscv: dts: spacemit: Define fixed regulators for Milk-V Jupiter
      riscv: dts: spacemit: Define the P1 PMIC regulators for Milk-V Jup=
iter

Jens Glathe (2):
      arm64: dts: qcom: x1p42100-lenovo-thinkbook-16: force usb2-only mo=
de on usb_1_ss2_dwc3
      arm64: dts: qcom: x1p42100-lenovo-thinkbook-16: add hdmi bridge wi=
th enable pin

Jerome Brunet (9):
      arm64: dts: amlogic: drop useless assigned-clock-parents
      arm64: dts: amlogic: s4: assign mmc b clock to 24MHz
      arm64: dts: amlogic: s4: fix mmc clock assignment
      arm64: dts: amlogic: c3: assign the MMC signal clocks
      arm64: dts: amlogic: a1: align the mmc clock setup
      arm64: dts: amlogic: axg: assign the MMC signal clocks
      arm64: dts: amlogic: gx: assign the MMC signal clocks
      arm64: dts: amlogic: g12: assign the MMC B and C signal clocks
      arm64: dts: amlogic: g12: assign the MMC A signal clock

Jianping Li (1):
      arm64: dts: qcom: kodiak: Add memory region for audiopd

Jie Gan (3):
      arm64: dts: qcom: monaco: Add CTCU and ETR nodes
      arm64: dts: qcom: lemans: enable static TPDM
      arm64: qcom: dts: sm8750: add coresight nodes

Jingyi Wang (7):
      dt-bindings: arm: qcom: Document Kaanapali SoC and its reference b=
oards
      arm64: dts: qcom: kaanapali: Add header file for IPCC physical cli=
ent IDs
      arm64: dts: qcom: Introduce Kaanapali SoC
      arm64: dts: qcom: kaanapali: Add base MTP board
      arm64: dts: qcom: kaanapali: Add base QRD board
      dt-bindings: mailbox: qcom: Add CPUCP mailbox controller bindings =
for Kaanapali
      dt-bindings: mailbox: qcom: Add IPCC support for Kaanapali and Gly=
mur Platforms

Jingzhou Zhu (2):
      arm64: dts: qcom: sdm850-huawei-matebook-e-2019: Remove duplicate =
reserved-memroy nodes
      arm64: dts: qcom: sdm850-huawei-matebook-e-2019: Correct ipa_fw_me=
m for the driver to load successfully

Johan Jonker (1):
      ARM: dts: rockchip: rk3036: remove mshc aliases

Jon Hunter (1):
      dt-bindings: tegra: pmc: Update aotag as an optional aperture

Jonathan Marek (1):
      arm64: dts: qcom: x1e: bus is 40-bits (fix 64GB models)

Joseph Guo (2):
      dt-bindings: arm: fsl: Add FRDM-IMX91 board
      arm64: dts: freescale: Add FRDM-IMX91 basic support

Joseph Kogut (3):
      dt-bindings: arm: rockchip: Add Radxa CM5 IO board
      arm64: dts: rockchip: Add rk3588 based Radxa CM5
      arm64: dts: rockchip: Add support for CM5 IO carrier

Josua Mayer (1):
      ARM: dts: imx50-kobo-aura: add epd pmic description

Jun Yan (1):
      arm64: dts: rockchip: Do not enable hdmi_sound node on Pinebook Pro

J=C3=A9r=C3=B4me de Bretagne (1):
      dt-bindings: arm: qcom: Document Microsoft Surface Pro 11

Khairul Anuar Romli (2):
      arm64: dts: socfpga: agilex5: Add dma-coherent property
      arm64: dts: intel: agilex5: Add simple-bus node on top of dma cont=
roller node

Khalid Faisal Ansari (3):
      arm64: dts: qcom: lemans-evk: Enable TPM (ST33)
      arm64: dts: qcom: monaco-evk: Enable TPM (ST33)
      arm64: dts: qcom: hamoa-iot-evk: Enable TPM (ST33) on SPI11

Kimi Chen (1):
      ARM: dts: aspeed: clemente: add gpio line name to io expander

Konrad Dybcio (3):
      arm64: dts: qcom: qcs615: Drop IPA interconnects
      arm64: dts: qcom: agatti: Add CX_MEM/DBGC GPU regions
      arm64: dts: qcom: sm6115: Add CX_MEM/DBGC GPU regions

Kory Maincent (TI.com) (1):
      ARM: dts: Drop am335x-base0033 devicetree

Krishna Chaitanya Chundru (1):
      arm64: dts: qcom: qcs6490-rb3gen2: Add TC9563 PCIe switch node

Krishna Kurapati (3):
      arm64: dts: qcom: hamoa-iot-evk: Add vbus regulator support for Ty=
pe-A ports
      arm64: dts: qcom: lemans-evk: Add OTG support for primary USB cont=
roller
      arm64: dts: qcom: sm8750-mtp: Add eusb2 repeater tuning parameters

Krzysztof Kozlowski (43):
      arm64: dts: toshiba: tmpv7708: Align node names with DT bindings
      arm64: dts: nuvoton: npcm845: Minor whitespace cleanup
      arm64: dts: cix: Use lowercase hex
      arm64: dts: freescale: Use hyphen in node names
      arm64: dts: freescale: Minor whitespace cleanup
      arm64: dts: freescale: Use lowercase hex
      arm64: dts: arm: Use hyphen in node names
      arm64: dts: qcom: Minor whitespace cleanup
      arm64: dts: qcom: Use hyphen in node names
      arm64: dts: qcom: Use lowercase hex
      arm64: dts: qcom: hamoa: Add sound DAI prefixes for DP
      arm64: dts: qcom: x1e78100-t14s: Add audio playback over DisplayPo=
rt
      arm64: dts: qcom: sm8750: Fix BAM DMA probing
      arm64: dts: ti: Minor whitespace cleanup
      arm64: dts: ti: Use lowercase hex
      arm64: dts: qcom: sm8750: Add Iris VPU v3.5
      arm64: dts: qcom: sm8750-mtp: Enable Iris codec
      arm64: dts: qcom: sm8750-qrd: Enable Iris codec
      arm64: dts: airoha: Use hyphen in node names
      arm64: dts: amlogic: Use hyphen in node names
      arm64: dts: amlogic: Use lowercase hex
      arm64: dts: qcom: ipq5018: Correct USB DWC3 wrapper interrupts
      arm64: dts: qcom: ipq9574: Complete USB DWC3 wrapper interrupts
      arm64: dts: renesas: Use hyphens in node names
      arm64: dts: renesas: Use lowercase hex
      arm64: dts: qcom: sm6125-ginkgo: Fix missing msm-id subtype
      arm64: tegra: Drop unneeded status=3Dokay on Tegra186
      arm64: tegra: Drop unneeded status=3Dokay on Tegra194
      arm64: tegra: Drop unneeded status=3Dokay on Tegra234
      arm64: tegra: Drop unneeded status=3Dokay on Tegra264
      arm64: tegra: Correct CPU compatibles on Tegra264
      Merge branch 'for-v6.20/dt-bindings-clk' into next/dt64
      arm64: dts: st: Use hyphen in node names
      arm64: dts: st: Minor whitespace cleanup
      Merge tag 'juno-updates-7.0' of https://git.kernel.org/pub/scm/lin=
ux/kernel/git/sudeep.holla/linux into soc/dt
      Merge tag 'v6.20-rockchip-dts32-1' of https://git.kernel.org/pub/s=
cm/linux/kernel/git/mmind/linux-rockchip into soc/dt
      Merge tag 'v6.20-rockchip-dts64-1' of https://git.kernel.org/pub/s=
cm/linux/kernel/git/mmind/linux-rockchip into soc/dt
      Merge tag 'nuvoton-arm64-6.20-devicetree-0' of https://git.kernel.=
org/pub/scm/linux/kernel/git/bmc/linux into soc/dt
      Merge tag 'aspeed-6.20-devicetree-1' of https://git.kernel.org/pub=
/scm/linux/kernel/git/bmc/linux into soc/dt
      Merge tag 'lpc32xx-dt-for-6.20' of https://github.com/vzapolskiy/l=
inux-lpc32xx into soc/dt
      Merge tag 'apple-soc-dt-6.20' of https://git.kernel.org/pub/scm/li=
nux/kernel/git/sven/linux into soc/dt
      ARM: dts: nuvoton: Minor whitespace cleanup
      arm64: dts: altera: Use lowercase hex

Kuldeep Singh (1):
      ARM: dts: lpc32xx: Update spi clock properties

Lad Prabhakar (26):
      dt-bindings: clock: renesas,r9a09g077/87: Add XSPI0/1 IDs
      arm64: dts: renesas: r9a09g057: Add FCPV and VSPD nodes
      arm64: dts: renesas: r9a09g057: Add DU and DSI nodes
      arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Enable DU and DSI
      arm64: dts: renesas: r9a09g056: Add FCPV and VSPD nodes
      arm64: dts: renesas: r9a09g056: Add DU and DSI nodes
      arm64: dts: renesas: r9a09g056n48-rzv2n-evk: Enable DU and DSI
      arm64: dts: renesas: r9a09g057: Add USB3 PHY/Host nodes
      arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Enable USB3.0 PHYs an=
d xHCI controllers
      arm64: dts: renesas: r9a09g056: Add USB3 PHY/Host nodes
      arm64: dts: renesas: r9a09g056n48-rzv2n-evk: Enable USB3.0 PHY and=
 xHCI controller
      arm64: dts: renesas: r9a09g056: Add ICU node
      arm64: dts: renesas: r9a09g056: Add DMAC nodes
      arm64: dts: renesas: r9a09g056: Add RSPI nodes
      arm64: dts: renesas: r9a09g056n48-rzv2n-evk: Add NMI wakeup button=
 support
      dt-bindings: clock: renesas,r9a09g077/87: Add PCLKCAN ID
      arm64: dts: renesas: r9a09g056: Add RSCI nodes
      arm64: dts: renesas: r9a09g057: Add RSCI nodes
      arm64: dts: renesas: r9a09g077: Add CANFD node
      arm64: dts: renesas: r9a09g087: Add CANFD node
      arm64: dts: renesas: r9a09g077m44-rzt2h-evk: Enable CANFD
      arm64: dts: renesas: r9a09g087m44-rzn2h-evk: Enable CANFD
      arm64: dts: renesas: r9a09g056: Add CANFD node
      arm64: dts: renesas: r9a09g057: Add CANFD node
      arm64: dts: renesas: rzt2h-n2h-evk-common: Use GPIO for SD0 write =
protect
      arm64: dts: renesas: rzt2h-rzn2h-evk: Reorder ADC nodes

Laurent Pinchart (2):
      dt-bindings: arm: rockchip: Add Orange Pi CM5 Base
      arm64: dts: rockchip: Add rk3588s-orangepi-cm5-base device tree

Laurentiu Mihalcea (1):
      arm64: dts: imx8ulp: add sim lpav node

Lei Xu (2):
      dt-bindings: arm: fsl: Add compatible for i.MX95 15x15 FRDM board
      arm64: dts: freescale: imx95: Add support for i.MX95 15x15 FRDM bo=
ard

Leo Wang (1):
      ARM: dts: aspeed: clemente: Add EEPROMs for boot and data drive FR=
Us

Loic Poulain (3):
      arm64: dts: qcom: qcm2290: Add pin configuration for mclks
      arm64: dts: qcom: qrb2210-rb1: Add PM8008 node
      arm64: dts: qcom: qrb2210-rb1: Add overlay for vision mezzanine

Louis-Alexis Eyraud (4):
      arm64: dts: mediatek: mt8390-genio-common: Add HDMI sound output s=
upport
      arm64: dts: mediatek: mt8395-radxa-nio-12l: Add HDMI sound output =
support
      arm64: dts: mediatek: mt8395-genio-common: Enable HDMI output
      arm64: dts: mediatek: mt8395-genio-common: Add HDMI sound output s=
upport

Luca Weiss (18):
      arm64: dts: qcom: sm7225-fairphone-fp4: Add camera EEPROMs
      arm64: dts: qcom: sm7225-fairphone-fp4: Add camera fixed regulators
      arm64: dts: qcom: sm7225-fairphone-fp4: Enable CCI pull-up
      ARM: dts: qcom: msm8974-hammerhead: Update model property
      dt-bindings: arm: qcom: Add Milos and The Fairphone (Gen. 6)
      arm64: dts: qcom: pm8550vs: Disable different PMIC SIDs by default
      arm64: dts: qcom: Add PM7550 PMIC
      arm64: dts: qcom: Add PMIV0104 PMIC
      arm64: dts: qcom: Add initial Milos dtsi
      arm64: dts: qcom: Add The Fairphone (Gen. 6)
      arm64: dts: qcom: kodiak: Add missing clock votes for lpass_tlmm
      ARM: dts: qcom: msm8974: Sort header includes alphabetically
      ARM: dts: qcom: msm8974: Start using rpmpd for power domains
      arm64: dts: qcom: msm8953: Re-sort tlmm pinctrl states
      arm64: dts: qcom: msm8953: Add CCI nodes
      arm64: dts: qcom: sdm632-fairphone-fp3: Add camera fixed regulators
      arm64: dts: qcom: sdm632-fairphone-fp3: Enable CCI and add EEPROM
      arm64: dts: qcom: sm6350: Add clocks for aggre1 & aggre2 NoC

Luis Garcia (1):
      arm64: dts: rockchip: Fix imx258 variant on pinephone pro

Marc Olberding (2):
      dt-bindings: arm: aspeed: Add NVIDIA MSX4 board
      ARM: dts: aspeed: Add NVIDIA MSX4 HPM

Marek Vasut (6):
      dt-bindings: tpm: Add st,st33tphf2ei2c
      arm64: dts: imx8mp: Update Data Modul i.MX8M Plus eDM SBC DT to re=
v.903
      arm64: dts: imx95: Use GPU_CGC as core clock for GPU
      dt-bindings: vendor-prefixes: Document ifm electronic gmbh
      dt-bindings: arm: fsl: Document ifm VHIP4 EvalBoard v1 and v2
      arm64: dts: imx8mn: Add SNVS LPGPR

Markus Niebel (7):
      arm64: dts: imx8mm-tqma8mqml: remove virtual 3.3V regulator
      arm64: dts: imx8mm-tqma8mqml: remove virtual 1.8V regulator
      arm64: dts: imx8mm-tqma8mqml: remove superfluous line
      arm64: dts: imx8mm-tqma8mqml: fix LDO5 power off
      arm64: dts: imx8mn-tqma8mqnl: remove virtual 3.3V regulator
      arm64: dts: imx8mn-tqma8mqnl: remove virtual 1.8V regulator
      arm64: dts: imx8mn-tqma8mqnl: fix LDO5 power off

Martin Blumenstingl (2):
      ARM: dts: meson: drop iio-hwmon in favour of generic-adc-thermal
      arm64: dts: amlogic: move CPU OPP table and clock assignment to So=
C.dtsi

Matthias Schiffer (1):
      dt-bindings: arm: fsl: add TQ-Systems boards MBLS1028A and MBLS102=
8A-IND

Maud Spierings (3):
      arm64: dts: qcom: x1e80100-vivobook-s15: enable ps8830 retimers
      arm64: dts: qcom: x1e80100-vivobook-s15: add HDMI port
      arm64: dts: qcom: x1e80100-vivobook-s15: enable IRIS

Max Krummenacher (1):
      arm64: dts: colibri-imx8x: Add wi-fi 32kHz clock

Michael Orlitzky (1):
      riscv: dts: sophgo: enable hardware clock (RTC) on the Milk-V Pion=
eer

Michael Walle (2):
      arm64: dts: ti: k3-am67a-kontron-sa67-base: Fix CMA node
      arm64: dts: ti: k3-am67a-kontron-sa67-base: Fix SD card regulator

Michal Simek (1):
      arm64: zynqmp: Remove ina260 IIO description

Mukesh Ojha (1):
      arm64: dts: qcom: lemans; Add EL2 overlay

Nazim Amirul (1):
      arm64: dts: socfpga: agilex5: Add IOMMUS property for ethernet nod=
es

Neal Frager (1):
      arm64: dts: xilinx: fix zynqmp opp-table-cpu

Neil Armstrong (1):
      arm64: dts: qcom: x1e78100-lenovo-thinkpad-t14s: add HDMI nodes

Ng Tze Yee (2):
      arm64: dts: socfpga: agilex: add emmc support
      dt-bindings: intel: Add Agilex eMMC support

Nick Chan (1):
      arm64: dts: apple: s8001: Add DWI backlight for J98a, J99a

Nick Xie (5):
      dt-bindings: arm: amlogic: introduce specific compatibles for S4 f=
amily
      arm64: dts: meson-s4-aq222: update compatible string with s805x2
      arm64: dts: meson-s4-s905y4-khadas-vim1s: add initial device tree
      arm64: dts: amlogic: meson-s4-s905y4-khadas-vim1s: enable eMMC sto=
rage
      arm64: dts: amlogic: meson-s4-s905y4-khadas-vim1s: enable SDIO int=
erface

Nickolay Goppen (3):
      arm64: dts: qcom: sdm630/660: Add CDSP-related nodes
      arm64: dts: qcom: sdm630: Add missing vote clock and GDSC to lpass=
_smmu
      arm64: dts: qcom: sdm630: Add FastRPC nodes to ADSP

Nicolas Ferre (3):
      ARM: dts: microchip: sama7d65: add dma properties to usart6
      ARM: dts: microchip: sama7d65: add fifo-size to usart
      ARM: dts: microchip: sama7d65: add missing flexcom nodes

Niravkumar L Rabara (2):
      dt-bindings: intel: Add Agilex5 SoCFPGA modular board
      arm64: dts: socfpga: agilex5: add support for modular board

Nobuhiro Iwamatsu (1):
      arm64: dts: renesas: r9a09g057h48-kakip: Enable SPI NOR Flash

Odelu Kukatla (1):
      arm64: dts: qcom: sa8775p: Add reg and clocks for QoS configuration

Ondrej Jirman (3):
      arm64: dts: rockchip: Add accelerometer sensor to Pinephone Pro
      arm64: dts: rockchip: Add magnetometer sensor to Pinephone Pro
      arm64: dts: rockchip: Add light/proximity sensor to Pinephone Pro

Otto Pfl=C3=BCger (1):
      arm64: dts: mediatek: mt8183: Add missing endpoint IDs to display =
graph

Ovidiu Panait (1):
      arm64: dts: renesas: r9a09g056: Add TSU nodes

Patrice Chotard (11):
      ARM: dts: stm32: reorder nodes for stm32429i-eval
      ARM: dts: stm32: Update LED nodes for stm32 MCU boards
      ARM: dts: stm32: Add LED support for stm32h743i-disco
      ARM: dts: stm32: Add LED support for stm32h743i-eval
      ARM: dts: stm32: Add red LED for stm32mp135f-dk board
      ARM: dts: stm32: Add red LED for stm32mp157c-ed1 board
      ARM: dts: stm32: Update LED node for stm32mp15xx-dkx board
      arm64: dts: st: Add green and orange LED for stm32mp2 ST boards
      ARM: dts: stm32: Add boot-led for stm32 MCU ST boards
      ARM: dts: stm32: Add boot-led for stm32mp1 ST boards
      arm64: dts: st: Add boot-led for stm32mp2 ST boards

Peng Fan (14):
      arm64: dts: imx95-15x15-evk: Use phys to replace xceiver-supply
      arm64: dts: imx8mp-evk: Use phys to replace xceiver-supply
      arm64: dts: imx93-11x11-evk: Use phys to replace xceiver-supply
      dt-bindings: arm: fsl: add i.MX952 EVK board
      arm64: dts: freescale: Add initial device tree for i.MX952
      arm64: dts: freescale: Add i.MX952 EVK basic device tree
      arm64: dts: imx952: Add idle-states node
      arm64: dts: imx952-evk: Enable I2C[2,3,4,6,7] bus
      arm64: dts: imx952-evk: Enable UART5
      arm64: dts: imx952-evk: Enable SPI7
      arm64: dts: imx952-evk: Enable USB[1,2]
      arm64: dts: imx952-evk: Enable wdog3
      arm64: dts: imx952-evk: Enable TPM[3,6]
      arm64: dts: imx952-evk: Add nxp,ctrl-ids for scmi misc

Peter Griffin (6):
      dt-bindings: soc: samsung: exynos-pmu: remove syscon for google,gs=
101-pmu
      arm64: dts: exynos: gs101: remove syscon compatible from pmu node
      arm64: dts: exynos: gs101: add samsung,sysreg property to CMU nodes
      dt-bindings: clock: google,gs101-clock: fix alphanumeric ordering
      dt-bindings: clock: google,gs101-clock: Add DPU clock management u=
nit
      arm64: dts: exynos: gs101: add cmu_dpu and sysreg_dpu dt nodes

Peter Robinson (2):
      arm64: dts: broadcom: bcm2712: Enable RNG
      arm64: dts: broadcom: bcm2712: Enable RNG

Peter Shen (2):
      dt-bindings: arm: aspeed: Add compatible for Facebook Anacapa BMC
      ARM: dts: aspeed: Add Facebook Anacapa platform

Philippe Schenker (2):
      arm64: dts: colibri-imx8x: Add backlight
      arm64: dts: colibri-imx8x: Add cma memory

Piotr Wojtaszczyk (3):
      ARM: dts: lpc32xx: Use syscon for system control block
      ARM: dts: lpc32xx: Add missing DMA properties
      ARM: dts: lpc32xx: Add missing properties to I2S device tree nodes

Puranam V G Tejaswi (1):
      arm64: dts: qcom: lemans: Add gpu and gmu nodes

Raghav Sharma (1):
      arm64: dts: exynosautov920: add CMU_MFD clock DT nodes

Randy Dunlap (1):
      arm64: STM32: drop an undefined Kconfig symbol

Rapha=C3=ABl Jakse (1):
      arm64: dts: rockchip: Fix Bluetooth on the RockPro64 board

Rebecca Cran (2):
      dt-bindings: arm: aspeed: add ASRock Rack ALTRAD8 board
      ARM: dts: aspeed: add device tree for ASRock Rack ALTRAD8 BMC

Ricardo Pardini (5):
      arm64: dts: rockchip: Enable the NPU on NanoPC T6/T6-LTS
      arm64: dts: rockchip: Enable the NPU on FriendlyElec CM3588
      arm64: dts: rockchip: Enable the NPU on Turing RK1
      arm64: dts: amlogic: Enable the npu node on Radxa Zero 2
      arm64: dts: amlogic: add the type-c controller on Radxa Zero 2

Riccardo Mereu (4):
      dt-bindings: vendor-prefixes: Add Arduino name
      dt-bindings: arm: qcom: Add arduino imola, UnoQ codename
      arm64: dts: qcom: agatti: add uart2 node
      arm64: dts: qcom: qrb2210: add dts for Arduino unoq

Richard Acayan (1):
      arm64: dts: qcom: sdm630: Add LPASS LPI TLMM

Rob Herring (Arm) (37):
      arm64: dts: lg: Use recommended simple-bus node name
      arm64: dts: sprd: Use recommended node names
      arm64: dts: toshiba: Use recommended node names
      arm64: dts: cavium: thunder-88xx: Add missing PL011 "uartclk"
      arm64: dts: cavium: Drop thunder2
      ARM: dts: vexpress/v2m-rs1: Use documented arm,vexpress,config-bus=
 child node names
      arm64: dts: apm/shadowcat: More clock clean-ups
      arm64: dts: apm: Use recommended i2c node names
      arm64: dts: apm: Add "reg" to "syscon-reboot" and "syscon-poweroff"
      arm64: dts: apm: Drop "dma" device_type
      ARM: dts: ti: Drop unused .dtsi
      arm64: dts: xilinx: Drop "label" property on dlg,slg7xl45106
      arm64: dts: rockchip: Add missing everest,es8388 supplies to rk339=
9-roc-pc-plus
      arm64: dts: mediatek: Apply mt8395-radxa DT overlay at build time
      arm64: dts: marvell: Add missing "#phy-cells" to "usb-nop-xceiv"
      arm64: dts: marvell: Fix stray and typo "pinctrl-names" properties
      arm64: dts: marvell: cn9131-cf-solidwan: Add missing GPIO properti=
es on "nxp,pca9536"
      arm64: dts: marvell: change regulator-gpio to regulator-fixed
      arm64: dts: nuvoton: Add missing "device_type" property on memory =
node
      ARM: dts: aspeed: ibm: Use non-deprecated AT25 properties
      ARM: dts: broadcom: bcm2711: Fix 'simple-bus' node names
      arm/arm64: dts: renesas: Drop unused .dtsi
      dt-bindings: riscv: extensions: Drop unnecessary select schema
      arm64: dts: broadcom: Remove unused and undocumented nodes
      arm64: dts: broadcom: stingray: Rework clock nodes
      arm64: dts: broadcom: stingray: Fix 'simple-bus' node names
      arm64: dts: broadcom: stingray: Move raid nodes out of bus
      arm64: dts: broadcom: Use preferred node names
      arm64: dts: broadcom: ns2-svk: Use non-deprecated at25 properties
      arm64: dts: broadcom: northstar2: Rework clock nodes
      arm64: dts: broadcom: northstar2: Drop unused and undocumented "br=
cm,pcie-ob-oarr-size" properties
      arm64: dts: broadcom: northstar2: Drop QSPI "clock-names"
      arm64: dts: broadcom: northstar2: Drop "arm,cci-400-pmu" fallback =
compatible
      arm64: dts: broadcom: bcm4906-netgear-r8000p: Drop unnecessary "ra=
nges" in partition node
      arm/arm64: dts: st: Drop unused .dtsi
      ARM: dts: microchip: Drop usb_a9g20-dab-mmx.dtsi
      ARM: dts: samsung: Drop s3c6400.dtsi

Robert Eckelmann (3):
      arm64: dts: qcom: sdm845-xiaomi-beryllium: Enable SLPI
      arm64: dts: qcom: sdm845-xiaomi-beryllium: Adjust firmware paths
      arm64: dts: qcom: sdm845-xiaomi-beryllium: Add placeholders and so=
rt

Robin Murphy (1):
      arm64: dts: morello: Add CMN PMU

Rogerio Pimentel (2):
      dt-bindings: arm: fsl: Add i.MX8MP FRDM board
      arm64: dts: add support for NXP i.MX8MP FRDM board

Rudraksha Gupta (5):
      ARM: dts: qcom: msm8960: Add GSBI2 & GSBI7
      ARM: dts: qcom: msm8960: expressatt: Add Light/Proximity Sensor
      ARM: dts: qcom: msm8960: expressatt: Add NFC
      ARM: dts: qcom: msm8960: expressatt: Add Magnetometer
      ARM: dts: qcom: msm8960: expressatt: Add Accelerometer

Sam Day (1):
      arm64: dts: qcom: sdm845-oneplus: Add framebuffer

Samuel Holland (3):
      arm64: dts: allwinner: a100: Add LED controller node
      riscv: dts: allwinner: d1: Add LED controller node
      riscv: dts: allwinner: d1: Add RGB LEDs to boards

Sarthak Garg (3):
      arm64: dts: qcom: sm8750: Add SDC2 nodes for sm8750 soc
      arm64: dts: qcom: sm8750-mtp: Add SDC2 node for sm8750 mtp board
      arm64: dts: qcom: sm8750-qrd: Add SDC2 node for sm8750 qrd board

Sebastian Krzyszkowiak (6):
      arm64: dts: imx8mq-librem5: Enable I2C recovery
      arm64: dts: imx8mq-librem5: Set vibrator's PWM frequency to 20kHz
      arm64: dts: imx8mq-librem5: Enable SNVS RTC
      arm64: dts: imx8mq-librem5: Limit uSDHC2 frequency to 50MHz
      arm64: dts: imx8mq-librem5: Set cap-power-off-card for usdhc2
      arm64: dts: imx8mq-librem5: Don't set mic-cfg for wm8962

Shawn Lin (6):
      arm64: dts: rockchip: Add PCIe clkreq stuff for RK3588 EVB1
      arm64: dts: rockchip: add dma-coherent for pcie and gmac of RK3576
      arm64: dts: rockchip: Fix SD card support for RK3576 EVB1
      arm64: dts: rockchip: Fix SD card support for RK3576 Nanopi R76s
      arm64: dts: rockchip: Fix rk356x PCIe range mappings
      arm64: dts: rockchip: Fix rk3588 PCIe range mappings

Sibi Sankar (1):
      arm64: dts: qcom: glymur: Add header file for IPCC physical client=
 IDs

Sjoerd Simons (7):
      arm64: dts: mediatek: mt7981b: Add PCIe and USB support
      arm64: dts: mediatek: mt7981b-openwrt-one: Enable PCIe and USB
      arm64: dts: mediatek: mt7981b: Add Ethernet and WiFi offload suppo=
rt
      arm64: dts: mediatek: mt7981b-openwrt-one: Enable Ethernet
      arm64: dts: mediatek: mt7981b: Disable wifi by default
      arm64: dts: mediatek: mt7981b: Add wifi memory region
      arm64: dts: mediatek: mt7981b-openwrt-one: Enable wifi

Stanimir Varbanov (2):
      arm64: dts: broadcom: bcm2712: Add watchdog DT node
      arm64: dts: broadcom: bcm2712: Add watchdog DT node

Stefan Riedmueller (1):
      arm64: dts: imx8mp-phyboard-pollux: Enable i2c3

Stefano Radaelli (10):
      arm64: dts: imx93-var-som-symphony: Update gpio aliases
      arm64: dts: imx93-var-som-symphony: Add support for ft5x06 touch c=
ontroller
      arm64: dts: imx93-var-som-symphony: Add USB support
      arm64: dts: imx93-var-som-symphony: Enable LPSPI6 controller
      arm64: dts: imx8mp-var-som: Move USDHC2 support to Symphony carrier
      arm64: dts: imx8mp-var-som: Move PCA9534 GPIO expander to Symphony=
 carrier
      arm64: dts: imx8mp-var-som: Move UART2 description to Symphony car=
rier
      arm64: dts: imx8mp-var-som: Add WiFi and Bluetooth support
      arm64: dts: imx8mp-var-som: Add support for WM8904 audio codec
      arm64: dts: imx8mp-var-som: Add support for TSC2046 touchscreen

Sushrut Shree Trivedi (1):
      arm64: dts: qcom: monaco-evk: Enable PCIe0 and PCIe1.

Sven Peter (2):
      arm64: dts: apple: t8103,t60xx,t8112: Add SMC RTC node
      Merge patch series "arm64: dts: apple: Add integrated USB Type-C p=
orts"

Svyatoslav Ryhel (3):
      ARM: tegra: Adjust DSI nodes for Tegra20/Tegra30
      dt-bindings: display: tegra: document Tegra132 MIPI calibration de=
vice
      dt-bindings: display: tegra: document Tegra30 VI and VIP

Taniya Das (2):
      dt-bindings: clock: qcom,x1e80100-gcc: Add missing UFS mux clocks
      arm64: dts: qcom: hamoa: Extend the gcc input clock list

Teresa Remmet (1):
      arm64: dts: imx8mm-phycore-som: Update eth phy impedance

Thierry Reding (2):
      dt-bindings: memory: tegra: Document DBB clock for Tegra264
      arm64: tegra: Add DBB clock to EMC on Tegra264

Tim Harvey (1):
      arm64: dts: imx8m{m,p}-venice-gw71xx: Add Magetometer

Tingguo Cheng (1):
      arm64: dts: qcom: hamoa-iot-evk: enable PWM RG LEDs

Tomas Melin (1):
      Revert "arm64: zynqmp: Add an OP-TEE node to the device tree"

Tommaso Merciai (1):
      arm64: dts: renesas: rzg3e-smarc-som: Enable I3C support

Torsten Duwe (1):
      arm64: dts: rockchip: Enable SPDIF audio on Rock 5 ITX

Troy Mitchell (1):
      riscv: dts: spacemit: pinctrl: update register and IO power

Tudor Ambarus (3):
      dt-bindings: rng: add google,gs101-trng compatible
      arm64: dts: exynos: gs101: add TRNG node
      arm64: dts: exynos: gs101: add OTP node

Viken Dadhaniya (1):
      arm64: dts: qcom: talos: Drop opp-shared from QUP OPP table

Vikram Sharma (1):
      arm64: dts: qcom: qcs8300: Add support for camss

Vincent Knecht (1):
      arm64: dts: qcom: msm8939: Add camss and cci

Vitor Soares (2):
      arm64: dts: ti: k3-am69-aquila: Change main_spi0/2 CS to GPIO mode
      arm64: dts: ti: k3-am69-aquila-clover: Change main_spi2 CS0 to GPI=
O mode

Vladimir Zapolskiy (15):
      arm64: dts: qcom: sm8650: Add CAMSS device tree node
      arm64: dts: qcom: sm8650: Add description of MCLK pins
      arm64: dts: qcom: sm8650-qrd: Enable CAMSS and Samsung S5KJN1 came=
ra sensor
      arm64: dts: qcom: sm8650-hdk: Add support for the Rear Camera Card=
 overlay
      arm64: dts: qcom: sm8550-qrd: rename image sensor supply properties
      arm64: dts: qcom: sm8550-qrd: remove data-lanes property of image =
sensor
      arm64: dts: qcom: sm8550-hdk-rear-camera-card: rename supply prope=
rties
      arm64: dts: qcom: sm8550-hdk-rear-camera-card: remove optional pro=
perty
      arm64: dts: qcom: msm8994-octagon: Fix Analog Devices vendor prefi=
x of AD7147
      ARM: dts: omap: dra7: Remove bogus #syscon-cells property
      ARM: dts: lpc32xx: change NAND controllers node names
      ARM: dts: lpc32xx: describe FLASH_INT of SLC NAND controller
      ARM: dts: lpc32xx: Declare the second AHB master support on PL080 =
DMA controller
      arm: dts: lpc32xx: add clocks property to Motor Control PWM device=
 tree node
      arm: dts: lpc32xx: add interrupts property to Motor Control PWM

Wadim Egorov (1):
      arm64: dts: ti: k3-am62(a)-phycore-som: Add bootphase tag to phy_g=
mii_sel

Wei Fang (2):
      arm64: dts: imx94: add basic NETC related nodes
      arm64: dts: imx943-evk: add ENETC, EMDIO and PTP Timer support

Wolfram Sang (8):
      arm64: dts: renesas: r8a77980: Add SWDT node
      arm64: dts: renesas: condor/v3hsk: Mark SWDT as reserved
      arm64: dts: renesas: r8a77970: Add WWDT nodes
      arm64: dts: renesas: r8a77980: Add WWDT nodes
      arm64: dts: renesas: r8a779a0: Add WWDT nodes
      arm64: dts: renesas: r8a779f0: Add WWDT nodes
      arm64: dts: renesas: r8a779g0: Add WWDT nodes
      arm64: dts: renesas: r8a779h0: Add WWDT nodes

Xiangxu Yin (2):
      arm64: dts: qcom: talos: Add DisplayPort and QMP USB3-DP PHY
      arm64: dts: qcom: qcs615-ride: Enable DisplayPort

Yannic Moog (3):
      arm64: dts: imx8mp-phyboard-pollux: add fan-supply
      arm64: dts: imx8mp-phycore-som: add spi-nor supply vcc
      arm64: dts: imx8mp-phyboard-pollux: add PEB-WLBT-05 expansion board

Yashwanth Varakala (2):
      arm64: dts: imx8mp libra: add and update display overlays
      arm64: dts: imx8mp libra: add peb-av-10 expansion board overlay

Yegor Yefremov (1):
      ARM: dts: omap: enable panic-indicator option

Yingying Tang (1):
      arm64: dts: qcom: hamoa-iot-evk: Add WLAN node for Hamoa IoT EVK b=
oard

Yixun Lan (1):
      riscv: dts: spacemit: sdhci: add reset support

Yongxing Mou (3):
      arm64: dts: qcom: qcs8300: add display dt nodes for MDSS, DPU, Dis=
playPort and eDP PHY
      arm64: dts: qcom: qcs8300-ride: Enable Display Port
      arm64: dts: qcom: hamoa-iot-evk: Add backlight support for eDP pan=
el

Yu-Chun Lin (2):
      dt-bindings: arm: realtek: Add Kent Soc family compatibles
      arm64: dts: realtek: Add Kent SoC and EVB device trees

Yuanjie Yang (2):
      arm64: dts: qcom: talos: switch to interrupt-cells 4 to add PPI pa=
rtitions
      arm64: dts: qcom: talos: Add PMU support

Ze Huang (3):
      riscv: dts: spacemit: Add USB2 PHY node for K1
      riscv: dts: spacemit: Add DWC3 USB 3.0 controller node for K1
      riscv: dts: spacemit: Enable USB3.0 on BananaPi-F3

Ziyue Zhang (7):
      arm64: dts: qcom: qcs8300: enable pcie0
      arm64: dts: qcom: qcs8300-ride: enable pcie0 interface
      arm64: dts: qcom: qcs8300: enable pcie1
      arm64: dts: qcom: qcs8300-ride: enable pcie1 interface
      arm64: dts: qcom: hamoa: Move PHY, PERST, and Wake GPIOs to PCIe p=
ort nodes and add port Nodes for all PCIe ports
      arm64: dts: qcom: Add PCIe3 and PCIe5 support for HAMOA-IOT-SOM pl=
atform
      arm64: dts: qcom: Add PCIe3 and PCIe5 regulators for HAMAO-IOT-EVK=
 board

sheetal (1):
      dt-bindings: dma: Update ADMA bindings for tegra264

 Documentation/devicetree/bindings/arm/altera.yaml  |   27 +
 Documentation/devicetree/bindings/arm/amlogic.yaml |    8 +
 .../devicetree/bindings/arm/aspeed/aspeed.yaml     |    3 +
 .../devicetree/bindings/arm/atmel-at91.yaml        |    6 +-
 Documentation/devicetree/bindings/arm/cix.yaml     |    6 +-
 Documentation/devicetree/bindings/arm/fsl.yaml     |   34 +-
 .../devicetree/bindings/arm/intel,socfpga.yaml     |   40 -
 .../devicetree/bindings/arm/mediatek.yaml          |    2 +
 .../bindings/arm/mediatek/mediatek,audsys.yaml     |   46 +-
 Documentation/devicetree/bindings/arm/qcom.yaml    |   33 +
 Documentation/devicetree/bindings/arm/realtek.yaml |   42 +-
 .../devicetree/bindings/arm/rockchip.yaml          |   42 +-
 .../bindings/arm/tegra/nvidia,tegra186-pmc.yaml    |   11 +-
 .../bindings/clock/google,gs101-clock.yaml         |   21 +-
 .../bindings/clock/qcom,x1e80100-gcc.yaml          |    8 +-
 .../display/tegra/nvidia,tegra114-mipi.yaml        |    1 +
 .../bindings/display/tegra/nvidia,tegra20-vi.yaml  |   19 +-
 .../bindings/display/tegra/nvidia,tegra20-vip.yaml |    9 +-
 .../bindings/dma/nvidia,tegra210-adma.yaml         |   15 +-
 .../devicetree/bindings/i2c/st,stm32-i2c.yaml      |    3 +
 .../bindings/input/touchscreen/goodix.yaml         |    2 +
 .../bindings/interrupt-controller/riscv,aplic.yaml |    1 +
 .../interrupt-controller/riscv,imsics.yaml         |    1 +
 .../devicetree/bindings/iommu/arm,smmu-v3.yaml     |   27 +-
 .../bindings/iommu/nvidia,tegra264-cmdqv.yaml      |   42 +
 .../bindings/mailbox/qcom,cpucp-mbox.yaml          |    2 +
 .../devicetree/bindings/mailbox/qcom-ipcc.yaml     |    2 +
 .../devicetree/bindings/media/st,stm32-dcmipp.yaml |    3 +
 .../bindings/media/st,stm32mp25-csi.yaml           |    3 +
 .../memory-controllers/nvidia,tegra186-mc.yaml     |   13 +
 .../bindings/mtd/nvidia,tegra20-nand.yaml          |  102 +
 .../bindings/mtd/nvidia-tegra20-nand.txt           |   64 -
 .../devicetree/bindings/power/fsl,imx-gpc.yaml     |    3 +
 Documentation/devicetree/bindings/riscv/cpus.yaml  |    1 +
 .../devicetree/bindings/riscv/extensions.yaml      |  194 +-
 .../devicetree/bindings/riscv/spacemit.yaml        |    5 +
 .../devicetree/bindings/riscv/starfive.yaml        |    1 +
 .../bindings/rng/samsung,exynos5250-trng.yaml      |   13 +-
 .../bindings/soc/altera/altr,sys-mgr.yaml          |    6 +-
 .../soc/renesas/renesas,rzn1-gpioirqmux.yaml       |   87 +
 .../bindings/soc/samsung/exynos-pmu.yaml           |    3 +-
 .../devicetree/bindings/timer/sifive,clint.yaml    |    1 +
 .../devicetree/bindings/tpm/tcg,tpm-tis-i2c.yaml   |    1 +
 .../devicetree/bindings/vendor-prefixes.yaml       |   10 +
 .../devicetree/bindings/watchdog/qcom-wdt.yaml     |    1 +
 .../bindings/watchdog/xlnx,versal-wwdt.yaml        |    3 +
 MAINTAINERS                                        |    3 +-
 .../dts/allwinner/sun4i-a10-dserve-dsrv9703c.dts   |    2 +-
 .../dts/allwinner/sun4i-a10-pov-protab2-ips9.dts   |    2 +-
 arch/arm/boot/dts/allwinner/sun5i-a13-utoo-p66.dts |    1 +
 .../boot/dts/allwinner/sun6i-a31-hummingbird.dts   |    2 +-
 arch/arm/boot/dts/allwinner/sun6i-a31s-primo81.dts |    2 +-
 arch/arm/boot/dts/allwinner/sun8i-t113s.dtsi       |   33 +
 arch/arm/boot/dts/amlogic/meson.dtsi               |    5 -
 arch/arm/boot/dts/arm/vexpress-v2m-rs1.dtsi        |    8 +-
 arch/arm/boot/dts/aspeed/Makefile                  |    3 +
 arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dts    |    7 +-
 .../boot/dts/aspeed/aspeed-bmc-asrock-altrad8.dts  |  637 +++++
 .../dts/aspeed/aspeed-bmc-facebook-anacapa.dts     | 1045 ++++++++
 .../dts/aspeed/aspeed-bmc-facebook-bletchley.dts   |  112 +-
 .../dts/aspeed/aspeed-bmc-facebook-clemente.dts    |   43 +-
 .../boot/dts/aspeed/aspeed-bmc-facebook-harma.dts  |    8 +-
 .../aspeed/aspeed-bmc-facebook-santabarbara.dts    |   29 +-
 .../arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dts |  128 +-
 .../boot/dts/aspeed/aspeed-bmc-nvidia-msx4-bmc.dts |  246 ++
 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi            |   12 +-
 arch/arm/boot/dts/aspeed/ibm-power10-dual.dtsi     |   64 +-
 arch/arm/boot/dts/aspeed/ibm-power10-quad.dtsi     |   64 +-
 arch/arm/boot/dts/broadcom/bcm2711.dtsi            |    4 +-
 arch/arm/boot/dts/intel/socfpga/socfpga.dtsi       |    6 +-
 .../boot/dts/intel/socfpga/socfpga_arria10.dtsi    |    6 +-
 arch/arm/boot/dts/microchip/Makefile               |    3 +-
 arch/arm/boot/dts/microchip/lan966x-pcb8385.dts    |  131 +
 arch/arm/boot/dts/microchip/sama7d65.dtsi          |  279 +++
 arch/arm/boot/dts/microchip/usb_a9g20-dab-mmx.dtsi |   93 -
 .../boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi   |    4 +-
 arch/arm/boot/dts/nvidia/tegra20.dtsi              |    4 +
 arch/arm/boot/dts/nvidia/tegra30.dtsi              |    8 +
 arch/arm/boot/dts/nxp/imx/e60k02.dtsi              |   35 +-
 arch/arm/boot/dts/nxp/imx/imx50-kobo-aura.dts      |   60 +-
 arch/arm/boot/dts/nxp/imx/imx6-logicpd-som.dtsi    |    6 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-icore.dtsi       |    6 +-
 .../boot/dts/nxp/imx/imx6qdl-phytec-pfla02.dtsi    |    6 +-
 .../dts/nxp/imx/imx6qdl-phytec-phycore-som.dtsi    |    6 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-skov-cpu.dtsi    |    6 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-tx6.dtsi         |    6 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi             |    3 +
 .../boot/dts/nxp/imx/imx6sl-tolino-shine2hd.dts    |   55 +-
 arch/arm/boot/dts/nxp/imx/imx6sl-tolino-shine3.dts |   26 +
 arch/arm/boot/dts/nxp/imx/imx6sl.dtsi              |    2 +-
 .../boot/dts/nxp/imx/imx6sll-kobo-clara2e-b.dts    |   61 +-
 arch/arm/boot/dts/nxp/imx/imx6sll-kobo-clarahd.dts |   26 +
 arch/arm/boot/dts/nxp/imx/imx6sll.dtsi             |    2 +-
 arch/arm/boot/dts/nxp/imx/imx6sx.dtsi              |    2 +-
 arch/arm/boot/dts/nxp/imx/imx6ul-geam.dts          |    6 +-
 arch/arm/boot/dts/nxp/imx/imx6ul-isiot.dtsi        |    6 +-
 .../dts/nxp/imx/imx6ul-phytec-phycore-som.dtsi     |    6 +-
 arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul.dtsi        |    6 +-
 arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi     |   12 +-
 .../boot/dts/nxp/imx/imx6ull-engicam-microgea.dtsi |   12 +-
 .../boot/dts/nxp/imx/imx6ull-myir-mys-6ulx.dtsi    |    6 +-
 arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts   |    6 +-
 arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi        |    8 +-
 arch/arm/boot/dts/nxp/lpc/lpc3250-ea3250.dts       |   18 +-
 arch/arm/boot/dts/nxp/lpc/lpc3250-phy3250.dts      |    8 +-
 arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi             |  133 +-
 .../arm/boot/dts/qcom/qcom-apq8074-dragonboard.dts |   13 -
 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi           |    4 +-
 .../dts/qcom/qcom-msm8960-samsung-expressatt.dts   |  109 +
 arch/arm/boot/dts/qcom/qcom-msm8960.dtsi           |   96 +
 .../qcom/qcom-msm8974-lge-nexus5-hammerhead.dts    |   14 +-
 .../boot/dts/qcom/qcom-msm8974-samsung-hlte.dts    |   12 -
 .../dts/qcom/qcom-msm8974-sony-xperia-rhine.dtsi   |   12 -
 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi           |   50 +-
 .../dts/qcom/qcom-msm8974pro-fairphone-fp2.dts     |    8 -
 arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts  |   11 -
 .../dts/qcom/qcom-msm8974pro-oneplus-bacon.dts     |    9 -
 .../qcom/qcom-msm8974pro-samsung-klte-common.dtsi  |   11 +-
 ...qcom-msm8974pro-sony-xperia-shinano-common.dtsi |   12 -
 .../dts/renesas/gr-peach-audiocamerashield.dtsi    |   75 -
 .../boot/dts/renesas/r8a77xx-aa121td01-panel.dtsi  |   39 -
 arch/arm/boot/dts/renesas/r9a06g032.dtsi           |  165 ++
 arch/arm/boot/dts/rockchip/rk3036.dtsi             |    3 -
 arch/arm/boot/dts/rockchip/rk3288.dtsi             |   17 +-
 arch/arm/boot/dts/samsung/s3c6400.dtsi             |   38 -
 arch/arm/boot/dts/st/spear320s.dtsi                |   24 -
 arch/arm/boot/dts/st/stm32429i-eval.dts            |   73 +-
 arch/arm/boot/dts/st/stm32746g-eval.dts            |   15 +-
 arch/arm/boot/dts/st/stm32f429-disco.dts           |   15 +-
 arch/arm/boot/dts/st/stm32f469-disco.dts           |   15 +-
 arch/arm/boot/dts/st/stm32f746-disco.dts           |   12 +-
 arch/arm/boot/dts/st/stm32f769-disco.dts           |   14 +-
 arch/arm/boot/dts/st/stm32h743i-disco.dts          |   34 +
 arch/arm/boot/dts/st/stm32h743i-eval.dts           |   25 +
 arch/arm/boot/dts/st/stm32h747i-disco.dts          |   15 +-
 arch/arm/boot/dts/st/stm32mp135f-dk.dts            |   15 +-
 arch/arm/boot/dts/st/stm32mp157c-ed1.dts           |   15 +-
 arch/arm/boot/dts/st/stm32mp157c-ev1.dts           |    3 +-
 arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi          |   19 +-
 arch/arm/boot/dts/st/stm32mp15xxab-pinctrl.dtsi    |   57 -
 arch/arm/boot/dts/ti/omap/Makefile                 |    1 -
 arch/arm/boot/dts/ti/omap/am335x-baltos-leds.dtsi  |    1 +
 arch/arm/boot/dts/ti/omap/am335x-base0033.dts      |   92 -
 arch/arm/boot/dts/ti/omap/am3703.dtsi              |   14 -
 arch/arm/boot/dts/ti/omap/am3715.dtsi              |   10 -
 arch/arm/boot/dts/ti/omap/dra7-l4.dtsi             |    1 -
 arch/arm/boot/dts/ti/omap/omap2430.dtsi            |    2 +-
 arch/arm/boot/dts/ti/omap/omap3.dtsi               |    2 +-
 arch/arm/boot/dts/ti/omap/omap3430es1-clocks.dtsi  |  237 --
 arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dts  |    5 +
 arch/arm/boot/dts/ti/omap/omap4-l4-abe.dtsi        |    2 +-
 arch/arm/boot/dts/ti/omap/omap4-l4.dtsi            |    2 +-
 arch/arm/boot/dts/ti/omap/omap5-l4.dtsi            |    2 +-
 arch/arm/boot/dts/tps65910.dtsi                    |    4 +
 arch/arm64/Kconfig.platforms                       |    1 -
 arch/arm64/boot/dts/airoha/en7581-evb.dts          |    6 +-
 arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi     |   14 +
 arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi     |   94 +
 .../boot/dts/allwinner/sun55i-t527-orangepi-4a.dts |   15 +
 arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi  |    2 +-
 .../boot/dts/altera/socfpga_stratix10_socdk.dts    |    2 +-
 .../dts/altera/socfpga_stratix10_socdk_nand.dts    |    4 +-
 arch/arm64/boot/dts/amlogic/Makefile               |    1 +
 arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi        |   13 +-
 .../boot/dts/amlogic/amlogic-t7-a311d2-an400.dts   |    2 +-
 arch/arm64/boot/dts/amlogic/meson-a1.dtsi          |    5 +-
 arch/arm64/boot/dts/amlogic/meson-axg-s400.dts     |    1 -
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi         |    6 +
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi  |    9 +
 arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am.dts  |    9 -
 .../boot/dts/amlogic/meson-g12a-radxa-zero.dts     |    9 -
 arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts  |    9 -
 arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts    |    9 -
 arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts |    9 -
 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi        |    8 +
 .../dts/amlogic/meson-g12b-a311d-libretech-cc.dts  |   13 -
 arch/arm64/boot/dts/amlogic/meson-g12b-a311d.dtsi  |   24 +
 .../dts/amlogic/meson-g12b-bananapi-cm4-cm4io.dts  |    1 -
 .../meson-g12b-bananapi-cm4-mnt-reform2.dts        |    1 -
 .../boot/dts/amlogic/meson-g12b-bananapi-cm4.dtsi  |   12 -
 .../boot/dts/amlogic/meson-g12b-bananapi.dtsi      |   13 -
 .../boot/dts/amlogic/meson-g12b-dreambox.dtsi      |    1 -
 .../arm64/boot/dts/amlogic/meson-g12b-gsking-x.dts |    1 -
 .../boot/dts/amlogic/meson-g12b-gtking-pro.dts     |    1 -
 arch/arm64/boot/dts/amlogic/meson-g12b-gtking.dts  |    1 -
 .../boot/dts/amlogic/meson-g12b-khadas-vim3.dtsi   |   12 -
 .../dts/amlogic/meson-g12b-odroid-go-ultra.dts     |   13 -
 .../boot/dts/amlogic/meson-g12b-odroid-n2.dtsi     |    1 -
 .../boot/dts/amlogic/meson-g12b-odroid-n2l.dts     |    1 -
 arch/arm64/boot/dts/amlogic/meson-g12b-odroid.dtsi |   12 -
 .../boot/dts/amlogic/meson-g12b-radxa-zero2.dts    |   51 +-
 arch/arm64/boot/dts/amlogic/meson-g12b-s922x.dtsi  |   24 +
 .../boot/dts/amlogic/meson-g12b-ugoos-am6.dts      |    1 -
 arch/arm64/boot/dts/amlogic/meson-g12b-w400.dtsi   |   12 -
 arch/arm64/boot/dts/amlogic/meson-g12b.dtsi        |    7 +
 .../boot/dts/amlogic/meson-gx-libretech-pc.dtsi    |    1 -
 .../arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi |    1 -
 arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts |    1 -
 .../boot/dts/amlogic/meson-gxbb-nanopi-k2.dts      |    1 -
 .../boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts    |    1 -
 .../arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts |    1 -
 arch/arm64/boot/dts/amlogic/meson-gxbb-p200.dts    |    1 -
 arch/arm64/boot/dts/amlogic/meson-gxbb-p201.dts    |    1 -
 .../boot/dts/amlogic/meson-gxbb-vega-s95.dtsi      |    1 -
 .../boot/dts/amlogic/meson-gxbb-wetek-hub.dts      |    1 -
 .../boot/dts/amlogic/meson-gxbb-wetek-play2.dts    |    1 -
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi        |    9 +
 .../dts/amlogic/meson-gxl-s805x-libretech-ac.dts   |    1 -
 .../boot/dts/amlogic/meson-gxl-s805x-p241.dts      |    1 -
 .../dts/amlogic/meson-gxl-s805y-xiaomi-aquaman.dts |    1 -
 .../dts/amlogic/meson-gxl-s905x-khadas-vim.dts     |    1 -
 .../amlogic/meson-gxl-s905x-libretech-cc-v2.dts    |    1 -
 .../dts/amlogic/meson-gxl-s905x-libretech-cc.dts   |    1 -
 .../boot/dts/amlogic/meson-gxl-s905x-p212.dts      |    1 -
 .../boot/dts/amlogic/meson-gxl-s905x-vero4k.dts    |    1 -
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi         |    9 +
 .../boot/dts/amlogic/meson-gxm-khadas-vim2.dts     |    1 -
 .../boot/dts/amlogic/meson-gxm-mecool-kiii-pro.dts |    2 +-
 .../arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts |    1 -
 arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts |    1 -
 arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi |    1 -
 .../dts/amlogic/meson-libretech-cottonwood.dtsi    |    1 -
 .../boot/dts/amlogic/meson-s4-s805x2-aq222.dts     |    2 +-
 .../dts/amlogic/meson-s4-s905y4-khadas-vim1s.dts   |  259 ++
 arch/arm64/boot/dts/amlogic/meson-s4.dtsi          |   13 +-
 .../boot/dts/amlogic/meson-sm1-a95xf3-air-gbit.dts |    1 -
 .../boot/dts/amlogic/meson-sm1-a95xf3-air.dts      |    1 -
 arch/arm64/boot/dts/amlogic/meson-sm1-ac2xx.dtsi   |    8 -
 .../boot/dts/amlogic/meson-sm1-bananapi-m2-pro.dts |    1 -
 .../boot/dts/amlogic/meson-sm1-bananapi-m5.dts     |    1 -
 .../arm64/boot/dts/amlogic/meson-sm1-bananapi.dtsi |    8 -
 arch/arm64/boot/dts/amlogic/meson-sm1-h96-max.dts  |    1 -
 .../boot/dts/amlogic/meson-sm1-khadas-vim3l.dts    |    8 -
 .../boot/dts/amlogic/meson-sm1-odroid-hc4.dts      |    2 +
 arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi  |   12 +-
 .../dts/amlogic/meson-sm1-s905d3-libretech-cc.dts  |    9 -
 arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts   |    9 -
 .../boot/dts/amlogic/meson-sm1-x96-air-gbit.dts    |    1 -
 arch/arm64/boot/dts/amlogic/meson-sm1-x96-air.dts  |    1 -
 arch/arm64/boot/dts/amlogic/meson-sm1.dtsi         |    8 +
 arch/arm64/boot/dts/apm/apm-merlin.dts             |    1 +
 arch/arm64/boot/dts/apm/apm-mustang.dts            |    1 +
 arch/arm64/boot/dts/apm/apm-shadowcat.dtsi         |   20 +-
 arch/arm64/boot/dts/apm/apm-storm.dtsi             |    4 +-
 arch/arm64/boot/dts/apple/s8001-j98a-j99a.dtsi     |    4 +
 arch/arm64/boot/dts/apple/s8001.dtsi               |    7 +
 arch/arm64/boot/dts/apple/t6001.dtsi               |    1 +
 arch/arm64/boot/dts/apple/t6002-j375d.dts          |  150 ++
 arch/arm64/boot/dts/apple/t6002.dtsi               |    1 +
 arch/arm64/boot/dts/apple/t600x-die0.dtsi          |    6 +
 arch/arm64/boot/dts/apple/t600x-dieX.dtsi          |  212 ++
 arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi     |  236 ++
 arch/arm64/boot/dts/apple/t600x-j375.dtsi          |  272 ++
 arch/arm64/boot/dts/apple/t6022-j180d.dts          |  417 ++++
 arch/arm64/boot/dts/apple/t6022-j475d.dts          |   31 +
 arch/arm64/boot/dts/apple/t6022-jxxxd.dtsi         |  133 +
 arch/arm64/boot/dts/apple/t602x-die0.dtsi          |    6 +
 arch/arm64/boot/dts/apple/t602x-dieX.dtsi          |  212 ++
 arch/arm64/boot/dts/apple/t8103-j274.dts           |   13 +
 arch/arm64/boot/dts/apple/t8103-j293.dts           |   13 +
 arch/arm64/boot/dts/apple/t8103-j313.dts           |   13 +
 arch/arm64/boot/dts/apple/t8103-j456.dts           |   13 +
 arch/arm64/boot/dts/apple/t8103-j457.dts           |   13 +
 arch/arm64/boot/dts/apple/t8103-jxxx.dtsi          |  134 +
 arch/arm64/boot/dts/apple/t8103-pmgr.dtsi          |    3 +
 arch/arm64/boot/dts/apple/t8103.dtsi               |  111 +
 arch/arm64/boot/dts/apple/t8112-j413.dts           |   13 +
 arch/arm64/boot/dts/apple/t8112-j415.dts           |   13 +
 arch/arm64/boot/dts/apple/t8112-j473.dts           |   32 +
 arch/arm64/boot/dts/apple/t8112-j493.dts           |   13 +
 arch/arm64/boot/dts/apple/t8112-jxxx.dtsi          |  134 +
 arch/arm64/boot/dts/apple/t8112.dtsi               |  111 +
 arch/arm64/boot/dts/arm/morello-fvp.dts            |    8 +-
 arch/arm64/boot/dts/arm/morello-sdp.dts            |    7 +
 arch/arm64/boot/dts/broadcom/bcm2712.dtsi          |   15 +
 .../dts/broadcom/bcmbca/bcm4906-netgear-r8000p.dts |    3 -
 .../boot/dts/broadcom/northstar2/ns2-clock.dtsi    |  105 -
 .../arm64/boot/dts/broadcom/northstar2/ns2-svk.dts |   26 +-
 .../arm64/boot/dts/broadcom/northstar2/ns2-xmc.dts |    2 +-
 arch/arm64/boot/dts/broadcom/northstar2/ns2.dtsi   |   87 +-
 .../boot/dts/broadcom/stingray/bcm958742-base.dtsi |    2 +-
 .../boot/dts/broadcom/stingray/stingray-clock.dtsi |  182 --
 .../boot/dts/broadcom/stingray/stingray-fs4.dtsi   |  114 +-
 .../boot/dts/broadcom/stingray/stingray-pcie.dtsi  |    2 +-
 .../dts/broadcom/stingray/stingray-pinctrl.dtsi    |    2 +-
 .../boot/dts/broadcom/stingray/stingray-usb.dtsi   |   21 +-
 .../arm64/boot/dts/broadcom/stingray/stingray.dtsi |  148 +-
 arch/arm64/boot/dts/cavium/Makefile                |    1 -
 arch/arm64/boot/dts/cavium/thunder-88xx.dtsi       |    8 +-
 arch/arm64/boot/dts/cavium/thunder2-99xx.dts       |   30 -
 arch/arm64/boot/dts/cavium/thunder2-99xx.dtsi      |  144 --
 arch/arm64/boot/dts/cix/Makefile                   |    1 +
 arch/arm64/boot/dts/cix/sky1-xcp.dts               |   83 +
 arch/arm64/boot/dts/cix/sky1.dtsi                  |    2 +-
 arch/arm64/boot/dts/exynos/exynosautov920.dtsi     |   11 +
 arch/arm64/boot/dts/exynos/google/gs101.dtsi       |   42 +-
 arch/arm64/boot/dts/freescale/Makefile             |   48 +-
 arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi     |    2 +-
 .../fsl-ls1028a-tqmls1028a-mbls1028a-ind.dts       |   68 +
 .../freescale/fsl-ls1028a-tqmls1028a-mbls1028a.dts |  118 +
 .../fsl-ls1028a-tqmls1028a-mbls1028a.dtsi          |  287 +++
 .../boot/dts/freescale/fsl-ls1028a-tqmls1028a.dtsi |  124 +
 .../boot/dts/freescale/fsl-ls1046a-tqmls1046a.dtsi |   12 +
 arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi     |    6 +-
 .../arm64/boot/dts/freescale/fsl-ls1088a-ten64.dts |    4 +-
 arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi     |    2 +-
 arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi     |    2 +-
 arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi     |   32 +-
 .../arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi |    4 +
 arch/arm64/boot/dts/freescale/imx8-ss-ddr.dtsi     |    2 +-
 arch/arm64/boot/dts/freescale/imx8dxl-ss-ddr.dtsi  |   22 +
 arch/arm64/boot/dts/freescale/imx8dxl.dtsi         |    7 +
 .../boot/dts/freescale/imx8mm-phycore-rpmsg.dtso   |    2 +-
 .../boot/dts/freescale/imx8mm-phycore-som.dtsi     |    1 +
 .../boot/dts/freescale/imx8mm-tqma8mqml-mba8mx.dts |   13 +-
 .../arm64/boot/dts/freescale/imx8mm-tqma8mqml.dtsi |   39 +-
 .../boot/dts/freescale/imx8mm-venice-gw71xx.dtsi   |   15 +
 arch/arm64/boot/dts/freescale/imx8mm.dtsi          |    2 +-
 .../boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx.dts |   29 +-
 .../arm64/boot/dts/freescale/imx8mn-tqma8mqnl.dtsi |   37 +-
 .../freescale/imx8mn-vhip4-evalboard-common.dtsi   |  396 +++
 .../imx8mn-vhip4-evalboard-ksz8794-common.dtsi     |   98 +
 .../imx8mn-vhip4-evalboard-v1-overlay-ksz8794.dtso |   24 +
 .../imx8mn-vhip4-evalboard-v1-overlay-ksz9031.dtso |   48 +
 .../dts/freescale/imx8mn-vhip4-evalboard-v1.dts    |  258 ++
 ...imx8mn-vhip4-evalboard-v2-overlay-adin1300.dtso |   60 +
 .../imx8mn-vhip4-evalboard-v2-overlay-ksz8794.dtso |   24 +
 .../dts/freescale/imx8mn-vhip4-evalboard-v2.dts    |  221 ++
 arch/arm64/boot/dts/freescale/imx8mn.dtsi          |    5 +
 .../dts/freescale/imx8mp-data-modul-edm-sbc.dts    |  148 +-
 arch/arm64/boot/dts/freescale/imx8mp-edm-g-wb.dts  |    2 +-
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts       |  123 +-
 arch/arm64/boot/dts/freescale/imx8mp-frdm.dts      |  355 +++
 .../imx8mp-hummingboard-pulse-common.dtsi          |    2 +-
 .../imx8mp-libra-rdk-fpsc-lvds-etml1010g3dra.dtso  |    2 +-
 .../imx8mp-libra-rdk-fpsc-lvds-peb-av-10.dtsi      |  196 ++
 .../imx8mp-libra-rdk-fpsc-lvds-peb-av-10.dtso      |    9 +
 ...8mp-libra-rdk-fpsc-lvds-ph128800t006-zhc01.dtso |   44 +
 .../boot/dts/freescale/imx8mp-libra-rdk-fpsc.dts   |    6 +-
 .../imx8mp-phyboard-pollux-peb-wlbt-05.dtso        |  108 +
 .../dts/freescale/imx8mp-phyboard-pollux-rdk.dts   |   33 +-
 .../boot/dts/freescale/imx8mp-phycore-som.dtsi     |    8 +
 arch/arm64/boot/dts/freescale/imx8mp-sr-som.dtsi   |    6 +-
 .../dts/freescale/imx8mp-toradex-smarc-dev.dts     |    4 +
 .../boot/dts/freescale/imx8mp-toradex-smarc.dtsi   |    6 +-
 .../freescale/imx8mp-tqma8mpql-mba8mp-ras314.dts   |   23 +-
 .../dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts    |   31 +-
 .../boot/dts/freescale/imx8mp-var-som-symphony.dts |  145 ++
 arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi  |  331 ++-
 .../boot/dts/freescale/imx8mp-venice-gw71xx.dtsi   |   15 +
 .../boot/dts/freescale/imx8mp-verdin-dahlia.dtsi   |    4 +
 .../boot/dts/freescale/imx8mp-verdin-dev.dtsi      |    4 +
 .../boot/dts/freescale/imx8mp-verdin-mallow.dtsi   |    4 +
 .../boot/dts/freescale/imx8mp-verdin-yavia.dtsi    |    4 +
 arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi   |    4 -
 .../boot/dts/freescale/imx8mq-librem5-devkit.dts   |    2 +-
 arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi  |   73 +-
 arch/arm64/boot/dts/freescale/imx8qm-mek.dts       |   12 +-
 arch/arm64/boot/dts/freescale/imx8qm-ss-ddr.dtsi   |   19 +
 arch/arm64/boot/dts/freescale/imx8qm.dtsi          |   10 +-
 .../dts/freescale/imx8qp-apalis-v1.1-eval-v1.2.dts |   26 +
 .../boot/dts/freescale/imx8qp-apalis-v1.1-eval.dts |   16 +
 .../freescale/imx8qp-apalis-v1.1-ixora-v1.1.dts    |   16 +
 .../freescale/imx8qp-apalis-v1.1-ixora-v1.2.dts    |   16 +
 .../boot/dts/freescale/imx8qp-apalis-v1.1.dtsi     |   16 +
 arch/arm64/boot/dts/freescale/imx8qp.dtsi          |   24 +
 arch/arm64/boot/dts/freescale/imx8qxp-mek.dts      |   38 +-
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi         |   17 +
 arch/arm64/boot/dts/freescale/imx8x-colibri.dtsi   |   31 +-
 arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts  |  181 +-
 arch/arm64/boot/dts/freescale/imx91-11x11-frdm.dts |  906 +++++++
 arch/arm64/boot/dts/freescale/imx91.dtsi           |   58 +
 arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts  |   17 +-
 arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts |  807 ++++++
 arch/arm64/boot/dts/freescale/imx93-14x14-evk.dts  |   74 +
 .../boot/dts/freescale/imx93-9x9-qsb-can1.dtso     |   63 +
 .../boot/dts/freescale/imx93-var-som-symphony.dts  |   84 +
 arch/arm64/boot/dts/freescale/imx93-var-som.dtsi   |    4 +-
 arch/arm64/boot/dts/freescale/imx94.dtsi           |  172 +-
 arch/arm64/boot/dts/freescale/imx943-evk.dts       |  178 ++
 arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts  |   17 +-
 arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts |  964 +++++++
 arch/arm64/boot/dts/freescale/imx95-clock.h        |    1 +
 .../boot/dts/freescale/imx95-toradex-smarc.dtsi    |    2 +-
 .../arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi |    2 +-
 arch/arm64/boot/dts/freescale/imx95.dtsi           |    2 +-
 arch/arm64/boot/dts/freescale/imx952-clock.h       |  215 ++
 arch/arm64/boot/dts/freescale/imx952-evk.dts       |  596 +++++
 arch/arm64/boot/dts/freescale/imx952-pinfunc.h     |  867 +++++++
 arch/arm64/boot/dts/freescale/imx952-power.h       |   44 +
 arch/arm64/boot/dts/freescale/imx952.dtsi          | 1266 ++++++++++
 arch/arm64/boot/dts/freescale/mba8xx.dtsi          |    4 +-
 arch/arm64/boot/dts/freescale/s32g3.dtsi           |    4 +-
 arch/arm64/boot/dts/freescale/s32gxxxa-evb.dtsi    |   20 +-
 arch/arm64/boot/dts/freescale/s32gxxxa-rdb.dtsi    |   20 +-
 .../boot/dts/freescale/tqma8xxs-mb-smarc-2.dtsi    |   12 +-
 arch/arm64/boot/dts/freescale/tqma8xxs.dtsi        |   16 +-
 arch/arm64/boot/dts/intel/Makefile                 |    2 +
 arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi     |  130 +-
 .../dts/intel/socfpga_agilex5_socdk_modular.dts    |  109 +
 arch/arm64/boot/dts/intel/socfpga_agilex_socdk.dts |    2 +-
 .../boot/dts/intel/socfpga_agilex_socdk_emmc.dts   |  105 +
 arch/arm64/boot/dts/intel/socfpga_n5x_socdk.dts    |    4 +-
 arch/arm64/boot/dts/lg/lg131x.dtsi                 |    2 +-
 arch/arm64/boot/dts/marvell/Makefile               |    1 +
 arch/arm64/boot/dts/marvell/armada-3720-db.dts     |    1 +
 .../dts/marvell/armada-3720-espressobin-ultra.dts  |    2 +-
 .../boot/dts/marvell/armada-3720-gl-mv1000.dts     |    9 +-
 arch/arm64/boot/dts/marvell/armada-37xx.dtsi       |    3 +-
 .../boot/dts/marvell/armada-7020-comexpress.dtsi   |  161 ++
 arch/arm64/boot/dts/marvell/armada-70x0.dtsi       |    7 +
 arch/arm64/boot/dts/marvell/armada-8040-db.dts     |    2 +
 arch/arm64/boot/dts/marvell/armada-ap806-dual.dtsi |    4 +-
 arch/arm64/boot/dts/marvell/armada-cp11x.dtsi      |    3 +-
 arch/arm64/boot/dts/marvell/cn9130-cf-base.dts     |    2 +-
 arch/arm64/boot/dts/marvell/cn9130-crb.dtsi        |    3 +-
 arch/arm64/boot/dts/marvell/cn9130-db.dtsi         |    4 +-
 arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dts |    2 +
 .../boot/dts/marvell/cn9131-db-comexpress.dtsi     |    3 +-
 arch/arm64/boot/dts/marvell/cn9131-db.dtsi         |    1 +
 arch/arm64/boot/dts/marvell/cn9132-db.dtsi         |    3 +-
 .../boot/dts/marvell/db-falcon-carrier-a7k.dts     |   27 +
 arch/arm64/boot/dts/marvell/db-falcon-carrier.dtsi |   22 +
 arch/arm64/boot/dts/mediatek/Makefile              |    2 +
 arch/arm64/boot/dts/mediatek/mt6331.dtsi           |    2 +-
 .../boot/dts/mediatek/mt6795-sony-xperia-m5.dts    |   50 +-
 arch/arm64/boot/dts/mediatek/mt6795.dtsi           |    3 +-
 .../boot/dts/mediatek/mt7981b-openwrt-one.dts      |  129 +-
 arch/arm64/boot/dts/mediatek/mt7981b.dtsi          |  220 +-
 arch/arm64/boot/dts/mediatek/mt7986a.dtsi          |    2 +-
 arch/arm64/boot/dts/mediatek/mt7988a.dtsi          |   28 +-
 arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi  |   34 +-
 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi       |  167 +-
 arch/arm64/boot/dts/mediatek/mt8173-evb.dts        |   68 +-
 arch/arm64/boot/dts/mediatek/mt8173.dtsi           |   28 +-
 arch/arm64/boot/dts/mediatek/mt8183-evb.dts        |   36 +-
 .../dts/mediatek/mt8183-kukui-jacuzzi-pico6.dts    |    2 +-
 arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi     |    6 +-
 arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts    |   16 +-
 arch/arm64/boot/dts/mediatek/mt8183.dtsi           |   37 +-
 arch/arm64/boot/dts/mediatek/mt8186-evb.dts        |   13 +
 arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi    |    1 -
 arch/arm64/boot/dts/mediatek/mt8188.dtsi           |   88 +-
 arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi   |    1 -
 arch/arm64/boot/dts/mediatek/mt8192.dtsi           |    2 +-
 arch/arm64/boot/dts/mediatek/mt8195.dtsi           |   85 +
 .../boot/dts/mediatek/mt8370-tungsten-smarc.dts    |   14 +
 .../boot/dts/mediatek/mt8390-genio-common.dtsi     |  150 ++
 .../boot/dts/mediatek/mt8390-tungsten-smarc.dts    |   22 +
 .../boot/dts/mediatek/mt8390-tungsten-smarc.dtsi   | 1489 +++++++++++
 .../boot/dts/mediatek/mt8395-genio-common.dtsi     |  150 ++
 .../boot/dts/mediatek/mt8395-radxa-nio-12l.dts     |  150 ++
 .../arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts |    1 +
 arch/arm64/boot/dts/nuvoton/nuvoton-npcm845.dtsi   |    4 +-
 arch/arm64/boot/dts/nvidia/tegra186.dtsi           |    2 -
 arch/arm64/boot/dts/nvidia/tegra194.dtsi           |   15 -
 arch/arm64/boot/dts/nvidia/tegra210-smaug.dts      |   25 +
 arch/arm64/boot/dts/nvidia/tegra234.dtsi           |   15 -
 arch/arm64/boot/dts/nvidia/tegra264-p3834.dtsi     |    8 +
 arch/arm64/boot/dts/nvidia/tegra264.dtsi           |   64 +-
 arch/arm64/boot/dts/qcom/Makefile                  |   30 +
 arch/arm64/boot/dts/qcom/agatti.dtsi               |  101 +-
 arch/arm64/boot/dts/qcom/glymur-ipcc.h             |   68 +
 arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts         |  273 +-
 arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi        |   80 +-
 arch/arm64/boot/dts/qcom/hamoa.dtsi                |  114 +-
 arch/arm64/boot/dts/qcom/ipq5018.dtsi              |   10 +-
 arch/arm64/boot/dts/qcom/ipq9574.dtsi              |   10 +-
 arch/arm64/boot/dts/qcom/kaanapali-ipcc.h          |   58 +
 arch/arm64/boot/dts/qcom/kaanapali-mtp.dts         |  754 ++++++
 arch/arm64/boot/dts/qcom/kaanapali-qrd.dts         |  712 ++++++
 arch/arm64/boot/dts/qcom/kaanapali.dtsi            | 1606 ++++++++++++
 arch/arm64/boot/dts/qcom/kodiak.dtsi               |   15 +-
 arch/arm64/boot/dts/qcom/lemans-el2.dtso           |   35 +
 arch/arm64/boot/dts/qcom/lemans-evk.dts            |  127 +-
 arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi   |    8 +
 arch/arm64/boot/dts/qcom/lemans.dtsi               |  486 +++-
 arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts   |  790 ++++++
 arch/arm64/boot/dts/qcom/milos.dtsi                | 2633 +++++++++++++=
+++++++
 arch/arm64/boot/dts/qcom/monaco-evk.dts            |  106 +
 arch/arm64/boot/dts/qcom/monaco.dtsi               | 1523 ++++++++++-
 arch/arm64/boot/dts/qcom/msm8916.dtsi              |    8 +-
 arch/arm64/boot/dts/qcom/msm8917.dtsi              |   12 +-
 arch/arm64/boot/dts/qcom/msm8937.dtsi              |   13 +-
 arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts     |   79 +-
 arch/arm64/boot/dts/qcom/msm8939-pm8916.dtsi       |    4 +
 arch/arm64/boot/dts/qcom/msm8939.dtsi              |  146 ++
 arch/arm64/boot/dts/qcom/msm8953.dtsi              |  516 ++--
 arch/arm64/boot/dts/qcom/msm8976.dtsi              |    4 +-
 arch/arm64/boot/dts/qcom/msm8992-lg-bullhead.dtsi  |    2 +-
 .../dts/qcom/msm8994-huawei-angler-rev-101.dts     |    2 +-
 .../boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi  |    2 +-
 arch/arm64/boot/dts/qcom/msm8998.dtsi              |   16 +-
 arch/arm64/boot/dts/qcom/pm7550.dtsi               |   67 +
 arch/arm64/boot/dts/qcom/pm8550vs.dtsi             |    8 +
 arch/arm64/boot/dts/qcom/pmiv0104.dtsi             |   73 +
 arch/arm64/boot/dts/qcom/qcs615-ride.dts           |   30 +
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts       |  128 +
 .../boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts | 1410 +++++++++++
 arch/arm64/boot/dts/qcom/qcs8300-ride.dts          |  126 +
 arch/arm64/boot/dts/qcom/qcs8550-aim300.dtsi       |   16 +
 arch/arm64/boot/dts/qcom/qdu1000.dtsi              |    2 +-
 arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts |  459 ++++
 .../dts/qcom/qrb2210-rb1-vision-mezzanine.dtso     |   66 +
 arch/arm64/boot/dts/qcom/qrb2210-rb1.dts           |   75 +
 arch/arm64/boot/dts/qcom/qrb4210-rb2.dts           |    2 +-
 arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi |    5 +
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi             |    4 +-
 arch/arm64/boot/dts/qcom/sdm630.dtsi               |  146 +-
 arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts  |   57 +
 arch/arm64/boot/dts/qcom/sdm636.dtsi               |   23 +-
 arch/arm64/boot/dts/qcom/sdm660.dtsi               |  163 +-
 arch/arm64/boot/dts/qcom/sdm670.dtsi               |    2 +-
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts         |    8 +-
 .../arm64/boot/dts/qcom/sdm845-google-blueline.dts |   89 +
 arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi |  536 ++++
 .../boot/dts/qcom/sdm845-google-crosshatch.dts     |   36 +
 .../arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi |   45 +-
 .../boot/dts/qcom/sdm845-oneplus-enchilada.dts     |   10 +-
 arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts |    4 +
 .../boot/dts/qcom/sdm845-samsung-starqltechn.dts   |   15 +-
 arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts  |   23 +-
 .../dts/qcom/sdm845-xiaomi-beryllium-common.dtsi   |   49 +-
 arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts |   17 +-
 .../dts/qcom/sdm850-huawei-matebook-e-2019.dts     |   17 +-
 arch/arm64/boot/dts/qcom/sm6115.dtsi               |   12 +-
 arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts  |    2 +-
 arch/arm64/boot/dts/qcom/sm6125.dtsi               |   12 +-
 .../dts/qcom/sm6350-sony-xperia-lena-pdx213.dts    |    2 +-
 arch/arm64/boot/dts/qcom/sm6350.dtsi               |    3 +
 arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts  |   72 +-
 arch/arm64/boot/dts/qcom/sm8150-hdk.dts            |    4 +
 arch/arm64/boot/dts/qcom/sm8150-mtp.dts            |    4 +
 arch/arm64/boot/dts/qcom/sm8150.dtsi               |   11 +-
 arch/arm64/boot/dts/qcom/sm8250-hdk.dts            |    4 +
 .../boot/dts/qcom/sm8550-hdk-rear-camera-card.dtso |    7 +-
 arch/arm64/boot/dts/qcom/sm8550-hdk.dts            |   16 +
 arch/arm64/boot/dts/qcom/sm8550-mtp.dts            |   16 +
 arch/arm64/boot/dts/qcom/sm8550-qrd.dts            |   23 +-
 arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dts    |   16 +
 .../dts/qcom/sm8550-sony-xperia-yodo-pdx234.dts    |   16 +
 .../boot/dts/qcom/sm8650-hdk-rear-camera-card.dtso |   88 +
 arch/arm64/boot/dts/qcom/sm8650-hdk.dts            |   16 +
 arch/arm64/boot/dts/qcom/sm8650-mtp.dts            |   16 +
 arch/arm64/boot/dts/qcom/sm8650-qrd.dts            |   59 +
 arch/arm64/boot/dts/qcom/sm8650.dtsi               |  299 +++
 arch/arm64/boot/dts/qcom/sm8750-mtp.dts            |   33 +-
 arch/arm64/boot/dts/qcom/sm8750-qrd.dts            |   27 +
 arch/arm64/boot/dts/qcom/sm8750.dtsi               | 1563 ++++++++++--
 arch/arm64/boot/dts/qcom/talos.dtsi                |  450 ++--
 arch/arm64/boot/dts/qcom/x1-el2.dtso               |    4 +
 arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi  | 1322 ++++++++++
 arch/arm64/boot/dts/qcom/x1e001de-devkit.dts       |   24 +-
 .../dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi    |  153 +-
 .../boot/dts/qcom/x1e80100-asus-vivobook-s15.dts   |  410 ++-
 .../boot/dts/qcom/x1e80100-asus-zenbook-a14.dts    |    3 +
 .../boot/dts/qcom/x1e80100-dell-xps13-9345.dts     |   14 +-
 .../boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts  |    8 +-
 .../dts/qcom/x1e80100-medion-sprchrgd-14-s1.dts    | 1515 +++++++++++
 .../dts/qcom/x1e80100-microsoft-denali-oled.dts    |   19 +
 .../boot/dts/qcom/x1e80100-microsoft-romulus.dtsi  |   19 +-
 arch/arm64/boot/dts/qcom/x1e80100-qcp.dts          |   21 +-
 .../boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts |   90 +
 .../boot/dts/qcom/x1p64100-microsoft-denali.dts    |   15 +
 arch/arm64/boot/dts/realtek/Makefile               |    7 +-
 arch/arm64/boot/dts/realtek/kent.dtsi              |  166 ++
 arch/arm64/boot/dts/realtek/rtd1501.dtsi           |   12 +
 .../boot/dts/realtek/rtd1501s-phantom-8gb.dts      |   25 +
 arch/arm64/boot/dts/realtek/rtd1501s-phantom.dtsi  |  118 +
 arch/arm64/boot/dts/realtek/rtd1861.dtsi           |   12 +
 .../boot/dts/realtek/rtd1861b-krypton-8gb.dts      |   25 +
 arch/arm64/boot/dts/realtek/rtd1861b-krypton.dtsi  |   72 +
 arch/arm64/boot/dts/realtek/rtd1920.dtsi           |   12 +
 .../boot/dts/realtek/rtd1920s-smallville-4gb.dts   |   23 +
 .../boot/dts/realtek/rtd1920s-smallville.dtsi      |  128 +
 .../arm64/boot/dts/renesas/beacon-renesom-som.dtsi |    2 +-
 arch/arm64/boot/dts/renesas/condor-common.dtsi     |    9 +-
 arch/arm64/boot/dts/renesas/draak.dtsi             |    2 +-
 arch/arm64/boot/dts/renesas/ebisu.dtsi             |    2 +-
 arch/arm64/boot/dts/renesas/gmsl-cameras.dtsi      |  332 ---
 arch/arm64/boot/dts/renesas/hihope-rev4.dtsi       |    2 +-
 arch/arm64/boot/dts/renesas/r8a774a1.dtsi          |   52 +-
 arch/arm64/boot/dts/renesas/r8a774b1.dtsi          |   52 +-
 arch/arm64/boot/dts/renesas/r8a774e1.dtsi          |   52 +-
 arch/arm64/boot/dts/renesas/r8a77951.dtsi          |   52 +-
 arch/arm64/boot/dts/renesas/r8a77960.dtsi          |   52 +-
 arch/arm64/boot/dts/renesas/r8a77961.dtsi          |   52 +-
 arch/arm64/boot/dts/renesas/r8a77965.dtsi          |   52 +-
 arch/arm64/boot/dts/renesas/r8a77970-eagle.dts     |    4 +-
 arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts     |    4 +-
 arch/arm64/boot/dts/renesas/r8a77970.dtsi          |   32 +
 arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dts     |    9 +-
 arch/arm64/boot/dts/renesas/r8a77980.dtsi          |   89 +
 arch/arm64/boot/dts/renesas/r8a779a0.dtsi          |  160 ++
 arch/arm64/boot/dts/renesas/r8a779f0.dtsi          |  160 ++
 arch/arm64/boot/dts/renesas/r8a779g0.dtsi          |  112 +
 arch/arm64/boot/dts/renesas/r8a779h0.dtsi          |  112 +
 arch/arm64/boot/dts/renesas/r8a779m0.dtsi          |   12 -
 arch/arm64/boot/dts/renesas/r8a779m2.dtsi          |   12 -
 arch/arm64/boot/dts/renesas/r8a779m4.dtsi          |   12 -
 arch/arm64/boot/dts/renesas/r8a779m6.dtsi          |   12 -
 arch/arm64/boot/dts/renesas/r8a779m7.dtsi          |   12 -
 arch/arm64/boot/dts/renesas/r8a779m8.dtsi          |   17 -
 arch/arm64/boot/dts/renesas/r8a779mb.dtsi          |   12 -
 arch/arm64/boot/dts/renesas/r9a07g044.dtsi         |    2 +-
 arch/arm64/boot/dts/renesas/r9a07g044c1.dtsi       |   25 -
 arch/arm64/boot/dts/renesas/r9a07g044l1.dtsi       |   18 -
 arch/arm64/boot/dts/renesas/r9a07g054.dtsi         |    2 +-
 arch/arm64/boot/dts/renesas/r9a07g054l1.dtsi       |   18 -
 arch/arm64/boot/dts/renesas/r9a08g045.dtsi         |   65 +
 arch/arm64/boot/dts/renesas/r9a09g047.dtsi         |  250 ++
 arch/arm64/boot/dts/renesas/r9a09g047e37.dtsi      |   18 -
 arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts |   75 +-
 arch/arm64/boot/dts/renesas/r9a09g056.dtsi         |  794 ++++++
 .../boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts    |   97 +
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi         |  429 ++++
 .../boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts    |  103 +-
 arch/arm64/boot/dts/renesas/r9a09g057h48-kakip.dts |   41 +-
 arch/arm64/boot/dts/renesas/r9a09g077.dtsi         |  334 +++
 .../boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts    |  112 +-
 arch/arm64/boot/dts/renesas/r9a09g087.dtsi         |  334 +++
 .../boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts    |  189 +-
 arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi    |   21 +-
 arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi   |   18 +
 arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi   |    5 +
 arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi       |   11 +
 .../boot/dts/renesas/rzt2h-n2h-evk-common.dtsi     |  161 +-
 arch/arm64/boot/dts/renesas/salvator-common.dtsi   |    4 +-
 arch/arm64/boot/dts/renesas/ulcb.dtsi              |    2 +-
 arch/arm64/boot/dts/rockchip/Makefile              |   15 +
 .../rockchip/rk3368-lion-haikou-video-demo.dtso    |  170 ++
 .../arm64/boot/dts/rockchip/rk3368-lion-haikou.dts |   38 +-
 arch/arm64/boot/dts/rockchip/rk3368-lion.dtsi      |   27 +-
 arch/arm64/boot/dts/rockchip/rk3368.dtsi           |   51 +
 .../boot/dts/rockchip/rk3399-pinebook-pro.dts      |    4 -
 .../boot/dts/rockchip/rk3399-pinephone-pro.dts     |   47 +-
 .../arm64/boot/dts/rockchip/rk3399-roc-pc-plus.dts |    4 +
 arch/arm64/boot/dts/rockchip/rk3399-roc-pc.dtsi    |    1 -
 .../boot/dts/rockchip/rk3399-rock-4c-plus.dts      |    8 +
 arch/arm64/boot/dts/rockchip/rk3399-rock-4se.dts   |   12 +
 arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4.dtsi |    8 +
 .../boot/dts/rockchip/rk3399-rockpro64-v2.dts      |    7 +
 arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dts  |    7 +
 .../boot/dts/rockchip/rk3528-armsom-sige1.dts      |   18 +
 arch/arm64/boot/dts/rockchip/rk3566-pinenote.dtsi  |   49 +
 arch/arm64/boot/dts/rockchip/rk3566-qnap-ts133.dts |   71 +
 arch/arm64/boot/dts/rockchip/rk3566-rock-3c.dts    |    1 +
 .../boot/dts/rockchip/rk3568-anbernic-rg-ds.dts    | 1237 +++++++++
 arch/arm64/boot/dts/rockchip/rk3568-qnap-ts233.dts |   18 +-
 arch/arm64/boot/dts/rockchip/rk3568-qnap-ts433.dts |   18 +-
 .../arm64/boot/dts/rockchip/rk3568-qnap-tsx33.dtsi |   21 +-
 .../arm64/boot/dts/rockchip/rk3568-radxa-cm3i.dtsi |   10 +-
 .../dts/rockchip/rk3568-radxa-cm3j-rpi-cm4.dts     |  204 ++
 .../arm64/boot/dts/rockchip/rk3568-radxa-cm3j.dtsi |  558 +++++
 arch/arm64/boot/dts/rockchip/rk3568-rock-3a.dts    |    8 +
 arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts    |    8 +
 arch/arm64/boot/dts/rockchip/rk3568.dtsi           |    4 +-
 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi      |    2 +-
 .../boot/dts/rockchip/rk3576-armsom-sige5.dts      |   19 +-
 .../boot/dts/rockchip/rk3576-evb1-v10-pcie1.dtso   |   31 +
 arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts   |  129 +
 .../boot/dts/rockchip/rk3576-luckfox-core3576.dtsi |    8 +
 arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dts  |   34 +-
 .../arm64/boot/dts/rockchip/rk3576-nanopi-r76s.dts |   23 +-
 arch/arm64/boot/dts/rockchip/rk3576-pinctrl.dtsi   |    7 +
 arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts    |   14 +
 arch/arm64/boot/dts/rockchip/rk3576.dtsi           |   42 +-
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi      |   78 +-
 arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts   |    7 +-
 arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi     |    6 +-
 .../rockchip/rk3588-friendlyelec-cm3588-nas.dts    |   38 +
 .../dts/rockchip/rk3588-friendlyelec-cm3588.dtsi   |   35 +-
 arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts     |   35 +-
 arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi |   36 +-
 arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts |   23 +
 .../boot/dts/rockchip/rk3588-rock-5b-plus.dts      |   10 +
 arch/arm64/boot/dts/rockchip/rk3588-rock-5t.dts    |   10 +
 arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi     |   35 +-
 .../arm64/boot/dts/rockchip/rk3588-turing-rk1.dtsi |   35 +-
 .../boot/dts/rockchip/rk3588s-gameforce-ace.dts    |   63 +
 .../dts/rockchip/rk3588s-orangepi-cm5-base.dts     |  355 +++
 .../boot/dts/rockchip/rk3588s-orangepi-cm5.dtsi    |  472 ++++
 .../boot/dts/rockchip/rk3588s-radxa-cm5-io.dts     |  339 +++
 .../arm64/boot/dts/rockchip/rk3588s-radxa-cm5.dtsi |  280 +++
 arch/arm64/boot/dts/rockchip/rk3588s-rock-5a.dts   |    1 +
 arch/arm64/boot/dts/rockchip/rk3588s-rock-5c.dts   |    1 +
 arch/arm64/boot/dts/sprd/sc9860.dtsi               |    7 +-
 arch/arm64/boot/dts/sprd/sc9863a.dtsi              |    4 +-
 arch/arm64/boot/dts/sprd/sharkl64.dtsi             |    2 +-
 arch/arm64/boot/dts/sprd/whale2.dtsi               |    8 +-
 arch/arm64/boot/dts/st/stm32mp21xc.dtsi            |    8 -
 arch/arm64/boot/dts/st/stm32mp231.dtsi             |   19 +-
 arch/arm64/boot/dts/st/stm32mp235f-dk.dts          |   21 +-
 arch/arm64/boot/dts/st/stm32mp23xc.dtsi            |    8 -
 arch/arm64/boot/dts/st/stm32mp251.dtsi             |   30 +-
 arch/arm64/boot/dts/st/stm32mp257f-dk.dts          |   28 +-
 arch/arm64/boot/dts/st/stm32mp257f-ev1.dts         |   39 +-
 arch/arm64/boot/dts/st/stm32mp25xc.dtsi            |    8 -
 arch/arm64/boot/dts/st/stm32mp25xxal-pinctrl.dtsi  |   71 -
 arch/arm64/boot/dts/ti/k3-am62-lp-sk-nand.dtso     |    2 +-
 arch/arm64/boot/dts/ti/k3-am62-phycore-som.dtsi    |    8 +
 arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi   |    8 +
 arch/arm64/boot/dts/ti/k3-am62d2-evm.dts           |    2 +-
 .../boot/dts/ti/k3-am62p-j722s-common-main.dtsi    |   17 +
 arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi        |    4 +-
 arch/arm64/boot/dts/ti/k3-am62p.dtsi               |    1 +
 arch/arm64/boot/dts/ti/k3-am62p5-sk.dts            |    2 +-
 .../boot/dts/ti/k3-am62p5-var-som-symphony.dts     |    4 +-
 arch/arm64/boot/dts/ti/k3-am64-main.dtsi           |   18 +-
 .../ti/k3-am642-phyboard-electra-peb-c-010.dtso    |    7 +-
 .../boot/dts/ti/k3-am642-phyboard-electra-rdk.dts  |    6 +-
 ...m642-phyboard-electra-x27-gpio1-spi1-uart3.dtso |   12 +-
 .../dts/ti/k3-am65-iot2050-arduino-connector.dtsi  |   58 +-
 arch/arm64/boot/dts/ti/k3-am65-iot2050-common.dtsi |    2 +-
 arch/arm64/boot/dts/ti/k3-am65-main.dtsi           |    4 +-
 arch/arm64/boot/dts/ti/k3-am654-base-board.dts     |    2 +-
 .../boot/dts/ti/k3-am67a-kontron-sa67-base.dts     |    4 +-
 arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dts   |   14 +-
 arch/arm64/boot/dts/ti/k3-am69-aquila-clover.dts   |    7 +-
 arch/arm64/boot/dts/ti/k3-am69-aquila-dev.dts      |    4 +-
 arch/arm64/boot/dts/ti/k3-am69-aquila.dtsi         |    6 +-
 arch/arm64/boot/dts/ti/k3-am69-sk.dts              |   26 +-
 arch/arm64/boot/dts/ti/k3-j7200-mcu-wakeup.dtsi    |    4 +-
 arch/arm64/boot/dts/ti/k3-j721e-sk.dts             |   24 +-
 arch/arm64/boot/dts/ti/k3-j721e.dtsi               |    4 +-
 arch/arm64/boot/dts/ti/k3-j721s2-mcu-wakeup.dtsi   |   19 +-
 arch/arm64/boot/dts/ti/k3-j722s-evm.dts            |    2 +-
 arch/arm64/boot/dts/ti/k3-j722s-main.dtsi          |    5 +
 arch/arm64/boot/dts/ti/k3-j722s.dtsi               |    3 +-
 arch/arm64/boot/dts/ti/k3-j742s2-mcu-wakeup.dtsi   |    4 +
 .../boot/dts/ti/k3-j784s4-j742s2-evm-common.dtsi   |    4 +-
 .../boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi  |   36 -
 .../dts/ti/k3-j784s4-j742s2-mcu-wakeup-common.dtsi |   17 +
 arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi         |   58 +-
 arch/arm64/boot/dts/toshiba/tmpv7708-rm-mbrc.dts   |    2 +-
 .../boot/dts/toshiba/tmpv7708-visrobo-vrb.dts      |    2 +-
 .../boot/dts/toshiba/tmpv7708-visrobo-vrc.dtsi     |    2 +-
 arch/arm64/boot/dts/toshiba/tmpv7708.dtsi          |    4 +-
 arch/arm64/boot/dts/toshiba/tmpv7708_pins.dtsi     |    2 +-
 arch/arm64/boot/dts/xilinx/versal-net.dtsi         |    4 +-
 arch/arm64/boot/dts/xilinx/zynqmp-clk-ccf.dtsi     |    2 +-
 .../boot/dts/xilinx/zynqmp-sck-kd-g-revA.dtso      |    7 -
 .../boot/dts/xilinx/zynqmp-sck-kr-g-revA.dtso      |    7 -
 .../boot/dts/xilinx/zynqmp-sck-kr-g-revB.dtso      |    7 -
 .../boot/dts/xilinx/zynqmp-sck-kv-g-revA.dtso      |    6 -
 .../boot/dts/xilinx/zynqmp-sck-kv-g-revB.dtso      |    6 -
 arch/arm64/boot/dts/xilinx/zynqmp.dtsi             |   25 +-
 .../dts/allwinner/sun20i-d1-lichee-rv-dock.dts     |   12 +
 arch/riscv/boot/dts/allwinner/sun20i-d1-nezha.dts  |   13 +
 arch/riscv/boot/dts/allwinner/sun20i-d1.dtsi       |    6 +
 arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi      |   31 +
 arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi  |   31 +
 arch/riscv/boot/dts/anlogic/dr1v90.dtsi            |    5 +-
 arch/riscv/boot/dts/microchip/mpfs.dtsi            |   34 +-
 arch/riscv/boot/dts/renesas/r9a07g043f.dtsi        |    3 +-
 arch/riscv/boot/dts/sophgo/cv180x.dtsi             |    4 +-
 arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi        |  305 +++
 .../riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts |   21 +
 arch/riscv/boot/dts/sophgo/sg2042.dtsi             |  479 +---
 arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi        |  256 +-
 arch/riscv/boot/dts/spacemit/Makefile              |    1 +
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts    |   90 +
 arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts  |  135 +
 arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts   |    2 +
 arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts   |    2 +
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi       |   33 +
 arch/riscv/boot/dts/spacemit/k1.dtsi               |  254 +-
 arch/riscv/boot/dts/spacemit/k3-pico-itx.dts       |   29 +
 arch/riscv/boot/dts/spacemit/k3.dtsi               |  578 +++++
 .../jh7110-starfive-visionfive-2-lite-emmc.dts     |    2 +-
 .../starfive/jh7110-starfive-visionfive-2-lite.dts |    2 +-
 drivers/firmware/qcom/qcom_scm.c                   |    1 +
 include/dt-bindings/clock/google,gs101.h           |   36 +
 include/dt-bindings/clock/qcom,gcc-msm8917.h       |    1 +
 include/dt-bindings/clock/qcom,x1e80100-gcc.h      |    3 +
 .../dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h |    3 +
 .../dt-bindings/clock/renesas,r9a09g087-cpg-mssr.h |    3 +
 777 files changed, 52320 insertions(+), 5640 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/intel,socfpga.=
yaml
 create mode 100644 Documentation/devicetree/bindings/iommu/nvidia,tegra=
264-cmdqv.yaml
 create mode 100644 Documentation/devicetree/bindings/mtd/nvidia,tegra20=
-nand.yaml
 delete mode 100644 Documentation/devicetree/bindings/mtd/nvidia-tegra20=
-nand.txt
 create mode 100644 Documentation/devicetree/bindings/soc/renesas/renesa=
s,rzn1-gpioirqmux.yaml
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-altrad8.d=
ts
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa=
.dts
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-msx4-bmc.=
dts
 create mode 100644 arch/arm/boot/dts/microchip/lan966x-pcb8385.dts
 delete mode 100644 arch/arm/boot/dts/microchip/usb_a9g20-dab-mmx.dtsi
 delete mode 100644 arch/arm/boot/dts/renesas/gr-peach-audiocamerashield=
.dtsi
 delete mode 100644 arch/arm/boot/dts/renesas/r8a77xx-aa121td01-panel.dt=
si
 delete mode 100644 arch/arm/boot/dts/samsung/s3c6400.dtsi
 delete mode 100644 arch/arm/boot/dts/st/spear320s.dtsi
 delete mode 100644 arch/arm/boot/dts/st/stm32mp15xxab-pinctrl.dtsi
 delete mode 100644 arch/arm/boot/dts/ti/omap/am335x-base0033.dts
 delete mode 100644 arch/arm/boot/dts/ti/omap/am3703.dtsi
 delete mode 100644 arch/arm/boot/dts/ti/omap/am3715.dtsi
 delete mode 100644 arch/arm/boot/dts/ti/omap/omap3430es1-clocks.dtsi
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-s4-s905y4-khadas-v=
im1s.dts
 delete mode 100644 arch/arm64/boot/dts/broadcom/northstar2/ns2-clock.dt=
si
 delete mode 100644 arch/arm64/boot/dts/broadcom/stingray/stingray-clock=
.dtsi
 delete mode 100644 arch/arm64/boot/dts/cavium/thunder2-99xx.dts
 delete mode 100644 arch/arm64/boot/dts/cavium/thunder2-99xx.dtsi
 create mode 100644 arch/arm64/boot/dts/cix/sky1-xcp.dts
 create mode 100644 arch/arm64/boot/dts/freescale/fsl-ls1028a-tqmls1028a=
-mbls1028a-ind.dts
 create mode 100644 arch/arm64/boot/dts/freescale/fsl-ls1028a-tqmls1028a=
-mbls1028a.dts
 create mode 100644 arch/arm64/boot/dts/freescale/fsl-ls1028a-tqmls1028a=
-mbls1028a.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/fsl-ls1028a-tqmls1028a=
.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mn-vhip4-evalboard=
-common.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mn-vhip4-evalboard=
-ksz8794-common.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mn-vhip4-evalboard=
-v1-overlay-ksz8794.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mn-vhip4-evalboard=
-v1-overlay-ksz9031.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mn-vhip4-evalboard=
-v1.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mn-vhip4-evalboard=
-v2-overlay-adin1300.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mn-vhip4-evalboard=
-v2-overlay-ksz8794.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mn-vhip4-evalboard=
-v2.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-frdm.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-libra-rdk-fpsc-=
lvds-peb-av-10.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-libra-rdk-fpsc-=
lvds-peb-av-10.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-libra-rdk-fpsc-=
lvds-ph128800t006-zhc01.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux=
-peb-wlbt-05.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qm-ss-ddr.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qp-apalis-v1.1-eva=
l-v1.2.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qp-apalis-v1.1-eva=
l.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qp-apalis-v1.1-ixo=
ra-v1.1.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qp-apalis-v1.1-ixo=
ra-v1.2.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qp-apalis-v1.1.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qp.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx91-11x11-frdm.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-9x9-qsb-can1.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx952-clock.h
 create mode 100644 arch/arm64/boot/dts/freescale/imx952-evk.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx952-pinfunc.h
 create mode 100644 arch/arm64/boot/dts/freescale/imx952-power.h
 create mode 100644 arch/arm64/boot/dts/freescale/imx952.dtsi
 create mode 100644 arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_modu=
lar.dts
 create mode 100644 arch/arm64/boot/dts/intel/socfpga_agilex_socdk_emmc.=
dts
 create mode 100644 arch/arm64/boot/dts/marvell/armada-7020-comexpress.d=
tsi
 create mode 100644 arch/arm64/boot/dts/marvell/db-falcon-carrier-a7k.dts
 create mode 100644 arch/arm64/boot/dts/marvell/db-falcon-carrier.dtsi
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8370-tungsten-smarc.d=
ts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.d=
ts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.d=
tsi
 create mode 100644 arch/arm64/boot/dts/qcom/glymur-ipcc.h
 create mode 100644 arch/arm64/boot/dts/qcom/kaanapali-ipcc.h
 create mode 100644 arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
 create mode 100644 arch/arm64/boot/dts/qcom/kaanapali-qrd.dts
 create mode 100644 arch/arm64/boot/dts/qcom/kaanapali.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/lemans-el2.dtso
 create mode 100644 arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
 create mode 100644 arch/arm64/boot/dts/qcom/milos.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/pm7550.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/pmiv0104.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi=
3.dts
 create mode 100644 arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
 create mode 100644 arch/arm64/boot/dts/qcom/qrb2210-rb1-vision-mezzanin=
e.dtso
 create mode 100644 arch/arm64/boot/dts/qcom/sdm845-google-blueline.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sdm845-google-crosshatch.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sm8650-hdk-rear-camera-card=
.dtso
 create mode 100644 arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/x1e80100-medion-sprchrgd-14=
-s1.dts
 create mode 100644 arch/arm64/boot/dts/qcom/x1e80100-microsoft-denali-o=
led.dts
 create mode 100644 arch/arm64/boot/dts/qcom/x1p64100-microsoft-denali.d=
ts
 create mode 100644 arch/arm64/boot/dts/realtek/kent.dtsi
 create mode 100644 arch/arm64/boot/dts/realtek/rtd1501.dtsi
 create mode 100644 arch/arm64/boot/dts/realtek/rtd1501s-phantom-8gb.dts
 create mode 100644 arch/arm64/boot/dts/realtek/rtd1501s-phantom.dtsi
 create mode 100644 arch/arm64/boot/dts/realtek/rtd1861.dtsi
 create mode 100644 arch/arm64/boot/dts/realtek/rtd1861b-krypton-8gb.dts
 create mode 100644 arch/arm64/boot/dts/realtek/rtd1861b-krypton.dtsi
 create mode 100644 arch/arm64/boot/dts/realtek/rtd1920.dtsi
 create mode 100644 arch/arm64/boot/dts/realtek/rtd1920s-smallville-4gb.=
dts
 create mode 100644 arch/arm64/boot/dts/realtek/rtd1920s-smallville.dtsi
 delete mode 100644 arch/arm64/boot/dts/renesas/gmsl-cameras.dtsi
 delete mode 100644 arch/arm64/boot/dts/renesas/r8a779m0.dtsi
 delete mode 100644 arch/arm64/boot/dts/renesas/r8a779m2.dtsi
 delete mode 100644 arch/arm64/boot/dts/renesas/r8a779m4.dtsi
 delete mode 100644 arch/arm64/boot/dts/renesas/r8a779m6.dtsi
 delete mode 100644 arch/arm64/boot/dts/renesas/r8a779m7.dtsi
 delete mode 100644 arch/arm64/boot/dts/renesas/r8a779m8.dtsi
 delete mode 100644 arch/arm64/boot/dts/renesas/r8a779mb.dtsi
 delete mode 100644 arch/arm64/boot/dts/renesas/r9a07g044c1.dtsi
 delete mode 100644 arch/arm64/boot/dts/renesas/r9a07g044l1.dtsi
 delete mode 100644 arch/arm64/boot/dts/renesas/r9a07g054l1.dtsi
 delete mode 100644 arch/arm64/boot/dts/renesas/r9a09g047e37.dtsi
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3368-lion-haikou-vide=
o-demo.dtso
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3566-qnap-ts133.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3568-anbernic-rg-ds.d=
ts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3568-radxa-cm3j-rpi-c=
m4.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3568-radxa-cm3j.dtsi
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3576-evb1-v10-pcie1.d=
tso
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588s-orangepi-cm5-ba=
se.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588s-orangepi-cm5.dt=
si
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588s-radxa-cm5-io.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588s-radxa-cm5.dtsi
 delete mode 100644 arch/arm64/boot/dts/st/stm32mp21xc.dtsi
 delete mode 100644 arch/arm64/boot/dts/st/stm32mp23xc.dtsi
 delete mode 100644 arch/arm64/boot/dts/st/stm32mp25xc.dtsi
 delete mode 100644 arch/arm64/boot/dts/st/stm32mp25xxal-pinctrl.dtsi
 create mode 100644 arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
 create mode 100644 arch/riscv/boot/dts/spacemit/k3.dtsi
