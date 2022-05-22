Return-Path: <SRS0=A6KV=V6=nuvoton.com=Tomer.Maimon@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 556DFC43219
	for <soc@archiver.kernel.org>; Sun, 22 May 2022 15:51:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1CF24C36AF9; Sun, 22 May 2022 15:51:48 +0000 (UTC)
Received: from herzl.nuvoton.co.il (unknown [212.199.177.27])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3E7B1C36AE3;
	Sun, 22 May 2022 15:51:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3E7B1C36AE3
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=nuvoton.com
Received: from taln60.nuvoton.co.il (ntil-fw [212.199.177.25])
	by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 24MFp3CW031625;
	Sun, 22 May 2022 18:51:03 +0300
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
	id A377463A50; Sun, 22 May 2022 18:51:02 +0300 (IDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: avifishman70@gmail.com, tali.perry1@gmail.com, joel@jms.id.au,
        venture@google.com, yuenn@google.com, benjaminfair@google.com,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, p.zabel@pengutronix.de,
        gregkh@linuxfoundation.org, daniel.lezcano@linaro.org,
        tglx@linutronix.de, wim@linux-watchdog.org, linux@roeck-us.net,
        catalin.marinas@arm.com, will@kernel.org, arnd@arndb.de,
        olof@lixom.net, jirislaby@kernel.org, shawnguo@kernel.org,
        bjorn.andersson@linaro.org, geert+renesas@glider.be,
        marcel.ziswiler@toradex.com, vkoul@kernel.org,
        biju.das.jz@bp.renesas.com, nobuhiro1.iwamatsu@toshiba.co.jp,
        robert.hancock@calian.com, j.neuschaefer@gmx.net, lkundrak@v3.sk
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-watchdog@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Tomer Maimon <tmaimon77@gmail.com>
Subject: [PATCH v1 06/19] watchdog: npcm_wdt: Add NPCM845 watchdog support
Date: Sun, 22 May 2022 18:50:33 +0300
Message-Id: <20220522155046.260146-7-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220522155046.260146-1-tmaimon77@gmail.com>
References: <20220522155046.260146-1-tmaimon77@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add Nuvoton BMC NPCM845 watchdog support.
The NPCM845 uses the same watchdog as the NPCM750.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 drivers/watchdog/npcm_wdt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/watchdog/npcm_wdt.c b/drivers/watchdog/npcm_wdt.c
index 28a24caa2627..0b91a3fbec09 100644
--- a/drivers/watchdog/npcm_wdt.c
+++ b/drivers/watchdog/npcm_wdt.c
@@ -231,6 +231,7 @@ static int npcm_wdt_probe(struct platform_device *pdev)
 static const struct of_device_id npcm_wdt_match[] = {
 	{.compatible = "nuvoton,wpcm450-wdt"},
 	{.compatible = "nuvoton,npcm750-wdt"},
+	{.compatible = "nuvoton,npcm845-wdt"},
 	{},
 };
 MODULE_DEVICE_TABLE(of, npcm_wdt_match);
-- 
2.33.0

