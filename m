Return-Path: <SRS0=6vKs=ZM=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71110ECAAD3
	for <soc@archiver.kernel.org>; Fri,  9 Sep 2022 15:08:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 38C25C433D7; Fri,  9 Sep 2022 15:08:59 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 26BECC433B5
	for <soc@kernel.org>; Fri,  9 Sep 2022 15:08:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 26BECC433B5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id p5so2166170ljc.13
        for <soc@kernel.org>; Fri, 09 Sep 2022 08:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=yG6n1mI/niFEcjcQjVJpd13snjc11+9Ua1ZcNArK/PA=;
        b=oEfXggTUejCD3bsEk5Eo+2JMTPU7wYewMF59Trg8eC3tcKDXXy9WPcQ/CmG4RUaDFB
         v0BbuQMpgpflqYAmI6w+ZDVN5FoE35/jmCH/VwnBtWCpZzbAELh1uQy3A95xe7uAci5y
         OrOwtu2CS7oHyXL4es6VMZhIHNyPJtLtxL8PuUd7qy/Cw2TVW70mKTKVtw95DqWc73SA
         ZaagKx6++krFfGPGbooUVF5xZihXWtqKe6v2QMCTcy7CQF8RegFYUt2P6IBtpLg3lmvU
         qPnJ09Io0tVuDU+XOSCas5VUCXCv64AADXRNempF/rlMHimS+KgZRV/GqWQJrmym6IDa
         tnOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=yG6n1mI/niFEcjcQjVJpd13snjc11+9Ua1ZcNArK/PA=;
        b=PbEfF9mQKetrLWHkB+mBgK+gm6OHGHDDdiQ4Qwa12zeEhPmCzfAQUsGWJHtAIqI/G+
         yD100fbJTPhCg2udunKaCgmqdcjkn5HDnBqnuaQR9FkpgoqmsNWMvXmYZHBvn5/QA2in
         x8+ltQ6cB/nt05MfcQ18DL7tCqpzNJrYll6GkoJe6STyxoLJr2f17w38+0HxTDL58I6p
         xV88GK088UwRKCLJMrGDmhNpkZXjFdchJzKainz3qMa3irZIBSf8RDpRPLMP/vTJlnWa
         PPWszRM7C4CWWtgi4eenaGeLdtt1jO2jN9rhXE1uHEKl2I4PEa+9lTLg1MNCd38VOrXa
         7e4g==
X-Gm-Message-State: ACgBeo32JzMx/7W0OETNP1ykQ8Lv1nCCwvhbe1MK7fGTR2dfk2gFzXxD
	ThmLEOpMR4S17G5jFhkIZtgn1g==
X-Google-Smtp-Source: AA6agR7iqqrJBwh91qdHkanhjVdu547jO82W1aU6cr1V6QbocxJYKksLDOPQALu7g/UDT1is1JsJDA==
X-Received: by 2002:a2e:b712:0:b0:26a:d1d9:f8d1 with SMTP id j18-20020a2eb712000000b0026ad1d9f8d1mr3644878ljo.271.1662736136106;
        Fri, 09 Sep 2022 08:08:56 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id d26-20020a2e361a000000b0026ab83298d6sm110605lja.77.2022.09.09.08.08.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Sep 2022 08:08:55 -0700 (PDT)
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
Subject: [GIT PULL 2/2] arm64: dts: samsung: for v6.1
Date: Fri,  9 Sep 2022 17:08:49 +0200
Message-Id: <20220909150849.820523-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220909150849.820523-1-krzysztof.kozlowski@linaro.org>
References: <20220909150849.820523-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

The clock binding headers are also shared with clk tree (via earlier pull
request).

Best regards,
Krzysztof


The following changes since commit 568035b01cfb107af8d2e4bd2fb9aea22cf5b868:

  Linux 6.0-rc1 (2022-08-14 15:50:18 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt64-6.1

for you to fetch changes up to dfce69c8520592f1a20619050e6ded6275e9f25f:

  dt-bindings: serial: samsung: add exynosautov9-uart compatible (2022-08-25 09:47:56 +0300)

----------------------------------------------------------------
Samsung DTS ARM64 changes for v6.0

1. Add binding headers for several Exynos850 and ExynosAutov9 clocks.
2. ExynosAutov9: Add FSYS clock controller nodes.
3. ExynosAutov9: Document serial compatible (used in DTS).
4. Exynos850: Add Audio, IS, MFC clock controllers. Add IOMMU nodes.

----------------------------------------------------------------
Chanho Park (6):
      dt-bindings: clock: exynosautov9: correct clock numbering of peric0/c1
      dt-bindings: clock: exynosautov9: add fys0 clock definitions
      dt-bindings: clock: exynosautov9: add fsys1 clock definitions
      dt-bindings: clock: exynosautov9: add schema for cmu_fsys0/1
      arm64: dts: exynosautov9: add fsys0/1 clock DT nodes
      dt-bindings: serial: samsung: add exynosautov9-uart compatible

Sam Protsenko (5):
      dt-bindings: clock: exynos850: Add Exynos850 CMU_AUD
      dt-bindings: clock: exynos850: Add Exynos850 CMU_IS
      dt-bindings: clock: exynos850: Add Exynos850 CMU_MFCMSCL
      arm64: dts: exynos: Add CMU_AUD, CMU_IS and CMU_MFCMSCL for Exynos850
      arm64: dts: exynos: Add SysMMU nodes for Exynos850

 .../bindings/clock/samsung,exynos850-clock.yaml    |  69 +++++++++++
 .../bindings/clock/samsung,exynosautov9-clock.yaml |  44 +++++++
 .../devicetree/bindings/serial/samsung_uart.yaml   |   5 +-
 arch/arm64/boot/dts/exynos/exynos850.dtsi          |  83 +++++++++++++
 arch/arm64/boot/dts/exynos/exynosautov9.dtsi       |  28 +++++
 include/dt-bindings/clock/exynos850.h              | 136 ++++++++++++++++++++-
 include/dt-bindings/clock/samsung,exynosautov9.h   | 128 ++++++++++++++-----
 7 files changed, 461 insertions(+), 32 deletions(-)
