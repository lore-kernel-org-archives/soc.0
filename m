Return-Path: <SRS0=r2Hb=FF=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17280C64E7A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Dec 2020 13:45:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 913EC20770
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Dec 2020 13:45:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="le4dfs7i";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="nnfurCpr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 913EC20770
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=94I6dLeRorolzt9TA/hgBBZqGKHTmpTnNNzQf2ZP1IU=; b=le4dfs7iI+Wfk6tLbA4h58+qz
	ivP5ZLmb3KilyKxSAzNnsKcgzfJBxSf1ZULUt7cpj5TtU3OR9OJmwJ4OXP4B9TipBkvCptC9muK5X
	Ot/evjKMgk519B8eVGpsoNP+qCV9hFqD6sOBYEy3Ks1riVWGipfnhach+1bg6GwU+GO77yX9gg79c
	w+GnfCXNGMJSWDcHo5DLiAqRLrKoQwbZNJrvBZ+Z71WUAxKW52diiq2tavACiSDzpSH54MZPydaHE
	YP8usC05/2lMyRkbmnVx2EFCPcN0fAgZwHJhkdajyzWcBHdvc2V7Wg16ku+EGanCX2QprNCI6vJux
	tzlrWRAGA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kk5xI-0007Ca-L7; Tue, 01 Dec 2020 13:44:32 +0000
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kk5wu-00073d-5i
 for linux-arm-kernel@lists.infradead.org; Tue, 01 Dec 2020 13:44:09 +0000
Received: by mail-pj1-x1041.google.com with SMTP id h7so780978pjk.1
 for <linux-arm-kernel@lists.infradead.org>;
 Tue, 01 Dec 2020 05:44:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0x0f.com; s=google;
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
 b=azZAOSxl/0q+/Z0Z/sNdDaBNJ11ss7BZXGNy6h3MhHiB/SZe749QP/PxY40WDP6k0P
 37eK4TT2dZwht+04Fe2wgPCNCQHjAguJOJvl6SJp0X7u8B5VNEjZ196n6A5KtFtNu+ik
 lzawMCbwU/HX+iU8ab11Vd2/gRs4aF5PEtK6t5p2lnt350uRFgCDD+WdPH3ofyDNQwBC
 XZxdLk/jLn8gt8A2qAUkC4Pkl2HPXnYc0pD4ioPhlgBlEI59nyPYjC/0dqKFLXL5dxig
 QOIMCLADEmC50i8w5Kv9GTPW0rLEJDeoMqpzU2wVx0jFMrOMr6P70YNmZ2WysOu2h301
 A+pQ==
X-Gm-Message-State: AOAM533yoViRccbzwUjOWxpWai9C9RgAVZq+93V/PGesv1OXkoj1C7xs
 aLdlHkbzhvMXh9bWKdZZq6iDCPAx9QU/nw==
X-Google-Smtp-Source: ABdhPJxJNuH03WeV+YCdxfpaFYEMD4f1GrVM3nOVUTLhZyrwQYDtwe6t9D1rzEqXhNFq2WjbkzhtWQ==
X-Received: by 2002:a17:902:9894:b029:da:5698:7f7b with SMTP id
 s20-20020a1709029894b02900da56987f7bmr2891979plp.78.1606830245846; 
 Tue, 01 Dec 2020 05:44:05 -0800 (PST)
Received: from shiro.work (p1268123-ipngn200803sizuokaden.shizuoka.ocn.ne.jp.
 [118.13.124.123])
 by smtp.googlemail.com with ESMTPSA id g14sm2839248pji.32.2020.12.01.05.44.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Dec 2020 05:44:05 -0800 (PST)
From: Daniel Palmer <daniel@0x0f.com>
List-Id: <soc.lore.kernel.org>
To: devicetree@vger.kernel.org, soc@kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 10/10] ARM: mstar: SMP support
Date: Tue,  1 Dec 2020 22:43:30 +0900
Message-ID: <20201201134330.3037007-11-daniel@0x0f.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201201134330.3037007-1-daniel@0x0f.com>
References: <20201201134330.3037007-1-daniel@0x0f.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201201_084408_265821_6EAC805F 
X-CRM114-Status: GOOD (  21.25  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: robh@kernel.org, arnd@arndb.de, daniel@0x0f.com,
 linux-kernel@vger.kernel.org, olof@lixom.net, w@1wt.eu
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201201134330.QgrC5327Lh5wrUN4u59Y79r0aib7T6WPOvIzqqBrb8E@z>

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


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
