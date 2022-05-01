Return-Path: <SRS0=ovHZ=VJ=startmail.com=hanetzer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6901C433F5
	for <soc@archiver.kernel.org>; Sun,  1 May 2022 17:34:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 64C8CC385B2; Sun,  1 May 2022 17:34:41 +0000 (UTC)
Received: from mx-out2.startmail.com (mx-out2.startmail.com [145.131.90.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 016F6C385A9;
	Sun,  1 May 2022 17:34:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 016F6C385A9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=startmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=startmail.com
From: "Marty E. Plummer" <hanetzer@startmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=startmail.com;
	s=2020-07; t=1651426477;
	bh=tPKqcMoeXO7fbOhD7EzqxPB0j0wCmwR22hp6X3JxcpQ=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:From:Subject:To:Date:Sender:
	 Content-Type:Content-Transfer-Encoding:Content-Disposition:
	 Mime-Version:Reply-To:In-Reply-To:References:Message-Id:Autocrypt;
	b=XfylJujgPDxhUPj14UR8eI/v2OYDosnRFRlwFgWdUjup1ZjOFs/ek+bOCrJwmDBSv
	 KQo1nZ+aFpCDRHjXi4ayrHD17AAj//FYewB1g9Gn+R6hL8YFeb0yqsRdYfPAsykx7y
	 1Rj2dXbCwllftTpA5WvDxLn5cTvbKxpm5B5X5Gw+o4HqqhKJHKl2aUYNt2hGTxHD85
	 o6ktWQ1eKt4RSdH/H0IkAEsdQRh+0fHXmyfJmNG1qZ+rh+jRJcaceeYDNWV41ZR1Cp
	 ZrrZAV0Ny8xeJg42Jia7CGrT+es+URAKWRSeD+dKzsZ+xzQZj17zBsZaP8HqPv6qiv
	 wJRGcYFCPyKXA==
List-Id: <soc.lore.kernel.org>
To: arnd@arndb.de,
	cai.huoqing@linux.dev,
	christian.koenig@amd.com,
	devicetree@vger.kernel.org,
	gengdongjiu@huawei.com,
	hanetzer@startmail.com,
	krzysztof.kozlowski+dt@linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux@armlinux.org.uk,
	michael@walle.cc,
	miquel.raynal@bootlin.com,
	mturquette@baylibre.com,
	novikov@ispras.ru,
	olof@lixom.net,
	p.yadav@ti.com,
	rdunlap@infradead.org,
	richard@nod.at,
	robh+dt@kernel.org,
	sboyd@kernel.org,
	soc@kernel.org,
	sumit.semwal@linaro.org,
	tudor.ambarus@microchip.com,
	vigneshr@ti.com,
	xuwei5@hisilicon.com
Subject: [RFC v2 0/2] Hi3521a support.
Date: Sun,  1 May 2022 12:34:21 -0500
Message-Id: <20220501173423.2473093-1-hanetzer@startmail.com>
In-Reply-To: <20220501054440.2434247-1-hanetzer@startmail.com>
References: <20220501054440.2434247-1-hanetzer@startmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Resend RFC.

Changes in v2:
- Actually include the dts files.
- DT Bindings still missing, as the the driver is not quite complete
  (need to add the reset controller bindings, have't quite figured that
  out yet.)

Marty E. Plummer (2):
  clk: hisilicon: add CRG driver Hi3521a SoC
  arm: hisi: enable Hi3521a soc

 arch/arm/boot/dts/Makefile                |   2 +
 arch/arm/boot/dts/hi3521a-rs-dm290e.dts   | 134 +++++++
 arch/arm/boot/dts/hi3521a.dtsi            | 423 ++++++++++++++++++++++
 arch/arm/mach-hisi/Kconfig                |   9 +
 drivers/clk/hisilicon/Kconfig             |   8 +
 drivers/clk/hisilicon/Makefile            |   1 +
 drivers/clk/hisilicon/crg-hi3521a.c       | 141 ++++++++
 include/dt-bindings/clock/hi3521a-clock.h |  34 ++
 8 files changed, 752 insertions(+)
 create mode 100644 arch/arm/boot/dts/hi3521a-rs-dm290e.dts
 create mode 100644 arch/arm/boot/dts/hi3521a.dtsi
 create mode 100644 drivers/clk/hisilicon/crg-hi3521a.c
 create mode 100644 include/dt-bindings/clock/hi3521a-clock.h

-- 
2.35.1

