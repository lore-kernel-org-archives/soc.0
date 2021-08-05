Return-Path: <SRS0=YB89=M4=microchip.com=Claudiu.Beznea@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FC17C4338F
	for <soc@archiver.kernel.org>; Thu,  5 Aug 2021 15:56:27 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id EDEB76112F; Thu,  5 Aug 2021 15:56:26 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A5D796105A;
	Thu,  5 Aug 2021 15:56:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A5D796105A
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1628178986; x=1659714986;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=i7ddTF2RdMj7+wLTZPUG9yvpW6hfBDmQ4fUfE2MtAEg=;
  b=M2KrAJY+SAD6zmCZ4gqiesAMIWilT9FQVwupyh7oWddvREad6xoEoLJn
   SHwbiOdmxaMr6JLZSYuEhahh7PuZcQrJ9jzG7YU4cPQPyG/UWVFboP4w7
   XpNpJo8PMvTfkxj1baqnKXhIjcH/oQjW1uG3PwuGr+Mag7VtSpM9PKoIP
   9UVEGYEpu/F94sabF5ozticS1CRLUu8AXkdART6w4CBb/CwLIBiH6M6g3
   VdQVPrPnYpkGz1Qr/lrIznTikQ+BXKBljq8cORPp9VwSRBdkgvl1AMbAG
   ftSpU2MTX5Yl2kaSmO4CfF3eQ3ZWGKp9w9kFTMBJZckYma7clXx9hvhSl
   w==;
IronPort-SDR: aSmE3qlrt4zX8Wis+1tVwG/pyG8WEO5samKbI5pWfxy0KftQrzbH8y52bkobJdTFiRIJ1xBNcr
 5+9BD0i73vmA5K7UDEUo2u1ZGGJuziklw64cwL+1UYemL1NkpdMiUiSYimvmRo7/B44Lafk+Tw
 wQRdefZZAgMpq273IEZyGTXU/m+Ab80fJiyOK+oQE5TzoNtXfS3RrGCrkyFuytHrI4723T0uyS
 g7AhvG6uXTu1966W2kj+nP3tk1VrP0GCQMS5C7DGxUtsL0tujmnC4nOiYb6s9ObgVsOW1ot4cF
 piP5OdhpGFh5lc8BB72Av1X4
X-IronPort-AV: E=Sophos;i="5.84,296,1620716400"; 
   d="scan'208";a="64834729"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 05 Aug 2021 08:56:25 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 5 Aug 2021 08:56:25 -0700
Received: from m18063-ThinkPad-T460p.mchp-main.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Thu, 5 Aug 2021 08:56:06 -0700
From: Claudiu Beznea <claudiu.beznea@microchip.com>
List-Id: <soc.lore.kernel.org>
To: <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<ludovic.desroches@microchip.com>, <robh+dt@kernel.org>, <arnd@arndb.de>,
	<olof@lixom.net>, <soc@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: [PATCH 1/7] ARM: dts: at91: at91sam9260: add pinctrl label
Date: Thu, 5 Aug 2021 18:53:51 +0300
Message-ID: <20210805155357.594414-2-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210805155357.594414-1-claudiu.beznea@microchip.com>
References: <20210805155357.594414-1-claudiu.beznea@microchip.com>
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

