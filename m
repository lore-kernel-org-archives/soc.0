Return-Path: <SRS0=yzO4=NY=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E79D6C27C53
	for <soc@archiver.kernel.org>; Sat, 22 Jun 2024 08:04:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 93A7DC32786; Sat, 22 Jun 2024 08:04:02 +0000 (UTC)
Received: from fout2-smtp.messagingengine.com (fout2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 04666C32781
	for <soc@kernel.org>; Sat, 22 Jun 2024 08:04:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 04666C32781
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfout.nyi.internal (Postfix) with ESMTP id DDA871380476;
	Sat, 22 Jun 2024 04:03:59 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Sat, 22 Jun 2024 04:03:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:subject:subject:to:to; s=fm1;
	 t=1719043439; x=1719129839; bh=FKzlUcihx00bVVETpJ3r/7kehxB+3dQo
	D5llsgT0D3U=; b=lDHP4SotVG9Vvo61qI2QppJ8qQwutgHL5VCYBSJIIcOq9AZv
	Ewez0bPLD/7cAoChB4Ki20jGXYURg3MujmWsiP5PvtbruaWUmt2MVW/He5rFJso/
	gieniEbXCdDRJU4unYipj430bkOc1kmRTvPe3SwxBPjWBQ0rl9Kjc7GMHTk+oTEd
	XeYe//1bofXiJOcmCLNRDNHpX19NC83RKY77aEvmNahb+iHeTB0qAfR4BSuYzqDk
	DYnlpssw9mX4AgPzxxv1DzxZjm7vp/JdyJkCvL2w/0cTzkdzMflxn48U5AITO65U
	FMkfHB0A/acmZqM26LOjCjis+L59t8MXuN2Z/w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1719043439; x=1719129839; bh=FKzlUcihx00bVVETpJ3r/7kehxB+3dQoD5l
	lsgT0D3U=; b=DjTIcncxhWhbrlocm7SIfcPscohgQneLXNjQn2MqC58CbI5KmV+
	OIEAsN/F+GutgTdNCMPdP8PFAIpnwg3+1O9GDw2iFa+kFjRzzRSOVUAecdgQM7+c
	G2GIpzEA+HS2wmNAwgLZUJrHeeFGNMBajOYxotHEIC9nMAIiKKJF3SYI606w5WRj
	1+vP9S1uDgkbBvhlsL583OMZIKYXJNJQMz1OatsPa43pz7V9nSPSyfcmNE9wmEKH
	p3U8SJU5i3BxEe70LcAMx/9veaumamDcu2+fylKyJ/QFh0AVYw8Smw9D7Ua+JjXJ
	pXXCWPWGWLzfS0z1adh34W2sIr8zk+Vgy4A==
X-ME-Sender: <xms:b4V2ZpXibtXBsIzD4NWLXACS1hJq8G_9IAGX_Ss6adCrLhMvj6VKYw>
    <xme:b4V2ZplzGt8tN8XZnZL5zxXSFj-S-j7Z8lwHPG6DuZT9Txk-TnbNMN4Nemo6zmQls
    OxG8humlLXH-BH75q4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfeefhedguddvkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhn
    ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
    gvrhhnpedvieefudekudegteefjeeuhffhvdduffelhfejhffhkedtieeigfeggeegkefg
    heenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdhgihhthhhusgdrtghomhenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghr
    nhgusgdruggv
X-ME-Proxy: <xmx:b4V2ZlYGi_jgZemsrqqWgciCSY11SV0fuehyHGFsqjEPGYbY71HTSA>
    <xmx:b4V2ZsViDmtUKW1iirYsBMrM839qa5Yzx-ScJusz92QWlbJb647_iA>
    <xmx:b4V2ZjnQvKEOA_C9EF0IJQYCuzfAJFmlOvUKXd_1vfnt-VJHatN20Q>
    <xmx:b4V2Zpd66mMm-aMkrcpPDxKruGwO2v96R2N2ID8FjbbIl0sKufn5jA>
    <xmx:b4V2ZoxLslqJrAcMdFKsRRczSt7FtWO9Fbg27s_ddFuBgMaCS_jN4wq_>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 7DCF5B6008D; Sat, 22 Jun 2024 04:03:59 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-522-ga39cca1d5-fm-20240610.002-ga39cca1d
MIME-Version: 1.0
Message-Id: <6f44ef12-ccc0-4a55-bca1-1e8e89b17ac7@app.fastmail.com>
Date: Sat, 22 Jun 2024 10:03:59 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL ARM: SoC fixes for 6.10
Content-Type: text/plain

The following changes since commit 6ba59ff4227927d3a8530fc2973b80e94b54d58f:

  Linux 6.10-rc4 (2024-06-16 13:40:16 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-fixes-6.10

for you to fetch changes up to e7c3696d4692e8046d25f6e63f983e934e12f2c5:

  firmware: psci: Fix return value from psci_system_suspend() (2024-06-20 22:58:40 +0200)

----------------------------------------------------------------
SoC fixes for 6.10

There are seven oneline patches that each address a distinct problem
on the NXP i.MX platform, mostly the popular i.MX8M variant.

The only other two fixes are for error handling on the psci
firmware driver and SD card support on the milkv duo riscv
board.

----------------------------------------------------------------
Arnd Bergmann (2):
      Merge tag 'imx-fixes-6.10' of git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux into arm/fixes
      Merge tag 'riscv-sophgo-dt-fixes-for-v6.10-rc4' of https://github.com/sophgo/linux into arm/fixes

Fabio Estevam (1):
      arm64: dts: imx93-11x11-evk: Remove the 'no-sdio' property

Frank Li (1):
      arm64: dts: imx8qm-mek: fix gpio number for reg_usdhc2_vmmc

Haylen Chu (1):
      riscv: dts: sophgo: disable write-protection for milkv duo

Joao Paulo Goncalves (1):
      arm64: dts: freescale: imx8mm-verdin: Fix GPU speed

Liu Ying (1):
      arm: dts: imx53-qsb-hdmi: Disable panel instead of deleting node

Marek Vasut (1):
      arm64: dts: imx8mp: Fix TC9595 input clock on DH i.MX8M Plus DHCOM SoM

Max Krummenacher (1):
      arm64: dts: freescale: imx8mm-verdin: enable hysteresis on slow input pin

Sudeep Holla (1):
      firmware: psci: Fix return value from psci_system_suspend()

Tim Harvey (1):
      arm64: dts: freescale: imx8mp-venice-gw73xx-2x: fix BT shutdown GPIO

 arch/arm/boot/dts/nxp/imx/imx53-qsb-common.dtsi         | 2 +-
 arch/arm/boot/dts/nxp/imx/imx53-qsb-hdmi.dtso           | 6 ++++--
 arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi        | 3 ++-
 arch/arm64/boot/dts/freescale/imx8mp-dhcom-som.dtsi     | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-venice-gw73xx.dtsi | 2 +-
 arch/arm64/boot/dts/freescale/imx8qm-mek.dts            | 2 +-
 arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts       | 1 -
 arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dts        | 1 +
 drivers/firmware/psci/psci.c                            | 4 +++-
 9 files changed, 14 insertions(+), 9 deletions(-)
