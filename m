Return-Path: <SRS0=b6Fa=EO=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B394C71153
	for <soc@archiver.kernel.org>; Tue, 29 Aug 2023 21:48:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0EB41C433C7; Tue, 29 Aug 2023 21:48:48 +0000 (UTC)
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com [64.147.123.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6FA19C433C8
	for <soc@kernel.org>; Tue, 29 Aug 2023 21:48:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6FA19C433C8
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.west.internal (Postfix) with ESMTP id 14E893200987;
	Tue, 29 Aug 2023 17:48:44 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Tue, 29 Aug 2023 17:48:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:sender:subject:subject:to:to; s=fm3; t=1693345724; x=
	1693432124; bh=hXajlw+n1cV4NCXACDaoPC/8NPhydjLm0TKUL3fGwuc=; b=b
	kkFw2AO7tqE9A4K/w/FvoxoCFhTMm+ScfQcV9APNiYa/d6tNeeYMgM7H9JpKNy/3
	6f9kFmRgff9UCJI5yisytOuhJH/1wgFiYhEt7ZjuCQb8A/RKYMPRHN7PQo2lTzu4
	kesXFnmlYMmgFHLlkK9ReqK2eTp1ymIpqHIOwikMBBlk4vRJiH/I+DyNQ9n6yu8b
	QDJBSzeF4BX6nUIz5Dyt4ekASzl3FJ1IIAcveh7nYK/2MKTYLl13xOkov8BQDazi
	c/85NN67EpIKyTcQhIWM/Lq5x7wswsBA3ihAPfVGb+MlkOAD0pdK+XBZ+olV6d1x
	f49BWoJIK4AWYHCMMoLAQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:sender
	:subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1693345724; x=1693432124; bh=h
	Xajlw+n1cV4NCXACDaoPC/8NPhydjLm0TKUL3fGwuc=; b=u0AaNgUmg7P/GH1b2
	F1ZP9EX8X6qoMTGaJBmoK4edsGV4pDYOD/ZbA9WH1RU8P8c/30MDEZ/v9uKlZk1O
	lzp7+CsR9tJeaQiRffGMB/dQPvJl+5cHv+E4cP8Q7sMStALxe+qxyR8qTKb7LHM2
	tY2829L5t0qnA1EPX9GsTcWmDXvNERBX834A3Y6tfBFE8nYDNcFaCUpTs7dLkYvm
	9CCJ7GMexZ3N+TBCKAXcPvoI8RIfOzOTprn0/c1v6EIGj6re1rps5M/fG8/7CaGa
	QoFNlE9Q4lvVBzKSyjE/iA22CI2Y9ArgkI8yaZ+2gAQRMoSW9QBXlxWCa1evYnJF
	h6+8A==
X-ME-Sender: <xms:vGfuZJNyZeqiyLYv2Ai5mvgydF-T_rFN2WvTTqEAZQpbF24Wmhfsbg>
    <xme:vGfuZL_2m1OAkiVKH2P-JDZSxDNbj87Uh9DItq-7GiPWhKmEtbp0E75-HbYX8Ito1
    Y9Kjm8FXlrNURTcH6c>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrudefjecutefuodetggdotefrodftvfcurf
    hrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefofgggkfffhffvvefutgfgsehtqhertderreejnecuhfhrohhmpedftehrnhguuceu
    vghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvghrnh
    epfeehleefteehledvieeifeeftefhkedvheehudelteevieekhefhgefhveekffeunecu
    vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnhguse
    grrhhnuggsrdguvg
X-ME-Proxy: <xmx:vGfuZIQBjMoucdsoQ1Lp2UrF84uwybJ9gZtiMsNQYrHWgoZsGbUoXQ>
    <xmx:vGfuZFupjCkEia20ifyFpwi1EWO7zlrNGHdvKqcNg1R6xRAA1H8r2w>
    <xmx:vGfuZBeiM1eN73BBzeWPnZsVFcoyE0_DOL0V6t_WK7iGxbUNSzTa9w>
    <xmx:vGfuZBFlz9JmOx1P4s6FhHn_VL7bEGgEvESC0o8VZDB-12IeX-Y6DQ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 2C20CB60089; Tue, 29 Aug 2023 17:48:44 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-701-g9b2f44d3ee-fm-20230823.001-g9b2f44d3
Mime-Version: 1.0
Message-Id: <4f60d13e-f060-491a-88c7-6f25323a48f8@app.fastmail.com>
Date: Tue, 29 Aug 2023 17:48:22 -0400
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
List-Id: <soc.lore.kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 soc@kernel.org
Subject: [GIT PULL 0/4] ARM: SoC changes for 6.6
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable

I have just under 1000 commits for the SoC tree, but very little
exciting going on overall, mostly cleanups. The most active
contributors by number of patches are:

    133 Krzysztof Kozlowski
     64 Konrad Dybcio
     55 Rob Herring
     33 Andrew Davis
     32 Fabio Estevam
     24 Thierry Reding
     21 Sebastian Reichel
     19 Jagan Teki
     19 Alexander Stein
     18 Ulf Hansson
     18 Dmitry Baryshkov
     17 Tim Harvey
     17 Rohit Agarwal
     17 Neil Armstrong
     16 Peng Fan
     15 Bartosz Golaszewski
     14 Stephan Gerhold
     13 Bjorn Andersson
     12 Rafa=C5=82 Mi=C5=82ecki

The dirstat shows that the largest changes are once
more for the Qualcomm devicetree files, which get both
a lot of cleanups and newly added hardware support:

   1.3% Documentation/devicetree/bindings/arm/
   0.9% Documentation/devicetree/bindings/clock/
   0.5% Documentation/devicetree/bindings/remoteproc/
   0.5% Documentation/devicetree/bindings/serial/
   0.6% Documentation/devicetree/bindings/soc/
   1.7% Documentation/devicetree/bindings/thermal/
   0.8% Documentation/devicetree/bindings/
   8.1% arch/arm/boot/dts/aspeed/
   1.0% arch/arm/boot/dts/broadcom/
   1.1% arch/arm/boot/dts/marvell/
   0.6% arch/arm/boot/dts/nspire/
   3.6% arch/arm/boot/dts/nxp/imx/
   0.7% arch/arm/boot/dts/nxp/ls/
   0.9% arch/arm/boot/dts/nxp/mxs/
   0.6% arch/arm/boot/dts/qcom/
   2.7% arch/arm/boot/dts/samsung/
   2.7% arch/arm/boot/dts/st/
   0.5% arch/arm/boot/dts/ti/
   1.2% arch/arm/boot/dts/
   1.6% arch/arm/
   0.6% arch/arm64/boot/dts/allwinner/
   0.5% arch/arm64/boot/dts/amlogic/
   9.6% arch/arm64/boot/dts/freescale/
   1.0% arch/arm64/boot/dts/intel/
   6.6% arch/arm64/boot/dts/nvidia/
  18.9% arch/arm64/boot/dts/qcom/
   0.9% arch/arm64/boot/dts/renesas/
   6.3% arch/arm64/boot/dts/rockchip/
   8.2% arch/arm64/boot/dts/ti/
   0.9% arch/arm64/boot/dts/xilinx/
   0.5% arch/arm64/boot/dts/
   1.7% arch/riscv/boot/dts/starfive/
   0.9% drivers/firmware/arm_scmi/
   0.9% drivers/firmware/
   0.8% drivers/genpd/
   2.8% drivers/soc/hisilicon/
   1.0% drivers/soc/qcom/
   1.1% drivers/soc/
   0.9% drivers/
   0.9% include/dt-bindings/clock/
   0.7% include/dt-bindings/
