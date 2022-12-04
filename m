Return-Path: <SRS0=WPFH=4C=schmorgal.com=doug@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3698FC4332F
	for <soc@archiver.kernel.org>; Sun,  4 Dec 2022 00:52:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E433BC433C1; Sun,  4 Dec 2022 00:52:00 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id F3A57C433D6
	for <soc@kernel.org>; Sun,  4 Dec 2022 00:51:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org F3A57C433D6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=schmorgal.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=schmorgal.com
Received: by mail-pl1-f178.google.com with SMTP id s7so7835093plk.5
        for <soc@kernel.org>; Sat, 03 Dec 2022 16:51:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=schmorgal.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NMKDlQK6w5vM05cXeYbQoGa5PaT/kmzZOsaTUxGIqfw=;
        b=h04sl9uqFP4yjV+BzAe/1I6f4E74BUDWAxauN4tiRzlfYJPedxIKaPzEuIKqAan0lm
         NESPULc7hwRVj6zyICBZD/5Ur7C71H4XFZ2n/THytNgNX+F1+hZUA/FubuxOer9aRxUn
         9NuwwRpdnvrIDh06KRn73YWOfzVQ63R6DIdSI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NMKDlQK6w5vM05cXeYbQoGa5PaT/kmzZOsaTUxGIqfw=;
        b=KsDSaHzOQqX6J5Fsd4jP+TkulHeCsB/E9K/iBMdRgSHRJ0pf00JgT+nU3S6mbpXBGu
         z8U1rO7erzfxXnHg2w/lBup4I/F4dvOiU8QaR1eAw9v1zDRpiCsjoYlUEFYbs69Nv46Y
         vsRzpDd0O62ImkfGkL1sJ6kunRSRjjLaNja7fOhUYrwFQjT0aUQT6REkJ21oQ0q8nJW7
         fxz0NhqTTkknoci26RFtZ5/pipaBrWebqVn8a891dqwnnAx3kEIL6vK0Wf9HIpN3WnV9
         xAhQ0d+91X7puQ5HkE+Lj3aoCK/6K+F66rr38pXLrpMVsG3jgkxTulf4MXwr+pdJXtZh
         U5mg==
X-Gm-Message-State: ANoB5pnYNHnlUejfHvC+GWWst6yAkl2dtjnkspQ1bBFl3PTQ3NrlhYlz
	5N4AmfDT6qG47jVYaIU9l/a0hA==
X-Google-Smtp-Source: AA0mqf6J3qV2CKsySZYd8rDtLINBQW/HTYZN+JEgB2qymluBQMwEw31K6Hi9ZlDjFbsA11bMunpWrA==
X-Received: by 2002:a17:90a:67c4:b0:213:ba14:3032 with SMTP id g4-20020a17090a67c400b00213ba143032mr89152676pjm.111.1670115119242;
        Sat, 03 Dec 2022 16:51:59 -0800 (PST)
Received: from doug-ryzen-5700G.. ([192.183.212.197])
        by smtp.gmail.com with ESMTPSA id 24-20020a631358000000b004393f60db36sm6058977pgt.32.2022.12.03.16.51.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Dec 2022 16:51:58 -0800 (PST)
From: Doug Brown <doug@schmorgal.com>
To: Russell King <linux@armlinux.org.uk>,
	Lubomir Rintel <lkundrak@v3.sk>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Doug Brown <doug@schmorgal.com>
Subject: [PATCH 2/2] ARM: mmp: fix timer_read delay
Date: Sat,  3 Dec 2022 16:51:17 -0800
Message-Id: <20221204005117.53452-3-doug@schmorgal.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221204005117.53452-1-doug@schmorgal.com>
References: <20221204005117.53452-1-doug@schmorgal.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

timer_read() was using an empty 100-iteration loop to wait for the
TMR_CVWR register to capture the latest timer counter value. The delay
wasn't long enough. This resulted in CPU idle time being extremely
underreported on PXA168 with CONFIG_NO_HZ_IDLE=y.

Switch to the approach used in the vendor kernel, which implements the
capture delay by reading TMR_CVWR a few times instead.

Fixes: 49cbe78637eb ("[ARM] pxa: add base support for Marvell's PXA168 processor line")
Signed-off-by: Doug Brown <doug@schmorgal.com>
---
 arch/arm/mach-mmp/time.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/arch/arm/mach-mmp/time.c b/arch/arm/mach-mmp/time.c
index 41b2e8abc9e6..708816caf859 100644
--- a/arch/arm/mach-mmp/time.c
+++ b/arch/arm/mach-mmp/time.c
@@ -43,18 +43,21 @@
 static void __iomem *mmp_timer_base = TIMERS_VIRT_BASE;
 
 /*
- * FIXME: the timer needs some delay to stablize the counter capture
+ * Read the timer through the CVWR register. Delay is required after requesting
+ * a read. The CR register cannot be directly read due to metastability issues
+ * documented in the PXA168 software manual.
  */
 static inline uint32_t timer_read(void)
 {
-	int delay = 100;
+	uint32_t val;
+	int delay = 3;
 
 	__raw_writel(1, mmp_timer_base + TMR_CVWR(1));
 
 	while (delay--)
-		cpu_relax();
+		val = __raw_readl(mmp_timer_base + TMR_CVWR(1));
 
-	return __raw_readl(mmp_timer_base + TMR_CVWR(1));
+	return val;
 }
 
 static u64 notrace mmp_read_sched_clock(void)
-- 
2.34.1

