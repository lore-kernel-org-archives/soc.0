Return-Path: <SRS0=bsdC=OM=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C06C6C433F5
	for <soc@archiver.kernel.org>; Wed, 22 Sep 2021 20:11:38 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id A0BBC6109E; Wed, 22 Sep 2021 20:11:38 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7A4EA61040
	for <soc@kernel.org>; Wed, 22 Sep 2021 20:11:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7A4EA61040
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id t10so16774088lfd.8
        for <soc@kernel.org>; Wed, 22 Sep 2021 13:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pboqZqvweFsIDQCFgGMzsUC6aFAkqmvJAemT89YbfKI=;
        b=M7MZdfWupPKwjytmjVcaZ2e5BrwSNNAaRMT+slF5tB46+1KjmiBf7/nrsyoeqQNCxz
         jv+GkOlQRSWziYS6VJ/XSDC3FSrID/zV4C+9eGlHLmBZtfvxaNaErSYElN0XesLZEtHn
         SpMNr5koTeXjUkryKkxg3T8ft/Zut6rmpPywIWG7Am2X8cjJIILCE2eDkwo72AvxsFOm
         c2+HU4BGaif+ctr6fLCUq4k/lC50k60lz8j2/8oPPLZ50rMtO2mHXzUYTmCil4G8hf2b
         DFsasfJW4FG6CsyRwTf6aQqjf4dKAv76fhjf9nt0bmF2npeK9qMuoh0brjMNYP7YvvWE
         YVLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pboqZqvweFsIDQCFgGMzsUC6aFAkqmvJAemT89YbfKI=;
        b=5Rmzp0ga0xi3smM981gqUJBefiSGMn8T7N7T+VLx4ldQkJxqjKHSMqtlwSqiI5uOxD
         SAv8lTn0o16d3jEUM016mzHAwu5qD+6ui29SdZkYDm7COeOg+GBiHjoMG4R9BMCefXsg
         r1agx+R56QybInoAF8xAPlwcSRE4ttm51FLvSgkOtgRotGpVX5gRdEJrRDfad6JQt8zs
         K1+NmghSpNT1Mk/KCajcc5+RtkPi5yYCGETan2KaFNPpvMxhJJFyqn/dtvq9rTU9x+GD
         4HT5leHyWsVVUXiB/B0njG5B9tPnLBUFmNc5rIz+Sqcvmq772ceb3E8NHuXSLLjtwxJp
         C5gw==
X-Gm-Message-State: AOAM533Qx4RLVS0l9aKp23vD8d6/Q2/9HEEOM3z+buR1vsLmE7I37Ff3
	V6ZTmSWhJDP05EilutQ4bl5VV7SvM5GFMA==
X-Google-Smtp-Source: ABdhPJzlj7Hv8wwmjXRXtHIl7SZrzTXpH2aLDjGBslS3DBdRfXGbq8ZtxT5WJycOt6O0mucWDk7Pug==
X-Received: by 2002:a2e:1510:: with SMTP id s16mr1140306ljd.119.1632341496966;
        Wed, 22 Sep 2021 13:11:36 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id b7sm255147lfj.19.2021.09.22.13.11.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 13:11:36 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Kees Cook <keescook@chromium.org>
Subject: [PATCH] ARM: defconfig: gemini: Restore framebuffer
Date: Wed, 22 Sep 2021 22:09:33 +0200
Message-Id: <20210922200933.1825752-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The framebuffer is gone on the D-Link DIR-685, restore it.

Fixes: f611b1e7624c ("drm: Avoid circular dependencies for CONFIG_FB")
Cc: Kees Cook <keescook@chromium.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
SoC folks, please apply this directly for fixes.
---
 arch/arm/configs/gemini_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/gemini_defconfig b/arch/arm/configs/gemini_defconfig
index d2d5f1cf815f..e6ff844821cf 100644
--- a/arch/arm/configs/gemini_defconfig
+++ b/arch/arm/configs/gemini_defconfig
@@ -76,6 +76,7 @@ CONFIG_REGULATOR_FIXED_VOLTAGE=y
 CONFIG_DRM=y
 CONFIG_DRM_PANEL_ILITEK_IL9322=y
 CONFIG_DRM_TVE200=y
+CONFIG_FB=y
 CONFIG_LOGO=y
 CONFIG_USB=y
 CONFIG_USB_MON=y
-- 
2.31.1

