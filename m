Return-Path: <SRS0=jB3W=56=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48CF6C61DA4
	for <soc@archiver.kernel.org>; Thu,  2 Feb 2023 20:56:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1140AC4339B; Thu,  2 Feb 2023 20:56:57 +0000 (UTC)
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 12F43C433EF
	for <soc@kernel.org>; Thu,  2 Feb 2023 20:56:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 12F43C433EF
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.west.internal (Postfix) with ESMTP id E507232005CA;
	Thu,  2 Feb 2023 15:56:53 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Thu, 02 Feb 2023 15:56:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1675371413; x=1675457813; bh=2exx0+SI5e
	rrgXygQAlDXpkSzhbDxEscB9KluUx0KHA=; b=Qzjcpe7vT26CEt2Q3ikvTvcnY8
	ZRoXxBErphhAPkty8iZaknH1I0xM6SNKI+gV3aOAfJ/eDa6k+ViQF7Gi+aHLmV+l
	DeVWo7S83dmxfX002OP3gio4RVq2dnavM5JvnajTAYWpfQHrRR3cmz12VBGS5ZdE
	JPPycIKVJUtDpBpNln/f/fOailtpR4OmQg2JkPEspeLN6Ff+D4LudKyZl6UfXWCr
	L/dxmDWw44kbhb6N9QBQVItuIR2mP8vR51UbIHSQbksO6k87w93eUhEwkIQ5i4pL
	MFGU6R9cdjGC7TtrpH9a1Ls/5oMNJC3HoWlnGZ9Qukr/W5FSvrnKf9JgPTnA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1675371413; x=1675457813; bh=2exx0+SI5errg
	XygQAlDXpkSzhbDxEscB9KluUx0KHA=; b=rxH7SgLmuHljP748Aoon8zEMo9GOS
	RxvyTUWRTrtAJdChNcpVcrhq+LuuDfkAEVhMrBrjwI1nBghLKJV/gM+XU1vzhI/U
	1chimswCfcEpEIwu+H6sLbysCiftBlT2fTO5HuGOsjr6fXkFunPzRgmx20pNx2m0
	NkuPK0tOzSCZP8P5b9I7E7kh8Bo0+oPapfIOTnxjxRudD65mN7eoWrL49BBw07GU
	KQvqDx0Oz3DyVvIxLleNqjygSMOtz1cmWwlQnMj3+4m/7THrXnRQp++u7BXva8xI
	vOfRABI3ksZ5bYjijvp+8pDaKtyAZpi7jMDHQBLoQOufCkFf8pqP53iBQ==
X-ME-Sender: <xms:lSPcYzxss-DqJRL0H6DU8qj4F5cSNKnjxlpiN5Vv1OKSwLvnxcgyRQ>
    <xme:lSPcY7QZ6fYJMVPz7nzIDtyijF-NDk8_c8-uYQbwdMhjCJ-YywQxYA8FyagV8fBAE
    mN8B1h9kCj0v1DivN0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudefkedgudegtdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfffhffvvefutgfgsehtqhertderreejnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepgfffvedutdeltdfhudeitddvvddtleefkefhgefgveevlefgiedtieelfeef
    gfeinecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpe
    dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:lSPcY9UBqE-qof7f81cQaTuuYZUj6c367Goz7New3hoZh_fXWi_iwg>
    <xmx:lSPcY9iRbYdNxv34G_0pSIGjhnXdNLrpM0G6yd39ciH_6Ff4TN5EKw>
    <xmx:lSPcY1DtEhqrBvhCPosTRe_2mF1NOajaDJ1auChPKzgS33m3jOXSBw>
    <xmx:lSPcYy4ARNoVf0ov__xVgNKZ2AncfyuWzydAzQIdne-8qX7yH8hjeg>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 4472BB60450; Thu,  2 Feb 2023 15:56:53 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-107-g82c3c54364-fm-20230131.002-g82c3c543
Mime-Version: 1.0
Message-Id: <98b46fed-4b4d-46f0-8975-d07df36534be@app.fastmail.com>
Date: Thu, 02 Feb 2023 21:53:40 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [GIT PULL] ARM: SoC fixes for 6.2, part 3
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable

The following changes since commit 2241ab53cbb5cdb08a6b2d4688feb13971058=
f65:

  Linux 6.2-rc5 (2023-01-21 16:27:01 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-f=
ixes-6.2-3

for you to fetch changes up to 5efb648042a1c3d1734e69ebbae2fe9477f4fc4d:

  ARM: dts: wpcm450: Add nuvoton,shm =3D <&shm> to FIU node (2023-02-01 =
17:10:45 +0100)

----------------------------------------------------------------
ARM: SoC fixes for 6.2, part 3

The majority of bugfixes is once more for the NXP i.MX platform,
addressing issue with i.MX8M (UART, watchdog and ethernet) as well as
imx8dxl power button and the USB modem on an imx7 board. The reason that
i.MX always shows up here is obviously not that they are more buggy than
the others, but they have the most boards and are good about getting
fixes in quickly.

The other DT fixes are for the Nuvoton wpcm450 flash controller and
the i2c mux on an ASpeed board.

Lastly, there are updates to the MAINTAINERS entries for Mediatek,
AMD/Seattle and NXP SoCs, as well as a lone code fix for error
handling in the allwinner "rsb" bus driver.

----------------------------------------------------------------
Ahmad Fatoum (1):
      MAINTAINERS: match freescale ARM64 DT directory in i.MX entry

Arnd Bergmann (2):
      Merge tag 'sunxi-fixes-for-6.2-1' of https://git.kernel.org/pub/sc=
m/linux/kernel/git/sunxi/linux into arm/fixes
      Merge tag 'imx-fixes-6.2-2' of git://git.kernel.org/pub/scm/linux/=
kernel/git/shawnguo/linux into arm/fixes

Eddie James (1):
      ARM: dts: aspeed: Fix pca9849 compatible

Fabio Estevam (2):
      arm64: dts: imx8m-venice: Remove incorrect 'uart-has-rtscts'
      ARM: dts: imx7d-smegw01: Fix USB host over-current polarity

Frank Li (1):
      arm64: dts: freescale: imx8dxl: fix sc_pwrkey's property name linu=
x,keycode

Jonathan Neusch=C3=A4fer (1):
      ARM: dts: wpcm450: Add nuvoton,shm =3D <&shm> to FIU node

Krzysztof Kozlowski (1):
      MAINTAINERS: amd: drop inactive Brijesh Singh

Marek Vasut (1):
      arm64: dts: imx8mm: Reinstate GPIO watchdog always-running propert=
y on eDM SBC

Matthias Brugger (1):
      MAINTAINERS: Update entry for MediaTek SoC support

Philippe Schenker (1):
      arm64: dts: imx8mm-verdin: Do not power down eth-phy

Pierluigi Passaro (1):
      arm64: dts: imx8mm: Fix pad control for UART1_DTE_RX

Yuan Can (1):
      bus: sunxi-rsb: Fix error handling in sunxi_rsb_init()

 MAINTAINERS                                                   | 11 ++++=
++++---
 arch/arm/boot/dts/aspeed-bmc-ibm-bonnell.dts                  |  2 +-
 arch/arm/boot/dts/imx7d-smegw01.dts                           |  3 ++-
 arch/arm/boot/dts/nuvoton-wpcm450.dtsi                        |  1 +
 arch/arm64/boot/dts/freescale/imx8dxl.dtsi                    |  2 +-
 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc.dts   |  1 +
 arch/arm64/boot/dts/freescale/imx8mm-pinfunc.h                |  2 +-
 .../boot/dts/freescale/imx8mm-venice-gw72xx-0x-rs232-rts.dtso |  1 -
 .../boot/dts/freescale/imx8mm-venice-gw73xx-0x-rs232-rts.dtso |  1 -
 arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx.dtsi       |  1 -
 arch/arm64/boot/dts/freescale/imx8mm-venice-gw7901.dts        |  3 ---
 arch/arm64/boot/dts/freescale/imx8mm-venice-gw7902.dts        |  3 ---
 arch/arm64/boot/dts/freescale/imx8mm-venice-gw7903.dts        |  1 -
 arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi              |  1 +
 arch/arm64/boot/dts/freescale/imx8mn-venice-gw7902.dts        |  1 -
 arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx.dts        |  1 -
 drivers/bus/sunxi-rsb.c                                       |  8 ++++=
+++-
 17 files changed, 23 insertions(+), 20 deletions(-)
