Return-Path: <SRS0=dBqm=FF=0x0f.com=daniel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DA7BC64E7B
	for <soc@archiver.kernel.org>; Tue,  1 Dec 2020 13:44:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id EC10E207FF; Tue,  1 Dec 2020 13:44:06 +0000 (UTC)
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com [209.85.216.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 98EF220857
	for <soc@kernel.org>; Tue,  1 Dec 2020 13:44:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="nnfurCpr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 98EF220857
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=daniel@0x0f.com
Received: by mail-pj1-f67.google.com with SMTP id e5so1255528pjt.0
        for <soc@kernel.org>; Tue, 01 Dec 2020 05:44:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hS2wM3FNHgJIyxJqyl8PuGsAWH0z3tsao6nHf2xVIB0=;
        b=nnfurCprKeYaMHdKwLLhAtc/7QpVAwGhPiDAysu4bgwUr0HPOE7DAtY2+DHE3HciSB
         qJwqpC+9ktJuXLvVQjVQh2XoVwielD3rNowfs4bNkzgY5SamuuXZAPkVrKYTncoBWhdL
         nPvmrVVHPUMiT7h//1NrmmPmFubTs8wcA+/QQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hS2wM3FNHgJIyxJqyl8PuGsAWH0z3tsao6nHf2xVIB0=;
        b=Jhwscyu5kklR5qd3zIgeUiSVMYSCVBpyn5Wd9kkxZuEmKp3PvY3XnzdGnaAOlg5hDJ
         GKvpzdvHRYSf+0lnH3L7UF0Ivzt6woR35weE0dPgPdyO+s5MLoDS9RHjKCF/qtSHB3O1
         LIYcGUGsxbXK3ou3oRjoRx+2FpmYG2+xE4WCnkzQxWrh0rdnbLYqOX3fVeHqF189y5D5
         FdOcZniYKnZDYQLFMSpcdlPu5TV3wKZWiS+XTDE56jRDPQiz5LKjafmICr+OWjI/t9ue
         U00ernkh4wKi9y8xBIfrZJeVrbw3S/fOh95TDOZNQPyC1VrQbETpRyYrIJky0dnEgJ45
         iyrQ==
X-Gm-Message-State: AOAM530t1lmQ+tNoNe25ckkD4dEChnCcMSb4NLzHYZmtFIpR/KKFXRXa
	C1f86lDhhvoPJDOwDaqpxJKg4A==
X-Google-Smtp-Source: ABdhPJxJNuH03WeV+YCdxfpaFYEMD4f1GrVM3nOVUTLhZyrwQYDtwe6t9D1rzEqXhNFq2WjbkzhtWQ==
X-Received: by 2002:a17:902:9894:b029:da:5698:7f7b with SMTP id s20-20020a1709029894b02900da56987f7bmr2891979plp.78.1606830245846;
        Tue, 01 Dec 2020 05:44:05 -0800 (PST)
Received: from shiro.work (p1268123-ipngn200803sizuokaden.shizuoka.ocn.ne.jp. [118.13.124.123])
        by smtp.googlemail.com with ESMTPSA id g14sm2839248pji.32.2020.12.01.05.44.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Dec 2020 05:44:05 -0800 (PST)
From: Daniel Palmer <daniel@0x0f.com>
List-Id: <soc.lore.kernel.org>
To: devicetree@vger.kernel.org,
	soc@kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	olof@lixom.net,
	arnd@arndb.de,
	robh@kernel.org,
	w@1wt.eu,
	daniel@0x0f.com
Subject: [PATCH v2 10/10] ARM: mstar: SMP support
Date: Tue,  1 Dec 2020 22:43:30 +0900
Message-Id: <20201201134330.3037007-11-daniel@0x0f.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201201134330.3037007-1-daniel@0x0f.com>
References: <20201201134330.3037007-1-daniel@0x0f.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch adds SMP support for MStar/Sigmastar chips that have a second core
like those in the infinity2m family.

So far only single and dual core chips have been found so this does
the bare minimum to boot the second core. From what I can tell not having
the "holding pen" code to handle multiple cores is fine if there is only
one core the will get booted. This might need to be reconsidered if chips
with more cores turn up.

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 arch/arm/mach-mstar/mstarv7.c | 48 +++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/arch/arm/mach-mstar/mstarv7.c b/arch/arm/mach-mstar/mstarv7.c
index 1aa748fa006e..274c4f0df270 100644
--- a/arch/arm/mach-mstar/mstarv7.c
+++ b/arch/arm/mach-mstar/mstarv7.c
@@ -31,6 +31,13 @@
 #define MSTARV7_L3BRIDGE_FLUSH_TRIGGER	BIT(0)
 #define MSTARV7_L3BRIDGE_STATUS_DONE	BIT(12)
 
+#ifdef CONFIG_SMP
+#define MSTARV7_CPU1_BOOT_ADDR_HIGH	0x4c
+#define MSTARV7_CPU1_BOOT_ADDR_LOW	0x50
+#define MSTARV7_CPU1_UNLOCK		0x58
+#define MSTARV7_CPU1_UNLOCK_MAGIC	0xbabe
+#endif
+
 static void __iomem *l3bridge;
 
 static const char * const mstarv7_board_dt_compat[] __initconst = {
@@ -63,6 +70,46 @@ static void mstarv7_mb(void)
 	}
 }
 
+#ifdef CONFIG_SMP
+static int mstarv7_boot_secondary(unsigned int cpu, struct task_struct *idle)
+{
+	struct device_node *np;
+	u32 bootaddr = (u32) __pa_symbol(secondary_startup_arm);
+	void __iomem *smpctrl;
+
+	/*
+	 * right now we don't know how to boot anything except
+	 * cpu 1.
+	 */
+	if (cpu != 1)
+		return -EINVAL;
+
+	np = of_find_compatible_node(NULL, NULL, "mstar,smpctrl");
+	smpctrl = of_iomap(np, 0);
+
+	if (!smpctrl)
+		return -ENODEV;
+
+	/* set the boot address for the second cpu */
+	writew(bootaddr & 0xffff, smpctrl + MSTARV7_CPU1_BOOT_ADDR_LOW);
+	writew((bootaddr >> 16) & 0xffff, smpctrl + MSTARV7_CPU1_BOOT_ADDR_HIGH);
+
+	/* unlock the second cpu */
+	writew(MSTARV7_CPU1_UNLOCK_MAGIC, smpctrl + MSTARV7_CPU1_UNLOCK);
+
+	/* and away we go...*/
+	arch_send_wakeup_ipi_mask(cpumask_of(cpu));
+
+	iounmap(smpctrl);
+
+	return 0;
+}
+
+static const struct smp_operations __initdata mstarv7_smp_ops = {
+	.smp_boot_secondary = mstarv7_boot_secondary,
+};
+#endif
+
 static void __init mstarv7_init(void)
 {
 	struct device_node *np;
@@ -78,4 +125,5 @@ static void __init mstarv7_init(void)
 DT_MACHINE_START(MSTARV7_DT, "MStar/Sigmastar Armv7 (Device Tree)")
 	.dt_compat	= mstarv7_board_dt_compat,
 	.init_machine	= mstarv7_init,
+	.smp		= smp_ops(mstarv7_smp_ops),
 MACHINE_END
-- 
2.29.2

