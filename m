Return-Path: <SRS0=T0ya=GO=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFD95C4332F
	for <soc@archiver.kernel.org>; Wed,  1 Nov 2023 23:39:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A3908C433C9; Wed,  1 Nov 2023 23:39:01 +0000 (UTC)
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7BA1FC433C7
	for <soc@kernel.org>; Wed,  1 Nov 2023 23:39:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7BA1FC433C7
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 7A7475C017E;
	Wed,  1 Nov 2023 19:38:59 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Wed, 01 Nov 2023 19:38:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1698881939; x=1698968339; bh=F1
	DCGCW1lBQGx3oWk6l1ZaaArAh1kPJB+/1646TCU88=; b=cU5tmODXG/ZE+43CMf
	n9Czs6AzFmJavHO0czDfmbY/q0vwHWZ8d7AfKIlOgYj6Jq1tYduG9Ug45p7P76gp
	Du5JsU86sz2xnFTZHgSCRnRJNIogs8HfR1xxvv+Akiif6/Ei8CE6f44ziHDLr6GS
	2+o0YuWiRvndDieaz8pWhQrfBC8cMt7x3+36zVKLGTCZgYgvbNxiyplI7iojO24i
	L5WnNAmmSDASt/d7PmaRuaDDbzekUuqTf0rvFLlKTnrBZm9LNp82Ca86sUGTQoc3
	0HWkJuSUKDHaA14vL+CAhFnkTNyKNE+u+ikmixhJHLSEaITzIiEyW1legMxWbxWp
	Toxg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1698881939; x=1698968339; bh=F1DCGCW1lBQGx
	3oWk6l1ZaaArAh1kPJB+/1646TCU88=; b=Q+jQe2bn6Swi+RertqkePFbDWzubK
	5phhnB/RCyqU2YuOBFKzFoK4RwArro+zlbkkxdvMFxoNoVlYSdw/r7cRhZtPWiN0
	XJu5snh2nzGKpxQ/eeHeG2sL0IXgHAUUPwt0eZM9Vf2vXowjmJLIL17veiofNqVY
	eCC5XTnmFdrVjWedfeTWlxZTRSN3vA5dybwNNBYNGXjOzLiuTmHGQohbiDe/9D3f
	bAbVPffH99p2n2v1ZXAyah+6Egbi52reQoH5x7U36wwH4sJRfAMpwlp58Wc5U6V9
	4DugwCx1JE/01jX6CqpIsyXNPg9agOAaX6T1cKooaV27HuhtUpy8+edKw==
X-ME-Sender: <xms:k-FCZVask4XTCjM0izcja_DhUDqGwwyeZFNq87DpanwR_1lPiXjGqw>
    <xme:k-FCZcbA80cWa91iw1OHh3a5DbP4RpkTEQQk4k1N6aLAJ_16otZOjVu3DSJJ_A02a
    6DuHYXmjaSZ5V52gRM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedruddthedguddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepvefhffeltdegheeffffhtdegvdehjedtgfekueevgfduffettedtkeekueef
    hedunecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpe
    dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:k-FCZX9Q4wNDGBqSEQYiJRzJLocPso1mlQt1W0zajv2psbKiroZUQw>
    <xmx:k-FCZTrMEn5wEB0ulJKikeJFeYYUy-0_XqtBrZ4X10CG9493aNscxA>
    <xmx:k-FCZQrVOF8s1TJW6OTqo-dlbmVVJ1DnxoEoOtu_mbBeA0AfgzQMTw>
    <xmx:k-FCZdBk_ZJYysQdw5_3QiCQsL2r_b6F9vXc1f6nreh04bd9O5GvzA>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id F281BB60089; Wed,  1 Nov 2023 19:38:58 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-1108-g3a29173c6d-fm-20231031.005-g3a29173c
MIME-Version: 1.0
Message-Id: <b2114f58-083c-43d0-a73e-660c030a0241@app.fastmail.com>
In-Reply-To: <263c2cf0-c35a-4d3c-85b3-fcb692cbfd40@app.fastmail.com>
References: <263c2cf0-c35a-4d3c-85b3-fcb692cbfd40@app.fastmail.com>
Date: Thu, 02 Nov 2023 00:38:38 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [GIT PULL 3/4] ARM defconfig updates for 6.7
Content-Type: text/plain

The following changes since commit 6465e260f48790807eef06b583b38ca9789b6072:

  Linux 6.6-rc3 (2023-09-24 14:31:13 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-defconfig-6.7

for you to fetch changes up to 216da5ebb83a13caece8032ee443acfd6a6083b6:

  Merge tag 'ti-k3-config-for-v6.7' of https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux into soc/defconfig (2023-10-27 17:28:10 +0200)

----------------------------------------------------------------
ARM defconfig updates for 6.7

These are the usual trivial changes to enable a couple of newly added
device drivers and remove lines for Kconfig options that are no
longer needed.

----------------------------------------------------------------
Alexander Stein (1):
      arm64: defconfig: Enable Samsung DSIM driver

Arnd Bergmann (9):
      Merge tag 'renesas-arm-defconfig-for-v6.7-tag1' of git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel into soc/defconfig
      Merge tag 'renesas-arm-defconfig-for-v6.7-tag2' of git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel into soc/defconfig
      Merge tag 'imx-defconfig-6.7' of git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux into soc/defconfig
      Merge tag 'qcom-arm64-defconfig-for-6.7' of https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux into soc/defconfig
      Merge tag 'aspeed-6.7-defconfig' of git://git.kernel.org/pub/scm/linux/kernel/git/joel/bmc into soc/defconfig
      Merge tag 'samsung-defconfig-6.7' of https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux into soc/defconfig
      Merge tag 'amlogic-defconfig-for-v6.7' of https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux into soc/defconfig
      Merge tag 'qcom-arm64-defconfig-for-6.7-2' of https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux into soc/defconfig
      Merge tag 'ti-k3-config-for-v6.7' of https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux into soc/defconfig

Claudiu Beznea (1):
      arm64: defconfig: Enable RZ/G3S (R9A08G045) SoC

Dmitry Baryshkov (2):
      arm64: defconfig: enable CONFIG_TYPEC_QCOM_PMIC
      arm64: defconfig: enable DisplayPort altmode support

Fabio Estevam (1):
      arm64: defconfig: Enable CONFIG_USB_MASS_STORAGE

Geert Uytterhoeven (1):
      ARM: shmobile: defconfig: Refresh for v6.6-rc3

Jai Luthra (1):
      arm64: defconfig: Enable TPS6593 PMIC for SK-AM62A

Joel Stanley (4):
      ARM: config: aspeed: Add new FSI drivers
      ARM: config: aspeed: Add Ampere SMPro drivers
      ARM: config: aspeed_g5: Enable SSIF BMC driver
      ARM: config: aspeed: Remove FIRMWARE_MEMMAP

Konrad Dybcio (1):
      arm64: defconfig: enable Qualcomm SM6115 LPASS pinctrl

Krzysztof Kozlowski (1):
      arm64: defconfig: enable Qualcomm SM8350 LPASS pinctrl

Marek Szyprowski (7):
      ARM: multi_v7_defconfig: make Exynos related PHYs modules
      ARM: multi_v7_defconfig: add AHCI_DWC driver
      ARM: exynos_defconfig: replace SATA_AHCI_PLATFORM with AHCI_DWC driver
      ARM: multi_v7_defconfig: add tm2-touchkey driver
      ARM: multi_v7_defconfig: add drivers for S5C73M3 & S5K6A3 camera sensors
      ARM: exynos_defconfig: add driver for ISL29018
      arm64: defconfig: add various drivers for Amlogic based boards

Neil Armstrong (1):
      arm64: defconfig: enable NB7VPQ904M driver as module

Svyatoslav Ryhel (1):
      ARM: s5pv210_defconfig: enable IIO required by MAX17040

Trevor Woerner (1):
      ARM: defconfig: cleanup orphaned CONFIGs

Varadarajan Narayanan (1):
      arm64: defconfig: Enable M31 USB phy driver

 arch/arm/configs/aspeed_g4_defconfig |  1 -
 arch/arm/configs/aspeed_g5_defconfig |  8 +++++++-
 arch/arm/configs/exynos_defconfig    |  3 ++-
 arch/arm/configs/keystone_defconfig  |  1 -
 arch/arm/configs/multi_v7_defconfig  |  7 ++++++-
 arch/arm/configs/omap2plus_defconfig |  8 --------
 arch/arm/configs/s5pv210_defconfig   |  1 +
 arch/arm/configs/shmobile_defconfig  |  2 +-
 arch/arm64/configs/defconfig         | 19 +++++++++++++++++++
 9 files changed, 36 insertions(+), 14 deletions(-)
