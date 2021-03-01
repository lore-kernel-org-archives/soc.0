Return-Path: <SRS0=ykaY=H7=0x0f.com=daniel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 095A7C433E0
	for <soc@archiver.kernel.org>; Mon,  1 Mar 2021 12:36:20 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id BFCED64E31; Mon,  1 Mar 2021 12:36:19 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2CE0164E75
	for <soc@kernel.org>; Mon,  1 Mar 2021 12:36:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2CE0164E75
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=daniel@0x0f.com
Received: by mail-pg1-f170.google.com with SMTP id o10so11464892pgg.4
        for <soc@kernel.org>; Mon, 01 Mar 2021 04:36:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=C88FmiAqxDnJbB9m5EGVR/CJ40sQ0nT98Az9DhqgecU=;
        b=k25ODqx0AJ9FiPd1SEWkoupl4VkvfyH//7e4sw3S9SizNEvqDBmeG8PMTbrw8Wud2p
         jPT/5r8AUEOc+6GCoMClwE2m9U12dn/IyaSPGBhnWNegGzlei+RJ5Q0GhZ1do2ME2bob
         0valpUCI4R32euZNZJguYY2Uh3+rSnvly1/gY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=C88FmiAqxDnJbB9m5EGVR/CJ40sQ0nT98Az9DhqgecU=;
        b=b1rV9knbbWRqwbFk8GCY6t/6UlkLUPy/22awVC0EurYssCI+aQj8r9yLBLShBHdw28
         75+4681ZM+zWSGs7xs2e74JHEtChErD4NkrKQhpK9zth1c6Z4MMTvZI/2lMjU0Kk+LTj
         iVdwBUhY7lVH6FoBunrDtHafBDZ/20TnOIVMSB9cTx8X60NyX/TseeXwVUu8qCGxCkNM
         zXCNh6bT1v7vtR3xQbpHiSKv2X6x64oPGYkuAbEkZ3SOuyUtV3LpslCClDBwdgglrOlG
         3W68+ammkT43NgqkfNXa0Rk8/1xRa4jFM2nrpwABbcOEQeBrqOBZZ7mBSD4JAenwR9a4
         zzFQ==
X-Gm-Message-State: AOAM532TiMW9xD+qhohrB4TYo0kcRogvNTVyUHzFwhIGIzG0FgVb52VC
	9Zxamz86eiF2hqFqGJ7FOlYIt4Eg+dvF8A==
X-Google-Smtp-Source: ABdhPJy4edf/KQypinIj/0pMZbp3pGG1yVFbUE7VPL2CwLLI5GWeL1N/ukAkzUJwOZk8lI2iMzCeTQ==
X-Received: by 2002:a62:ed0b:0:b029:1ee:7568:5ab9 with SMTP id u11-20020a62ed0b0000b02901ee75685ab9mr7010492pfh.79.1614602178032;
        Mon, 01 Mar 2021 04:36:18 -0800 (PST)
Received: from shiro.work (p345188-ipngn200408sizuokaden.shizuoka.ocn.ne.jp. [124.98.97.188])
        by smtp.googlemail.com with ESMTPSA id 8sm18130928pfp.171.2021.03.01.04.36.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Mar 2021 04:36:17 -0800 (PST)
From: Daniel Palmer <daniel@0x0f.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: arnd@kernel.org,
	olof@lixom.net,
	w@1wt.eu,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Daniel Palmer <daniel@0x0f.com>
Subject: [PATCH 1/3] ARM: mstar: Select MSTAR_MSC313_MPLL
Date: Mon,  1 Mar 2021 21:35:40 +0900
Message-Id: <20210301123542.2800643-2-daniel@0x0f.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210301123542.2800643-1-daniel@0x0f.com>
References: <20210301123542.2800643-1-daniel@0x0f.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All of the ARCH_MSTARV7 chips have an MPLL as the source for
peripheral clocks so select MSTAR_MSC313_MPLL.

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 arch/arm/mach-mstar/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/mach-mstar/Kconfig b/arch/arm/mach-mstar/Kconfig
index 576d1ab293c8..cd300eeedc20 100644
--- a/arch/arm/mach-mstar/Kconfig
+++ b/arch/arm/mach-mstar/Kconfig
@@ -4,6 +4,7 @@ menuconfig ARCH_MSTARV7
 	select ARM_GIC
 	select ARM_HEAVY_MB
 	select MST_IRQ
+	select MSTAR_MSC313_MPLL
 	help
 	  Support for newer MStar/Sigmastar SoC families that are
 	  based on Armv7 cores like the Cortex A7 and share the same
-- 
2.30.1

