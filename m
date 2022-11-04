Return-Path: <SRS0=D7si=3E=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99C1EC4332F
	for <soc@archiver.kernel.org>; Fri,  4 Nov 2022 11:40:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 58C74C433D6; Fri,  4 Nov 2022 11:40:13 +0000 (UTC)
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3131AC433D7;
	Fri,  4 Nov 2022 11:40:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3131AC433D7
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 096FF5C01AC;
	Fri,  4 Nov 2022 07:40:10 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute3.internal (MEProxy); Fri, 04 Nov 2022 07:40:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to; s=fm3; t=
	1667562010; x=1667648410; bh=/0+S/V06l1ed5bj3s02GkWbIHu3S41SI63b
	tL2YKGpY=; b=QhoRb0vl9LJRTgFijB/SoOxx/lahgvIu723hdwrr8LUy0kiQbsH
	LqoFJS6vffRFelEwRsl8XSB8NwsqOO8XZxdqrRId+lK0+yABh9wbb1OKEp62hSPO
	+ZqdDYINHfJOd8dGZMU8ADolhGHWnbjuuptWIxyKBYc3M3ZCOG2LdvpgmYzr9btk
	8zAXw+ykTIoERpmFj21R+h5/H5o1dyII1vdgUL01LWUvfqfmCgNvbDlDdVZ2gBf1
	KXeL9zIdM6fE2y6zfSSy83Hvln6/m0aJC4NBYJ2kfN+27yY2Wc4DU5YaxjjrT3/X
	VQvPPalKUkHdY9j+vGs73VGWzvlx4S343pw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:message-id:mime-version
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1667562010; x=
	1667648410; bh=/0+S/V06l1ed5bj3s02GkWbIHu3S41SI63btL2YKGpY=; b=h
	w60gBiJaG1JdcMZVNe1XvPJqvSyboD9dknMDIIkDL0wTaYQyDarc6Jrih0tKcuBk
	9P/nvButFJBQwsJzahpF93Baw/DQTLiLSPsu/lD5IRH3SaF8STGLR/cNeIPgUDhf
	gaY/a+dGkxtnu2XzVuDG3ei4eV5Jbqo2ue7903f92yUad0BX4dxqMN+u7boauCKJ
	SC+qNBE5HIxs853v7NUQfn+ww7eerjD+3pvwpyRINO4AyqpFL/3RJDIrhKAT3n2m
	AS1XoiCOyIoVCLTnaEkTE4YjlibKtXmG0glYYEYYTUjotx+Ck5bBxW1XTUQO6Stv
	k7U1YYMcjEK8NJ+Y6eG3A==
X-ME-Sender: <xms:GfpkY0As5MMIhavWFf-lg67HiGjqDKVGN953_t_WblJutIWSGHnFPQ>
    <xme:GfpkY2hz3vpFvG5JXP4vRvdWDhoDD_NbbetCNhCh6zWDh-fHaSNYFvigLzEYGt0Xq
    nM-v4mSVCAO36mh8_c>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrvddugddvkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpedvieefudekudegteefjeeuhffhvdduffelhfejhffhkedtieeigfeggeegkefgheen
    ucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdhgihhthhhusgdrtghomhenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgu
    sgdruggv
X-ME-Proxy: <xmx:GfpkY3nrpjdwpkDIYZZTdIlJHu1xrdXUYNGVJgrQ0GuSYbRmMcQy6w>
    <xmx:GfpkY6xkEPBlpwSuYogiu-1_M6v5yHZwqfpwx1k5RISOyqOojt2AeA>
    <xmx:GfpkY5QpQSQ3pnQR8g1S3-2KfSkI7gMewp_OconhUsY7wRVC4vQNfA>
    <xmx:GvpkY3PRvxglNn-tR4GoNE24i5vIW6r4Jim0XRTXEMr501-IP_EHwA>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id AAD0FB603ED; Fri,  4 Nov 2022 07:40:09 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-1087-g968661d8e1-fm-20221021.001-g968661d8
Mime-Version: 1.0
Message-Id: <518fccac-657a-4ff4-8dcd-5225421e989a@app.fastmail.com>
Date: Fri, 04 Nov 2022 12:38:47 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, "Shawn Guo" <shawnguo@kernel.org>,
 "Cristian Marussi" <cristian.marussi@arm.com>,
 "Sudeep Holla" <sudeep.holla@arm.com>
Subject: [GIT PULL] ARM: SoC fixes for 6.1, part 2
Content-Type: text/plain

The following changes since commit 247f34f7b80357943234f93f247a1ae6b6c3a740:

  Linux 6.1-rc2 (2022-10-23 15:27:33 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-6.1-2

for you to fetch changes up to 5449cabd95bbf141e2b7471e8d3cedb6f3b92492:

  Merge tag 'juno-fix-6.1' of git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux into arm/fixes (2022-11-02 21:58:46 +0100)

----------------------------------------------------------------
ARM: SoC fixes for 6.1, part 2

There are not a lot of important fixes for the soc tree yet this
time, but it's time to upstream what I got so far before more comes
The contents so far are:

 - DT Fixes for Arm Juno and ST-Ericsson Ux500 to add missing critical
   temperature points

 - A number of fixes for the Arm SCMI firmware, addressing correctness
   issues in the code, in particular error handling and resource leaks.

 - One error handling fix for the new i.MX93 power domain driver

 - Several devicetree fixes for NXP i.MX6/8/9 and Layerscape chips,
   fixing incorrect or missing DT properties for MDIO controller nodes,
   CPLD, USB and regulators for various boards, as well as some
   fixes for DT schema checks.

 - MAINTAINERS file updates for HiSilicon LPC Bus and Broadcom git URLs

----------------------------------------------------------------
Arnd Bergmann (4):
      Merge tag 'arm-soc/for-6.1/maintainers-fixes' of https://github.com/Broadcom/stblinux into arm/fixes
      Merge tag 'imx-fixes-6.1' of git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux into arm/fixes
      Merge tag 'scmi-fixes-6.1' of git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux into arm/fixes
      Merge tag 'juno-fix-6.1' of git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux into arm/fixes

Christophe JAILLET (1):
      soc: imx: imx93-pd: Fix the error handling path of imx93_pd_probe()

Cristian Marussi (7):
      firmware: arm_scmi: Cleanup the core driver removal callback
      firmware: arm_scmi: Suppress the driver's bind attributes
      firmware: arm_scmi: Make tx_prepare time out eventually
      firmware: arm_scmi: Make Rx chan_setup fail on memory errors
      firmware: arm_scmi: Fix devres allocation device in virtio transport
      firmware: arm_scmi: Fix deferred_tx_wq release on error paths
      arm64: dts: juno: Add thermal critical trip points

Ioana Ciornei (3):
      arm64: dts: lx2160a: specify clock frequencies for the MDIO controllers
      arm64: dts: ls1088a: specify clock frequencies for the MDIO controllers
      arm64: dts: ls208xa: specify clock frequencies for the MDIO controllers

Jay Fang (1):
      MAINTAINERS: Update HiSilicon LPC BUS Driver maintainer

Li Jun (4):
      arm64: dts: imx8mm: remove otg1/2 power domain dependency on hsio
      arm64: dts: imx8mm: correct usb power domains
      arm64: dts: imx8mn: remove otg1 power domain dependency on hsio
      arm64: dts: imx8mn: Correct the usb power domain

Linus Walleij (1):
      ARM: dts: ux500: Add trips to battery thermal zones

Marek Vasut (1):
      arm64: dts: imx8mm: Enable CPLD_Dn pull down resistor on MX8Menlo

Max Krummenacher (1):
      arm64: dts: verdin-imx8mp: fix ctrl_sleep_moci

Palmer Dabbelt (1):
      MAINTAINERS: git://github -> https://github.com for broadcom

Peng Fan (4):
      arm64: dts: imx8: correct clock order
      dt-bindings: power: gpcv2: add power-domains property
      arm64: dts: imx93: correct s4mu interrupt names
      arm64: dts: imx93: correct gpio-ranges

Petr Benes (1):
      ARM: dts: imx6dl-yapp4: Do not allow PM to switch PU regulator off on Q/QP

Tim Harvey (1):
      ARM: dts: imx6qdl-gw59{10,13}: fix user pushbutton GPIO offset

 .../devicetree/bindings/power/fsl,imx-gpcv2.yaml   |  3 ++
 MAINTAINERS                                        | 16 ++++-----
 arch/arm/boot/dts/imx6q-yapp4-crux.dts             |  4 +++
 arch/arm/boot/dts/imx6qdl-gw5910.dtsi              |  2 +-
 arch/arm/boot/dts/imx6qdl-gw5913.dtsi              |  2 +-
 arch/arm/boot/dts/imx6qp-yapp4-crux-plus.dts       |  4 +++
 arch/arm/boot/dts/ste-href.dtsi                    |  8 +++++
 arch/arm/boot/dts/ste-snowball.dts                 |  8 +++++
 arch/arm/boot/dts/ste-ux500-samsung-codina-tmo.dts |  8 +++++
 arch/arm/boot/dts/ste-ux500-samsung-codina.dts     |  8 +++++
 arch/arm/boot/dts/ste-ux500-samsung-gavini.dts     |  8 +++++
 arch/arm/boot/dts/ste-ux500-samsung-golden.dts     |  8 +++++
 arch/arm/boot/dts/ste-ux500-samsung-janice.dts     |  8 +++++
 arch/arm/boot/dts/ste-ux500-samsung-kyle.dts       |  8 +++++
 arch/arm/boot/dts/ste-ux500-samsung-skomer.dts     |  8 +++++
 arch/arm64/boot/dts/arm/juno-base.dtsi             | 14 ++++++++
 arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi     |  6 ++++
 arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi     |  6 ++++
 arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi     |  6 ++++
 arch/arm64/boot/dts/freescale/imx8-ss-conn.dtsi    | 18 +++++-----
 arch/arm64/boot/dts/freescale/imx8mm-mx8menlo.dts  | 16 ++++-----
 arch/arm64/boot/dts/freescale/imx8mm.dtsi          |  8 ++---
 arch/arm64/boot/dts/freescale/imx8mn.dtsi          |  4 +--
 arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi   | 20 +++++------
 arch/arm64/boot/dts/freescale/imx93.dtsi           | 11 +++---
 drivers/firmware/arm_scmi/bus.c                    | 11 ++++++
 drivers/firmware/arm_scmi/common.h                 |  5 ++-
 drivers/firmware/arm_scmi/driver.c                 | 41 ++++++++++++++--------
 drivers/firmware/arm_scmi/mailbox.c                |  2 +-
 drivers/firmware/arm_scmi/optee.c                  |  2 +-
 drivers/firmware/arm_scmi/shmem.c                  | 31 +++++++++++++---
 drivers/firmware/arm_scmi/smc.c                    |  2 +-
 drivers/firmware/arm_scmi/virtio.c                 | 26 ++++++++------
 drivers/soc/imx/imx93-pd.c                         | 17 +++++++--
 34 files changed, 267 insertions(+), 82 deletions(-)
