Return-Path: <SRS0=yFtV=NH=microchip.com=Claudiu.Beznea@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22B39C432BE
	for <soc@archiver.kernel.org>; Mon, 16 Aug 2021 06:46:29 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id E08F261A59; Mon, 16 Aug 2021 06:46:28 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9970061A51;
	Mon, 16 Aug 2021 06:46:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9970061A51
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1629096388; x=1660632388;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=i7ddTF2RdMj7+wLTZPUG9yvpW6hfBDmQ4fUfE2MtAEg=;
  b=VSRY8tyeGY7oPTawnkM2LsfNv2+WFYKE+jwz/uj4cIRTiOaX9t+6N1kz
   VMjPnlRjUjD2gjT5UGPg44Uq9aUv/fy6+rjP/Acx6n3cuLYhDeKPJZsDU
   HJAPizT7UuHVUdL2Cc7lShdIBt02ubjQJNmzxOmnZ/g4XCY1LxkQDdH/3
   oc8deUjhkWvKAFsT8BrDFYnNU7rZQrioy5FjwBRvDSOsyI77XE3ys0eHD
   P7ME//eQJwwMeUotjMpHu+TavIlzEbYLBt82GnSNKaC6n1LkmzFVexXcF
   /q1X4d9N0ZFaPUsE8b3idrPGdUGlIroOyXXSUQxB3RLRHgPE5m8Q7OuLS
   w==;
IronPort-SDR: mCB471Qx/s7ExUNpJx2m1aQOMgeEoPmEEO0bfDzjbkC/nENIrU4djEEBjdmK2KWSX0V2MkiEVF
 emA7fQXf82aVXOIxqqHnmdNsNdn1PEJeR/mLbShRSbLfj7vehqj1LPfxMc50PvDmyvL31N9orW
 tyukO8weYwkStynrik8pX81XqIf+bhkUs0T/4HVNyR5zV1pzla1+tjgKL0ZYoh805hMdlDuRWk
 t8lqKDytG/X97/pFMVkuH6+uezUMz7VyPBIk+hVuWZG5thUcQhvQhIkf0CMm7/Iq4ytp5NpAH2
 x4POjgCnrxIOV7sRX0SskqOS
X-IronPort-AV: E=Sophos;i="5.84,324,1620716400"; 
   d="scan'208";a="132362605"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 15 Aug 2021 23:46:28 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Sun, 15 Aug 2021 23:46:27 -0700
Received: from m18063-ThinkPad-T460p.mchp-main.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Sun, 15 Aug 2021 23:46:23 -0700
From: Claudiu Beznea <claudiu.beznea@microchip.com>
List-Id: <soc.lore.kernel.org>
To: <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<ludovic.desroches@microchip.com>, <robh+dt@kernel.org>, <arnd@arndb.de>,
	<olof@lixom.net>, <soc@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: [PATCH v2 1/7] ARM: dts: at91: at91sam9260: add pinctrl label
Date: Mon, 16 Aug 2021 09:44:10 +0300
Message-ID: <20210816064416.1630674-2-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210816064416.1630674-1-claudiu.beznea@microchip.com>
References: <20210816064416.1630674-1-claudiu.beznea@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Add label for pinctrl node.

Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
---
 arch/arm/boot/dts/at91sam9260.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/at91sam9260.dtsi b/arch/arm/boot/dts/at91sam9260.dtsi
index 019f1c3d4d30..7368347c9357 100644
--- a/arch/arm/boot/dts/at91sam9260.dtsi
+++ b/arch/arm/boot/dts/at91sam9260.dtsi
@@ -166,7 +166,7 @@ tcb1: timer@fffdc000 {
 				clock-names = "t0_clk", "t1_clk", "t2_clk", "slow_clk";
 			};
 
-			pinctrl@fffff400 {
+			pinctrl: pinctrl@fffff400 {
 				#address-cells = <1>;
 				#size-cells = <1>;
 				compatible = "atmel,at91rm9200-pinctrl", "simple-bus";
-- 
2.25.1

