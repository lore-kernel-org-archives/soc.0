Return-Path: <SRS0=MFSJ=W7=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4506C433EF
	for <soc@archiver.kernel.org>; Fri, 24 Jun 2022 08:04:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A4919C341CA; Fri, 24 Jun 2022 08:04:28 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DD4CCC34114
	for <soc@kernel.org>; Fri, 24 Jun 2022 08:04:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org DD4CCC34114
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f49.google.com with SMTP id e2so2334191edv.3
        for <soc@kernel.org>; Fri, 24 Jun 2022 01:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4OtMpzHKzt91qkm5V15gkjdA78bNtdhhU+jDtTaRt8Y=;
        b=fYHxbPX9kMi6QwUH5r9LNDwsFslHQChYVUSoxHKqS/Sbczv6WsqcHg5LMjF1kCYhhr
         vRGm0im6lsDWbXAJKv4sKfTccMFIr45np2W1U/CyUfs/1NFNwRrPMHmTUV8+SBqptfwI
         NX8szonEbOKl/DNlTLpBRZ4aX4fWv0FNUsFEY9zvg/pct5z6R1DHQkFjrWLPq5bSwx9j
         UyESn/oJRH4JabPxCnH7VWt/iz7En1csAUD/cV/6CtWKwuZRYZM+P4MfpkU6ONKwV7ff
         tZU4bhM0RukM0tUnE0G+xx2tUba3uwJY3QjWMJ+gkin/6rg5N7DMYAd2Q1kBYrEFh4s2
         k7vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4OtMpzHKzt91qkm5V15gkjdA78bNtdhhU+jDtTaRt8Y=;
        b=bSW6D0r1wFcBmaKZQj+rkIWrnRfnbKy1+c1pFv/ovqn4fK5/PaZF+q5K55rS40fM6Z
         QN26Hii8Yn+PMsSiu5VMaO4PuEhqdACkYcxKtBoMdwk4+msLY00jU5FpDc8q4IYN9ByG
         sqJeI5j9xBCH3IGkS58dh8y54F9VwFfwwfZk6VMAELXlRQq73nIbCvbOAd6JPPdTRpoq
         PHm/KYKvji2GEHpypDFuzJY4GrSbba3R2P6he3Q74Q10x7oh4qu+GnBg5lf6Zdlf989L
         XFNA4c/xOfYL8qeLk+5+6RiCA2btXmjpoAuXoDfpls/tvSJ5oIU7n2T0mvBoVVBUHgZL
         SSAQ==
X-Gm-Message-State: AJIora+g4E1MJU4C+NNNDcjF6rr+NHMs8wT2YhVMDGjr06Bl0F/TZKer
	gZVPF3rSTkEgLsz0xA+ETYENMQ==
X-Google-Smtp-Source: AGRyM1vO8srbTPpU08tP7uU1GPYZF7L70IU0e2vDNGf8P3wJz+25K67GBLB56/dBsIiBV+Kf80UloQ==
X-Received: by 2002:a05:6402:254c:b0:435:c541:fc8d with SMTP id l12-20020a056402254c00b00435c541fc8dmr10378580edb.385.1656057866189;
        Fri, 24 Jun 2022 01:04:26 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id d6-20020a170906174600b00715705dd23asm684580eje.89.2022.06.24.01.04.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jun 2022 01:04:25 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>,
	Arnd Bergmann <arnd@arndb.de>,
	arm@kernel.org,
	soc@kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL fixes] ARM: samsung: fixes for v5.19
Date: Fri, 24 Jun 2022 10:04:23 +0200
Message-Id: <20220624080423.31427-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Two fixes for v5.19.

Best regards,
Krzysztof


The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a56:

  Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-fixes-5.19

for you to fetch changes up to c4c79525042a4a7df96b73477feaf232fe44ae81:

  ARM: exynos: Fix refcount leak in exynos_map_pmu (2022-06-06 10:40:57 +0200)

----------------------------------------------------------------
Samsung fixes for v5.19

Both fixes are for issues present before v5.19 merge window:
1. Correct UART clocks on Exynos7885.  Although the initial, fixed
   DTS commit is from v5.18, the issue will be exposed with a upcoming fix
   to Exynos7885 clock driver, so we need to correct the DTS earlier.
2. Fix theoretical OF node leak in Exynos machine code.

----------------------------------------------------------------
David Virag (1):
      arm64: dts: exynos: Correct UART clocks on Exynos7885

Miaoqian Lin (1):
      ARM: exynos: Fix refcount leak in exynos_map_pmu

 arch/arm/mach-exynos/exynos.c              |  1 +
 arch/arm64/boot/dts/exynos/exynos7885.dtsi | 12 ++++++------
 2 files changed, 7 insertions(+), 6 deletions(-)
