Return-Path: <SRS0=zANd=VO=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85779C4332F
	for <soc@archiver.kernel.org>; Fri,  6 May 2022 08:14:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6C953C385A8; Fri,  6 May 2022 08:14:50 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B92B2C385B0
	for <soc@kernel.org>; Fri,  6 May 2022 08:14:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B92B2C385B0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id i5so8968549wrc.13
        for <soc@kernel.org>; Fri, 06 May 2022 01:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VzjcV3LY0ywTAwJH4JJM1dmdhwuF1gWAWbVhUFafxbE=;
        b=lQnSziesxGwRRS3eLO1dYR2Z6H0chCnrH52wKrTqzXXOk6KOHrMNx4Zc12TICzaZNf
         9RFXRev2QMNjxgjnfB6S3GJ08E5IS5p1/2up/GslTn+1pi5JV63hFcS9zkF5Oo540t+O
         JfOzpp3IOWrKsinXuiA+2bG7M2TTZkysPLh8eM9TeCGdFYIgnrDGoadKPNflKfGLan28
         bTvWvTnvr6jJBWswp6lIEGqFkxdljfxxGh+sTIWyp8QDP4htG3OYiKVCDlvna7mG0Geu
         K7Jo2bkwkS99NUQLgTOxk51IbdSJ6V1hnMlt65vNHOX5uNLTj0rDZy62Gx3LqJobwrXB
         jp3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VzjcV3LY0ywTAwJH4JJM1dmdhwuF1gWAWbVhUFafxbE=;
        b=SePK0IsyQz/tU3UPArlsQAbYLnD3LMNjNUL9j6XPAzIUKoZIfV9AhLQDUguHn+3MDt
         7ShUKGY1qxY+fZp6BY+zbRtf9d28gblN6Igw7cwVKwgCn+n4OxvsLpNWOZ5i8lAsiYsA
         MZEsPCANGVLSoErz0PFuH7LfQFKjvCRlre4dBZaAHxSjrHffcSIXJaZ1FMr5oqBjhbZH
         n4cP2ocb67cWN3LJ5gq6WKjLfqT5v5RJS/bBZtqfFYnVAeI9K7m17BEY0Yp37pM0pAFB
         5hrf8kqkdOZCMRg8DekC/5/rLltcwRArsTn8nGAss74UFvCXqkAVAyLRV/Sez2SFbjiX
         nJWQ==
X-Gm-Message-State: AOAM533yxwmmoItaX3nfvhpUnTTeNfW3gIaku/UVr6lBXQlWM3ogue4d
	M6k1zlfnM9ihFhBGwBkM96DaAQ==
X-Google-Smtp-Source: ABdhPJxIT75VOVNxVrXyV/CpcdD3WcMbUkR3GCMnaYIlEUIcJEiHczmJPK0JN0wQ9LqXLB2M8p2dkg==
X-Received: by 2002:a05:6000:10c4:b0:20a:d4ee:d962 with SMTP id b4-20020a05600010c400b0020ad4eed962mr1662467wrx.649.1651824888080;
        Fri, 06 May 2022 01:14:48 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id c14-20020adffb0e000000b0020c6fa5a797sm3059657wrr.91.2022.05.06.01.14.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 May 2022 01:14:47 -0700 (PDT)
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
Subject: [GIT PULL 5/6] arm64: dts: samsung: for v5.19, part two
Date: Fri,  6 May 2022 10:14:37 +0200
Message-Id: <20220506081438.149192-5-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220506081438.149192-1-krzysztof.kozlowski@linaro.org>
References: <20220506081438.149192-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

On top of previous pull.

The clock bindings header, from my tree, was shared also with Samsung clk tree.

Best regards,
Krzysztof


The following changes since commit 22cbcb8f4a17c194d208f686fc3ea37fc860bd71:

  arm64: dts: tesla: add a specific compatible to MCT on FSD (2022-04-04 18:53:08 +0200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt64-5.19-2

for you to fetch changes up to 9882948322874b1ffdd559e6887397de4c903440:

  arm64: dts: exynos: switch UFS clock node in ExynosAutov9 (2022-05-05 09:07:36 +0200)

----------------------------------------------------------------
Samsung DTS ARM64 changes for v5.19, part two

1. Cleanups: unused and undocumented dma-channels and dma-requests.
2. Add clock controllers to ExynosAutov9.

----------------------------------------------------------------
Chanho Park (5):
      dt-bindings: clock: add clock binding definitions for Exynos Auto v9
      dt-bindings: clock: add Exynos Auto v9 SoC CMU bindings
      arm64: dts: exynos: add initial CMU clock nodes in ExynosAutov9
      arm64: dts: exynos: switch USI clocks in ExynosAutov9
      arm64: dts: exynos: switch UFS clock node in ExynosAutov9

Krzysztof Kozlowski (4):
      arm64: dts: exynos: move XTCXO clock frequency to board in Exynos Auto v9
      arm64: dts: exynos: drop useless 'dma-channels/requests' properties
      arm64: dts: fsd: drop useless 'dma-channels/requests' properties
      Merge tag 'samsung-dt-bindings-clk-exynosautov9-5.19' into next/dt64

 .../bindings/clock/samsung,exynosautov9-clock.yaml | 219 +++++++++++++++
 arch/arm64/boot/dts/exynos/exynos5433.dtsi         |   6 -
 arch/arm64/boot/dts/exynos/exynos7.dtsi            |   4 -
 arch/arm64/boot/dts/exynos/exynosautov9-sadk.dts   |   4 +
 arch/arm64/boot/dts/exynos/exynosautov9.dtsi       | 116 ++++++--
 arch/arm64/boot/dts/tesla/fsd.dtsi                 |   8 -
 include/dt-bindings/clock/samsung,exynosautov9.h   | 299 +++++++++++++++++++++
 7 files changed, 612 insertions(+), 44 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/samsung,exynosautov9-clock.yaml
 create mode 100644 include/dt-bindings/clock/samsung,exynosautov9.h
