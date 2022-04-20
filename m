Return-Path: <SRS0=wXmp=U6=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90ECEC433EF
	for <soc@archiver.kernel.org>; Wed, 20 Apr 2022 07:22:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 79020C385AB; Wed, 20 Apr 2022 07:22:01 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7528DC385AE
	for <soc@kernel.org>; Wed, 20 Apr 2022 07:22:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7528DC385AE
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f44.google.com with SMTP id ks6so1692284ejb.1
        for <soc@kernel.org>; Wed, 20 Apr 2022 00:22:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5bhHmkNynxArCaTA/7bZ7/hQVWgPWdbqpkbJXO91I6o=;
        b=V3BsCCRe/dmD5vyspIiiwnvVRGjTw9phFS+Deblji7ZMzkzb5GRm14IBNskkzUYr6i
         koMqOflEWfWXuj7c4vmEwAZtWkhCR8hk6SuDMVs+7TNfHQAt/r5fKrBeCFcVtJPzJzl8
         jm1t2FYtqyIkzxUGEtEVq/yXcOQqqlsW1s+jOL47F3pFti0iLq5r9S28TL6vjk0Iyj8t
         xuZq3DQD2y/BQJDVo/66/I+rDTTuGNoIBNy7pSYpg2pHBq/57iG1ZjZnPecQ1LpyC6oL
         xz+h3p4HDqngQKdFN/UhCEBglc/b4Yp5guIIMAAE+pjqVeTwvUb3hhFCoy4Na0lA6eJY
         F1dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5bhHmkNynxArCaTA/7bZ7/hQVWgPWdbqpkbJXO91I6o=;
        b=eEhzSFP0hNjj6zodtLxWR8lcE6woaL+UNKyMmUV2TpfIO2mWhNsZqFsh43sM3S/D3X
         lANLxecDnKSRXFNRacdPPevJ451t5dhEdi+Y2jTpXIviW8dD13bzYBntQ6DOs4sstaWw
         HGSy7Ek3sL9s/00bEGr8p7YQ7G+9O6nvMeEQZRJhc67FEHMw6AdDh0KU3kQSLy2Bwolz
         lAubrUyggQvE2tldLrcoGd97wcueu+do8RmcogYh1vZsoPJyYdEoCweLhXjM6gnxLiMT
         ucq/0hALrVeV9a1DoAfjzvoU655DCaXoP56P+XfDEt7Ir1Q2yw93kTob0VUb9SQaNpe3
         NBYg==
X-Gm-Message-State: AOAM530fmCFzaESOOixvfv6Xew2ijy1AA9XGm2DtI8HqmizCiRL6gIaT
	kH4A16eJegestAkgwpaia/yiiA==
X-Google-Smtp-Source: ABdhPJyDYc5gwpPbK9kabmfq2DveJYHoUheuzGxUxOm+QOQqAKm0THRZRPtHRpizJ2fraH1+pUxO8Q==
X-Received: by 2002:a17:906:c110:b0:6e8:3a96:996a with SMTP id do16-20020a170906c11000b006e83a96996amr17040723ejc.216.1650439318749;
        Wed, 20 Apr 2022 00:21:58 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id a1-20020a1709063e8100b006ce06ed8aa7sm6492106ejj.142.2022.04.20.00.21.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Apr 2022 00:21:58 -0700 (PDT)
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
Subject: [GIT PULL 3/3] arm64: dts: samsung: dts for v5.19
Date: Wed, 20 Apr 2022 09:21:52 +0200
Message-Id: <20220420072152.11696-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220420072152.11696-1-krzysztof.kozlowski@linaro.org>
References: <20220420072152.11696-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:

  Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt64-5.19

for you to fetch changes up to 22cbcb8f4a17c194d208f686fc3ea37fc860bd71:

  arm64: dts: tesla: add a specific compatible to MCT on FSD (2022-04-04 18:53:08 +0200)

----------------------------------------------------------------
Samsung DTS ARM64 changes for v5.19

1. Cleanup: move aliases of board-related features to board in
   Exynos850.
2. Add specific compatibles to Multi Core Timer to allow stricter DT
   schema matching.

----------------------------------------------------------------
Krzysztof Kozlowski (3):
      arm64: dts: exynos: move aliases to board in Exynos850
      arm64: dts: exynos: add a specific compatible to MCT
      arm64: dts: tesla: add a specific compatible to MCT on FSD

 arch/arm64/boot/dts/exynos/exynos5433.dtsi       |  3 ++-
 arch/arm64/boot/dts/exynos/exynos850-e850-96.dts |  5 +++++
 arch/arm64/boot/dts/exynos/exynos850.dtsi        | 19 ++-----------------
 arch/arm64/boot/dts/tesla/fsd.dtsi               |  2 +-
 4 files changed, 10 insertions(+), 19 deletions(-)
