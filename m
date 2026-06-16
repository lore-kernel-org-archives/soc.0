Received: from fout-b2-smtp.messagingengine.com (fout-b2-smtp.messagingengine.com [202.12.124.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 091DD40E8DC
	for <soc@lists.linux.dev>; Tue, 16 Jun 2026 07:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781596322; cv=none; b=BnN2Ec+EB/LRr5kHL9wo5jyMAPhfiZyvwHllsvNaAjpopJASQkRCHeaM+HpFkwP7Y6DvpAjxB/2JvwFpsHeD/OkvqX27jFZLLF9X3hjov/HkfsypAqAoD0M5RR5cWqeQWVutygcmekgKN0tcT9fvQdELt7rKBASGr+k9idOhlog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781596322; c=relaxed/simple;
	bh=SdBHYNqeZMqTx5jb6Ss48FQlic5kVSpadOIdylz+9sY=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=paB20uQqXTCmZ+k00Eq/aJ18yKSnz1G0Fm3MMeMtYxjO/OuemXn3TAw4zHUkiKtBNpi6sWH5A0BRm7GGafbPKjviOnBlyphrKlL8NI+gxnXwTq7nCOi/coDDw6UgMrEnRAb6Cm/7fOrs8eQIL0OJ5vmMWZtfDu7Cg+yOypHhoGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=jM5SUnoC; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=PUeEvbAt; arc=none smtp.client-ip=202.12.124.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="jM5SUnoC";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="PUeEvbAt"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id 1E1911D001AE;
	Tue, 16 Jun 2026 03:51:56 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Tue, 16 Jun 2026 03:51:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1781596315;
	 x=1781682715; bh=F565cvZXKVxXnHPG6hhlup/ncvWY0cKVgt/aIQka9Fw=; b=
	jM5SUnoCciO5kHQABj0n3nW5UOLUM52+1+1mPGPZIR6EYuf+WozQ8jKVKmbIGOUq
	mVicH+TaQ/G+luJO5klro+ambztPLyRxF41r3X37+aGd8w9YhvSnMEiEBXVpXBAC
	+ldo9wE1Fbdh7740ZW6wr3sdwiUv42t+bp5neSJu0BayjREgZGgeL2NCGBerexpC
	CUBQAWUKAe3SMBWXntTG+esOFgUqym/+XTOnMGIEYyHgI8Xh1Ev7iD39fr/pplav
	5Dn+PMVRdiVw8C1QbQpp2PHvD/f0XWzxC3kE1bXu+7vySQhEiGjXKCDTD6acJbVO
	gAr/ggA+Rr7/YkroZd/Odg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1781596315; x=
	1781682715; bh=F565cvZXKVxXnHPG6hhlup/ncvWY0cKVgt/aIQka9Fw=; b=P
	UeEvbAt9bRgqwD0uw8qZHEPysTtUsi6FXsgEo719tTAEi/XgTllpCG8/hKjubckG
	NRlQ+mQ7XykpdWWnEdHxHrRUboLWfmf8kfHSk2C/IVSF+v7knv6e5dh2IUjiCZeE
	kFrZkKt2GaXZj8yrZpUo4C7wK/MOC4+90ZYZrSc4DmjrwEvdHNfWcJCXv3w0gyKY
	YSgRB+Qqo100XrQ3ts8l+aSFALLm9nape94JJE/oq5awhxO39tR8/QfLxixxdZp4
	j2UBBRrBLVvPFC97rAPXb6DupEgmlOlVBe09U4wfDDLC1q5L4afDXP5ZXgyqasrb
	HZKSETfSy+AErWMyRQ1lA==
X-ME-Sender: <xms:mwAxamE-EtESTf64V9dyhyNFdSm69JZ_yb7MO2xTSh4Y1OvMeCXBqw>
    <xme:mwAxaiKJyuMpAVG8vnsmw18iRn_GdUzLZxbSWnqnT-RL-nUa_eJMc3xS9nKFsR6cs
    1cFbpKrkO1dwQ8xi0iO7jCp7TEW5hRcmq_Vlig5K-40TsHN1VEe8rE>
X-ME-Proxy-Cause: dmFkZTGSQ9eA2y43kTz+xTjmAOutsT6GiIFEilCuOfLZHsFxL1reanwAE00kKX4tfmTOil
    JIt5NT/Vjnj8BbfugAYcDkKDhPnJ80beSYPPnb6BY+7AqbZpUul+gKD9xuIGB4DVEfsYvJ
    UqWIrQPbrm30fL71QNtk+aolZ8AKCUN98FS4RTx1+LGj0qUTXk5Y0BxsjxRHLhyeKI96Dx
    fZ9rvc4TgZk3NKV4kpcHsWn95pBfhsFYCZDRZodgMkrf2bP9L5n8RqW6mJYChDOZTG6qyN
    o4Ssn5NFDGHouWPVXqGdJ9W1Zs8IaEwqj6nGSsvkumrUUusZsmJkNO4GGVYC98b7uh9nek
    Hj91OxM0G2VCO1SBSDskjmEM/niz/tasK/LeQjXey5BH/Jz33Q4RyjVooazTtnKKOUq7Ko
    0pn+MQXJkD6P1JGt3rC5q7X5ch2Aj7MUU7Xl8IvdVw2nqk7pxSt/CWDtsn+PLSLkNQLzBu
    N1i7rFbAydXWaMB+Zj4uYUnlEcGKe2NWaENCuYVqOnV3iDY8DyUymAt0Ed5yUbcAhO/bB6
    3MpbLHf9yLrd6d4syAEw7VNAHGt6kxIpcWP8qz+HC1bhopwUO3Q1GNP6zGj8cJexaFTjVT
    Z7NbtZieyWVkDyP1c42st6zvLUMxNa4Z1qnPMX2jNrmJCdEllggROXKhTHTA
X-ME-Proxy: <xmx:mwAxapotUAO1oo589qZc63fUSS-4u0aTF-ack-Or9S386qe9LO4pew>
    <xmx:mwAxat7K4QZyGIntj-yK4czPwc3Y4h_HkHrLLrQaN1kHXkFEYY_oMw>
    <xmx:mwAxaoewUj5TGSCh4SDltx9PuoLkq50JdkYpGXUC0gho4yzVBqASNg>
    <xmx:mwAxaq7h8TD9u7zKD6z7cRHRuGj2hBMW8kV9lOriExY5PzopYbSCVQ>
    <xmx:mwAxajPIOlLgExpypu_4kwrk3a66LhYAsOZ1SVwxJsVWp_jd2aBXmKaY>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 9112B182007E; Tue, 16 Jun 2026 03:51:55 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Tue, 16 Jun 2026 09:51:35 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
Cc: soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 "Krzysztof Kozlowski" <krzk@kernel.org>, "Linus Walleij" <linusw@kernel.org>,
 linux-kernel@vger.kernel.org
Message-Id: <ef5fa237-1d2f-4c1d-8940-0e8c6c156759@app.fastmail.com>
In-Reply-To: <40c8ebc3-d681-4dcf-b3f2-ce0d780c539e@app.fastmail.com>
References: <40c8ebc3-d681-4dcf-b3f2-ce0d780c539e@app.fastmail.com>
Subject: [GIT PULL 1/4] soc: devicetree updates for 7.2
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The following changes since commit 5d6919055dec134de3c40167a490f33c74c12=
581:

  Linux 7.1-rc3 (2026-05-10 14:08:09 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-d=
t-7.2

for you to fetch changes up to 9e84fd546dc3f9f97bfbf2717c2d71d878a4f46f:

  arm64: dts: aspeed: Fix duplicate pinctrl labels and address scheme (2=
026-06-12 12:39:49 +0200)

----------------------------------------------------------------
soc: devicetree updates for 7.2

There are fewer devicetree updates this time that the last few ones, with
five SoC types getting added:

 - Qualcomm Dragonwing IPQ9650 is a new wireless networking SoC using
   four Cortex-A55 and one Cortex-A78 core, which is a significant
   upgrade from older generations

 - ZTE zx297520v3 is an older low-end wireless SoC using a single
   Cortex-A53 core, which so far can only run 32-bit kernels.  This brin=
gs
   back the ZX family of chips that was removed in 2021 after support
   for the original zx296702 and zx296718 chips was never completed.

 - Renesas R-Car M3Le (R8A779MD) is a variant of the R-Car M3-N (R8A7796=
5)
   automotive SoC.

 - Apple t8122 (M3) is the 2023 generation of their laptop SoCs,
   which has now been reverse-engineered to the point of having initial
   kernel support for five laptop models.

 - ASPEED AST27xx is their first baseboard managment controller using
   a 64-bit core, the Cortex-A35, following earlier generations using
   ARMv5/v6/v7 CPUs.

These all come with one or more initial boards, and in total there
are 39 new boards getting added across SoC families, including:

 - Two NAS boxes using the old Cortina Systems Gemini SoC based on
   an ARMv4 FA526 CPU core

 - 18 industrial embedded boards using NXP i.MX6/8/9 and LX2160A
   SoCs from Variscite, Toradex and SolidRun, plus a number of
   overlays for combinations with additional boards

 - One new carrier board and SoM using TI K3 AM62x, in addition to
   new overlays for older SoMs

 - Two new boards using Spacemit K3 (no relation with TI) RISC-V
   SoCs.

 - Three phones from Google, Nothing and Motorola, all using Qualcomm
   Snapdragon SoCs

 - AST26xx BMC support for two server boards

While there is still a significant number of patches improving hardware
support for the existing boards across vendors (NXP, Qualcomm, Renesas,
Rockchips, Mediatek, ...), a much smaller number of cleanups and warning
fixes have made it in this time.

----------------------------------------------------------------
Aaron Kling (3):
      arm64: dts: qcom: sm8550: add cpu OPP table with DDR, LLCC & L3 ba=
ndwidths
      Revert "arm64: tegra: Disable ISO SMMU for Tegra194"
      arm64: tegra: Enable SMMU on Tegra194 display controllers

Aastha Pandey (1):
      arm64: dts: qcom: sm8750: Enable cpufreq cooling devices

Abel Vesa (9):
      arm64: dts: qcom: hamoa: Fix OPP tables for all DisplayPort contro=
llers
      arm64: dts: qcom: glymur-crd: Enable LID sensor
      arm64: dts: qcom: glymur-crd: Drop forced host mode for USB SS0 an=
d SS1
      arm64: dts: qcom: glymur: Mark USB SS1 and SS2 as role-switch capa=
ble
      arm64: dts: qcom: eliza: Describe the ADSP and USB related nodes
      arm64: dts: qcom: Add Eliza-specific PM7550BA dtsi
      arm64: dts: qcom: eliza-mtp: Enable USB and ADSP support
      arm64: dts: qcom: eliza-mtp: Fix the debug UART index
      arm64: dts: qcom: eliza: Add QUPv3, GPI DMA, SDHCI and LLCC nodes

Abhash Kumar Jha (1):
      arm64: dts: ti: k3-j722s: Use ti,j7200-padconf compatible

Adrian Ng Ho Yin (4):
      arm64: dts: socfpga: agilex5: set alias for i3c controllers
      arm64: dts: socfpga: agilex3: set alias for i3c controller
      arm64: dts: socfpga: agilex5: update data-width for dmac
      dt-bindings: altera: add compatible for agilex5 socdk debug daught=
er card

Akari Tsuyukusa (1):
      arm: dts: mediatek: mt6589: Add Arm Generic Timer node

Akash Sukhavasi (1):
      arm64: dts: hisilicon: hi3660-hikey960: move role-switch endpoint =
into connector

Akashdeep Kaur (1):
      arm64: dts: ti: k3-am62-lp-sk: Add system-power-controller

Albert Yang (1):
      arm64: dts: bst: enable eMMC controller in C1200

Aleksander Jan Bajkowski (2):
      arm64: dts: mediatek: add crypto offload support on MT7981
      arm64: dts: mediatek: add LED and key support on Xiaomi AX3000T

Alex Elder (1):
      riscv: dts: spacemit: define a SPI controller node

Alexander Feilke (1):
      ARM: dts: imx7: add nvmem-layout

Alexander Koskovich (8):
      arm64: dts: qcom: milos: Reduce rmtfs_mem size to 2.5MiB
      dt-bindings: arm: qcom: Add the Nothing Phone (3a)
      arm64: dts: qcom: Add the Nothing Phone (3a)
      arm64: dts: qcom: milos: Add QCrypto nodes
      arm64: dts: qcom: eliza: Sort nodes by unit address
      arm64: dts: qcom: eliza: Add IMEM node
      arm64: dts: qcom: eliza: Fix reserved memory addresses & sizes
      arm64: dts: qcom: milos: Add qfprom efuse node

Alexander Stein (3):
      arm64: dts: freescale: add initial device tree for TQMa8x
      arm64: dts: imx8qm-tqma8qm-mba8x: Disable Cortex-A72 cluster
      arm64: dts: tqma8mpql-mba8mpxl: configure sai clock in audio codec=
 as well

Alexey Klimov (1):
      arm64: dts: exynos850: Add syscon-poweroff node

Alice Guo (3):
      ARM: dts: freescale: add bootph-all to i.MX7ULP watchdog nodes
      arm64: dts: imx94: fix DDR PMU interrupt number
      arm64: dts: freescale: add bootph-all to watchdog nodes for i.MX p=
latforms

Alim Akhtar (1):
      arm64: dts: exynosautov920: Add syscon hsi2 node

Amit Pundir (1):
      arm64: dts: qcom: sdm845-xiaomi-beryllium: Enable ath10k host-cap =
skip quirk

Andre Heider (6):
      riscv: dts: spacemit: k1-musepi-pro: add PMIC and power infrastruc=
ture
      riscv: dts: spacemit: k1-musepi-pro: add 24c02 eeprom
      riscv: dts: spacemit: k1-musepi-pro: enable QSPI and add SPI NOR
      riscv: dts: spacemit: k1-musepi-pro: enable USB 3 ports
      riscv: dts: spacemit: k1-musepi-pro: enable PCIe ports
      riscv: dts: spacemit: k1-musepi-pro: set default console baud rate

Andre Przywara (1):
      arm64: dts: allwinner: a523: Add missing GPIO interrupt

Andreas Kemnade (1):
      ARM: dts: ti/omap: omap4-epson-embt2ws: fix typo in iio device pro=
perty

Anirudh Srinivasan (1):
      ARM: dts: aspeed: Enable networking for Asus Kommando IPMI Card

Antoine Gouby (2):
      arm64: dts: freescale: imx95-toradex-smarc: replace deprecated gpi=
o property
      arm64: dts: freescale: imx95-aquila: Add Clover carrier board

Anup Kulkarni (1):
      arm64: dts: qcom: lemans-evk: Enable CAN RX via I2C GPIO expander

Arnd Bergmann (19):
      Merge tag 'pxa1908-dt-for-7.2' of https://codeberg.org/pxa1908-mai=
nline/linux into soc/dt
      Merge tag 'renesas-dts-for-v7.2-tag1' of git://git.kernel.org/pub/=
scm/linux/kernel/git/geert/renesas-devel into soc/dt
      Merge tag 'zx29-dts-for-7.2' of https://gitlab.com/stefandoesinger=
/zx297520-kernel into soc/dt
      Merge tag 'tegra-for-7.2-arm64-dt' of git://git.kernel.org/pub/scm=
/linux/kernel/git/tegra/linux into soc/dt
      Merge tag 'arm-soc/for-7.2/devicetree' of https://github.com/Broad=
com/stblinux into soc/dt
      Merge tag 'ti-k3-dt-for-v7.2' of https://git.kernel.org/pub/scm/li=
nux/kernel/git/ti/linux into soc/dt
      Merge tag 'apple-soc-dt-7.2' of https://git.kernel.org/pub/scm/lin=
ux/kernel/git/sven/linux into soc/dt
      Merge tag 'imx-dt-7.2' of git://git.kernel.org/pub/scm/linux/kerne=
l/git/frank.li/linux into soc/dt
      Merge tag 'hisi-arm64-dt-for-7.2' of https://github.com/hisilicon/=
linux-hisi into soc/dt
      Merge tag 'v7.2-rockchip-dts64-2' of https://git.kernel.org/pub/sc=
m/linux/kernel/git/mmind/linux-rockchip into soc/dt
      Merge tag 'riscv-dt-for-v7.2' of https://git.kernel.org/pub/scm/li=
nux/kernel/git/conor/linux into soc/dt
      Merge tag 'omap-for-v7.2/dt-signed' of git://git.kernel.org/pub/sc=
m/linux/kernel/git/khilman/linux-omap into soc/dt
      Merge tag 'at91-dt-7.2' of https://git.kernel.org/pub/scm/linux/ke=
rnel/git/at91/linux into soc/dt
      Merge tag 'microchip-dt64-7.2' of https://git.kernel.org/pub/scm/l=
inux/kernel/git/at91/linux into soc/dt
      Merge tag 'imx-dt64-7.2' of git://git.kernel.org/pub/scm/linux/ker=
nel/git/frank.li/linux into soc/dt
      Merge tag 'imx-dt64-7.2-part2' of git://git.kernel.org/pub/scm/lin=
ux/kernel/git/frank.li/linux into soc/dt
      Merge tag 'imx-binding-7.2' of git://git.kernel.org/pub/scm/linux/=
kernel/git/frank.li/linux into soc/dt
      Merge tag 'sunxi-dt-for-7.2-2' of https://git.kernel.org/pub/scm/l=
inux/kernel/git/sunxi/linux into soc/dt
      Merge tag 'bst-arm64-emmc-driver-dts-for-v7.2' of https://github.c=
om/BlackSesame-SoC/linux into soc/dt

Aurelien Jarno (5):
      riscv: dts: spacemit: set console baud rate on Milk-V Jupiter
      riscv: dts: spacemit: sort aliases on Milk-V Jupiter
      riscv: dts: spacemit: enable eMMC on Milk-V Jupiter
      riscv: dts: spacemit: enable SD card support on Milk-V Jupiter
      riscv: dts: spacemit: fix uboot partition offset on Milk-V Jupiter

Biju Das (27):
      dt-bindings: pinctrl: renesas,rzg2l-pinctrl: Document reset-names
      dt-bindings: pinctrl: renesas: Document RZ/G3L SoC
      arm64: dts: renesas: r9a08g046: Add GBETH nodes
      arm64: dts: renesas: rzg3l-smarc-som: Enable eth0 (GBETH0) interfa=
ce
      arm64: dts: renesas: Add pinctrl reset-names for RZ/G2L and RZ/V2H=
 family SoCs
      arm64: dts: renesas: r9a08g046: Add OPP table
      arm64: dts: renesas: r9a08g046: Add ICU node
      arm64: dts: renesas: r9a08g046: Add pincontrol node
      arm64: dts: renesas: r9a08g046l48-smarc: Add SCIF0 pincontrol
      arm64: dts: renesas: rzg3l-smarc-som: Add pinctrl configuration fo=
r ETH0
      arm64: dts: renesas: rzg3l-smarc-som: Enable eth1 (GBETH1) interfa=
ce
      arm64: dts: renesas: r9a08g046: Add wdt device node
      arm64: dts: renesas: rzg3l-smarc-som: Enable watchdog
      arm64: dts: renesas: r9a08g046: Add scif{1..5} device nodes
      arm64: dts: renesas: r9a08g046: Add i2c{0..3} device nodes
      arm64: dts: renesas: r9a08g046: Add DMAC node
      arm64: dts: renesas: r9a08g046: Add SSI support
      arm64: dts: renesas: r9a08g046: Add audio clock nodes
      arm64: dts: renesas: r9a08g046: Add rsci{0..3} device nodes
      arm64: dts: renesas: r9a07g043: Add max-frequency to SDHI nodes
      arm64: dts: renesas: r9a07g044: Add max-frequency to SDHI nodes
      arm64: dts: renesas: r9a07g054: Add max-frequency to SDHI nodes
      arm64: dts: renesas: rzg3e-smarc-som: Sort GMAC pinmux entries
      arm64: dts: renesas: r9a08g046l48-smarc: Add gpio keys
      arm64: dts: renesas: r9a08g046l48-smarc: Enable I2C{2,3} devices
      arm64: dts: renesas: rzg3l-smarc-som: Enable Versa clock generator
      arm64: dts: renesas: r9a08g046l48-smarc: Enable audio

Billy Tsai (1):
      ARM: dts: aspeed: g6: Add PWM/Tach controller node

Bjorn Andersson (3):
      Merge branch '20260225-topic-wcn6855_pmu_dtbdings-v3-1-576ec5c4e63=
1@oss.qualcomm.com' into arm64-for-7.2
      Merge branch '20260507-ipq9650_boot_to_shell-v3-1-62742b49c991@oss=
.qualcomm.com' into arm64-for-7.2
      Merge branch '20260416-qcom_ice_power_and_clk_vote-v5-13-5ccf5d7e2=
846@oss.qualcomm.com' into arm64-for-7.2

Brian Norris (4):
      ARM: dts: rockchip: Add #{address,size}-cells to Chromium-based /f=
irmware
      arm64: dts: rockchip: Add #{address,size}-cells to Chromium-based =
/firmware
      ARM: tegra: Add #{address,size}-cells to Chromium-based /firmware
      arm64: tegra: Add #{address,size}-cells to Chromium-based /firmware

Chen Wang (1):
      MAINTAINERS: update Chen Wang's email address

Chen-Yu Tsai (23):
      arm64: dts: mediatek: mt8192-asurada: Move PCIe DMA bounce buffer =
to host
      arm64: dts: mediatek: mt8186-corsola-voltorb: Add MT6315 PMIC supp=
lies
      arm64: dts: mediatek: mt6359: Switch to proper ldo_vcn33_[12] regu=
lators
      arm64: dts: mediatek: mt8192-asurada: Add MT6359 PMIC supplies
      arm64: dts: mediatek: mt8192-asurada: Add MT6315 PMIC supplies
      arm64: dts: mediatek: mt8192-asurada: Add supplies for ChromeOS EC=
 regulators
      arm64: dts: mediatek: mt8192-asurada: Add CPU power supplies
      arm64: dts: mediatek: mt8192-asurada: Add SPI NOR flash power supp=
ly
      arm64: dts: mediatek: mt8192-asurada: Fix WiFi regulator descripti=
on
      arm64: dts: mediatek: mt8195-cherry: Add MT6359 PMIC supplies
      arm64: dts: mediatek: mt8195-cherry: Add MT6315 PMIC supplies
      arm64: dts: mediatek: mt8195-cherry: Add supplies for ChromeOS EC =
regulators
      arm64: dts: mediatek: mt8195-cherry: Fix VBUS regulator description
      arm64: dts: mediatek: mt8195-cherry: Add supply for SPI NOR flash
      arm64: dts: mediatek: mt8195-cherry: Add vusb33 supplies for XHCI =
controllers
      arm64: dts: mediatek: mt8188-geralt: Add MT6359 PMIC supplies
      arm64: dts: mediatek: mt8188-geralt: Add little core CPU power sup=
plies
      arm64: dts: mediatek: mt8192-asurada: Fix SPI-NOR flash compatible
      arm64: dts: mediatek: mt8192-asurada: Add (BT|WIFI)_KILL_1V8_L GPI=
O line names
      arm64: dts: mediatek: mt8195-cherry: Fix names for EC controlled r=
egulators
      arm64: dts: mediatek: mt8195-cherry: Sort top level nodes correctly
      arm64: dts: rockchip: Fix EEPROM compatible on rk3399-nanopi-r4s-e=
nterprise
      arm64: dts: rockchip: Disable removed devices from rk3399-nanopi-r=
4s

Christoph Stoidner (1):
      arm64: dts: freescale: imx{91,93}-phycore-som: Improve USDHC signa=
ls

Christopher Obbard (1):
      ARM: dts: dm8168-evm: Set stdout-path to uart3

Chukun Pan (5):
      riscv: dts: spacemit: enable eMMC for OrangePi RV2
      riscv: dts: spacemit: enable QSPI for OrangePi RV2
      riscv: dts: spacemit: enable USB3 on OrangePi R2S
      riscv: dts: spacemit: enable PMIC on OrangePi R2S
      arm64: dts: rockchip: enable adc button for Radxa E25

Claudiu Beznea (1):
      arm64: dts: renesas: r9a07g044: Add DMA properties to serial nodes

Colin Huang (1):
      ARM: dts: aspeed: anacapa: Add JTAG CPLD TRST pin to SGPIO map

Conor Dooley (11):
      dts: spacemit: set console baud rate on bpif3
      riscv: dts: microchip: add tsu clock to macb on pic64gx
      riscv: dts: microchip: update pic64gx gpio interrupts to better ma=
tch the SoC
      riscv: dts: microchip: sort pic64gx i2c nodes alphanumerically
      riscv: dts: microchip: gpio controllers on mpfs need 2 interrupt c=
ells
      riscv: dts: microchip: remove gpio hogs from beaglev-fire
      riscv: dts: microchip: clean up beaglev-fire regulator node names
      riscv: dts: microchip: add adc interrupt on beaglev-fire
      riscv: dts: microchip: add gpio line names on beaglev-fire
      riscv: dts: microchip: fix pic64gx gpio interrupt-cells
      riscv: dts: microchip: remove redudant enabling of syscontroller

Cosmin Tanislav (3):
      arm64: dts: renesas: r9a07g0{43,44,54}: Remove TCIU8 interrupt fro=
m MTU3
      arm64: dts: renesas: r9a09g077: Add MTU3 support
      arm64: dts: renesas: r9a09g087: Add MTU3 support

Cristian Ciocaltea (15):
      arm64: dts: rockchip: Fix vdec register blocks order on RK3576
      arm64: dts: rockchip: Update vdec register blocks order on RK3588
      arm64: dts: rockchip: Add frl-enable-gpios to rk3576 boards
      arm64: dts: rockchip: Add frl-enable-gpios to rk3576-luckfox-core3=
576
      arm64: dts: rockchip: Add frl-enable-gpios to rk3576-nanopi-r76s
      arm64: dts: rockchip: Add frl-enable-gpios to rk3588 boards
      arm64: dts: rockchip: Add frl-enable-gpios to rk3588s boards
      arm64: dts: rockchip: Add frl-enable-gpios to rk3588s-gameforce-ace
      arm64: dts: rockchip: Add frl-enable-gpios to rk3588s-khadas-edge2
      arm64: dts: rockchip: Add frl-enable-gpios to rk3588s-orangepi-cm5=
-base
      arm64: dts: rockchip: Add frl-enable-gpios to rk3588s-roc-pc
      arm64: dts: rockchip: Drop unnecessary #{address,size}-cells from =
rk3588-jaguar
      arm64: dts: rockchip: Add missing pinctrl-names to rk3576 boards
      arm64: dts: rockchip: Add missing pinctrl-names to rk3588 boards
      arm64: dts: rockchip: Add missing pinctrl-names to rk3588s boards

Daniel Hsu (1):
      ARM: dts: aspeed: yosemite5: Add MP5998 power monitor

David Heidelberg (10):
      arm64: dts: qcom: sdm845-oneplus: Drop address from framebuffer no=
de
      arm64: dts: qcom: sdm845-shift-axolotl: Convert fb to use memory-r=
egion
      arm64: dts: qcom: sdm845-samsung-starqltechn: Convert fb to use me=
mory-region
      arm64: dts: qcom: sdm845-oneplus: Enable NFC
      arm64: dts: qcom: sdm845-shift-axolotl: Correct touchscreen sleep =
state
      arm64: dts: qcom: sdm845-shift-axolotl: Enable NFC
      arm64: dts: qcom: sdm845-google-common: Enable NFC
      dt-bindings: arm: qcom: Document Xiaomi Poco F1 Tianma variant
      arm64: dts: qcom: sdm845-oneplus: Enable known blocks and add plac=
eholders
      arm64: dts: qcom: sdm845-shift-axolotl: describe WiFi/BT properly

David Jander (7):
      ARM: dts: stm32: stm32mp15x-mecio1-io: Enable internal ADC referen=
ce
      ARM: dts: stm32: stm32mp15x-mecio1-io: Fix ADC sampling times
      ARM: dts: stm32: stm32mp15x-mecio1-io: Move divergent mecio1 ADC c=
hannels to board files
      ARM: dts: stm32: stm32mp15x-mecio1-io: Fix GPIO names typo
      ARM: dts: stm32: stm32mp15x-mecio1-io: Move gpio-line-names to boa=
rd files
      ARM: dts: stm32: stm32mp15x-mecio1-io: Fix expander gpio line typo
      ARM: dts: stm32: stm32mp15x-mecio1-io: Move expander gpio-line-nam=
es to board files

David Lechner (3):
      arm: dts: mediatek: mt7623: fix pinctrl child node names
      arm: dts: mediatek: mt7623: fix pinctrl controller node name
      arm: dts: mediatek: mt8135: fix pinctrl node name

Dawid Glazik (2):
      ARM: dts: aspeed-g6: move i2c controllers directly into apb node
      ARM: dts: aspeed-g6: Add nodes for i3c controllers

Devin Li (2):
      arm64: dts: cix: Add SCMI performance domains for CPUFreq on Sky1
      arm64: dts: cix: Add CPU idle states for Sky1

Diederik de Haas (1):
      arm64: dts: rockchip: Fix gmac0 reset pin for NanoPi R5S

Dikshita Agarwal (1):
      arm64: dts: qcom: agatti: add higher OPP levels

Dinh Nguyen (3):
      dt-bindings: arm: altera: document the Agilex7-M devkit
      arm64: dts: socfpga: agilex7m: Add SoCFPGA Agilex7-M devkit
      ARM: dts: socfpga: remove the reg property in the pmu

Diogo Ivo (1):
      arm64: tegra: Mark MAX77620 as system power controller on Smaug

Dmitry Baryshkov (1):
      arm64: dts: qcom: qcs6490-rb3gen2: add rmtfs node

Duje Mihanovi=C4=87 (4):
      arm64: dts: marvell: samsung-coreprimevelte: Increase touchscreen =
voltage
      arm64: dts: marvell: samsung,coreprimevelte: Use memory-region for=
 framebuffer
      arm64: dts: marvell: pxa1908: Add PSCI function IDs
      arm64: dts: marvell: samsung-coreprimevelte: Add missing SDIO prop=
erties

Durai Manickam KR (1):
      ARM: dts: microchip: add I3C controller

Eduard Bostina (2):
      dt-bindings: watchdog: Convert TS-4800 to DT schema
      ARM: dts: nxp: imx51-ts4800: Rename wdt node to watchdog

Ekansh Gupta (1):
      arm64: dts: qcom: monaco: add GDSP fastrpc-compute-cb nodes

Ender Hsieh (1):
      ARM: dts: aspeed: msx4: enable BMC networking via MAC0

Fabio Estevam (1):
      ARM: dts: rockchip: Remove invalid properies from rk3288-veyron-an=
alog-audio

Fabrizio Castro (1):
      arm64: dts: renesas: rzt2h-n2h-evk: Configure eMMC/SDHI pins

Florijan Plohl (6):
      arm64: dts: freescale: imx91-phycore-som: Add gpio-line-names
      arm64: dts: freescale: imx91-phyboard-segin: Add gpio-line-names
      arm64: dts: freescale: imx93-phycore-som: Add gpio-line-names
      arm64: dts: freescale: imx93-phyboard-nash: Add gpio-line-names
      arm64: dts: freescale: imx93-phyboard-segin: Add gpio-line-names
      arm64: dts: imx{91,93}-phyboard-segin: Add peb-av-18 overlays

Francesco Dolcini (8):
      dt-bindings: arm: fsl: Add verdin imx8m[mp] and imx95 zinnia board
      arm64: dts: freescale: imx8mm-verdin: Split UART_2 pinctrl group
      arm64: dts: freescale: imx8mm-verdin: Add Zinnia
      arm64: dts: freescale: imx8mp-verdin: Split UART_2 pinctrl group
      arm64: dts: freescale: imx8mp-verdin: Add Zinnia
      arm64: dts: freescale: imx95-verdin: Split UART_2 pinctrl group
      arm64: dts: freescale: imx95-verdin: Add Zinnia
      arm64: dts: freescale: imx95-verdin-ivy: fix RS485 RTS polarity

Frank Li (12):
      ARM: dts: imx35: remove empty clock-names for nand-controller@bb00=
0000
      ARM: dts: imx25: remove empty clock-names for nand-controller@bb00=
0000
      ARM: dts: imx: add ti,deskew =3D <0> for ti,tfp410
      ARM: dts: imx53-qsb: add dvdd and avdd supply for panel sii,43wvf1g
      ARM: dts: imx53-ppd: add '#phy-cells' for usb-nop-xceiv
      ARM: dts: imx: add (power|vdd)-supply for related node
      ARM: dts: imx: remove redundant bus-width for video-mux
      ARM: dts: imx: Add bus-type for ov5642/ov5640
      ARM: dts: imx6qdl-tx6: remove undocumented karo,imx6qdl-tx6-sgtl50=
00 and keep only simple-audio-card
      ARM: dts: imx: replace undocumented compatible string edt,edt-ft5x=
06 with edt,edt-ft5206
      ARM: dts: imx6-display5: replace marvell,88E1510 with ethernet-phy=
-ieee802.3-c22
      dt-bindings: soc: imx: Add fsl,aipi-bus and fsl,emi-bus

Frank Wunderlich (4):
      arm64: dts: mediatek: mt7988a-bpi-r4pro: rename mgmt port to lan5
      arm64: dts: mediatek: mt7988a-bpi-r4pro: drop duplicate fan proper=
ties
      arm64: dts: mediatek: mt7988a-bpi-r4pro: update gpio-leds
      arm64: dts: mediatek: mt7988a-bpi-r4pro: rework pcie gpio-hog hand=
ling

Franz Schnyder (4):
      arm64: dts: freescale: imx95-toradex-smarc: Add SER2 interface
      arm64: dts: freescale: imx95-toradex-smarc: Enable bluetooth on lp=
uart5
      arm64: dts: freescale: imx95-toradex-smarc: Use gpio-hog for WIFI_=
UART_EN
      dt-bindings: arm: fsl: add Aquila iMX95

Frieder Schrempf (2):
      arm64: dts: imx8mp-kontron: Reduce EERAM SPI clock frequency
      arm64: dts: imx8mp-kontron: Fix GPIO for display power switch

Gary Bisson (1):
      arm64: dts: mediatek: mt8390-tungsten-smarc: add HDMI support

Geert Uytterhoeven (6):
      arm64: dts: renesas: r8a78000: Fix SCIF brg_int clocks
      Merge tag 'renesas-fixes-for-v7.1-tag1' into renesas-dts-for-v7.2
      Merge tag 'renesas-r8a7740-dt-binding-defs-tag1' into renesas-dts-=
for-v7.2
      Merge tag 'renesas-r9a08g046-dt-binding-defs-tag2' into renesas-dt=
s-for-v7.2
      Merge tag 'renesas-r8a73a4-dt-binding-defs-tag1' into renesas-dts-=
for-v7.2
      Merge tag 'renesas-r8a78000-dt-binding-defs-tag1' into renesas-dts=
-for-v7.2

Gopikrishna Garmidi (1):
      arm64: dts: qcom: glymur: Fix wrong interrupt number for i2c19

Gray Huang (7):
      arm64: dts: rockchip: Add PMIC support for Khadas Edge 2L
      arm64: dts: rockchip: Enable GPU for Khadas Edge 2L
      arm64: dts: rockchip: Add HDMI and VOP support for Khadas Edge 2L
      arm64: dts: rockchip: Add HYM8563 RTC for Khadas Edge 2L
      arm64: dts: rockchip: Add AP6275P wireless support for Khadas Edge=
 2L
      arm64: dts: rockchip: Enable USB for Khadas Edge 2L
      arm64: dts: rockchip: Add Bluetooth support for Khadas Edge 2L

Griffin Kroah-Hartman (1):
      arm64: dts: qcom: milos-fairphone-fp6: Add vibrator support

Guangliu Ding (1):
      arm64: dts: imx952: Describe Mali G310 GPU

Guodong Xu (1):
      riscv: dts: spacemit: k3: Add Ziccrse extension for X100 cores

Guoniu Zhou (1):
      arm64: dts: imx8ulp: Add CSI and ISI Nodes

Han Gao (4):
      riscv: dts: spacemit: Enable i2c8 adapter for OrangePi RV2
      riscv: dts: spacemit: Define the P1 PMIC regulators for OrangePi R=
V2
      riscv: dts: spacemit: Enable USB3.0/PCIe on OrangePi RV2
      riscv: dts: sophgo: Add dma-coherent to SG2042 PCIe controllers

Haritha S K (1):
      arm64: dts: qcom: glymur: Enable cpufreq cooling devices

Harrison Vanderbyl (1):
      dt-bindings: arm: qcom: Add Microsoft Surface Pro 12in

Harshal Dev (12):
      arm64: dts: qcom: glymur: Add crypto engine and BAM
      arm64: dts: qcom: milos: Add power-domain and iface clk for ice no=
de
      arm64: dts: qcom: eliza: Add power-domain and iface clk for ice no=
de
      arm64: dts: qcom: kaanapali: Add power-domain and iface clk for ic=
e node
      arm64: dts: qcom: lemans: Add power-domain and iface clk for ice n=
ode
      arm64: dts: qcom: monaco: Add power-domain and iface clk for ice n=
ode
      arm64: dts: qcom: sc7180: Add power-domain and iface clk for ice n=
ode
      arm64: dts: qcom: kodiak: Add power-domain and iface clk for ice n=
ode
      arm64: dts: qcom: sm8450: Add power-domain and iface clk for ice n=
ode
      arm64: dts: qcom: sm8550: Add power-domain and iface clk for ice n=
ode
      arm64: dts: qcom: sm8650: Add power-domain and iface clk for ice n=
ode
      arm64: dts: qcom: sm8750: Add power-domain and iface clk for ice n=
ode

Hugo Osvaldo Barrera (1):
      arm64: dts: rockchip: Fix vcc_sdio regulator max voltage on Pinebo=
ok Pro

Hugo Villeneuve (15):
      ARM: dts: imx6ul-var-som: fix warning for non-existent dc-supply p=
roperty
      ARM: dts: imx6ul-var-som: fix warning for boolean property with a =
value
      ARM: dts: imx6ul-var-som: change incorrect VAR-SOM-MX6UL references
      dt-bindings: arm: fsl: change incorrect VAR-SOM-MX6UL references
      dt-bindings: arm: fsl: add variscite,var-som-imx6ull
      ARM: dts: imx6ul-var-som: Factor out common parts for all CPU vari=
ants
      ARM: dts: imx6ul-var-som-concerto: Factor out common parts for all=
 CPU variants
      ARM: dts: imx6ul-var-som-concerto: order DT properties
      ARM: dts: imx6ul-var-som: factor out SD card support
      ARM: dts: imx6ul-var-som: add proper Wifi and Bluetooth support
      ARM: dts: imx6ul-var-som: factor out ENET2 ethernet support
      ARM: dts: imx6ul-var-som: add support for EC configuration option =
(ENET1)
      ARM: dts: imx6ul-var-som: factor out audio support
      ARM: dts: imx6ul-var-som: add support for LVDS display panel
      dt-bindings: display/lvds-codec: add ti,sn65lvds93

Icenowy Zheng (1):
      riscv: dts: sophgo: reduce SG2042 MSI count to 16

Iker Pedrosa (3):
      riscv: dts: spacemit: k1: add SD card controller and pinctrl suppo=
rt
      riscv: dts: spacemit: k1-orangepi-rv2: add SD card support with UH=
S modes
      riscv: dts: spacemit: k1-bananapi-f3: add SD card support with UHS=
 modes

Inochi Amaoto (2):
      riscv: dts: sophgo: sg2044: use hex for CPU unit address
      riscv: dts: sophgo: sg2042: use hex for CPU unit address

Ion Agorria (1):
      ARM: tegra: p880: Lower CPU thermal limit

Ivaylo Dimitrov (2):
      arch: arm: dts: cpcap-mapphone: Set VAUDIO regulator always-on
      arch: arm: dts: cpcap-mapphone: Add audio-codec jack detection int=
errupts

Janne Grunau (5):
      dt-bindings: arm: apple: apple,pmgr: Add t8122 compatible
      dt-bindings: power: apple,pmgr-pwrstate: Add t8122 compatible
      dt-bindings: pwm: apple,s5l-fpwm: Add t8122 compatible
      dt-bindings: arm: apple: Add M3 based devices
      arm64: dts: apple: Initial t8122 (M3) device trees

Jens Reidel (1):
      arm64: dts: qcom: sdm845-xiaomi-beryllium: Append compatible strin=
gs

Jernej Skrabec (1):
      arm64: dts: allwinner: sun50i-h616: Add SRAM nodes

Jian Hu (1):
      arm64: dts: amlogic: t7: Add clock controller nodes

Jie Gan (1):
      arm64: dts: qcom: glymur: add coresight nodes

Jihed Chaibi (1):
      ARM: dts: am335x-sl50: Fix audio bitclock and frame master endpoint

Jinseok Kim (1):
      arm: dts: bcm2711: Fix typo in gpio-line-names

Joel Selvaraj (1):
      arm64: dts: qcom: sdm845-xiaomi-beryllium: Correct IPA FW path

Joey Lu (1):
      arm64: dts: nuvoton: Add Ethernet nodes

Jon Hunter (3):
      arm64: tegra: Fix Tegra234 MGBE PTP clock
      arm64: tegra: Fix address of Tegra264 main GPIO controller
      arm64: tegra: Enable PCIe for Jetson AGX Thor

Jonas Karlman (6):
      arm64: dts: rockchip: Add watchdog node for RK3528
      arm64: dts: rockchip: Add USB nodes for RK3528
      arm64: dts: rockchip: Enable USB 2.0 ports on Radxa E20C
      arm64: dts: rockchip: Enable USB ports on Radxa ROCK 2A/2F
      arm64: dts: rockchip: Enable USB 2.0 ports on ArmSoM Sige1
      arm64: dts: rockchip: Enable USB 2.0 ports on NanoPi Zero2

Joseph Guo (2):
      dt-bindings: arm: fsl: Add i.MX95 19x19 FRDM PRO board
      arm64: dts: freescale: add i.MX95 19x19 FRDM PRO board dts

Joshua Milas (2):
      dt-bindings: soc: sophgo: add Milk-V Duo S board compatibles
      dt-bindings: soc: sophgo: add sg2000 plic and clint documentation

Josua Mayer (12):
      arm64: dts: lx2160a-rev2: extend 32-bit and add 64-bit pci regions
      arm64: dts: lx2162a-clearfog: use rev2 SoC dtsi
      arm64: dts: lx2162a-clearfog: cleanup superfluous status properties
      arm64: dts: lx2162a-clearfog: specify sfp ports led colour and fun=
ction
      dt-bindings: arm: fsl: Add solidrun lx2160a twins board
      arm64: dts: lx2160a-clearfog-itx: remove redundant dts version tag
      arm64: dts: lx2160a-clearfog-itx: move shared includes to dts
      arm64: dts: lx2160a-cex7: add usb hub
      arm64: dts: Add support for LX2160 Twins board in single configura=
tion
      dt-bindings: arm: fsl: Add SolidRun i.MX8DXL SoM and HummingBoard
      arm64: dts: imx8dxl: Add SolidRun SoM and HummingBoard
      arm64: dts: lx2160a-rev2: avoid 32-bit pcie window system ram over=
lap

Joy Zou (10):
      dt-bindings: arm: fsl: add i.MX91 9x9 QSB board
      arm64: dts: imx91-11x11-evk: remove unused property clock-frequenc=
y from mdio node
      arm64: dts: imx93-11x11-evk: remove unused property clock-frequenc=
y from mdio node
      arm64: dts: imx93-9x9-qsb: remove unused property clock-frequency =
from mdio node
      arm64: dts: freescale: add i.MX91 9x9 QSB basic support
      arm64: dts: imx91-9x9-qsb: remove unused property clock-frequency =
from mdio node
      arm64: dts: imx91-9x9-qsb: add pinctrl for wdog3 reset
      arm64: dts: imx91-11x11-evk: add pinctrl for wdog3 reset
      arm64: dts: imx91-11x11-evk: add reset gpios for ethernet PHYs
      arm64: dts: imx91-9x9-qsb: add reset gpios for ethernet PHYs

Jo=C3=A3o Paulo Gon=C3=A7alves (1):
      arm64: dts: freescale: add Aquila iMX95 support

Judith Mendez (1):
      arm64: dts: ti: k3-am62a7-sk: Add bootph-all tag to vqmmc

Jun Yan (1):
      arm64: dts: amlogic: meson-gxl-s905d-phicomm-n1: add bluetooth node

Kamal Wadhwa (1):
      arm64: dts: qcom: fix temp-alarm probe failure for PMH0104 on Glym=
ur

Kathiravan Thirumoorthy (5):
      dt-bindings: clock: add Qualcomm IPQ9650 GCC
      dt-bindings: qcom: add IPQ9650 boards
      arm64: dts: qcom: add IPQ9650 SoC and rdp488 board support
      arm64: dts: qcom: ipq9650: add watchdog node
      arm64: dts: qcom: ipq5210: add watchdog node

Khristine Andreea Barbulescu (3):
      arm64: dts: s32g: add PIT support for s32g2 and s32g3
      arm64: dts: s32g: add SAR ADC support for s32g2 and s32g3
      arm64: dts: s32g: add PWM support for s32g2 and s32g3

Konrad Dybcio (10):
      dt-bindings: net: bluetooth: qualcomm: Fix WCN6855 regulator names
      arm64: dts: qcom: qcs615-ride: Fix BT RFA supply name
      arm64: dts: qcom: sc8280xp-crd: Fix BT RFA supply name
      arm64: dts: qcom: sc8280xp-gaokun3: Fix BT RFA supply name
      arm64: dts: qcom: sc8280xp-x13s: Fix BT RFA supply name
      arm64: dts: qcom: sc8280xp-blackrock: Fix BT RFA supply name
      arm64: dts: qcom: sm8450-hdk: Fix BT RFA supply name
      arm64: dts: qcom: x1-omnibook-x14: Fix BT RFA supply name
      arm64: dts: qcom: x1-zenbook-a14: Fix BT RFA supply name
      arm64: dts: qcom: lemans-ride-common: Fix up WCN power grid

Krzysztof Kozlowski (26):
      arm64: dts: qcom: glymur: Fix USB simple_bus_reg warning
      arm64: dts: qcom: glymur: Fix cache and SRAM simple_bus_reg warnin=
gs
      arm64: dts: qcom: ipq5424: Fix USB simple_bus_reg warnings
      arm64: dts: qcom: sc8180x: Fix phy simple_bus_reg warning
      arm64: dts: qcom: sdm845-mezzanine: Fix camss ports unit_address_v=
s_reg warning
      arm64: dts: imx8mn-vhip4-evalboard-v1: Correct interrupt flags
      arm64: dts: imx8mn-vhip4-evalboard-v2: Correct interrupt flags
      arm64: dts: imx8mp-ab2: Correct interrupt flags
      arm64: dts: qcom: eliza: Add QCE crypto
      arm64: dts: qcom: Use GIC_SPI macro for interrupt-map
      arm64: dts: qcom: sm8750: Fix DSI1 phy reference clock rate
      arm64: dts: imx8ulp-evk: Correct Type-C int GPIO flags
      arm64: dts: qcom: eliza: Add display (MDSS) with Display CC
      arm64: dts: qcom: eliza-mtp: Enable DSI display panel
      arm64: dts: qcom: eliza-mtp: Enable DisplayPort on USB
      arm64: dts: s32g3: Fix SWT8 watchdog address
      Merge tag 'mtk-dts32-for-v7.2' of ssh://gitolite.kernel.org/pub/sc=
m/linux/kernel/git/mediatek/linux into soc/dt
      Merge tag 'mtk-dts64-for-v7.2' of ssh://gitolite.kernel.org/pub/sc=
m/linux/kernel/git/mediatek/linux into soc/dt
      Merge tag 'renesas-dts-for-v7.2-tag2' of https://git.kernel.org/pu=
b/scm/linux/kernel/git/geert/renesas-devel into soc/dt
      Merge tag 'tenstorrent-dt-for-v7.2' of https://git.kernel.org/pub/=
scm/linux/kernel/git/tenstorrent/linux into soc/dt
      Merge tag 'thead-dt-for-v7.2' of https://git.kernel.org/pub/scm/li=
nux/kernel/git/fustini/linux into soc/dt
      Merge tag 'spacemit-dt-for-7.2-1' of https://github.com/spacemit-c=
om/linux into soc/dt
      Merge tag 'amlogic-arm64-dt-for-v7.2-v2' of ssh://gitolite.kernel.=
org/pub/scm/linux/kernel/git/amlogic/linux into soc/dt
      Merge tag 'nuvoton-7.2-devicetree-0' of ssh://gitolite.kernel.org/=
pub/scm/linux/kernel/git/bmc/linux into soc/dt
      Merge tag 'riscv-sophgo-dt-for-v7.2' of https://github.com/sophgo/=
linux into soc/dt
      Merge tag 'aspeed-7.2-devicetree-0' of ssh://gitolite.kernel.org/p=
ub/scm/linux/kernel/git/bmc/linux into soc/dt

Kuldeep Singh (2):
      arm64: dts: qcom: kodiak: Fix ICE reg size
      arm64: dts: qcom: sm8450: Fix ICE reg size

Kuninori Morimoto (2):
      arm64: dts: renesas: r8a78000: Add MFIS, MFIS-SCP, and transport n=
odes
      arm64: dts: renesas: ironhide: Enable to use SCMI

Lad Prabhakar (8):
      arm64: dts: renesas: rz-smarc-du-adv7513: Simplify DU port configu=
ration
      arm64: dts: renesas: r9a09g056: Add PCIe node
      arm64: dts: renesas: r9a09g056n48-rzv2n-evk: Enable PCIe
      arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Add alias for on-SoC =
RTC
      arm64: dts: renesas: r9a09g056n48-rzv2n-evk: Add alias for on-SoC =
RTC
      arm64: dts: renesas: r9a09g077: Add xSPI nodes
      arm64: dts: renesas: r9a09g087: Add xSPI nodes
      arm64: dts: renesas: rzt2h-n2h-evk: Enable xSPI nodes

Le Qi (2):
      arm64: dts: qcom: talos: Add GPR node, audio services, and MI2S1 T=
LMM pins
      arm64: dts: qcom: talos-evk: Add sound card support with DA7212 co=
dec

Lech Perczak (1):
      ARM: dts: imx7d-pico-pi: add OV5645 camera support

Linus Walleij (18):
      ARM: dts: gemini: iTian SQ201 need to boot from mtdblock3
      ARM: dts: gemini: Tag disk led for disk-activity
      ARM: dts: gemini: Add SSP/SPI block
      dt-bindings: vendor-prefixes: Add Verbatim Corporation
      dt-bindings: arm: Add two missing Gemini devices
      ARM: dts: Add a Verbatim Gigabit NAS DTS
      ARM: dts: Add a Raidsonic IB-4210-B DTS
      ARM: dts: gemini: Correct the RUT1xx
      Merge tag 'cix-dt-v7.2-rc1' of git://git.kernel.org/pub/scm/linux/=
kernel/git/peter.chen/cix into soc/dt
      Merge tag 'qcom-arm64-for-7.2' of https://git.kernel.org/pub/scm/l=
inux/kernel/git/qcom/linux into soc/dt
      Merge tag 'v7.2-rockchip-dts32' of https://git.kernel.org/pub/scm/=
linux/kernel/git/mmind/linux-rockchip into soc/dt
      Merge tag 'v7.2-rockchip-dts64-1' of https://git.kernel.org/pub/sc=
m/linux/kernel/git/mmind/linux-rockchip into soc/dt
      Merge tag 'gemini-for-v7.2' of git://git.kernel.org/pub/scm/linux/=
kernel/git/linusw/linux-integrator into soc/dt
      Merge tag 'tegra-for-7.2-dt-bindings' of git://git.kernel.org/pub/=
scm/linux/kernel/git/tegra/linux into soc/dt
      Merge tag 'tegra-for-7.2-arm-dt' of git://git.kernel.org/pub/scm/l=
inux/kernel/git/tegra/linux into soc/dt
      Merge tag 'samsung-dt64-7.2' of https://git.kernel.org/pub/scm/lin=
ux/kernel/git/krzk/linux into soc/dt
      Merge tag 'stm32-dt-for-7.2-1' of git://git.kernel.org/pub/scm/lin=
ux/kernel/git/atorgue/stm32 into soc/dt
      Merge tag 'socfpga_dts_updates_for_v7.2' of git://git.kernel.org/p=
ub/scm/linux/kernel/git/dinguyen/linux into soc/dt

Liu Ying (1):
      arm64: dts: imx93-9x9-qsb: Add tianma,tm050rdh03 panel

Louis-Alexis Eyraud (9):
      arm64: dts: mediatek: add MT6365 PMIC include
      arm64: dts: mediatek: mt8390-genio-common: use MT6365 PMIC definit=
ions
      arm64: dts: mediatek: mt8395-genio-common: use MT6365 PMIC definit=
ions
      arm64: dts: mediatek: mt8395-radxa-nio-12l: use MT6365 PMIC defini=
tions
      arm64: dts: mediatek: mt8390-genio-common: add MT6319 PMIC support
      arm64: dts: mediatek: mt8390-genio-common: add CPU power supplies
      arm64: dts: mediatek: mt8390-genio-700-evk: add specific CPU power=
 supplies
      arm64: dts: mediatek: mt8395-genio-common: add MT6315 PMIC supplies
      arm64: dts: mediatek: mt8395-genio-common: add MT6360 PMIC supplies

Luca Weiss (2):
      arm64: dts: qcom: sm6350: add LPASS LPI pin controller
      arm64: defconfig: Enable LPASS LPI pin controller for SM6350

Mani Chandana Ballary Kuntumalla (2):
      arm64: dts: qcom: lemans: add mdss1 display device nodes
      arm64: dts: qcom: lemans-ride: Enable mdss1 display Port

Manikanta Maddireddy (2):
      arm64: tegra: Add aspm-l1-entry-delay-ns to PCIe nodes
      arm64: tegra: Fix aspm-l1-entry-delay-ns L1 latency cells

Marc Zyngier (3):
      arm64: dts: exynos: Add EL2 virtual timer interrupt
      arm64: dts: rockchip: Add EL2 virtual timer interrupt
      arm64: dts: allwinner: Add EL2 virtual timer interrupt

Marek Vasut (50):
      arm64: dts: renesas: draak/ebisu-panel: Fix missing cells and reg =
in DTO
      arm64: dts: renesas: salvator-panel: Fix missing cells and reg in =
DTO
      arm64: dts: renesas: rz-smarc-cru-csi-ov5645: Fix missing cells an=
d reg in CSI2 subnode
      arm64: dts: renesas: rz-smarc-du-adv7513-smarc: Fix missing cells =
and reg in DU subnode
      ARM: dts: renesas: r8a7778: Add missing unit address to bus node
      ARM: dts: renesas: r8a7779: Add missing unit address to bus node
      ARM: dts: renesas: r8a7792: Add missing unit address to bus node
      ARM: dts: renesas: r7s72100: Add missing unit address to bus node
      ARM: dts: renesas: genmai: Drop superfluous cells
      ARM: dts: renesas: rskrza1: Drop superfluous cells
      dt-bindings: clock: renesas,cpg-clocks: Document ZT/ZTR trace cloc=
k on R-Mobile A1
      arm64: dts: renesas: r8a77960-ulcb: Enable GPU support
      arm64: dts: renesas: r8a77960-salvator-x: Enable GPU support
      arm64: dts: renesas: r8a77960-salvator-xs: Enable GPU support
      arm64: dts: renesas: r8a77961-ulcb: Enable GPU support
      arm64: dts: renesas: r8a77961-salvator-xs: Enable GPU support
      ARM: dts: renesas: r8a7740: Add ZT/ZTR trace clocks
      ARM: dts: renesas: r8a7740: Describe coresight
      arm64: dts: renesas: gray-hawk-single: Fix AVB0 PHY node alignment
      arm64: dts: renesas: ebisu: Sort sound node
      arm64: dts: renesas: salvator-common: Sort sound node
      dt-bindings: clock: renesas,cpg-clocks: Document ZT/ZTR trace cloc=
k on R-Mobile APE6
      ARM: dts: renesas: r8a73a4: Add ZT/ZTR trace clock on R-Mobile APE6
      ARM: dts: renesas: r8a73a4: Describe coresight on R-Mobile APE6
      ARM: dts: stm32: Enable PHY SSC on DH STM32MP13xx DHCOR DHSBC board
      arm64: dts: imx8mn: Sort ifm VHIP4 EvalBoard Makefile entries
      arm64: dts: st: Fix SAI addresses on stm32mp251
      arm64: dts: renesas: Simplify AA1024XD12 display DTO
      dt-bindings: clock: cirrus,cs2000-cp: Document CS2500
      dt-bindings: soc: renesas: Document R-Car R8A779MD Geist
      arm64: dts: renesas: draak: Rename clk-multiplier to clock-control=
ler
      arm64: dts: renesas: ebisu: Rename clk-multiplier to clock-control=
ler
      arm64: dts: renesas: hihope: Rename clk-multiplier to clock-contro=
ller
      arm64: dts: renesas: salvator-common: Rename clk-multiplier to clo=
ck-controller
      arm64: dts: renesas: ulcb: Rename clk-multiplier to clock-controll=
er
      arm64: dts: renesas: salvator-common: Specify ethernet PHY reset t=
imings
      arm64: dts: renesas: ulcb: Specify ethernet PHY reset timings
      arm64: dts: renesas: eagle: Specify ethernet PHY reset timings
      arm64: dts: renesas: v3msk: Specify ethernet PHY reset timings
      arm64: dts: renesas: condor-common: Specify ethernet PHY reset tim=
ings
      arm64: dts: renesas: v3hsk: Specify ethernet PHY reset timings
      arm64: dts: renesas: ebisu: Specify ethernet PHY reset timings
      arm64: dts: renesas: draak: Specify ethernet PHY reset timings
      arm64: dts: renesas: falcon: Specify ethernet PHY reset timings
      arm64: dts: renesas: white-hawk: Specify ethernet PHY reset timings
      arm64: dts: renesas: gray-hawk: Specify ethernet PHY reset timings
      arm64: dts: renesas: r8a78000: Add PSCI node
      arm64: dts: renesas: r8a78000: Fix GIC-720AE View 1 Redistributor =
description
      arm64: dts: renesas: ironhide: Describe all reserved memory
      arm64: dts: imx8mp: Add DT overlays for DH i.MX8M Plus DHCOM SoM a=
nd boards

Markus Niebel (1):
      ARM: dts: imx6ul: add #io-channel-cells to ADC

Maud Spierings (2):
      arm64: dts: freescale: moduline-display-av101hdt-a10: add backlight
      arm64: dts: freescale: moduline-display-av123z7m-n17: add backlight

Michael Neuling (1):
      riscv: dts: tenstorrent: Add PMU node to blackhole for Linux perf =
support

Michael Riesch (4):
      arm64: dts: rockchip: add mipi csi-2 receiver nodes to rk3588
      arm64: dts: rockchip: add vicap node to rk3588
      arm64: dts: rockchip: add radxa camera 4k on rock 5b+ cam0
      arm64: dts: rockchip: add radxa camera 4k on rock 5b+ cam1

Michal Piekos (4):
      riscv: dts: allwinner: d1s-t113: add hstimer node
      arm64: dts: allwinner: h616: add hstimer node
      arm: dts: allwinner: t113s: enable watchdog for reboot
      arm64: dts: allwinner: a523: add gpadc node

Midgy BALON (1):
      arm64: dts: rockchip: rock-3b: Model PI6C20100 as gated-fixed-clock

Mike Hsieh (1):
      ARM: dts: aspeed: clemente: Remove IOB NIC TMP421 nodes

MoeLeak (2):
      riscv: dts: thead: Add TH1520 I2C1 controller
      riscv: dts: thead: Enable WiFi on Lichee Pi 4A

Mohamed Ayman (1):
      ARM: dts: ixp4xx: use phandle-based GPIOs in mi424wr

Mukesh Ojha (1):
      arm64: dts: qcom: Drop unused remoteproc_adsp_glink label

Nazim Amirul (1):
      arm64: dts: socfpga: agilex5: Fix phy-mode to rgmii as HW provides=
 clock delay

Neil Cheng (2):
      dt-bindings: arm: aspeed: Add Meta Rainiera6 board
      ARM: dts: aspeed: rainiera6: Add Meta Rainiera6 BMC

Nguyen Tran (2):
      arm64: dts: renesas: r8a779md: Add Renesas R-Car R8A779MD M3Le DTs
      arm64: dts: renesas: r8a779md: Add support for R-Car M3Le R8A779MD=
 Geist

Nicholas Piggin (1):
      dt-bindings: iommu: riscv: Add bindings for Tenstorrent RISC-V IOM=
MU

Nick Xie (9):
      arm64: dts: amlogic: meson-s4: add UART_A node
      arm64: dts: amlogic: meson-s4-s905y4-khadas-vim1s: enable bluetooth
      arm64: dts: amlogic: meson-s4-s905y4-khadas-vim1s: add PWM LED sup=
port
      arm64: dts: amlogic: meson-s4-s905y4-khadas-vim1s: add POWER key s=
upport
      arm64: dts: amlogic: meson-s4: add internal SARADC controller
      arm64: dts: amlogic: meson-s4-s905y4-khadas-vim1s: add Function ke=
y support
      arm64: dts: amlogic: meson-s4: add VRTC node
      arm64: dts: amlogic: meson-s4-s905y4-khadas-vim1s: enable HYM8563 =
RTC
      arm64: dts: amlogic: meson-s4-s905y4-khadas-vim1s: use rc-khadas k=
eymap

Nickolay Goppen (5):
      dt-bindings: firmware: qcom: scm: add CP_ADSP_SHARED VMID
      arm64: dts: qcom: sdm660: set cdsp compute-cbs' regs properly
      arm64: dts: qcom: sdm630: set adsp compute-cbs' regs properly
      arm64: dts: qcom: sdm630: describe adsp_mem region properly
      arm64: dts: qcom: sdm630: assign adsp_mem region to ADSP FastRPC n=
ode

Niravkumar L Rabara (1):
      ARM: dts: socfpga: arria10: Increase JFFS2 rootfs partition size

Nora Schiffer (4):
      dt-bindings: arm: ti: Add compatible for AM625-based TQMa62xx SOM =
family and carrier board
      arm64: dts: ti: Add TQ-Systems TQMa62xx SoM and MBa62xx carrier bo=
ard Device Trees
      arm64: dts: ti: k3-j722s-main: use J722S compatibles for WIZ, gmii=
-sel and CPSW3G
      arm64: dts: freescale: fsl-ls1028a-tqmls1028a-mbls1028a: switch mm=
c aliases

Pankaj Patil (1):
      arm64: dts: qcom: glymur: Add qfprom efuse node

Paul Kocialkowski (4):
      arm64: dts: imx8mp-phyboard-pollux: Add HDMI support
      dt-bindings: media: sun6i-a31-csi: Add optional interconnect prope=
rties
      dt-bindings: media: sun6i-a31-isp: Add optional interconnect prope=
rties
      ARM: dts: sun8i: a83t: Add MIPI CSI-2 controller node

Paul Sajna (4):
      arm64: dts: qcom: sdm845-lg-common: Add camera flash
      arm64: dts: qcom: sdm845-lg-common: Change ipa gsi-loader to 'self=
', add memory-region
      arm64: dts: qcom: sdm845-lg-{judyln, judyp}: Reference memory regi=
on in fb
      arm64: dts: qcom: sdm845-lg: Enable qcom,snoc-host-cap-skip-quirk

Peng Fan (5):
      arm64: dts: imx8x-colibri: Correct SODIMM PAD settings
      Revert "arm64: dts: imx8mm-kontron: Add support for reading SD_VSE=
L signal"
      Revert "arm64: dts: imx8mp-kontron: Add support for reading SD_VSE=
L signal"
      arm64: dts: imx95: Correct SMMU reg
      arm64: dts: imx95: Add SMMU PMU nodes

Pengyu Luo (1):
      arm64: dts: qcom: sc8280xp: Add ADSP FastRPC node

Peter Griffin (1):
      MAINTAINERS: Add Peter Griffin as a co-maintainer of Samsung Exyno=
s SoCs

Peter Robinson (1):
      arm64: dts: allwinner: sun50i-a64: Enable DT overlays

Petr Hodina (1):
      arm64: dts: qcom: sdm845-xiaomi-beryllium: Introduce framebuffer

Potin Lai (4):
      dt-bindings: arm: aspeed: add Meta SanMiguel BMC
      ARM: dts: aspeed: Add Meta SanMiguel BMC
      ARM: dts: aspeed: sanmiguel: Add IOEXP interrupt pin settings
      ARM: dts: aspeed: sanmiguel: Fix the CPU_CHIPTHROT linename

Prathamesh Shete (1):
      dt-bindings: tegra: pmc: Add Tegra238 compatible

Primoz Fiser (2):
      arm64: dts: freescale: imx{91,93}-phycore-som: Set BUCK5 in FPWM m=
ode
      arm64: dts: freescale: imx{91,93}-phycore-som: Adjust PHY RST driv=
e-strength

Quentin Schulz (2):
      arm64: dts: rockchip: fix Ethernet PHY not found on PX30 Cobra
      arm64: dts: rockchip: fix Ethernet PHY not found on PX30 Ringneck

Rex Fu (2):
      ARM: dts: aspeed: anacapa: Add interrupt properties for PDB PCA9555
      ARM: dts: aspeed: anacapa: Correct SGPIO names for monitoring

Richard Acayan (6):
      arm64: dts: qcom: sdm670: label the camss ports instead of endpoin=
ts
      arm64: dts: qcom: sdm670: add camera mclk pins
      arm64: dts: qcom: sdm670-google-sargo: add imx355 front camera
      arm64: dts: qcom: sdm670: add lpi pinctrl
      arm64: dts: qcom: sdm670-google: add common device tree include
      arm64: dts: qcom: add support for pixel 3a xl with the tianma panel

Richard Genoud (TI) (2):
      arm64: dts: ti: k3-j722s: Add mcu domain peripherals specific to J=
722S
      arm64: dts: ti: k3-j722s: Add wakeup domain peripherals specific t=
o J722S

Richard Zhu (4):
      arm64: dts: imx94: Add pcie0 and pcie0-ep supports
      arm64: dts: imx943: Add pcie1 and pcie1-ep supports
      arm64: dts: imx943-evk: Add pcie[0,1] and pcie-ep[0,1] support
      arm64: dts: imx95: Correct PCIe outbound address space configurati=
on

Ritesh Kumar (1):
      arm64: dts: qcom: lemans: Add eDP ref clock for eDP PHYs

Robert Marko (1):
      arm64: dts: microchip: lan969x: add OTP node

Ronak Raheja (3):
      arm64: dts: qcom: kaanapali: Add USB support for Kaanapali SoC
      arm64: dts: qcom: kaanpaali: Add USB support for MTP platform
      arm64: dts: qcom: kaanpaali: Add USB support for QRD platform

Ronald Claveau (11):
      arm64: dts: amlogic: t7: Add eMMC, SD card and SDIO pinctrl nodes
      arm64: dts: amlogic: t7: Add PWM pinctrl nodes
      arm64: dts: amlogic: t7: khadas-vim4: Add power regulators
      arm64: dts: amlogic: t7: Add MMC controller nodes
      arm64: dts: amlogic: t7: Add PWM controller nodes
      arm64: dts: amlogic: t7: khadas-vim4: Add SDIO power sequence and =
WiFi clock
      arm64: dts: amlogic: t7: khadas-vim4: Add MMC nodes
      arm64: dts: amlogic: t7: Fix missing required reset property
      arm64: dts: amlogic: t7: khadas-vim4: reorder root node
      arm64: dts: amlogic: t7: khadas-vim4: add PWM-driven status LED
      arm64: dts: amlogic: t7: Add i2c pinctrl node

Rosen Penev (3):
      ARM: dts: NSP: Move MX6X pinctrl config to PWM node
      ARM: dts: BCM5301X: R6300v2: fix USB3
      ARM: dts: BCM5301X: EA6500v2: fix USB3

Ryan Chen (4):
      dt-bindings: arm: aspeed: Add AST2700 board compatible
      arm64: Kconfig: Add ASPEED SoC family Kconfig support
      arm64: dts: aspeed: Add initial AST27xx SoC device tree
      arm64: dts: aspeed: Fix duplicate pinctrl labels and address scheme

Sandie Cao (2):
      dt-bindings: riscv: spacemit: add deepcomputing,fml13v05
      riscv: dts: spacemit: add DeepComputing FML13V05 board device tree

Saurabh Anand (1):
      arm64: dts: qcom: sm8750: allow mode-switch events to reach the QM=
P Combo PHY

Sebastian Reichel (1):
      MAINTAINERS: Add Rockchip keyword matching

Shawn Guo (1):
      arm64: dts: qcom: lemans: Move PCIe devices into soc node

Shengjiu Wang (2):
      dt-bindings: arm: fsl: Add compatible for i.MX95 15x15 audio board=
 (version 2)
      arm64: dts: add support for NXP i.MX95 15x15 audio board (version =
2)

Sherry Sun (16):
      arm64: dts: imx8mp-evk: Disable PCIe bus in the default dts
      arm64: dts: imx95-15x15-evk: Disable PCIe bus in the default dts
      arm64: dts: imx: Add common imx-m2-pcie.dtso to enable PCIe on M.2=
 connector
      arm64: dts: imx8dxl-evk: Remove unnecessary PCIe EP properties
      arm64: dts: imx8qxp-mek: Remove unnecessary PCIe EP vpcie-supply
      arm64: dts: imx95-19x19-evk: Fix PCIe EP vpcie-supply
      ARM: dts: imx6qdl: Add Root Port node and PERST property
      ARM: dts: imx6sx: Add Root Port node and PERST property
      ARM: dts: imx7d: Add Root Port node and PERST property
      arm64: dts: imx8mm: Add Root Port node and PERST property
      arm64: dts: imx8mp: Add Root Port node and PERST property
      arm64: dts: imx8mq: Add Root Port node and PERST property
      arm64: dts: imx8dxl/qm/qxp: Add Root Port node and PERST property
      arm64: dts: imx95: Add Root Port node and PERST property
      arm64: dts: imx943-evk: Fix PCIe EP vpcie-supply
      arm64: dts: imx943-evk-sdwifi: add a new dtso to support SDIW612 W=
iFi

Shuai Zhang (1):
      arm64: dts: qcom: monaco-arduino-monza: Add Bluetooth UART node

Shuwei Wu (1):
      riscv: dts: spacemit: Add thermal sensor for K1 SoC

Sibi Sankar (2):
      arm64: dts: qcom: glymur: Add ADSP and CDSP for Glymur SoC
      arm64: dts: qcom: glymur-crd: Enable ADSP and CDSP

Sowon Na (1):
      arm64: dts: exynosautov920: enable support for ufs controller

Stefan D=C3=B6singer (2):
      dt-bindings: arm: zte: Add D-Link DWR932M board based on zx297520v=
3 SoC
      ARM: dts: zte: Add D-Link DWR-932M support

Stefano Radaelli (15):
      arm64: dts: imx91-var-dart-sonata: add RGB enable supply for PCA64=
08
      dt-bindings: arm: fsl: add Variscite DART-MX93 Boards
      arm64: dts: freescale: Add support for Variscite DART-MX93
      arm64: dts: imx93-var-dart: Add support for Variscite Sonata board
      dt-bindings: arm: fsl: add Variscite VAR-SOM-MX91 Boards
      arm64: dts: freescale: Add support for Variscite VAR-SOM-MX91
      arm64: dts: imx91-var-som: Add support for Variscite Symphony board
      arm64: dts: imx95-var-dart-sonata: add TPM reset GPIO
      arm64: dts: imx95-var-dart-sonata: add CAN controller
      arm64: dts: imx91-var-som-symphony: fix RGB_SEL handling
      arm64: dts: imx93-var-som-symphony: add TPM support
      arm64: dts: imx93-var-som-symphony: enable UART7
      arm64: dts: imx93-var-som-symphony: keep RGB_SEL low
      arm64: dts: imx93-var-som-symphony: enable TPM3 PWM
      arm64: dts: imx93-var-som-symphony: enable ADC

Sten-Silver Ots (1):
      arm64: dts: rockchip: Enable the NPU on rk3588-rock-5-itx

Sven P=C3=BCschel (1):
      arm64: dts: rockchip: add rga3 dt nodes to rk3588

Svyatoslav Ryhel (13):
      dt-bindings: memory: Document Tegra114 Memory Controller
      dt-bindings: memory: Document Tegra114 External Memory Controller
      ARM: tegra: Add EMC OPP and ICC properties to Tegra114 EMC and ACT=
MON device-tree nodes
      ARM: tegra: Add DC interconnections for Tegra114
      ARM: tegra: Configure Tegra114 power domains
      ARM: tegra: lg-x3: Complete video device graph
      ARM: tegra: lg-x3: Set PMIC's RTC address
      ARM: tegra: grouper: Add support for front camera
      ARM: tegra: transformer: Add support for front camera
      ARM: tegra: transformers: Add connector node for common trees
      ARM: tegra: tf600t: Configure panel
      ARM: tegra: tf600t: Drop backlight regulator
      ARM: tegra: tf600t: Invert accelerometer calibration matrix

Taniya Das (2):
      arm64: dts: qcom: Add support for MM clock controllers for Glymur
      arm64: dts: qcom: sm8750: Add camera clock controller

Thierry Reding (2):
      dt-bindings: reserved-memory: Change maintainer for BPMP SHMEM
      Merge tag 'memory-controller-drv-tegra-dt-bindings-7.2' of https:/=
/git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl into for-7.=
2/arm/dt

Thomas Gerner (1):
      riscv: dts: thead: Enable wifi on the BeagleV-Ahead

Thomas Richard (TI) (1):
      arm64: dts: ti: k3-j721s2-som-p0: add bootph-pre-ram property to P=
MIC-B

Tommaso Merciai (4):
      arm64: dts: renesas: r9a09g057: Add #mux-state-cells to usb2{0,1}p=
hyrst
      arm64: dts: renesas: r9a09g056: Add #mux-state-cells to usb20phyrst
      arm64: dts: renesas: r9a09g047: Add fcpvd{0,1} nodes
      arm64: dts: renesas: r9a09g047: Add vspd{0,1} nodes

Trevor Gamblin (1):
      riscv: dts: spacemit: k1-musepi-pro: add SD card support with UHS =
modes

Troy Mitchell (1):
      riscv: dts: spacemit: Add PDMA controller node for K3 SoC

Uwe Kleine-K=C3=B6nig (1):
      ARM: dts: stm32: add board pin documentation stm32mp135f-dk

Val Packett (2):
      dt-bindings: arm: qcom: Add SM7325 Motorola Edge 30 (dubai)
      arm64: dts: qcom: Add Motorola Edge 30 (dubai) DTS

Viken Dadhaniya (6):
      arm64: dts: qcom: qcs6490-rb3gen2: Enable CAN bus controller
      arm64: dts: qcom: talos: Add QSPI support
      arm64: dts: qcom: qcs615-ride: Enable QSPI and NOR flash
      arm64: dts: qcom: kodiak: Add QSPI memory interconnect path
      arm64: dts: qcom: sc7180: Add QSPI memory interconnect path
      arm64: dts: qcom: hamoa-iot-evk: add MCP2518FD CAN on spi18

Vishnu Saini (1):
      arm64: dts: qcom: lemans-evk-ifp-mezzanine: Enable mdss1 display P=
ort

Vitor Soares (10):
      arm64: dts: ti: k3-am62-verdin: Add DSI to HDMI adapter overlay
      arm64: dts: ti: k3-am62-verdin: Add Toradex DSI to LVDS adapter wi=
th 10.1" display
      arm64: dts: ti: k3-am62-verdin: Add Toradex Capacitive Touch Displ=
ay 10.1" LVDS
      arm64: dts: ti: k3-am62-verdin: Add Toradex Capacitive Touch Displ=
ay 10.1" DSI
      arm64: dts: ti: k3-am62-verdin: Add Toradex Capacitive Touch Displ=
ay 7" DSI
      arm64: dts: ti: k3-am62-verdin: Add NAU8822 Bridge Tied Load
      arm64: dts: ti: k3-am62-verdin: Reserve UART_4 for Cortex-M4F
      arm64: dts: ti: k3-am62-verdin: Add Toradex OV5640 CSI Cameras
      arm64: dts: ti: k3-am62-verdin: Add Toradex Verdin Mezzanine CAN
      arm64: dts: ti: k3-am62-verdin: Add Mezzanine with Toradex Display=
 10.1" LVDS

Wadim Egorov (1):
      arm64: dts: ti: am62-phyboard-lyra: Add DT overlay for Lincoln LCD=
185-101CT panel

Weixin Guo (1):
      arm64: dts: rockchip: fix rk809 interrupt pin on rk3566-roc-pc

Wojciech Slenska (1):
      arm64: dts: qcom: agatti: Add IPA nodes

Wolfram Sang (1):
      dt-bindings: soc: renesas: Document MFIS IP core

Xilin Wu (1):
      arm64: dts: qcom: sc8280xp: drop unused polling-delay-passive prop=
erties

Xin Liu (1):
      arm64: dts: qcom: purwa: Add EL2 overlay for purwa-iot-evk

Yedaya Katsman (1):
      arm64: dts: qcom: sm6125-xiaomi-laurel-sprout: Enable MDSS and add=
 panel

Yixun Lan (6):
      dts: riscv: spacemit: correct 32k clock frequency
      riscv: dts: spacemit: k3: Add USB2.0 support
      riscv: dts: spacemit: k3: Add pwm support
      dt-bindings: riscv: spacemit: Add K3 CoM260-IFX board
      riscv: dts: spacemit: k3: Initial support for CoM260-IFX board
      dts: riscv: spacemit: k3: Fix I/O power settings

Yu-Chun Lin (1):
      arm64: dts: realtek: Add pinctrl support for RTD1625

 Documentation/devicetree/bindings/arm/altera.yaml  |    7 +
 Documentation/devicetree/bindings/arm/apple.yaml   |   18 +
 .../devicetree/bindings/arm/apple/apple,pmgr.yaml  |    4 +-
 .../devicetree/bindings/arm/aspeed/aspeed.yaml     |    8 +
 Documentation/devicetree/bindings/arm/fsl.yaml     |   45 +-
 Documentation/devicetree/bindings/arm/gemini.yaml  |   10 +
 Documentation/devicetree/bindings/arm/qcom.yaml    |   21 +-
 .../bindings/arm/tegra/nvidia,tegra186-pmc.yaml    |    2 +
 Documentation/devicetree/bindings/arm/ti/k3.yaml   |    7 +
 Documentation/devicetree/bindings/arm/zte.yaml     |   26 +
 .../devicetree/bindings/bus/fsl,spba-bus.yaml      |    4 +
 .../bindings/clock/cirrus,cs2000-cp.yaml           |   11 +-
 .../bindings/clock/qcom,ipq9650-gcc.yaml           |   68 +
 .../bindings/clock/renesas,cpg-clocks.yaml         |    8 +-
 .../bindings/display/bridge/lvds-codec.yaml        |    1 +
 .../interrupt-controller/sifive,plic-1.0.0.yaml    |    1 +
 .../devicetree/bindings/iommu/riscv,iommu.yaml     |   59 +-
 .../bindings/media/allwinner,sun6i-a31-csi.yaml    |    6 +
 .../bindings/media/allwinner,sun6i-a31-isp.yaml    |    6 +
 .../memory-controllers/nvidia,tegra124-emc.yaml    |  174 +-
 .../memory-controllers/nvidia,tegra124-mc.yaml     |   31 +-
 .../bindings/net/bluetooth/qcom,wcn6855-bt.yaml    |    7 +-
 .../bindings/pinctrl/renesas,rzg2l-pinctrl.yaml    |   35 +
 .../bindings/power/apple,pmgr-pwrstate.yaml        |    4 +-
 .../devicetree/bindings/pwm/apple,s5l-fpwm.yaml    |    1 +
 .../nvidia,tegra264-bpmp-shmem.yaml                |    3 +-
 .../devicetree/bindings/riscv/spacemit.yaml        |    6 +
 .../soc/renesas/renesas,r8a78000-mfis.yaml         |  187 ++
 .../devicetree/bindings/soc/renesas/renesas.yaml   |    6 +
 .../devicetree/bindings/soc/sophgo/sophgo.yaml     |    4 +
 .../devicetree/bindings/timer/sifive,clint.yaml    |    1 +
 .../devicetree/bindings/vendor-prefixes.yaml       |    2 +
 .../bindings/watchdog/technologic,ts4800-wdt.yaml  |   40 +
 .../devicetree/bindings/watchdog/ts4800-wdt.txt    |   25 -
 MAINTAINERS                                        |    7 +-
 arch/arm/boot/dts/Makefile                         |    1 +
 arch/arm/boot/dts/allwinner/sun8i-a83t.dtsi        |   43 +
 arch/arm/boot/dts/allwinner/sun8i-t113s.dtsi       |    4 +
 arch/arm/boot/dts/aspeed/Makefile                  |    2 +
 .../aspeed/aspeed-bmc-asus-kommando-ipmi-card.dts  |   18 +
 .../dts/aspeed/aspeed-bmc-facebook-anacapa.dts     |   34 +-
 .../dts/aspeed/aspeed-bmc-facebook-clemente.dts    |   20 -
 .../dts/aspeed/aspeed-bmc-facebook-rainiera6.dts   | 1012 ++++++++
 .../dts/aspeed/aspeed-bmc-facebook-sanmiguel.dts   |  672 +++++
 .../dts/aspeed/aspeed-bmc-facebook-yosemite5.dts   |    5 +
 .../boot/dts/aspeed/aspeed-bmc-nvidia-msx4-bmc.dts |   15 +
 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi            |  552 ++--
 arch/arm/boot/dts/broadcom/bcm2711-rpi-4-b.dts     |    2 +-
 arch/arm/boot/dts/broadcom/bcm2711-rpi-cm4-io.dts  |    2 +-
 .../dts/broadcom/bcm4708-linksys-ea6500-v2.dts     |    4 +
 .../boot/dts/broadcom/bcm4708-netgear-r6300-v2.dts |    4 +
 .../dts/broadcom/bcm958625-meraki-mx6x-common.dtsi |    6 +-
 arch/arm/boot/dts/gemini/Makefile                  |    2 +
 arch/arm/boot/dts/gemini/gemini-nas4210b.dts       |  205 ++
 arch/arm/boot/dts/gemini/gemini-nas4220b.dts       |    1 +
 arch/arm/boot/dts/gemini/gemini-rut1xx.dts         |   18 +-
 arch/arm/boot/dts/gemini/gemini-sq201.dts          |    2 +-
 .../dts/gemini/gemini-verbatim-s08v1901-d1.dts     |  225 ++
 arch/arm/boot/dts/gemini/gemini.dtsi               |   17 +
 .../intel/ixp/intel-ixp42x-actiontec-mi424wr.dtsi  |    6 +-
 arch/arm/boot/dts/intel/socfpga/socfpga.dtsi       |    4 +-
 .../boot/dts/intel/socfpga/socfpga_arria10.dtsi    |    4 +-
 .../intel/socfpga/socfpga_arria10_socdk_nand.dts   |    4 +-
 arch/arm/boot/dts/mediatek/mt6589.dtsi             |   11 +
 arch/arm/boot/dts/mediatek/mt7623.dtsi             |   64 +-
 arch/arm/boot/dts/mediatek/mt8135.dtsi             |    2 +-
 arch/arm/boot/dts/microchip/sama7d65.dtsi          |    8 +
 .../boot/dts/nvidia/tegra114-peripherals-opp.dtsi  | 1439 +++++++++++
 arch/arm/boot/dts/nvidia/tegra114.dtsi             |  157 ++
 arch/arm/boot/dts/nvidia/tegra124-nyan.dtsi        |    5 +
 arch/arm/boot/dts/nvidia/tegra124-venice2.dts      |    5 +
 .../nvidia/tegra20-asus-transformer-common.dtsi    |   22 +-
 .../nvidia/tegra30-asus-nexus7-grouper-common.dtsi |  128 +
 .../tegra30-asus-nexus7-grouper-maxim-pmic.dtsi    |    4 +-
 .../tegra30-asus-nexus7-grouper-ti-pmic.dtsi       |    4 +-
 arch/arm/boot/dts/nvidia/tegra30-asus-tf600t.dts   |   71 +-
 .../nvidia/tegra30-asus-transformer-common.dtsi    |  159 +-
 arch/arm/boot/dts/nvidia/tegra30-lg-p880.dts       |   41 +
 arch/arm/boot/dts/nvidia/tegra30-lg-p895.dts       |   46 +
 arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi        |  157 +-
 arch/arm/boot/dts/nxp/imx/Makefile                 |    3 +
 arch/arm/boot/dts/nxp/imx/imx25.dtsi               |    1 -
 arch/arm/boot/dts/nxp/imx/imx35.dtsi               |    1 -
 arch/arm/boot/dts/nxp/imx/imx51-babbage.dts        |    1 +
 arch/arm/boot/dts/nxp/imx/imx51-ts4800.dts         |    2 +-
 arch/arm/boot/dts/nxp/imx/imx53-cx9020.dts         |    1 +
 arch/arm/boot/dts/nxp/imx/imx53-m53menlo.dts       |   11 +-
 arch/arm/boot/dts/nxp/imx/imx53-ppd.dts            |    2 +
 arch/arm/boot/dts/nxp/imx/imx53-qsb-common.dtsi    |   10 +
 .../boot/dts/nxp/imx/imx53-sk-imx53-atm0700d4.dtsi |    1 +
 arch/arm/boot/dts/nxp/imx/imx53-sk-imx53.dts       |    7 +
 arch/arm/boot/dts/nxp/imx/imx53-smd.dts            |    2 +
 arch/arm/boot/dts/nxp/imx/imx53-tx53-x03x.dts      |    2 +-
 arch/arm/boot/dts/nxp/imx/imx6dl-gw52xx.dts        |    2 -
 arch/arm/boot/dts/nxp/imx/imx6dl-gw53xx.dts        |    2 -
 arch/arm/boot/dts/nxp/imx/imx6dl-gw54xx.dts        |    2 -
 arch/arm/boot/dts/nxp/imx/imx6q-display5.dtsi      |    2 +-
 arch/arm/boot/dts/nxp/imx/imx6q-gw52xx.dts         |    2 -
 arch/arm/boot/dts/nxp/imx/imx6q-gw53xx.dts         |    2 -
 arch/arm/boot/dts/nxp/imx/imx6q-gw54xx.dts         |    4 -
 arch/arm/boot/dts/nxp/imx/imx6q-novena.dts         |    1 +
 arch/arm/boot/dts/nxp/imx/imx6q-utilite-pro.dts    |   18 +-
 .../boot/dts/nxp/imx/imx6q-var-dt6customboard.dts  |    2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw51xx.dtsi      |    2 -
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw551x.dtsi      |    2 -
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw553x.dtsi      |    2 -
 arch/arm/boot/dts/nxp/imx/imx6qdl-nit6xlite.dtsi   |    2 +-
 .../boot/dts/nxp/imx/imx6qdl-nitrogen6_max.dtsi    |    2 +-
 .../boot/dts/nxp/imx/imx6qdl-nitrogen6_som2.dtsi   |    2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-nitrogen6x.dtsi  |    2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-pico.dtsi        |    2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-sabreauto.dtsi   |    2 -
 arch/arm/boot/dts/nxp/imx/imx6qdl-sabresd.dtsi     |    5 +
 arch/arm/boot/dts/nxp/imx/imx6qdl-tx6.dtsi         |    5 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi             |   11 +
 arch/arm/boot/dts/nxp/imx/imx6qp-sabreauto.dts     |    5 +
 arch/arm/boot/dts/nxp/imx/imx6sx-sdb.dtsi          |    5 +
 arch/arm/boot/dts/nxp/imx/imx6sx.dtsi              |   11 +
 arch/arm/boot/dts/nxp/imx/imx6ul-14x14-evk.dtsi    |    1 +
 arch/arm/boot/dts/nxp/imx/imx6ul-pico-hobbit.dts   |    2 +-
 arch/arm/boot/dts/nxp/imx/imx6ul-pico-pi.dts       |    2 +-
 arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul.dtsi        |    2 +-
 .../arm/boot/dts/nxp/imx/imx6ul-var-som-audio.dtsi |   30 +
 .../boot/dts/nxp/imx/imx6ul-var-som-common.dtsi    |  187 ++
 .../nxp/imx/imx6ul-var-som-concerto-common.dtsi    |  215 ++
 .../dts/nxp/imx/imx6ul-var-som-concerto-full.dts   |   22 +
 .../boot/dts/nxp/imx/imx6ul-var-som-concerto.dts   |  318 +--
 .../arm/boot/dts/nxp/imx/imx6ul-var-som-enet1.dtsi |   44 +
 .../arm/boot/dts/nxp/imx/imx6ul-var-som-enet2.dtsi |   79 +
 .../dts/nxp/imx/imx6ul-var-som-lvds-panel.dtsi     |  112 +
 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-sd.dtsi   |   27 +
 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-wifi.dtsi |   75 +
 arch/arm/boot/dts/nxp/imx/imx6ul-var-som.dtsi      |  215 +-
 arch/arm/boot/dts/nxp/imx/imx6ul.dtsi              |    1 +
 .../dts/nxp/imx/imx6ull-var-som-concerto-full.dts  |   22 +
 .../boot/dts/nxp/imx/imx6ull-var-som-concerto.dts  |   21 +
 arch/arm/boot/dts/nxp/imx/imx6ull-var-som.dtsi     |   36 +
 arch/arm/boot/dts/nxp/imx/imx7-tqma7.dtsi          |   10 +
 arch/arm/boot/dts/nxp/imx/imx7d-pico-dwarf.dts     |    2 +-
 arch/arm/boot/dts/nxp/imx/imx7d-pico-pi.dts        |   68 +-
 arch/arm/boot/dts/nxp/imx/imx7d-sdb.dts            |    5 +
 arch/arm/boot/dts/nxp/imx/imx7d.dtsi               |   11 +
 arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi             |   12 +
 arch/arm/boot/dts/renesas/r7s72100-genmai.dts      |    3 -
 arch/arm/boot/dts/renesas/r7s72100-rskrza1.dts     |    2 -
 arch/arm/boot/dts/renesas/r7s72100.dtsi            |    2 +-
 arch/arm/boot/dts/renesas/r8a73a4.dtsi             |  114 +-
 arch/arm/boot/dts/renesas/r8a7740.dtsi             |  116 +-
 arch/arm/boot/dts/renesas/r8a7778.dtsi             |    2 +-
 arch/arm/boot/dts/renesas/r8a7779.dtsi             |    2 +-
 arch/arm/boot/dts/renesas/r8a7792.dtsi             |    2 +-
 .../dts/rockchip/rk3288-veyron-analog-audio.dtsi   |    2 -
 arch/arm/boot/dts/rockchip/rk3288-veyron.dtsi      |    5 +
 arch/arm/boot/dts/st/stm32mp135f-dhcor-dhsbc.dts   |    4 +
 arch/arm/boot/dts/st/stm32mp135f-dk.dts            |   28 +-
 arch/arm/boot/dts/st/stm32mp151c-mecio1r0.dts      |  128 +
 arch/arm/boot/dts/st/stm32mp153c-mecio1r1.dts      |  144 ++
 arch/arm/boot/dts/st/stm32mp15x-mecio1-io.dtsi     |  146 +-
 arch/arm/boot/dts/ti/omap/am335x-sl50.dts          |    4 +-
 arch/arm/boot/dts/ti/omap/dm8168-evm.dts           |    4 +
 .../boot/dts/ti/omap/motorola-cpcap-mapphone.dtsi  |    6 +-
 arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dts  |    4 +-
 arch/arm/boot/dts/zte/Makefile                     |    3 +
 arch/arm/boot/dts/zte/zx297520v3-dlink-dwr932m.dts |   22 +
 arch/arm/boot/dts/zte/zx297520v3.dtsi              |  103 +
 arch/arm64/Kconfig.platforms                       |    6 +
 arch/arm64/boot/dts/Makefile                       |    1 +
 arch/arm64/boot/dts/allwinner/Makefile             |    6 +
 arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi     |   38 +-
 arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi     |   19 +-
 .../dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts  |  215 ++
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi        |  482 ++++
 .../dts/amlogic/meson-gxl-s905d-phicomm-n1.dts     |   15 +
 .../dts/amlogic/meson-s4-s905y4-khadas-vim1s.dts   |   81 +
 arch/arm64/boot/dts/amlogic/meson-s4.dtsi          |   45 +
 arch/arm64/boot/dts/apple/Makefile                 |    5 +
 arch/arm64/boot/dts/apple/t8122-j433.dts           |   19 +
 arch/arm64/boot/dts/apple/t8122-j434.dts           |   19 +
 arch/arm64/boot/dts/apple/t8122-j504.dts           |   37 +
 arch/arm64/boot/dts/apple/t8122-j613.dts           |   35 +
 arch/arm64/boot/dts/apple/t8122-j615.dts           |   35 +
 arch/arm64/boot/dts/apple/t8122-jxxx.dtsi          |   48 +
 arch/arm64/boot/dts/apple/t8122-pmgr.dtsi          | 1149 +++++++++
 arch/arm64/boot/dts/apple/t8122-usbpd-i2c.dtsi     |   32 +
 arch/arm64/boot/dts/apple/t8122.dtsi               |  444 ++++
 arch/arm64/boot/dts/aspeed/Makefile                |    4 +
 .../dts/aspeed/aspeed-evb-flash-layout-128.dtsi    |   32 +
 arch/arm64/boot/dts/aspeed/aspeed-g7-a35.dtsi      |  194 ++
 .../boot/dts/aspeed/aspeed-g7-soc0-pinctrl.dtsi    |  225 ++
 arch/arm64/boot/dts/aspeed/aspeed-g7-soc0.dtsi     |  230 ++
 .../boot/dts/aspeed/aspeed-g7-soc1-pinctrl.dtsi    | 1011 ++++++++
 arch/arm64/boot/dts/aspeed/aspeed-g7-soc1.dtsi     |  557 ++++
 arch/arm64/boot/dts/aspeed/ast2700-evb.dts         |   65 +
 .../boot/dts/bst/bstc1200-cdcu1.0-adas_4c2g.dts    |   19 +
 arch/arm64/boot/dts/bst/bstc1200.dtsi              |   18 +
 arch/arm64/boot/dts/cix/sky1-power.h               |   13 +
 arch/arm64/boot/dts/cix/sky1.dtsi                  |   70 +
 arch/arm64/boot/dts/exynos/axis/artpec9.dtsi       |    3 +-
 arch/arm64/boot/dts/exynos/exynos2200.dtsi         |    3 +-
 arch/arm64/boot/dts/exynos/exynos850.dtsi          |    7 +
 arch/arm64/boot/dts/exynos/exynos990.dtsi          |    3 +-
 arch/arm64/boot/dts/exynos/exynosautov9.dtsi       |    3 +-
 arch/arm64/boot/dts/exynos/exynosautov920-sadk.dts |    8 +
 arch/arm64/boot/dts/exynos/exynosautov920.dtsi     |   27 +
 arch/arm64/boot/dts/exynos/google/gs101.dtsi       |    3 +-
 arch/arm64/boot/dts/freescale/Makefile             |  163 +-
 .../fsl-ls1028a-tqmls1028a-mbls1028a.dtsi          |    4 +-
 .../arm64/boot/dts/freescale/fsl-lx2160a-cex7.dtsi |   41 +-
 .../boot/dts/freescale/fsl-lx2160a-clearfog-cx.dts |    2 +
 .../dts/freescale/fsl-lx2160a-clearfog-itx.dtsi    |    7 +-
 .../boot/dts/freescale/fsl-lx2160a-half-twins.dts  |  830 ++++++
 .../boot/dts/freescale/fsl-lx2160a-honeycomb.dts   |    2 +
 .../arm64/boot/dts/freescale/fsl-lx2160a-rev2.dtsi |   48 +-
 arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi     |   24 +-
 .../boot/dts/freescale/fsl-lx2162a-clearfog.dts    |   37 +-
 arch/arm64/boot/dts/freescale/imx-m2-pcie.dtso     |   15 +
 arch/arm64/boot/dts/freescale/imx8-ss-hsio.dtsi    |   11 +
 arch/arm64/boot/dts/freescale/imx8dxl-evk.dts      |    7 +-
 .../freescale/imx8dxl-hummingboard-telematics.dts  |  560 ++++
 arch/arm64/boot/dts/freescale/imx8dxl-sr-som.dtsi  |  458 ++++
 arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi      |    5 +
 .../arm64/boot/dts/freescale/imx8mm-kontron-bl.dts |   10 +-
 .../boot/dts/freescale/imx8mm-kontron-osm-s.dtsi   |    7 +-
 .../dts/freescale/imx8mm-verdin-nonwifi-zinnia.dts |   21 +
 .../dts/freescale/imx8mm-verdin-wifi-zinnia.dts    |   21 +
 .../boot/dts/freescale/imx8mm-verdin-zinnia.dtsi   |  383 +++
 arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi   |   16 +-
 arch/arm64/boot/dts/freescale/imx8mm.dtsi          |   11 +
 .../dts/freescale/imx8mn-vhip4-evalboard-v1.dts    |    2 +-
 .../dts/freescale/imx8mn-vhip4-evalboard-v2.dts    |    2 +-
 arch/arm64/boot/dts/freescale/imx8mp-ab2.dts       |    2 +-
 .../imx8mp-dhcom-overlay-panel-ch101olhlwh.dtsi    |   37 +
 .../imx8mp-dhcom-overlay-panel-clock.dtsi          |   33 +
 .../imx8mp-dhcom-overlay-panel-common.dtsi         |   31 +
 .../freescale/imx8mp-dhcom-overlay-panel-dpi.dtsi  |   35 +
 .../imx8mp-dhcom-overlay-panel-etm0700g0edh6.dtsi  |   53 +
 .../freescale/imx8mp-dhcom-overlay-panel-lvds.dtsi |   22 +
 .../imx8mp-dhcom-pdk-overlay-eth2xfast.dtso        |   10 +
 ...dhcom-pdk2-overlay-505-200-x12-ch101olhlwh.dtso |   40 +
 .../imx8mp-dhcom-pdk2-overlay-531-100-x21.dtso     |   32 +
 .../imx8mp-dhcom-pdk2-overlay-531-100-x22.dtso     |   32 +
 .../imx8mp-dhcom-pdk2-overlay-560-300-x12.dtso     |   25 +
 .../arm64/boot/dts/freescale/imx8mp-dhcom-pdk2.dts |    2 +-
 ...dhcom-pdk3-overlay-505-200-x36-ch101olhlwh.dtso |   53 +
 .../imx8mp-dhcom-pdk3-overlay-531-100-x40.dtso     |   32 +
 .../imx8mp-dhcom-pdk3-overlay-531-100-x41.dtso     |   32 +
 .../imx8mp-dhcom-pdk3-overlay-560-300-x36.dtso     |   24 +
 .../imx8mp-dhcom-pdk3-overlay-732-100-x36.dtso     |   36 +
 ...mx8mp-dhcom-pdk3-overlay-ea-murata-2ae-x20.dtso |   56 +
 ...m-pdk3-overlay-nxp-spf-29853-c1-ov5640-x29.dtso |   32 +
 ...m-pdk3-overlay-nxp-spf-29853-c1-ov5640-x31.dtso |   32 +
 ...dhcom-pdk3-overlay-nxp-spf-29853-c1-ov5640.dtsi |   64 +
 .../arm64/boot/dts/freescale/imx8mp-dhcom-pdk3.dts |    2 +-
 ...com-picoitx-overlay-626-100-x2-ch101olhlwh.dtso |   77 +
 .../boot/dts/freescale/imx8mp-dhcom-picoitx.dts    |    3 +
 .../imx8mp-dhcom-som-overlay-eth1xfast.dtso        |   85 +
 .../imx8mp-dhcom-som-overlay-eth2xfast.dtso        |   29 +
 .../arm64/boot/dts/freescale/imx8mp-dhcom-som.dtsi |    4 +-
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts       |    9 +-
 .../boot/dts/freescale/imx8mp-kontron-bl-osm-s.dts |   14 +-
 .../boot/dts/freescale/imx8mp-kontron-osm-s.dtsi   |    7 +-
 .../dts/freescale/imx8mp-phyboard-pollux-rdk.dts   |   62 +
 .../dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts    |    3 +
 ...x8p-ml81-moduline-display-106-av101hdt-a10.dtso |   24 +
 ...x8p-ml81-moduline-display-106-av123z7m-n17.dtso |   19 +-
 .../dts/freescale/imx8mp-verdin-nonwifi-zinnia.dts |   21 +
 .../dts/freescale/imx8mp-verdin-wifi-zinnia.dts    |   21 +
 .../boot/dts/freescale/imx8mp-verdin-zinnia.dtsi   |  422 +++
 arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi   |   14 +-
 arch/arm64/boot/dts/freescale/imx8mp.dtsi          |   11 +
 arch/arm64/boot/dts/freescale/imx8mq-evk.dts       |   10 +
 arch/arm64/boot/dts/freescale/imx8mq.dtsi          |   22 +
 arch/arm64/boot/dts/freescale/imx8qm-mek.dts       |   10 +
 arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi  |   22 +
 .../boot/dts/freescale/imx8qm-tqma8qm-mba8x.dts    |  871 +++++++
 arch/arm64/boot/dts/freescale/imx8qm-tqma8qm.dtsi  |  325 +++
 arch/arm64/boot/dts/freescale/imx8qxp-mek.dts      |    6 +-
 arch/arm64/boot/dts/freescale/imx8ulp-evk.dts      |    4 +-
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi         |   67 +
 arch/arm64/boot/dts/freescale/imx8x-colibri.dtsi   |    4 +-
 arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts  |   15 +-
 .../imx91-93-phyboard-segin-peb-av-18.dtsi         |   93 +
 arch/arm64/boot/dts/freescale/imx91-9x9-qsb.dts    |  435 ++++
 .../freescale/imx91-phyboard-segin-peb-av-18.dtso  |   57 +
 .../boot/dts/freescale/imx91-phyboard-segin.dts    |   24 +-
 .../boot/dts/freescale/imx91-phycore-som.dtsi      |   39 +-
 .../boot/dts/freescale/imx91-var-dart-sonata.dts   |    9 +
 .../boot/dts/freescale/imx91-var-som-symphony.dts  |  527 ++++
 arch/arm64/boot/dts/freescale/imx91-var-som.dtsi   |  456 ++++
 arch/arm64/boot/dts/freescale/imx91_93_common.dtsi |    3 +
 .../boot/dts/freescale/imx93-11x11-evk-common.dtsi |    1 -
 .../imx93-9x9-qsb-ontat-kd50g21-40nt-a1.dtsi       |  110 +
 .../imx93-9x9-qsb-ontat-kd50g21-40nt-a1.dtso       |  106 +-
 .../freescale/imx93-9x9-qsb-tianma-tm050rdh03.dtso |   14 +
 arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts    |    1 -
 .../boot/dts/freescale/imx93-phyboard-nash.dts     |   39 +-
 .../freescale/imx93-phyboard-segin-peb-av-18.dtso  |   57 +
 .../boot/dts/freescale/imx93-phyboard-segin.dts    |   24 +-
 .../boot/dts/freescale/imx93-phycore-som.dtsi      |   39 +-
 .../boot/dts/freescale/imx93-var-dart-sonata.dts   |  654 +++++
 arch/arm64/boot/dts/freescale/imx93-var-dart.dtsi  |  461 ++++
 .../boot/dts/freescale/imx93-var-som-symphony.dts  |   61 +
 arch/arm64/boot/dts/freescale/imx94.dtsi           |  102 +-
 .../boot/dts/freescale/imx943-evk-sdwifi.dtso      |   15 +
 arch/arm64/boot/dts/freescale/imx943-evk.dts       |   85 +-
 arch/arm64/boot/dts/freescale/imx943.dtsi          |   75 +
 arch/arm64/boot/dts/freescale/imx95-15x15-ab2.dts  |  669 +++++
 arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts  |    9 +-
 arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts  |   12 +-
 .../boot/dts/freescale/imx95-19x19-frdm-pro.dts    | 1021 ++++++++
 .../boot/dts/freescale/imx95-aquila-clover.dts     |  285 +++
 arch/arm64/boot/dts/freescale/imx95-aquila-dev.dts |  389 +++
 arch/arm64/boot/dts/freescale/imx95-aquila.dtsi    | 1160 +++++++++
 .../boot/dts/freescale/imx95-toradex-smarc-dev.dts |    5 +
 .../boot/dts/freescale/imx95-toradex-smarc.dtsi    |   46 +-
 .../boot/dts/freescale/imx95-var-dart-sonata.dts   |   29 +-
 .../arm64/boot/dts/freescale/imx95-verdin-ivy.dtsi |    1 -
 .../dts/freescale/imx95-verdin-nonwifi-zinnia.dts  |   21 +
 .../dts/freescale/imx95-verdin-wifi-zinnia.dts     |   21 +
 .../boot/dts/freescale/imx95-verdin-zinnia.dtsi    |  429 ++++
 arch/arm64/boot/dts/freescale/imx95-verdin.dtsi    |   18 +-
 arch/arm64/boot/dts/freescale/imx95.dtsi           |  129 +-
 arch/arm64/boot/dts/freescale/imx952.dtsi          |   47 +
 arch/arm64/boot/dts/freescale/s32g2.dtsi           |   66 +-
 arch/arm64/boot/dts/freescale/s32g3.dtsi           |   70 +-
 arch/arm64/boot/dts/freescale/s32gxxxa-evb.dtsi    |   78 +-
 arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts  |   17 +-
 arch/arm64/boot/dts/intel/Makefile                 |    1 +
 .../arm64/boot/dts/intel/socfpga_agilex3_socdk.dts |    2 +
 arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi     |    4 +-
 .../arm64/boot/dts/intel/socfpga_agilex5_socdk.dts |    4 +-
 .../boot/dts/intel/socfpga_agilex5_socdk_013b.dts  |    4 +-
 .../dts/intel/socfpga_agilex5_socdk_modular.dts    |    4 +-
 .../boot/dts/intel/socfpga_agilex5_socdk_nand.dts  |    4 +-
 .../boot/dts/intel/socfpga_agilex7m_socdk.dts      |  103 +
 .../marvell/mmp/pxa1908-samsung-coreprimevelte.dts |   11 +-
 arch/arm64/boot/dts/marvell/mmp/pxa1908.dtsi       |    5 +-
 arch/arm64/boot/dts/mediatek/Makefile              |    8 +
 arch/arm64/boot/dts/mediatek/mt6359.dtsi           |   22 +-
 arch/arm64/boot/dts/mediatek/mt6365.dtsi           |   26 +
 .../boot/dts/mediatek/mt7981b-xiaomi-ax3000t.dts   |   36 +
 arch/arm64/boot/dts/mediatek/mt7981b.dtsi          |   15 +
 .../mediatek/mt7988a-bananapi-bpi-r4-pro-cn13.dtso |   20 +
 .../mediatek/mt7988a-bananapi-bpi-r4-pro-cn14.dtso |   20 +
 .../dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtsi  |   15 +-
 .../boot/dts/mediatek/mt8186-corsola-voltorb.dtsi  |    4 +
 arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi    |   41 +
 arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi   |   82 +-
 arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi    |  154 +-
 .../boot/dts/mediatek/mt8390-genio-700-evk.dts     |    7 +
 .../boot/dts/mediatek/mt8390-genio-common.dtsi     |   80 +-
 .../boot/dts/mediatek/mt8390-grinn-genio-som.dtsi  |    2 +-
 .../boot/dts/mediatek/mt8390-tungsten-smarc.dtsi   |  122 +-
 .../boot/dts/mediatek/mt8395-genio-common.dtsi     |   46 +-
 .../mediatek/mt8395-radxa-nio-12l-8-hd-panel.dtso  |    4 +-
 .../boot/dts/mediatek/mt8395-radxa-nio-12l.dts     |    8 +-
 arch/arm64/boot/dts/microchip/lan9691.dtsi         |    5 +
 arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts    |   25 +
 arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts    |   24 +
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi            |   52 +
 arch/arm64/boot/dts/nvidia/tegra132-norrin.dts     |    5 +
 arch/arm64/boot/dts/nvidia/tegra194.dtsi           |   17 +-
 arch/arm64/boot/dts/nvidia/tegra210-smaug.dts      |    7 +
 arch/arm64/boot/dts/nvidia/tegra234.dtsi           |   24 +-
 .../dts/nvidia/tegra264-p4071-0000+p3834-0008.dts  |   12 +
 arch/arm64/boot/dts/nvidia/tegra264.dtsi           |   88 +-
 arch/arm64/boot/dts/qcom/Makefile                  |    8 +
 arch/arm64/boot/dts/qcom/agatti.dtsi               |   63 +
 arch/arm64/boot/dts/qcom/eliza-mtp.dts             |  156 +-
 arch/arm64/boot/dts/qcom/eliza.dtsi                | 2707 +++++++++++++=
+++++--
 arch/arm64/boot/dts/qcom/glymur-crd.dts            |    4 -
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi           |   33 +-
 arch/arm64/boot/dts/qcom/glymur.dtsi               | 1856 ++++++++++++--
 arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts         |   21 +
 arch/arm64/boot/dts/qcom/hamoa.dtsi                |   77 +-
 arch/arm64/boot/dts/qcom/ipq5210.dtsi              |    7 +
 arch/arm64/boot/dts/qcom/ipq5424.dtsi              |    4 +-
 arch/arm64/boot/dts/qcom/ipq9650-rdp488.dts        |   79 +
 arch/arm64/boot/dts/qcom/ipq9650.dtsi              |  384 +++
 arch/arm64/boot/dts/qcom/kaanapali-mtp.dts         |   27 +
 arch/arm64/boot/dts/qcom/kaanapali-qrd.dts         |   27 +
 arch/arm64/boot/dts/qcom/kaanapali.dtsi            |  170 +-
 arch/arm64/boot/dts/qcom/kodiak.dtsi               |   17 +-
 .../boot/dts/qcom/lemans-evk-ifp-mezzanine.dtso    |   74 +
 arch/arm64/boot/dts/qcom/lemans-evk.dts            |    7 +
 arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi   |  110 +
 arch/arm64/boot/dts/qcom/lemans.dtsi               | 1001 +++++---
 arch/arm64/boot/dts/qcom/mahua.dtsi                |    1 +
 arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts   |   31 +-
 .../boot/dts/qcom/milos-nothing-asteroids.dts      |  964 +++++++
 arch/arm64/boot/dts/qcom/milos.dtsi                |   52 +-
 arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts  |   11 +
 arch/arm64/boot/dts/qcom/monaco.dtsi               |   37 +-
 arch/arm64/boot/dts/qcom/msm8998.dtsi              |    8 +-
 arch/arm64/boot/dts/qcom/pm7550ba-eliza.dtsi       |   70 +
 arch/arm64/boot/dts/qcom/pmh0104-glymur.dtsi       |    2 +-
 arch/arm64/boot/dts/qcom/qcs615-ride.dts           |   14 +-
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts       |   31 +
 arch/arm64/boot/dts/qcom/sar2130p.dtsi             |    2 +-
 arch/arm64/boot/dts/qcom/sc7180.dtsi               |   15 +-
 arch/arm64/boot/dts/qcom/sc8180x.dtsi              |    4 +-
 arch/arm64/boot/dts/qcom/sc8280xp-crd.dts          |    2 +-
 .../boot/dts/qcom/sc8280xp-huawei-gaokun3.dts      |    2 +-
 .../dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts     |    2 +-
 .../boot/dts/qcom/sc8280xp-microsoft-blackrock.dts |    2 +-
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi             |   49 +-
 arch/arm64/boot/dts/qcom/sdm630.dtsi               |   28 +-
 arch/arm64/boot/dts/qcom/sdm660.dtsi               |   36 +-
 .../boot/dts/qcom/sdm670-google-bonito-tianma.dts  |   32 +
 arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi |  712 +++++
 arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts   |  614 +----
 arch/arm64/boot/dts/qcom/sdm670.dtsi               |  119 +-
 .../qcom/sdm845-db845c-navigation-mezzanine.dtso   |    5 +
 arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi |   31 +
 arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi     |   22 +-
 arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts      |    4 +-
 arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dts       |    4 +-
 .../arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi |   79 +-
 .../boot/dts/qcom/sdm845-samsung-starqltechn.dts   |    7 +-
 arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts  |  127 +-
 .../dts/qcom/sdm845-xiaomi-beryllium-common.dtsi   |   19 +-
 .../boot/dts/qcom/sdm845-xiaomi-beryllium-ebbg.dts |    2 +-
 .../dts/qcom/sdm845-xiaomi-beryllium-tianma.dts    |    2 +-
 .../boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts  |   94 +
 arch/arm64/boot/dts/qcom/sm6350.dtsi               |   66 +
 arch/arm64/boot/dts/qcom/sm7325-motorola-dubai.dts | 1456 +++++++++++
 arch/arm64/boot/dts/qcom/sm8450-hdk.dts            |    2 +-
 arch/arm64/boot/dts/qcom/sm8450.dtsi               |   10 +-
 arch/arm64/boot/dts/qcom/sm8550.dtsi               |  375 ++-
 arch/arm64/boot/dts/qcom/sm8650.dtsi               |    8 +-
 arch/arm64/boot/dts/qcom/sm8750.dtsi               |   63 +-
 arch/arm64/boot/dts/qcom/talos-evk.dts             |   56 +
 arch/arm64/boot/dts/qcom/talos.dtsi                |  134 +
 arch/arm64/boot/dts/qcom/x1-hp-omnibook-x14.dtsi   |    2 +-
 .../boot/dts/qcom/x1p42100-asus-zenbook-a14.dtsi   |    2 +-
 arch/arm64/boot/dts/realtek/kent.dtsi              |   20 +
 arch/arm64/boot/dts/renesas/Makefile               |    1 +
 arch/arm64/boot/dts/renesas/condor-common.dtsi     |    2 +
 .../dts/renesas/draak-ebisu-panel-aa104xd12.dtso   |   28 +-
 arch/arm64/boot/dts/renesas/draak.dtsi             |    4 +-
 arch/arm64/boot/dts/renesas/ebisu.dtsi             |   38 +-
 arch/arm64/boot/dts/renesas/gray-hawk-single.dtsi  |   12 +-
 arch/arm64/boot/dts/renesas/hihope-rev4.dtsi       |    2 +-
 arch/arm64/boot/dts/renesas/panel-aa104xd12.dtsi   |   64 +-
 .../arm64/boot/dts/renesas/r8a77960-salvator-x.dts |    4 +
 .../boot/dts/renesas/r8a77960-salvator-xs.dts      |    4 +
 arch/arm64/boot/dts/renesas/r8a77960-ulcb.dts      |    4 +
 .../boot/dts/renesas/r8a77961-salvator-xs.dts      |    4 +
 arch/arm64/boot/dts/renesas/r8a77961-ulcb.dts      |    4 +
 arch/arm64/boot/dts/renesas/r8a77970-eagle.dts     |    2 +
 arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts     |    2 +
 arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dts     |    2 +
 arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts    |    2 +
 arch/arm64/boot/dts/renesas/r8a779md-geist.dts     |  720 ++++++
 arch/arm64/boot/dts/renesas/r8a779md.dtsi          |   59 +
 arch/arm64/boot/dts/renesas/r8a78000-ironhide.dts  |   65 +-
 arch/arm64/boot/dts/renesas/r8a78000.dtsi          |  178 +-
 arch/arm64/boot/dts/renesas/r9a07g043.dtsi         |    8 +-
 arch/arm64/boot/dts/renesas/r9a07g044.dtsi         |   18 +-
 arch/arm64/boot/dts/renesas/r9a07g054.dtsi         |    8 +-
 arch/arm64/boot/dts/renesas/r9a08g045.dtsi         |    1 +
 arch/arm64/boot/dts/renesas/r9a08g046.dtsi         |  786 +++++-
 arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts |  140 +-
 arch/arm64/boot/dts/renesas/r9a09g047.dtsi         |   53 +
 arch/arm64/boot/dts/renesas/r9a09g056.dtsi         |   71 +
 .../boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts    |   24 +
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi         |    3 +
 .../boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts    |    1 +
 arch/arm64/boot/dts/renesas/r9a09g077.dtsi         |  108 +
 .../boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts    |   15 +
 arch/arm64/boot/dts/renesas/r9a09g087.dtsi         |  108 +
 .../boot/dts/renesas/rz-smarc-cru-csi-ov5645.dtsi  |    5 +
 .../boot/dts/renesas/rz-smarc-du-adv7513.dtsi      |   10 +-
 arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi   |   49 +-
 arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi   |  204 ++
 .../boot/dts/renesas/rzt2h-n2h-evk-common.dtsi     |  274 +-
 arch/arm64/boot/dts/renesas/salvator-common.dtsi   |   30 +-
 .../boot/dts/renesas/salvator-panel-aa104xd12.dtso |   28 +-
 arch/arm64/boot/dts/renesas/ulcb.dtsi              |    4 +-
 .../boot/dts/renesas/white-hawk-cpu-common.dtsi    |    2 +
 arch/arm64/boot/dts/rockchip/Makefile              |    7 +
 arch/arm64/boot/dts/rockchip/px30-cobra.dtsi       |    2 +-
 arch/arm64/boot/dts/rockchip/px30-ringneck.dtsi    |    2 +-
 arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi       |    5 +
 .../dts/rockchip/rk3399-nanopi-r4s-enterprise.dts  |    2 +-
 .../arm64/boot/dts/rockchip/rk3399-nanopi-r4s.dtsi |   68 +
 .../boot/dts/rockchip/rk3399-pinebook-pro.dts      |    2 +-
 .../boot/dts/rockchip/rk3528-armsom-sige1.dts      |   25 +
 .../boot/dts/rockchip/rk3528-nanopi-zero2.dts      |   29 +
 arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts |   60 +
 arch/arm64/boot/dts/rockchip/rk3528-rock-2.dtsi    |   17 +
 arch/arm64/boot/dts/rockchip/rk3528-rock-2a.dts    |   11 +
 arch/arm64/boot/dts/rockchip/rk3528-rock-2f.dts    |   12 +
 arch/arm64/boot/dts/rockchip/rk3528.dtsi           |   88 +
 arch/arm64/boot/dts/rockchip/rk3566-roc-pc.dts     |    2 +-
 arch/arm64/boot/dts/rockchip/rk3568-nanopi-r5s.dts |    6 +-
 arch/arm64/boot/dts/rockchip/rk3568-radxa-e25.dts  |   14 +
 arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts    |   20 +-
 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi      |    3 +-
 .../boot/dts/rockchip/rk3576-100ask-dshanpi-a1.dts |   10 +
 .../boot/dts/rockchip/rk3576-armsom-sige5.dts      |   10 +
 arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts   |    9 +
 arch/arm64/boot/dts/rockchip/rk3576-evb2-v10.dts   |    9 +
 .../boot/dts/rockchip/rk3576-khadas-edge-2l.dts    |  620 +++++
 .../boot/dts/rockchip/rk3576-luckfox-core3576.dtsi |   22 +-
 arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dts  |    9 +
 .../arm64/boot/dts/rockchip/rk3576-nanopi-r76s.dts |   16 +-
 arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dts     |   10 +
 arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts    |   10 +
 arch/arm64/boot/dts/rockchip/rk3576.dtsi           |    6 +-
 .../boot/dts/rockchip/rk3588-armsom-sige7.dts      |   11 +
 arch/arm64/boot/dts/rockchip/rk3588-armsom-w3.dts  |   19 +
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi      |  199 +-
 .../boot/dts/rockchip/rk3588-coolpi-cm5-evb.dts    |   18 +-
 .../dts/rockchip/rk3588-coolpi-cm5-genbook.dts     |   12 +-
 .../arm64/boot/dts/rockchip/rk3588-coolpi-cm5.dtsi |    4 +
 .../boot/dts/rockchip/rk3588-edgeble-neu6a-io.dtsi |    1 +
 arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts   |   20 +
 arch/arm64/boot/dts/rockchip/rk3588-evb2-v10.dts   |   11 +
 arch/arm64/boot/dts/rockchip/rk3588-fet3588-c.dtsi |    1 +
 .../dts/rockchip/rk3588-firefly-core-3588j.dtsi    |    1 +
 .../dts/rockchip/rk3588-firefly-icore-3588q.dtsi   |    1 +
 .../boot/dts/rockchip/rk3588-firefly-itx-3588j.dts |   12 +
 .../rockchip/rk3588-friendlyelec-cm3588-nas.dts    |   18 +
 .../arm64/boot/dts/rockchip/rk3588-h96-max-v58.dts |   11 +
 arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts     |   24 +-
 .../arm64/boot/dts/rockchip/rk3588-mnt-reform2.dts |   12 +
 arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi |   21 +
 .../boot/dts/rockchip/rk3588-orangepi-5-max.dts    |   18 +-
 .../boot/dts/rockchip/rk3588-orangepi-5-plus.dts   |   20 +
 .../boot/dts/rockchip/rk3588-orangepi-5-ultra.dts  |   11 +-
 .../arm64/boot/dts/rockchip/rk3588-orangepi-5.dtsi |    1 +
 arch/arm64/boot/dts/rockchip/rk3588-roc-rt.dts     |   19 +
 arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts |   47 +-
 .../boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi   |   19 +-
 .../rk3588-rock-5b-plus-radxa-cam4k-cam0.dtso      |   99 +
 .../rk3588-rock-5b-plus-radxa-cam4k-cam1.dtso      |   99 +
 .../boot/dts/rockchip/rk3588-tiger-haikou.dts      |    4 +-
 arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi     |   20 +-
 .../arm64/boot/dts/rockchip/rk3588-toybrick-x0.dts |    1 +
 .../arm64/boot/dts/rockchip/rk3588-turing-rk1.dtsi |    2 +
 arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dts |   16 +
 arch/arm64/boot/dts/rockchip/rk3588s-evb1-v10.dts  |    1 +
 .../boot/dts/rockchip/rk3588s-gameforce-ace.dts    |   15 +-
 .../boot/dts/rockchip/rk3588s-indiedroid-nova.dts  |   13 +-
 .../boot/dts/rockchip/rk3588s-khadas-edge2.dts     |   15 +-
 .../arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi |   11 +
 arch/arm64/boot/dts/rockchip/rk3588s-odroid-m2.dts |   10 +
 .../boot/dts/rockchip/rk3588s-orangepi-5.dtsi      |   11 +
 .../dts/rockchip/rk3588s-orangepi-cm5-base.dts     |   12 +-
 .../boot/dts/rockchip/rk3588s-orangepi-cm5.dtsi    |    3 +
 .../boot/dts/rockchip/rk3588s-radxa-cm5-io.dts     |   10 +
 arch/arm64/boot/dts/rockchip/rk3588s-roc-pc.dts    |   17 +-
 arch/arm64/boot/dts/rockchip/rk3588s-rock-5a.dts   |   13 +-
 arch/arm64/boot/dts/rockchip/rk3588s-rock-5c.dts   |   13 +-
 arch/arm64/boot/dts/st/stm32mp251.dtsi             |    8 +-
 arch/arm64/boot/dts/ti/Makefile                    |   67 +
 arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts           |    1 +
 .../dts/ti/k3-am62-phyboard-lyra-oldi-lcd185.dtso  |  185 ++
 .../boot/dts/ti/k3-am625-tqma62xx-mba62xx.dts      | 1033 ++++++++
 arch/arm64/boot/dts/ti/k3-am625-tqma62xx.dtsi      |  360 +++
 .../dts/ti/k3-am625-verdin-dev-mezzanine-can.dtso  |   28 +
 ...-dev-mezzanine-panel-cap-touch-10inch-lvds.dtso |   98 +
 .../dts/ti/k3-am625-verdin-dev-nau8822-btl.dtso    |   14 +
 .../boot/dts/ti/k3-am625-verdin-dsi-to-hdmi.dtso   |   94 +
 ...-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtso |  124 +
 .../boot/dts/ti/k3-am625-verdin-ov5640-24mhz.dtso  |   17 +
 arch/arm64/boot/dts/ti/k3-am625-verdin-ov5640.dtsi |   71 +
 arch/arm64/boot/dts/ti/k3-am625-verdin-ov5640.dtso |   18 +
 ...k3-am625-verdin-panel-cap-touch-10inch-dsi.dtso |  132 +
 ...3-am625-verdin-panel-cap-touch-10inch-lvds.dtso |  120 +
 .../k3-am625-verdin-panel-cap-touch-7inch-dsi.dtso |  132 +
 .../boot/dts/ti/k3-am625-verdin-uart4-mcu.dtso     |   13 +
 arch/arm64/boot/dts/ti/k3-am62a7-sk.dts            |    2 +
 arch/arm64/boot/dts/ti/k3-j721s2-som-p0.dtsi       |    1 +
 arch/arm64/boot/dts/ti/k3-j722s-main.dtsi          |   32 +-
 arch/arm64/boot/dts/ti/k3-j722s-mcu.dtsi           |   15 +
 arch/arm64/boot/dts/ti/k3-j722s-wakeup.dtsi        |   18 +
 arch/arm64/boot/dts/ti/k3-j722s.dtsi               |    2 +
 arch/arm64/configs/defconfig                       |    1 +
 arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi  |    9 +
 .../riscv/boot/dts/microchip/mpfs-beaglev-fire.dts |   37 +-
 arch/riscv/boot/dts/microchip/mpfs-disco-kit.dts   |    4 -
 .../boot/dts/microchip/mpfs-icicle-kit-common.dtsi |    4 -
 arch/riscv/boot/dts/microchip/mpfs-m100pfsevp.dts  |    4 -
 arch/riscv/boot/dts/microchip/mpfs-polarberry.dts  |    4 -
 arch/riscv/boot/dts/microchip/mpfs-sev-kit.dts     |    4 -
 arch/riscv/boot/dts/microchip/mpfs-tysom-m.dts     |    4 -
 arch/riscv/boot/dts/microchip/mpfs.dtsi            |    6 +-
 .../boot/dts/microchip/pic64gx-curiosity-kit.dts   |   67 +-
 arch/riscv/boot/dts/microchip/pic64gx.dtsi         |   46 +-
 arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi        |  236 +-
 arch/riscv/boot/dts/sophgo/sg2042.dtsi             |    6 +-
 arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi        |  236 +-
 arch/riscv/boot/dts/spacemit/Makefile              |    2 +
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts    |   33 +-
 arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts  |   38 +-
 arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts     |  329 ++-
 arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts   |  157 ++
 arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts   |  292 +++
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi       |   60 +
 arch/riscv/boot/dts/spacemit/k1.dtsi               |  131 +-
 arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts     |   21 +
 arch/riscv/boot/dts/spacemit/k3-com260.dtsi        |  190 ++
 .../dts/spacemit/k3-deepcomputing-fml13v05.dts     |   31 +
 arch/riscv/boot/dts/spacemit/k3-pico-itx.dts       |   24 +
 arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi       |  623 +++++
 arch/riscv/boot/dts/spacemit/k3.dtsi               |  281 +-
 arch/riscv/boot/dts/tenstorrent/blackhole.dtsi     |   48 +
 arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts |   48 +
 arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts  |   47 +
 arch/riscv/boot/dts/thead/th1520.dtsi              |   11 +
 include/dt-bindings/clock/qcom,ipq9650-gcc.h       |  172 ++
 include/dt-bindings/clock/r8a73a4-clock.h          |    2 +
 include/dt-bindings/clock/r8a7740-clock.h          |    2 +
 include/dt-bindings/firmware/qcom,scm.h            |    1 +
 include/dt-bindings/memory/tegra114-mc.h           |   67 +
 .../pinctrl/renesas,r9a08g046-pinctrl.h            |   38 +
 include/dt-bindings/reset/qcom,ipq9650-gcc.h       |  215 ++
 include/dt-bindings/soc/renesas,r8a78000-mfis.h    |   28 +
 620 files changed, 48073 insertions(+), 3997 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/zte.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,ipq9650=
-gcc.yaml
 create mode 100644 Documentation/devicetree/bindings/soc/renesas/renesa=
s,r8a78000-mfis.yaml
 create mode 100644 Documentation/devicetree/bindings/watchdog/technolog=
ic,ts4800-wdt.yaml
 delete mode 100644 Documentation/devicetree/bindings/watchdog/ts4800-wd=
t.txt
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-rainier=
a6.dts
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-sanmigu=
el.dts
 create mode 100644 arch/arm/boot/dts/gemini/gemini-nas4210b.dts
 create mode 100644 arch/arm/boot/dts/gemini/gemini-verbatim-s08v1901-d1=
.dts
 create mode 100644 arch/arm/boot/dts/nvidia/tegra114-peripherals-opp.dt=
si
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-audio.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-common.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto-co=
mmon.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto-fu=
ll.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-enet1.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-enet2.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-lvds-panel.=
dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-sd.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-wifi.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-som-concerto-f=
ull.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-som-concerto.d=
ts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-som.dtsi
 create mode 100644 arch/arm/boot/dts/zte/Makefile
 create mode 100644 arch/arm/boot/dts/zte/zx297520v3-dlink-dwr932m.dts
 create mode 100644 arch/arm/boot/dts/zte/zx297520v3.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t8122-j433.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8122-j434.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8122-j504.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8122-j613.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8122-j615.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8122-jxxx.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t8122-pmgr.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t8122-usbpd-i2c.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t8122.dtsi
 create mode 100644 arch/arm64/boot/dts/aspeed/Makefile
 create mode 100644 arch/arm64/boot/dts/aspeed/aspeed-evb-flash-layout-1=
28.dtsi
 create mode 100644 arch/arm64/boot/dts/aspeed/aspeed-g7-a35.dtsi
 create mode 100644 arch/arm64/boot/dts/aspeed/aspeed-g7-soc0-pinctrl.dt=
si
 create mode 100644 arch/arm64/boot/dts/aspeed/aspeed-g7-soc0.dtsi
 create mode 100644 arch/arm64/boot/dts/aspeed/aspeed-g7-soc1-pinctrl.dt=
si
 create mode 100644 arch/arm64/boot/dts/aspeed/aspeed-g7-soc1.dtsi
 create mode 100644 arch/arm64/boot/dts/aspeed/ast2700-evb.dts
 create mode 100644 arch/arm64/boot/dts/freescale/fsl-lx2160a-half-twins=
.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx-m2-pcie.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8dxl-hummingboard-t=
elematics.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8dxl-sr-som.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-verdin-nonwifi-=
zinnia.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-verdin-wifi-zin=
nia.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-verdin-zinnia.d=
tsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-dhcom-overlay-p=
anel-ch101olhlwh.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-dhcom-overlay-p=
anel-clock.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-dhcom-overlay-p=
anel-common.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-dhcom-overlay-p=
anel-dpi.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-dhcom-overlay-p=
anel-etm0700g0edh6.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-dhcom-overlay-p=
anel-lvds.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk-overl=
ay-eth2xfast.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk2-over=
lay-505-200-x12-ch101olhlwh.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk2-over=
lay-531-100-x21.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk2-over=
lay-531-100-x22.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk2-over=
lay-560-300-x12.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk3-over=
lay-505-200-x36-ch101olhlwh.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk3-over=
lay-531-100-x40.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk3-over=
lay-531-100-x41.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk3-over=
lay-560-300-x36.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk3-over=
lay-732-100-x36.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk3-over=
lay-ea-murata-2ae-x20.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk3-over=
lay-nxp-spf-29853-c1-ov5640-x29.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk3-over=
lay-nxp-spf-29853-c1-ov5640-x31.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk3-over=
lay-nxp-spf-29853-c1-ov5640.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-dhcom-picoitx-o=
verlay-626-100-x2-ch101olhlwh.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-dhcom-som-overl=
ay-eth1xfast.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-dhcom-som-overl=
ay-eth2xfast.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-=
zinnia.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-zin=
nia.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-verdin-zinnia.d=
tsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qm-tqma8qm-mba8x.d=
ts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qm-tqma8qm.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx91-93-phyboard-segi=
n-peb-av-18.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx91-9x9-qsb.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx91-phyboard-segin-p=
eb-av-18.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx91-var-som-symphony=
.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx91-var-som.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-9x9-qsb-ontat-kd=
50g21-40nt-a1.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-9x9-qsb-tianma-t=
m050rdh03.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-phyboard-segin-p=
eb-av-18.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-var-dart-sonata.=
dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-var-dart.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx943-evk-sdwifi.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-15x15-ab2.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-19x19-frdm-pro.d=
ts
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-aquila-clover.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-aquila-dev.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-aquila.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-z=
innia.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-verdin-wifi-zinn=
ia.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-verdin-zinnia.dt=
si
 create mode 100644 arch/arm64/boot/dts/intel/socfpga_agilex7m_socdk.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt6365.dtsi
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4=
-pro-cn13.dtso
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4=
-pro-cn14.dtso
 create mode 100644 arch/arm64/boot/dts/qcom/ipq9650-rdp488.dts
 create mode 100644 arch/arm64/boot/dts/qcom/ipq9650.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/milos-nothing-asteroids.dts
 create mode 100644 arch/arm64/boot/dts/qcom/pm7550ba-eliza.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sdm670-google-bonito-tianma=
.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sm7325-motorola-dubai.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779md-geist.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779md.dtsi
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus-rad=
xa-cam4k-cam0.dtso
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus-rad=
xa-cam4k-cam1.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62-phyboard-lyra-oldi-lc=
d185.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-tqma62xx-mba62xx.dts
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-tqma62xx.dtsi
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-verdin-dev-mezzanine=
-can.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-verdin-dev-mezzanine=
-panel-cap-touch-10inch-lvds.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-verdin-dev-nau8822-b=
tl.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-verdin-dsi-to-hdmi.d=
tso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-verdin-dsi-to-lvds-p=
anel-cap-touch-10inch.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-verdin-ov5640-24mhz.=
dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-verdin-ov5640.dtsi
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-verdin-ov5640.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-verdin-panel-cap-tou=
ch-10inch-dsi.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-verdin-panel-cap-tou=
ch-10inch-lvds.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-verdin-panel-cap-tou=
ch-7inch-dsi.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-verdin-uart4-mcu.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-j722s-mcu.dtsi
 create mode 100644 arch/arm64/boot/dts/ti/k3-j722s-wakeup.dtsi
 create mode 100644 arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts
 create mode 100644 arch/riscv/boot/dts/spacemit/k3-com260.dtsi
 create mode 100644 arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v=
05.dts
 create mode 100644 include/dt-bindings/clock/qcom,ipq9650-gcc.h
 create mode 100644 include/dt-bindings/pinctrl/renesas,r9a08g046-pinctr=
l.h
 create mode 100644 include/dt-bindings/reset/qcom,ipq9650-gcc.h
 create mode 100644 include/dt-bindings/soc/renesas,r8a78000-mfis.h
