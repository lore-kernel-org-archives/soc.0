Return-Path: <SRS0=a2Po=FL=baylibre.com=khilman@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83A7AC4361B
	for <soc@archiver.kernel.org>; Mon,  7 Dec 2020 23:01:59 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 60D60239ED; Mon,  7 Dec 2020 23:01:59 +0000 (UTC)
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com [209.85.210.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 722D3239EC
	for <soc@kernel.org>; Mon,  7 Dec 2020 23:01:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 722D3239EC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=khilman@baylibre.com
Received: by mail-pf1-f196.google.com with SMTP id t8so11863582pfg.8
        for <soc@kernel.org>; Mon, 07 Dec 2020 15:01:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=c20XgdAWTsbcAzOG9E8OkNi+KNaONEX/6aLRj6TsWxc=;
        b=EwegfNBs5entoa8RTWbuxqCh6BwUofBPgf/qE0SkOI2Rn4Ks9HFcPKGdutUm4fOK3r
         OxFPkkBQmo+IdmnmopgCqhCuLXHk4K3vp+MEyXCGhu7vEuJ3USoh8Q6N7FKsZNIaj0cr
         PH8zTu0NmtOB5Xfk+80FEj1l35HdEswCDNmd8WlfAnmKaJn1rfPUZulzcDpR7iqeKh2e
         bfqKs4uVFpVUbqx7Q0sFJoMCwWK7wAiQedXlVX0nfYJDvioOsddaP6Z2B1PBE6PKAkiW
         NwVz/RIxQtAZKgRf4LwOxscMmlyjPUtK+rZAEV2BfGPoVdoRTmKEf+jb4Aunuh6ugfPr
         e/AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=c20XgdAWTsbcAzOG9E8OkNi+KNaONEX/6aLRj6TsWxc=;
        b=KnrrOyqXHM/X37ti/ojYfaDaFEQP+9hpeStt6vkjMg0kUKfje7WtTY4wtMxaijqRMr
         h15WzEqNcD4HiLKv0YyAKmd5Yfkpdv9m5yZreqR4hV/jsyT57bDRucLuMExuKwedantT
         yr2crUOLK32pxf/Y8F1USWv5i2QPi4TWWzTK6RpweKNuQaI0CUyfm+ca7oNlzOxVct9K
         yNotW+zRw8/LFmszMcvaY+PKfYfm2DlkkcTfZbyNK/uMQsaYXzKoqttMufDqCDgvRako
         wmnLCdZiD8SDdeh2ZnBVzfu+q+p7cAZpTdy8fZ0KwKykTcznyRL5H8eXr32vp8yRIvDE
         i8Nw==
X-Gm-Message-State: AOAM533vE0Nfz5MuC6KDnSSxhSGmdWreCu481WXuAZkfusMCL0rbix+v
	NrCGGCrxUxV1hgvimGwdxRtTpfc0LKflSBGA
X-Google-Smtp-Source: ABdhPJzdlIcWNokZmEVIhqX/HKCaktB+kahUWRkXhiz1gQdn+o6cyqzyt1mMCYVeVkfPXxUvnHu81A==
X-Received: by 2002:a17:90a:c38e:: with SMTP id h14mr1074311pjt.10.1607382117377;
        Mon, 07 Dec 2020 15:01:57 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net. [71.197.186.152])
        by smtp.gmail.com with ESMTPSA id z17sm396704pjn.46.2020.12.07.15.01.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Dec 2020 15:01:56 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: linux-amlogic@lists.infradead.org,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] arm64: Kconfig: meson: drop pinctrl
Date: Mon,  7 Dec 2020 15:01:56 -0800
Message-Id: <20201207230156.10198-1-khilman@baylibre.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Don't automatically select pinctrl drivers, leave it up to defaults in
drivers/pinctrl/meson, which default to built-in, but are also now
optionally configurable as modules as of
commit 9c65441ec823 ("pinctrl/meson: enable building as modules")

Signed-off-by: Kevin Hilman <khilman@baylibre.com>
---
Arnd, Olof: I missed this in my earlier PR for arm-soc core changes.
Please apply directly.

 arch/arm64/Kconfig.platforms | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index e4e74e0b5b01..6c4d7356d918 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -152,8 +152,6 @@ config ARCH_MEDIATEK
 
 config ARCH_MESON
 	bool "Amlogic Platforms"
-	select PINCTRL
-	select PINCTRL_MESON
 	select MESON_IRQ_GPIO
 	help
 	  This enables support for the arm64 based Amlogic SoCs
-- 
2.28.0

