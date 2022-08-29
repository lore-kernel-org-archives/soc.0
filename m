Return-Path: <SRS0=ug29=ZB=gmail.com=f.fainelli@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C96BECAAA4
	for <soc@archiver.kernel.org>; Mon, 29 Aug 2022 17:38:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D48CBC433D7; Mon, 29 Aug 2022 17:38:41 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E0C26C433C1;
	Mon, 29 Aug 2022 17:38:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E0C26C433C1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f54.google.com with SMTP id cv7so4327160qvb.3;
        Mon, 29 Aug 2022 10:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=jmKeAtPXOcd+yShd8sCQiTVBynSMhTtxly66Ju96lv0=;
        b=Edq7x/9HKggVb6ESM6Fh0IdGrVve6UXc3lit7QZ14e+bwTxbhlata4cxxxkxf6c+/s
         u+b98kXwmG+eT0FVKLryUnVdVbZwozkLjKDA6REkUaVd7yFB9zljSTHCg0u+9oLy5tGb
         AJLZIj81V5BseUOsetCz4vftiASSe3l8woafCPt0KJ+5S5JETp3p8y+PoMYKss+pG1oa
         Erf7bAeSSGC2SAUPi+WkBc2oqlqiM0jr4rJmad7Zz963S0vEnHhEJkQ5/QCrzFOm96Jp
         +QMKMOuIyFW9tL7eyDkyfy64xt/pdBuuZfZUgLKGe7dSnb43NGrhurUgC11hTv8Ht2D7
         D+mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=jmKeAtPXOcd+yShd8sCQiTVBynSMhTtxly66Ju96lv0=;
        b=KCNNbwkbZ2vIRfSJ0bqihVtBRHagqom4VnHEY9dXB4z3LoClq+O3e8rJE7KTJVAmun
         I7sZzAtv9UJHmkBD8wM7FNx3muDRQKniLtAhVhv3Q7RUbZYCXRuA0vJn6rmSy11h+BSv
         gBUNsDxKc4UKznuuoW8wIZ8LS+HFo8cO5txo+cnWHwjR4Ci2uiH11+vQAetHRUOxiS3/
         NxMTtzHu7byt0CNRGyU96I0MIHkK+aLtawUU78t2foNnjVkE/gIxlpMLQRtPr27HYJmj
         0jBh6TWMLnjUzy6MiR0L9ZLqPIsJUe8TUnyaP9j7aqm35Vod5rdNYAhdORKDeYPnzk1d
         2ceA==
X-Gm-Message-State: ACgBeo1JcRmTWm6Q0xNxXZUPTSSduiAu5sxGvOkUrP/vMq78HT5PK3FL
	i1PM5HfRbhgOehYbqUx5oOg=
X-Google-Smtp-Source: AA6agR6bnU0ltyY9R5eQpQfqad8/YbId9SHWXpBqe7WhCmE30HHPxB+cGqXxJza4ZsaU7y6v78oRyA==
X-Received: by 2002:ad4:5e8a:0:b0:496:b694:9ca7 with SMTP id jl10-20020ad45e8a000000b00496b6949ca7mr11797521qvb.80.1661794719809;
        Mon, 29 Aug 2022 10:38:39 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id j8-20020a05620a288800b006bb7ccf6855sm6543583qkp.76.2022.08.29.10.38.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Aug 2022 10:38:39 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
To: linux-arm-kernel@lists.infradead.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org,
	Florian Fainelli <f.fainelli@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	linux-kernel@vger.kernel.org (open list),
	krzysztof.kozlowski@linaro.org,
	arnd@arndb.de,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	william.zhang@broadcom.com,
	anand.gore@broadcom.com
Subject: [PATCH v2 1/2] arm64: Kconfig.platforms: Re-organized Broadcom menu
Date: Mon, 29 Aug 2022 10:38:28 -0700
Message-Id: <20220829173830.3567047-2-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220829173830.3567047-1-f.fainelli@gmail.com>
References: <20220829173830.3567047-1-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are now multiple Broadcom SoCs supported so group them under their
own menu such that the selection is visually more appealing and we can
easily add new platforms there in the future. This allows us to move
ARCH_BRCMSTB back to its siblings.

No functional changes introduced.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 arch/arm64/Kconfig.platforms | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index 74e9e9de3759..748f9ac4d775 100644
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
@@ -73,6 +78,16 @@ config ARCH_BCMBCA
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
@@ -87,14 +102,6 @@ config ARCH_BITMAIN
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

