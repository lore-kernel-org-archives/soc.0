Return-Path: <SRS0=saSd=XR=gmail.com=f.fainelli@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D405C43334
	for <soc@archiver.kernel.org>; Tue, 12 Jul 2022 16:42:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3F273C3411E; Tue, 12 Jul 2022 16:42:43 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 833C0C3411C;
	Tue, 12 Jul 2022 16:42:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 833C0C3411C
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f41.google.com with SMTP id o3-20020a17090a744300b001ef8f7f3dddso8785027pjk.3;
        Tue, 12 Jul 2022 09:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=38qVWGdU7HKJkL6IeCHeQKdX+0uOfPHorBf46EI1KJs=;
        b=nVBSoT3GWPU4E9j6+KwPb2GXTEMNqck6Lio7zEkhgrmsW4lsa0rlm9nUQaVaF0XaIp
         bFiKfAHlnEMwbcNJjb/ZIBNaBcWiR13sXTVSW3l2G72ri0vIBrdmz0Wqf+gSU6oq99+y
         SNxe+8FbAENRA35QJLfQlf+JA7ii4Ka7N98XKEc0NFaxeUxN2h/TS4mZ/LkUVTJGw6eF
         JpTCyzwcrbDR1NUGVdsOvZtY+jiJbqLw1NI1HAJnQAWCaG8oWrwls3appxJ40EPz6yLc
         3wGiuSsiSAb3V+cjwx+mSoB1DDpycEQr2k/CzCKj/bpJ8hkToVo9QxAgrCQhmodDenXK
         VSKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=38qVWGdU7HKJkL6IeCHeQKdX+0uOfPHorBf46EI1KJs=;
        b=PKQUZbAQ+7cmv113rRvTwjpbygwUaSQLSF3UcrDvDDnJst9XmG6cBcuPEl3zbByzdd
         3q6oyeJeEnUnaqnCCugbGVfyb+nQXGOg7C3MpBAZNBT7X2IH4hTmJ4xwg0Mmeo61cqv2
         pQsUpGJ7/0sfY1mJ71hSE6npYxXkrbEUkMO4dMa6rCN7vOneZsl1pcHYLbqwOOK95szJ
         UZyy2G3vS4qDv9EW9hDSaVRz+407cDcLjpasxq3pYYnJA4jXJ7tqVFo7tgrixetq4Wyt
         Nhlu4JGc3PAZkl8bTcw7Osg+fQFc3K8XlW+2foOTLVkyb7Iy3vjX5+OiWmQtcA1jDteA
         5Fcg==
X-Gm-Message-State: AJIora9Qb6Axf2SN0y8JuYTJxxvtOE784h4m8knl34uhpxQD/2+4qWDj
	4n/9woN2sG1lfMAmORJ3FdM=
X-Google-Smtp-Source: AGRyM1vM/uufGxIf0o5rDefUv4yeq7W+vjifZQYSEdFtEs1ZztI71WgQjYPptMY8+ctn++udD323Mw==
X-Received: by 2002:a17:90b:4ad2:b0:1f0:3395:6427 with SMTP id mh18-20020a17090b4ad200b001f033956427mr5166794pjb.93.1657644161878;
        Tue, 12 Jul 2022 09:42:41 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id n5-20020a622705000000b005254c71df0esm7050562pfn.86.2022.07.12.09.42.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jul 2022 09:42:40 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
To: linux-arm-kernel@lists.infradead.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org,
	bcm-kernel-feedback-list@broadcom.com,
	william.zhang@broadcom.com,
	krzysztof.kozlowski@linaro.org,
	anand.gore@broadcom.com,
	arnd@arndb.de,
	olof@lixom.net,
	Florian Fainelli <f.fainelli@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] arm64: Kconfig.platforms: Re-organized Broadcom menu
Date: Tue, 12 Jul 2022 09:42:35 -0700
Message-Id: <20220712164235.40293-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are now multiple Broadcom SoCs supported so group them under their
own menu such that the selection is visually more appealing and we can
easily add new platforms there in the future. This allows us to move
ARCH_BRCMSTB back to its siblings.

No functional changes introduced.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---

Note this is based on "arm64: bcmbca: add arch bcmbca machine entry"

 arch/arm64/Kconfig.platforms | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index 88ddc2e5b152..c8c15f611d4e 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -33,6 +33,11 @@ config ARCH_APPLE
 	  This enables support for Apple's in-house ARM SoC family, starting
 	  with the Apple M1.
 
+menuconfig ARCH_BCM
+	bool "Broadcom SoC Support"
+
+if ARCH_BCM
+
 config ARCH_BCM2835
 	bool "Broadcom BCM2835 family"
 	select TIMER_OF
@@ -72,6 +77,16 @@ config ARCH_BCMBCA
 	  This enables support for Broadcom BCA ARM-based broadband chipsets,
 	  including the DSL, PON and Wireless family of chips.
 
+config ARCH_BRCMSTB
+	bool "Broadcom Set-Top-Box SoCs"
+	select ARCH_HAS_RESET_CONTROLLER
+	select GENERIC_IRQ_CHIP
+	select PINCTRL
+	help
+	  This enables support for Broadcom's ARMv8 Set Top Box SoCs
+
+endif
+
 config ARCH_BERLIN
 	bool "Marvell Berlin SoC Family"
 	select DW_APB_ICTL
@@ -86,14 +101,6 @@ config ARCH_BITMAIN
 	help
 	  This enables support for the Bitmain SoC Family.
 
-config ARCH_BRCMSTB
-	bool "Broadcom Set-Top-Box SoCs"
-	select ARCH_HAS_RESET_CONTROLLER
-	select GENERIC_IRQ_CHIP
-	select PINCTRL
-	help
-	  This enables support for Broadcom's ARMv8 Set Top Box SoCs
-
 config ARCH_EXYNOS
 	bool "ARMv8 based Samsung Exynos SoC family"
 	select COMMON_CLK_SAMSUNG
-- 
2.25.1

