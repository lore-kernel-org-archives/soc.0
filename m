Return-Path: <SRS0=A6KV=V6=nuvoton.com=Tomer.Maimon@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 442C7C433F5
	for <soc@archiver.kernel.org>; Sun, 22 May 2022 15:52:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2DDD7C34113; Sun, 22 May 2022 15:52:35 +0000 (UTC)
Received: from herzl.nuvoton.co.il (unknown [212.199.177.27])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 16ECFC385AA;
	Sun, 22 May 2022 15:52:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 16ECFC385AA
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=nuvoton.com
Received: from taln60.nuvoton.co.il (ntil-fw [212.199.177.25])
	by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 24MFovI4031611;
	Sun, 22 May 2022 18:50:58 +0300
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
	id E754663A4C; Sun, 22 May 2022 18:50:57 +0300 (IDT)
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
Subject: [PATCH v1 02/19] clocksource: timer-npcm7xx: Add NPCM845 timer support
Date: Sun, 22 May 2022 18:50:29 +0300
Message-Id: <20220522155046.260146-3-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220522155046.260146-1-tmaimon77@gmail.com>
References: <20220522155046.260146-1-tmaimon77@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add Nuvoton BMC NPCM845 timer support.
The NPCM845 uses the same timer controller as the NPCM750.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 drivers/clocksource/timer-npcm7xx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clocksource/timer-npcm7xx.c b/drivers/clocksource/timer-npcm7xx.c
index a00520cbb660..1630daad4df5 100644
--- a/drivers/clocksource/timer-npcm7xx.c
+++ b/drivers/clocksource/timer-npcm7xx.c
@@ -210,4 +210,5 @@ static int __init npcm7xx_timer_init(struct device_node *np)
 
 TIMER_OF_DECLARE(wpcm450, "nuvoton,wpcm450-timer", npcm7xx_timer_init);
 TIMER_OF_DECLARE(npcm7xx, "nuvoton,npcm750-timer", npcm7xx_timer_init);
+TIMER_OF_DECLARE(npcm8xx, "nuvoton,npcm845-timer", npcm7xx_timer_init);
 
-- 
2.33.0

