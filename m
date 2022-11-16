Return-Path: <SRS0=a1DX=3Q=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 236A5C433FE
	for <soc@archiver.kernel.org>; Wed, 16 Nov 2022 09:35:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0650BC433C1; Wed, 16 Nov 2022 09:35:16 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 984BCC433D6
	for <soc@kernel.org>; Wed, 16 Nov 2022 09:35:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 984BCC433D6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id t10so21099630ljj.0
        for <soc@kernel.org>; Wed, 16 Nov 2022 01:35:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nnGZMm94TS+LvaxxKTJdVvSSqPuScV0DEkrGulsvoNU=;
        b=cWvOAeWRcgEWMUU9ZznDG/GIhzoVfPeDPYCfL3l0ItQDiQF9Vpwd+Ll9Tlsq0ihG3J
         C1saqr623DWv8nWlq9DO+NUFZrtoTG3WrOGAv18uq+fgdZFUScWzO0EwdKIIXNVBLBJG
         TaItHFqLV3XayjnXAhzHPLFLhe1NA2Ckc1WoZru6mgimf0DyTlf2DcHQt/TOf0y+NOft
         JWhBeNocjMmGQqXR5fyRfOh64tUkPAOLdEYNHhw4lMO4sXfrxKCzZPyQUz+gk+vd55pG
         l2zhmtJYFxG9F3xalVHX6OpDpVWo9zk/kGgn2k7s9nTMm/15SdoEJ5Uxgm3FCxHQ+6vQ
         ZYYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nnGZMm94TS+LvaxxKTJdVvSSqPuScV0DEkrGulsvoNU=;
        b=Ms/JaVBpMPYk3fRLHZESqSYImSEq8i9XtzOolsBhiI+EFlCRM0FTqPzjTjatFZxnNg
         11/+s5W7l6E+2zdyC6MdOZe80KvewuPZtxFzKYoab5MPA3F6nv38Wp4rKPEth305Jt1S
         wu4R/XIm0UpiGalP3Y3zV6gGgGz4/5xK2lRCLS59/YxVpaU4XOWC8UPY5tw5LbFi/j//
         uPsYag2PpxRwH2wHC2qvSc1YJgfcLVniHUs0scZqJ3qNOwHtSDKqcgf/7aJyT5wVS8Qb
         FZPz3X2X9U7CW7bDxmkJZFe/FZubOzq4vZHONvlGDlr5wCnZnFo5lxfbTjY3dClHbbGE
         XEGw==
X-Gm-Message-State: ANoB5pkcZnJXDBb4UWMMPzE2k7t6wR80T7lru7lMhAFQol2DVOAgvFt7
	4jKtbjp+L1m+6XMmFA3Ubtkrgw==
X-Google-Smtp-Source: AA0mqf6zDJT3zFwexfzOscLO3lxb6Dm90Fbd7lU0o4wGJ1bmYYWYcpyr1QnsA6spHenpqZr6LJA9vQ==
X-Received: by 2002:a2e:3505:0:b0:277:328:aff6 with SMTP id z5-20020a2e3505000000b002770328aff6mr6830580ljz.182.1668591311647;
        Wed, 16 Nov 2022 01:35:11 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id r27-20020a2e8e3b000000b0026dffd032b8sm2914488ljk.2.2022.11.16.01.35.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 01:35:11 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>,
	Arnd Bergmann <arnd@arndb.de>,
	arm@kernel.org,
	soc@kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL] memory: drivers for v6.2, part two
Date: Wed, 16 Nov 2022 10:35:09 +0100
Message-Id: <20221116093509.19657-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

On top of previous pull request.

Best regards,
Krzysztof


The following changes since commit a11a5debdf4b5b5c24e88a378b53b42cc4fe1bb9:

  dt-bindings: memory-controller: st,stm32: Split off MC properties (2022-10-18 13:05:18 -0400)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl.git tags/memory-controller-drv-6.2-2

for you to fetch changes up to 8dd7e4af585331dda004e92ed0739c3609e37177:

  memory: omap-gpmc: fix coverity issue "Control flow issues" (2022-11-10 11:04:07 +0100)

----------------------------------------------------------------
Memory controller drivers for v6.2, part two

1. ARM PL353: document PL354 in bindings.
2. TI/OMAP GPMC: allow setting wait-pin polarity.

----------------------------------------------------------------
Benedikt Niedermayr (3):
      memory: omap-gpmc: wait pin additions
      dt-bindings: memory-controllers: ti,gpmc: add wait-pin polarity
      memory: omap-gpmc: fix coverity issue "Control flow issues"

Lukas Bulwahn (1):
      MAINTAINERS: arm,pl353-smc: correct dt-binding path

Rob Herring (1):
      dt-bindings: memory-controllers: arm,pl353-smc: Extend to support 'arm,pl354' SMC

 .../{arm,pl353-smc.yaml => arm,pl35x-smc.yaml}     |  80 +++++++++-----
 .../bindings/memory-controllers/ti,gpmc-child.yaml |   7 ++
 MAINTAINERS                                        |   2 +-
 drivers/memory/omap-gpmc.c                         | 122 ++++++++++++++++++---
 include/linux/platform_data/gpmc-omap.h            |   8 ++
 5 files changed, 178 insertions(+), 41 deletions(-)
 rename Documentation/devicetree/bindings/memory-controllers/{arm,pl353-smc.yaml => arm,pl35x-smc.yaml} (65%)
