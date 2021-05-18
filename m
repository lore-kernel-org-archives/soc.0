Return-Path: <SRS0=YtiX=KN=gmail.com=joel.stan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18FF3C433B4
	for <soc@archiver.kernel.org>; Tue, 18 May 2021 07:15:29 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id E3B0061261; Tue, 18 May 2021 07:15:28 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BAEE261166
	for <soc@kernel.org>; Tue, 18 May 2021 07:15:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BAEE261166
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=joel.stan@gmail.com
Received: by mail-pl1-f176.google.com with SMTP id p6so4562784plr.11
        for <soc@kernel.org>; Tue, 18 May 2021 00:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/G2RDpogjBkSoejrHeQJwHfsONspUvsVyyACZIjrYK4=;
        b=Ny3WgWBtRFzRQQPH9nMOjZ8ENdfASCuXKVRwScfKKc/DxGWDcgqN4cdkSFXgrmEGCS
         FmlqRLVN+UNevp0p0M0RsTVgcCmkU9AcKW3B6Hj8NyIPBjd716H8t5LZv0b9nNqVeBHI
         j6AvaRLIv4gSAwF0xRXduDXsSLT5vlp1BGEFbzB4X4t8E0UW4tE0I8uybtNDYexOubG1
         ifZCXtRSSPPjJIf7gNkO/NxgDhtQzIb8869XV1CDFEesHwxAtVvJuEzAN+2MR/5hv2Dx
         2YpAAsMclFOWVqBsWaMQA9aakwvWxgDy1dfwg6c4VQsSOa/Dwjbg/1Xmd3a50XE3Kiof
         o6sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=/G2RDpogjBkSoejrHeQJwHfsONspUvsVyyACZIjrYK4=;
        b=mVPJMxtjwK1lqLU9Ai/LFRZ0uSjWkFSVcBUsvBo1wShNR7JgAxwbq3WnkMr8aT8StE
         fsDSVVak0yaz/OxKCmBWsT79BPFbu5KxY7WKDPXGAtsJa8o2RXljDClW/8B+nl3bqqv3
         gklSuHksP9XTVKVHuS4whQGjD8F2M+UwlQcOPeBTM+zdRemZBIAxUidkcLs8Vw158hXr
         O4yO9hlUi814M4MIO5XMebfQxQ/0kj0Ts96DC0P+/OKk3fkvUgPm/5/cTIA6AIa4+hwd
         TRWct5HoSIHTD61LJbWyPkdLIN3ssXuDxvsRob8BPpt0zGM08jMl6ZhdYXEwt2IBDcMO
         nnRg==
X-Gm-Message-State: AOAM5316MpLfC7Em9lWEtC173tIECzNGrjs1Z8S1+TWU7vagzIypz9fI
	dulSwlsAOZPr6Y83R+uaJRkkTOfbHkuDgTrl
X-Google-Smtp-Source: ABdhPJyveQiAOsfQe3cu89I4sun1SGG+6V7uDCis5AvkV/6SYSI65XoeoxmuqQtcZF4idrgqKnl2Lg==
X-Received: by 2002:a17:90b:4b0f:: with SMTP id lx15mr3823524pjb.184.1621322127699;
        Tue, 18 May 2021 00:15:27 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.14])
        by smtp.gmail.com with ESMTPSA id h24sm11829928pfn.180.2021.05.18.00.15.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 May 2021 00:15:26 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
From: Joel Stanley <joel@jms.id.au>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Subject: [PATCH] ARM: npcm: wpcm450: select interrupt controller driver
Date: Tue, 18 May 2021 16:45:14 +0930
Message-Id: <20210518071514.604492-1-joel@jms.id.au>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Jonathan Neuschäfer <j.neuschaefer@gmx.net>

The interrupt controller driver is necessary in order to have a
functioning Linux system on WPCM450. Select it in mach-npcm/Kconfig.

Signed-off-by: Jonathan Neuschäfer <j.neuschaefer@gmx.net>
Fixes: ece3fe93e8f4 ("ARM: npcm: Introduce Nuvoton WPCM450 SoC")
Reviewed-by: Joel Stanley <joel@jms.id.au>
Link: https://lore.kernel.org/r/20210513165627.1767093-1-j.neuschaefer@gmx.net
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
Can we please have this applied as a fix for v5.13. Thanks!

 arch/arm/mach-npcm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/mach-npcm/Kconfig b/arch/arm/mach-npcm/Kconfig
index 658c8efb4ca1..a71cf1d189ae 100644
--- a/arch/arm/mach-npcm/Kconfig
+++ b/arch/arm/mach-npcm/Kconfig
@@ -10,6 +10,7 @@ config ARCH_WPCM450
 	bool "Support for WPCM450 BMC (Hermon)"
 	depends on ARCH_MULTI_V5
 	select CPU_ARM926T
+	select WPCM450_AIC
 	select NPCM7XX_TIMER
 	help
 	  General support for WPCM450 BMC (Hermon).
-- 
2.30.2

