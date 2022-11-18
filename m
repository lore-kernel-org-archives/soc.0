Return-Path: <SRS0=MWgV=3S=microchip.com=Claudiu.Beznea@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2A51C4332F
	for <soc@archiver.kernel.org>; Fri, 18 Nov 2022 13:07:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B7DFAC433B5; Fri, 18 Nov 2022 13:07:34 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id F1C30C433D6;
	Fri, 18 Nov 2022 13:07:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org F1C30C433D6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1668776852; x=1700312852;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=2nyVeljcRaEsfl9BSbLGUNRs1OvxIV1DhnYpU5ltHyg=;
  b=GwtgQsZRrm5j5/7A5EGQXkRH5VIs0v4vX1O8+Cbn8Uw8xtCCFMH3ZwDQ
   Eeh0Sodrq2RC4mEyPbJGpVKerVfSN71OWrhHP1u4aW+dM4A9VtXOUOCqa
   0B0okWdaogfxV9LG0iOlsuB+UOQShdNOxLTXc8a+xDzUP5Yi5NNzDIym7
   sfDEqJ+mqrPEhV7sCdbYpSlWNATy0fDn1d0TxebpIMIY8XHMnShn5XWD4
   OLLLYdK0Cx4xiGA62reRy+GhOv44+2pGaH66375ItWG0qRSw/XPAK+2E5
   IYQhOGxn/PrMiFdRDL4PdL+COVnlk5Rnkb5oBcOtIFMaR07AY36a3/WQu
   A==;
X-IronPort-AV: E=Sophos;i="5.96,174,1665471600"; 
   d="scan'208";a="124078253"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 18 Nov 2022 06:07:24 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Fri, 18 Nov 2022 06:07:24 -0700
Received: from localhost.localdomain (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.12 via Frontend Transport; Fri, 18 Nov 2022 06:07:23 -0700
From: Claudiu Beznea <claudiu.beznea@microchip.com>
List-Id: <soc.lore.kernel.org>
To: <arnd@arndb.de>, <olof@lixom.net>, <arm@kernel.org>, <soc@kernel.org>
CC: <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<linux-arm-kernel@lists.infradead.org>
Subject: [GIT PULL] AT91 device tree updates for 6.2 #2
Date: Fri, 18 Nov 2022 15:12:14 +0200
Message-ID: <20221118131214.301678-1-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

The following changes since commit 5258d30f33bdbb495f6de7601db5d60e13223a5b:

  ARM: dts: at91: sam9x60ek: remove status = "okay" for regulators (2022-11-01 12:28:58 +0200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-dt-6.2-2

for you to fetch changes up to 7a3c62678699d7e56736c2d0579d077a7773e77c:

  ARM: dts: at91: sama7g5: fix signal name of pin PD8 (2022-11-17 15:32:33 +0200)

----------------------------------------------------------------
AT91 DT for 6.2 #2

It contains:
- one typo fix for a SAMA7G5 pin; the pin is not used anywhere in the
  device trees.

----------------------------------------------------------------
Mihai Sain (1):
      ARM: dts: at91: sama7g5: fix signal name of pin PD8

 arch/arm/boot/dts/sama7g5-pinfunc.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
