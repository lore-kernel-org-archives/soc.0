Return-Path: <SRS0=i7Gr=UU=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED4DBC433EF
	for <soc@archiver.kernel.org>; Sun, 10 Apr 2022 14:58:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B0042C385AA; Sun, 10 Apr 2022 14:58:31 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DA397C385A1
	for <soc@kernel.org>; Sun, 10 Apr 2022 14:58:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org DA397C385A1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id u19so7580259ljd.11
        for <soc@kernel.org>; Sun, 10 Apr 2022 07:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PUc/CgGK8uaNPirbkWCNUqxXbU2YGP4Xn3i6J2o4wv4=;
        b=iA0HNz8vouwWreWVmxIJgZPL2H2W2b7ektk5pk42LHm2DHfgKDyoBLIHKJ+pyO8xDx
         bbAMWs3wIpgPhi0Uk7yuzUQ1L7eRPdNdIfjaO897u2ReBHEzIm8gUDa6sZ+wC+ZPkNml
         QI+TnNxl0OMoa3Wid5w9edU1FyDP69cy3mihTbIkiWoA3uzQi2r6rnmN+R6ZyxVwWSVd
         n2aofMG7c7PGrfxSgKw6S6lQNdXNFZfLTweH1qZAFrWYW+XeEzftzeQ7VwOkEkVSN8Ak
         4lvWSLkXbhBk4eaoCFGOd4H4iQVwM0IvehEHZoBAGgdbXuPeT+7/GpA/qmzQFMahUhEH
         pT2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PUc/CgGK8uaNPirbkWCNUqxXbU2YGP4Xn3i6J2o4wv4=;
        b=sB0awJKVOP8PlV8x71amXHSzlNuDwpVcOeN+6gv7cIJDce5yYzo3pSQtWVQ3y7a+f8
         UQnLbHnBgcW1xe8NiyqNun9L7ovjNXVU+CegGPtRrII8dJMX4ZV3TXAmltfdtucT+qjT
         mM/+zI0ijhpqhd1e5KTF9Eh9SjNS16ijrgt+W9YZThmbrTNTAbxkSQ7Gvax3wkRePMSD
         0p2q8c5+RNsuXQC3pIvq8n5kS+uEpYoGoBU/U4en4XKk0RqY8bEN0MKkV1K8hV56RS97
         Ap47z+QpyJRRc3GYDgjlTNoooMDNnAVmyh0c82EGSwNJqitSGGcnaxTDe9egx+KRy0wb
         2roA==
X-Gm-Message-State: AOAM5314v45GbiptQC7+617NRZ9PNOk+JPsqi/ByuV9UyAS5oLoZm/HQ
	3efdYWnUDB0vXCl1eHWfChp7Uw==
X-Google-Smtp-Source: ABdhPJynTTOGXudgaY6b+kzNnaSoPjaT4AC8k0/CY1z2QJN3UzBHmWxNYqIF7jrm+7GEgsNPxpHy0Q==
X-Received: by 2002:a2e:5858:0:b0:24b:48e7:45d4 with SMTP id x24-20020a2e5858000000b0024b48e745d4mr9735140ljd.18.1649602708729;
        Sun, 10 Apr 2022 07:58:28 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id c21-20020a056512239500b0044aa21dadeasm3047353lfv.60.2022.04.10.07.58.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Apr 2022 07:58:27 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] arm: nomadik: drop selecting obsolete CLKSRC_NOMADIK_MTU_SCHED_CLOCK
Date: Sun, 10 Apr 2022 16:56:23 +0200
Message-Id: <20220410145623.2620380-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lukas Bulwahn <lukas.bulwahn@gmail.com>

Commit 85b6fcadcf66 ("clocksource/drivers/ux500: Drop Ux500 custom
SCHED_CLOCK") removes a sched_clock workaround and its corresponding
config CLKSRC_NOMADIK_MTU_SCHED_CLOCK. Since then, selecting
CLKSRC_NOMADIK_MTU_SCHED_CLOCK in ./arch/arm/mach-nomadik/Kconfig has no
effect and ./scripts/checkkconfigsymbols.py warns:

CLKSRC_NOMADIK_MTU_SCHED_CLOCK
Referencing files: arch/arm/mach-nomadik/Kconfig

Simply drop selecting the obsolete CLKSRC_NOMADIK_MTU_SCHED_CLOCK.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Reviewed-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
This got stuck in my tree by mistake. Please apply this one patch
directly to the SoC tree for v5.19.
---
 arch/arm/mach-nomadik/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/mach-nomadik/Kconfig b/arch/arm/mach-nomadik/Kconfig
index e98429be2b18..ab52b1abc453 100644
--- a/arch/arm/mach-nomadik/Kconfig
+++ b/arch/arm/mach-nomadik/Kconfig
@@ -5,7 +5,6 @@ menuconfig ARCH_NOMADIK
 	select ARM_AMBA
 	select ARM_VIC
 	select CLKSRC_NOMADIK_MTU
-	select CLKSRC_NOMADIK_MTU_SCHED_CLOCK
 	select CPU_ARM926T
 	select GPIOLIB
 	select MFD_SYSCON
-- 
2.35.1

