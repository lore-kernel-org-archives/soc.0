Return-Path: <SRS0=tuuZ=NO=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25B38C27C53
	for <soc@archiver.kernel.org>; Wed, 12 Jun 2024 14:10:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0C9A4C4AF1A; Wed, 12 Jun 2024 14:10:47 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 37877C116B1
	for <soc@kernel.org>; Wed, 12 Jun 2024 14:10:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 37877C116B1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2ebd95f136bso23934561fa.0
        for <soc@kernel.org>; Wed, 12 Jun 2024 07:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718201443; x=1718806243; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fDZBDbUR/Osz8PKcQ2HcjsVNrayHLES+DrpHvD2F5Pk=;
        b=hrbbrguXdSd2s8PJPxtZL2EuB0oPbhZ0LrJ4GPpfNo8Ea8dQfjKj+BewQuwZvuFFOT
         0ivaKFdSJDCs2j86UDhc1Met7C3uj8q/3IxAjlJwgreeJwr7GOgyvIz78OUJLMVbfm84
         0fSSLg/bFTU/7qG/2huaXp3rXSjMB9bWqyeDsopjfxMZKCUCKMatzXeJM3e4pl3V/6Co
         9HnGWbnysrQdXhgPz79L8CBeuMzCHxdmzQtxO/0K1a/NpJV1Nnjy92Nm/7znVNLA0ahD
         IBK2YrK8jTyAPQsssM8Z0Ri6hzwAEgHiEyT2hZ9XDPRWTSip3V0qFdtpA47LrnByY8jD
         scEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718201443; x=1718806243;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fDZBDbUR/Osz8PKcQ2HcjsVNrayHLES+DrpHvD2F5Pk=;
        b=CPAKlnd8ydJVtr6V20YnV3h/bj39FotH0t734wRKs741wSrALoKZH6JQEY/7+oRgKi
         MtFnsB4dOon/3QD8SqpgjXhDPxaU+Xx/gfQ85S5X7NuFGRqQznyMFjglzUa18tk9wKUo
         TOth1vgNFFF/VMmWPNwp+4/uRHS0bDbgjDFAqmu5zme3+zNKI1BN7UoFAcsN6cWkrvvl
         GiiYxRem5N3LEioRul+CpLH2X1OzDl/rFCh9toPPCCBRSo9nujgvUbfl3TIDKoeWwbBR
         PKjDIZZbhp5SWPjAJKg8/MrHqAmNr/j5BKjWCnZPTzTXHiZtRyCKFhMlP2V1rn9G2qSa
         OLuw==
X-Forwarded-Encrypted: i=1; AJvYcCUeyIdyAQtBhovDA4HC5l4SkVdqRPA7qJcPNn/AxNYNo5i556ufF61KYCvBny3Zxprx1CuVmP4T4HQRqRiAyw==
X-Gm-Message-State: AOJu0YwMuq0zm0ylyGgXviNxmjBxf2hPVwl4NCk9qp8g5t6zE7iBuisv
	8uqNF5NnQOrpltbHmliWE4RkhEvBqH2rc9rIXDukdIK2a+IxDaSthARiOd2l+qE=
X-Google-Smtp-Source: AGHT+IFjLR7yr1vu07suK4U8uhG1T2SNjOgZASn+EN8VRdq7sFOEyjV5ivQ5D5ogr5TWg7tHypOgaw==
X-Received: by 2002:a2e:9b88:0:b0:2eb:120c:1a59 with SMTP id 38308e7fff4ca-2ebfc9d0865mr11492691fa.16.1718201443353;
        Wed, 12 Jun 2024 07:10:43 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42286fe7670sm29304585e9.6.2024.06.12.07.10.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 07:10:42 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	arm@kernel.org,
	soc@kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Oleksij Rempel <linux@rempel-privat.de>
Subject: [PATCH] MAINTAINERS: ARM: alphascale: add Krzysztof Kozlowski as maintainer
Date: Wed, 12 Jun 2024 16:10:18 +0200
Message-ID: <20240612141018.7348-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Apparently there was never a maintainers entry for the ARM Alphascale
ASM9260 SoC, thus patches end up nowhere.  Add such entry, because even
if platform is orphaned and on its way out of the kernel, it is nice to
take patches if someone sends something.

I do not plan to actively support/maintain ARM Alphascale but I can take
odd fixes now and then.

Cc: Oleksij Rempel <linux@rempel-privat.de>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 MAINTAINERS | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index c7a13170b697..647233a62f50 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1946,6 +1946,16 @@ N:	allwinner
 N:	sun[x456789]i
 N:	sun[25]0i
 
+ARM/ALPHASCALE ARCHITECTURE
+M:	Krzysztof Kozlowski <krzk@kernel.org>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+S:	Odd Fixes
+F:	arch/arm/boot/dts/alphascale/
+F:	drivers/clk/clk-asm9260.c
+F:	drivers/clocksource/asm9260_timer.c
+F:	drivers/rtc/rtc-asm9260.c
+F:	drivers/watchdog/asm9260_wdt.c
+
 ARM/AMD PENSANDO ARM64 ARCHITECTURE
 M:	Brad Larson <blarson@amd.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
-- 
2.43.0

