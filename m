Return-Path: <SRS0=zXmn=M4=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 712B0C4338F
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Aug 2021 15:58:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 391EA6105A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Aug 2021 15:58:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 391EA6105A
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=O+9mwcftyrbtaYB4tOWN6bvnOsNxAoZvvyzDcKZm8Tg=; b=e8v9VtKiD/mNEr
	doUCOqBNOZ4BHYuKhXJg/hkBfDkn0kPw+3+KYaR4W9uyPTjRribTJVymSfwH4SICeluYWtGKUSVZn
	8SP4jo97BVyaUSDTdFrH7tH6Mu/VoH9xptGJ1XFFfMyK9NSxUhkn2XaoBr1OhMCowufOBZgUwvRd8
	rL04ZLu0LCNYAUu1uf9feH2okvEnxbxMJRBiPaPlFtM44JESGSsJkTwxYGRbJsTxfw0HTC9Ea9xl0
	hFaug4GW9iXzI0KCoelNq8Qu6ZvARg6y1n0Zn6fY/5+EgJdu8/x6a563PYqrqXV1e9h8EpAS7dLTu
	21pRvmCqfrO+2t4nKoyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBfjG-00A8gm-8N; Thu, 05 Aug 2021 15:56:18 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBfjC-00A8gD-G5
 for linux-arm-kernel@lists.infradead.org; Thu, 05 Aug 2021 15:56:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1628178974; x=1659714974;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=81T3ky8ph63ood5pQ7YHc+7hsAzYVUGV/KsU2nTP3y0=;
 b=ML1cavXOq7ALYCH5Me14BPFscGytawQ4mRymuV70IcCkFdpRq5Z7IJ+O
 rI6FPzpBVHW7MGK+1mcSh9ePbUfAIAXC28em15EtNZWnU+P4OUB3YzGiL
 mRF++qfhu5q1VaHgvssAm8y4PtH5dN4zRGWeAoS0m9GmLt6xDjaA3PnC9
 h2xhsj07RVjxFgKDoL0dNqEOcbdYCAPVZ0z0St4RTUJ2FiSFikPcmtNtW
 RzpxxH1pZlK3OThcqqlOAp4432A+RwLnvbYxsZtOXm4NIYMySZ+AIUOAZ
 RNRIj1HjVokd00c4za7e/Jl/dQie7gKETKRPDnolpDKLSDlFKabJjv5vu g==;
IronPort-SDR: QpyF9jmWrkSPZ/OK/apAvqbwN7X0djrfrAh05jX/GF0Ghw8TGzwCGKcWgAEFE0ggetctzP8jYQ
 N0t7tUuJ+NzBvzQLL+fWsLJJbN/o8/HUy8ebxzrtbvmjOu0+g+I2Lgl2bcZvttYxw16tXYhd/V
 ElekBNKPYsR55ragKf9onJtyaqv6mk/pJPPFHsdVvY9e54rDqPbo0qHDsieO1HNvGe3gAooPIX
 avXQZ0Os4JG8+NnPbTHG1/GM5az0BpWDnLk93qZ9YwThwvFe8m0EcXQavj2xDlxp8CGzVeOr+w
 Hur4Eji3bJJBZwr/AdQ/vlRH
X-IronPort-AV: E=Sophos;i="5.84,296,1620716400"; d="scan'208";a="64834627"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 05 Aug 2021 08:56:05 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 5 Aug 2021 08:56:05 -0700
Received: from m18063-ThinkPad-T460p.mchp-main.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Thu, 5 Aug 2021 08:56:01 -0700
From: Claudiu Beznea <claudiu.beznea@microchip.com>
List-Id: <soc.lore.kernel.org>
To: <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
 <ludovic.desroches@microchip.com>, <robh+dt@kernel.org>, <arnd@arndb.de>,
 <olof@lixom.net>, <soc@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: [PATCH 0/7] ARM: dts: at91: add Exegin Q5xR5 and CalAmp LMU5000
Date: Thu, 5 Aug 2021 18:53:50 +0300
Message-ID: <20210805155357.594414-1-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210805_085614_657569_A0D11EA1 
X-CRM114-Status: GOOD (  11.16  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210805155350.Ys21Tj1X1oL_g_Uix6Qyp5dkyTe9SBsvCbfLK_lyhss@z>

Hi,

This series adds support for Exegin Q5xR5 and CalAmp LMU5000 boards
which were maintained up to this moment, separatelly, in OpenWrt tree.
With these patches the support for these boards will be included in
upstream kernel and there will be no need to forward port the proper
patches in OpenWrt every time the OpenWrt kernel version is changed.

Thank you,
Claudiu Beznea

Adam Porter (1):
  ARM: dts: at91: add CalAmp LMU5000 board

Claudiu Beznea (5):
  ARM: dts: at91: at91sam9260: add pinctrl label
  dt-bindings: add vendor prefix for exegin
  dt-bindings: ARM: at91: document exegin q5xr5 board
  dt-bindings: add vendor prefix for calamp
  dt-bindings: ARM: at91: document CalAmp LMU5000 board

Owen Kirby (1):
  ARM: dts: at91: add Exegin Q5xR5 board

 .../devicetree/bindings/arm/atmel-at91.yaml   |  12 ++
 .../devicetree/bindings/vendor-prefixes.yaml  |   4 +
 arch/arm/boot/dts/Makefile                    |   2 +
 arch/arm/boot/dts/at91-lmu5000.dts            | 148 +++++++++++++
 arch/arm/boot/dts/at91-q5xr5.dts              | 200 ++++++++++++++++++
 arch/arm/boot/dts/at91sam9260.dtsi            |   2 +-
 6 files changed, 367 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/boot/dts/at91-lmu5000.dts
 create mode 100644 arch/arm/boot/dts/at91-q5xr5.dts

-- 
2.25.1


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
