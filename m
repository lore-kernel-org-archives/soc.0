Return-Path: <SRS0=rPfG=CY=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A198AEB64DD
	for <soc@archiver.kernel.org>; Thu,  6 Jul 2023 08:21:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5A281C433C9; Thu,  6 Jul 2023 08:21:08 +0000 (UTC)
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A214FC433C8
	for <soc@kernel.org>; Thu,  6 Jul 2023 08:21:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A214FC433C8
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id 6BC655C00D4;
	Thu,  6 Jul 2023 04:21:05 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Thu, 06 Jul 2023 04:21:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm2; t=1688631665; x=1688718065; bh=RoJE5GTy67nX2a3Vmizguhy5l
	YuBkadye1gBut0tsZk=; b=B69HohW3KnwAJnk6maL5YW7ttivIu/DIzi0z9EbTQ
	PoTJc7Rg3GBKuGUlQRFw/7cT3pImBY7wMMjZe3UiEipupofrC6IuLT+2cS1ebtQn
	21GkZfWbRXc7bEOiWeBUEEXW9Vh+kon9eHuhw/WNM9J+a5dloPAb0+Ord88ORRhL
	Ugavncwbyatp8ea3IApQEiYUiYKZXJti9PG5hyj5/8TQTrfFjqXs5wsWhoMnx6QO
	pW2+5aIKOIvk71PJ430fVdLKH3lSxQ1OF2TLk50pxPAnUOjsSnsUjhTURecQ9Svb
	1XO5FR7uYtJLnbQponmRnQ4SOWdYOi2DiwDPh8MfQOVTw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1688631665; x=1688718065; bh=RoJE5GTy67nX2a3Vmizguhy5lYuBkadye1g
	But0tsZk=; b=ZzB1IMKQNThu7aao2ytl4LOyAo2LeVXi4i0qG8A1BXRJ11YSHOA
	yQ9Pk0lpyjvlWpqsNJzZ4KGQlyOdYSxU+l4CZdK2Rs0zzZn1DhukdU72QgdcNI23
	bokHrNJMElYCpZTQobN0GwSCEtjLJp4/2djiNp0av2QSGRaLokspQKqGpMD5KXu/
	FhSnylTNVkDuAXeDSiNeuF7V5zKM8eQw9VqBDUDC3gP5UgiKfujOBqCEzCWorw5S
	hMzTdWji/WBXnefyoXGUc8yY/eek4wiuDeP2ZULuYq+yTwhwmABcbJ4xI1FE+7li
	hrR2cJmUIei7huXKvGFMGbL+0kRx4uN1vmA==
X-ME-Sender: <xms:cXmmZIqPM-Xco4WCppcUGJUILbwJrAGgbl8CEHIOnGxyVs0S4w8vaA>
    <xme:cXmmZOo1GDEf3BEtBzkWFRsge1vy-hCj0MEb6UdrElhke9RSX1HsfLCSRQU5fffcz
    _7wifHNG4tT5WnTWl0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrudelgddtfecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpeeffeeuhfekjeevtddvtdelledttddtjeegvdfhtdduvdfhueekudeihfejtefgieen
    ucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgepudenuc
    frrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:cXmmZNOI1z6dSBCES5YO8pHhpdfQs_vZP04xC1p3E8N0ecj6-oPfNg>
    <xmx:cXmmZP4_GsgQyEB0ssktRWB_Cpq4rRzWpWAoXbyZFPWPypRPrkap4w>
    <xmx:cXmmZH43F0fanZ_QrrRiXiFHQh4iGpLlgNjuzu2SMhIzZFHYWU-kkQ>
    <xmx:cXmmZBQNLjYivsDFf6a7w8W6YNaUewMdOCn9YacsSRzI6mHJ5H5u_w>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 2FD51B60086; Thu,  6 Jul 2023 04:21:05 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-531-gfdfa13a06d-fm-20230703.001-gfdfa13a0
Mime-Version: 1.0
Message-Id: <a89a22e2-df89-4341-ba61-c42149e21c8e@app.fastmail.com>
Date: Thu, 06 Jul 2023 10:20:17 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] SoC fixes for 6.5, part 1
Content-Type: text/plain

The following changes since commit bf1fa6f15553df04f2bdd06190ccd5f388ab0777:

  Merge tag 'soc-arm-6.5' of git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc (2023-06-29 15:28:33 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-6.5-1

for you to fetch changes up to 6722e46513e0af8e2fff4698f7cb78bc50a9f13f:

  bus: ixp4xx: fix IXP4XX_EXP_T1_MASK (2023-07-05 22:22:55 +0200)

----------------------------------------------------------------
SoC fixes for 6.5, part 1

There are three small fixes that came up sincie the past week:

 - an incorrect bit offset in ixp4xx bus driver

 - a riscv randconfig regression in the thead platform I merged

 - whitespace fixes for some dts files

----------------------------------------------------------------

Conor Dooley (1):
      RISC-V: make ARCH_THEAD preclude XIP_KERNEL

Jonas Gorski (1):
      bus: ixp4xx: fix IXP4XX_EXP_T1_MASK

Krzysztof Kozlowski (1):
      ARM: dts: st: add missing space before {

 arch/arm/boot/dts/st/spear1310.dtsi                     |  2 +-
 arch/arm/boot/dts/st/spear1340.dtsi                     |  2 +-
 arch/arm/boot/dts/st/stih407-family.dtsi                |  2 +-
 arch/arm/boot/dts/st/stih407-pinctrl.dtsi               | 10 +++++-----
 arch/arm/boot/dts/st/stm32f429-disco.dts                |  2 +-
 arch/arm/boot/dts/st/stm32f746-pinctrl.dtsi             |  2 +-
 arch/arm/boot/dts/st/stm32f769-pinctrl.dtsi             |  2 +-
 arch/arm/boot/dts/st/stm32h7-pinctrl.dtsi               |  6 +++---
 arch/arm/boot/dts/st/stm32mp15-pinctrl.dtsi             |  4 ++--
 arch/arm/boot/dts/st/stm32mp157a-icore-stm32mp1.dtsi    |  6 +++---
 arch/arm/boot/dts/st/stm32mp157a-microgea-stm32mp1.dtsi |  6 +++---
 arch/riscv/Kconfig.socs                                 |  1 +
 drivers/bus/intel-ixp4xx-eb.c                           |  2 +-
 13 files changed, 24 insertions(+), 23 deletions(-)
