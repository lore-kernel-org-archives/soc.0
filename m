Return-Path: <SRS0=05Gg=LE=canonical.com=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98A2DC48BD1
	for <soc@archiver.kernel.org>; Thu, 10 Jun 2021 07:41:04 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 6BF2A613C6; Thu, 10 Jun 2021 07:41:04 +0000 (UTC)
Received: from youngberry.canonical.com (youngberry.canonical.com [91.189.89.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 279B6613DF
	for <soc@kernel.org>; Thu, 10 Jun 2021 07:41:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 279B6613DF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=krzysztof.kozlowski@canonical.com
Received: from mail-wr1-f69.google.com ([209.85.221.69])
	by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <krzysztof.kozlowski@canonical.com>)
	id 1lrFJG-0001Yb-ML
	for soc@kernel.org; Thu, 10 Jun 2021 07:41:02 +0000
Received: by mail-wr1-f69.google.com with SMTP id z13-20020adfec8d0000b0290114cc6b21c4so458559wrn.22
        for <soc@kernel.org>; Thu, 10 Jun 2021 00:41:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=e2+wIvEzXuddcIq0HptNZ4S2HwP4Xp1f1Y9ZwuawFc4=;
        b=exvQ6qn1A+3KmafLF8XVh/q4L1NZYt6a0AoGT1NxzT1q3Izt4rbkHDVJG1/pHPt4Tc
         E7ADEu96NKUgpjXWS1jZk/pmo8GH8ysflWgjXvhcxrLsGylbAYYqnDtx5uTf6kHEyhxA
         zWxe18CVih20JkxsuS5YPkgDExQPWLNXQQB/ztj+rXQxjRBbNU12//aYqn3VUV5isb6M
         MGJwrmgTqxG6pxHqrNjO7+NI67F1SVPsEQJd3RvpBNyAI0MXyz0JZnFfQ35WcxdU1DKh
         i6z2K0SS3c8GOxvNDB3Pq4GJ0IO1MAtrjkdGGhdVAbeeVbCh8hppaBZw2ZbTS5Dogkh7
         WFyg==
X-Gm-Message-State: AOAM532bOFBGuumip8fbutIe2qJb8l/x5aNACYmclsLA7xwr3T12yVt/
	0b7bmkLhbS/CpcX7eK/11dddbtjD4jGZTPgvzDDwnGEXQgfswLevWGYGk5mLGCQpgiRA+4XNiWy
	eyLGI1bex9hRMEnhR8tWJ07Q=
X-Received: by 2002:a5d:4ecf:: with SMTP id s15mr3761846wrv.80.1623310862384;
        Thu, 10 Jun 2021 00:41:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwZwFM7Mtml6+tDBHWQSvn1Ol2Wwfw1kgdH8lO0D7YcHyNXXoa62MbbMN9e/Cmg+98Wt0tHsw==
X-Received: by 2002:a5d:4ecf:: with SMTP id s15mr3761833wrv.80.1623310862249;
        Thu, 10 Jun 2021 00:41:02 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-177-222.adslplus.ch. [188.155.177.222])
        by smtp.gmail.com with ESMTPSA id k11sm8417229wmj.1.2021.06.10.00.41.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jun 2021 00:41:01 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>,
	Arnd Bergmann <arnd@arndb.de>,
	arm@kernel.org,
	soc@kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 1/2] ARM: dts: samsung: pull for v5.14
Date: Thu, 10 Jun 2021 09:40:54 +0200
Message-Id: <20210610074055.12474-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Few DTS changes. I will have slightly later also pulls for ARM64 and defconfig.

Best regards,
Krzysztof


The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt-5.14

for you to fetch changes up to 135adbbee4c66f89b57519633cbf8c3c35b6c4da:

  ARM: dts: exynos: Disable unused camera input for I9100 (2021-05-31 17:53:00 +0200)

----------------------------------------------------------------
Samsung DTS ARM changes for v5.14

1. Several cleanups and alignment with dtschema.  This includes removal
   of unused properties and fixing LED brightness property.
2. Enable PMIC RTC interrupt as a wakeup source (intended to wakeup for
   example from Suspend to RAM where the PMIC RTC's power is still
   supplied).
3. Disable unused/not implemented camera on GT-I9100.

----------------------------------------------------------------
Krzysztof Kozlowski (16):
      ARM: dts: exynos: align Broadcom WiFi with dtschema
      ARM: dts: exynos: replace legacy MMS114 touchscreen x/y properties in GT-N7100
      ARM: dts: exynos: fix PWM LED max brightness on Odroid XU/XU3
      ARM: dts: exynos: fix PWM LED max brightness on Odroid HC1
      ARM: dts: exynos: fix PWM LED max brightness on Odroid XU4
      ARM: dts: s5pv210: remove unused Atmel touchscreen properties in Goni
      ARM: dts: exynos: enable PMIC wakeup from suspend on Itop Core
      ARM: dts: exynos: enable PMIC wakeup from suspend on Origen4412
      ARM: dts: exynos: enable PMIC wakeup from suspend on Arndale
      ARM: dts: exynos: enable PMIC wakeup from suspend on Odroid XU
      ARM: dts: exynos: enable PMIC wakeup from suspend on Midas
      ARM: dts: exynos: enable PMIC wakeup from suspend on Odroid X/U3
      ARM: dts: exynos: enable PMIC wakeup from suspend on P4 Note
      ARM: dts: exynos: enable PMIC wakeup from suspend on Arndale Octa
      ARM: dts: exynos: enable PMIC wakeup from suspend on SMDK5420
      ARM: dts: exynos: enable PMIC wakeup from suspend on Odroid XU3/XU4 family

Timon Baetz (1):
      ARM: dts: exynos: Disable unused camera input for I9100

 arch/arm/boot/dts/exynos3250-rinato.dts         | 2 +-
 arch/arm/boot/dts/exynos4210-i9100.dts          | 8 +++++---
 arch/arm/boot/dts/exynos4210-trats.dts          | 2 +-
 arch/arm/boot/dts/exynos4210-universal_c210.dts | 2 +-
 arch/arm/boot/dts/exynos4412-itop-scp-core.dtsi | 1 +
 arch/arm/boot/dts/exynos4412-midas.dtsi         | 1 +
 arch/arm/boot/dts/exynos4412-n710x.dts          | 4 ++--
 arch/arm/boot/dts/exynos4412-odroid-common.dtsi | 1 +
 arch/arm/boot/dts/exynos4412-origen.dts         | 1 +
 arch/arm/boot/dts/exynos4412-p4note.dtsi        | 1 +
 arch/arm/boot/dts/exynos5250-arndale.dts        | 1 +
 arch/arm/boot/dts/exynos5410-odroidxu.dts       | 1 +
 arch/arm/boot/dts/exynos5420-arndale-octa.dts   | 1 +
 arch/arm/boot/dts/exynos5420-smdk5420.dts       | 1 +
 arch/arm/boot/dts/exynos5422-odroid-core.dtsi   | 1 +
 arch/arm/boot/dts/exynos5422-odroidhc1.dts      | 2 +-
 arch/arm/boot/dts/exynos5422-odroidxu4.dts      | 2 +-
 arch/arm/boot/dts/exynos54xx-odroidxu-leds.dtsi | 4 ++--
 arch/arm/boot/dts/s5pv210-goni.dts              | 9 ---------
 19 files changed, 24 insertions(+), 21 deletions(-)
