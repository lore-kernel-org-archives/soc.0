Return-Path: <SRS0=uson=BW=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 299B0C7EE29
	for <soc@archiver.kernel.org>; Fri,  2 Jun 2023 09:15:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E17E1C433EF; Fri,  2 Jun 2023 09:15:11 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E4255C4339C
	for <soc@kernel.org>; Fri,  2 Jun 2023 09:15:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E4255C4339C
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-96fab30d1e1so401727366b.0
        for <soc@kernel.org>; Fri, 02 Jun 2023 02:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685697308; x=1688289308;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LO2AVakNJYdGKKswXTJ62e7wU1rklDdTnrJOOA69PQc=;
        b=fNPHwES7nVPEk1F4Ce1u9HTwBf9Q5hmjvDjfKwjvXVqDyeAxH9fGVRv95PEXIEY3Lm
         qdqLzy19YupyJ6GDsN9Bq4TsZqRB2BxTBcq4SKhp8Kfgcf2LH0AxUL/G19NDua38KFra
         5mWK9F9EB2pMs992dzETb8uCfQrNbwwG3pOPGtj3ZJZmJbrnvSt+GJusXkDWQtHLsBOC
         9V+bvPIVRK+HInWgnmDNO/lCu3LpcecuLKHO+SyfY+Bkz5Rkf2mzDGbKmx3BCFJZs5Hb
         bVyqFcNW4M7wOm8VQUtrHKMoZ2JWwoJhtcp+QL4ZVFFbPrk2zaKdCncyCWrvOGntPojM
         VcbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685697308; x=1688289308;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LO2AVakNJYdGKKswXTJ62e7wU1rklDdTnrJOOA69PQc=;
        b=ZkuS2JhOtKGXBYszZOHjn5v7n9QnTiaxxMWqeXfo6PjOD+cx7JfaKImCgfwK1+h5No
         iAEKXd+YR6HA8u18Da6jGeuHVWGR89QVs4lCP0+kOkoBgjvCFnr7KQ44ZAx/9LiZgIoF
         NiTVkCUoAMOHJg9dAkbnVKxBj7XsGDhaHf5On14AhVdkXeJ/7iKW4apXkWE8uon/WZGH
         jw49+ZN5ZGKRMNSj6Uh6vGm1bqO0UEhdOFxdOvzO4LcmfXiwKDh0em9mcNd8PYBu+naW
         7pfSlJ/YVOPoTUyrMiEimXKxV3BmequRAzNRj/dZHrnA/k2T43dS0GWDRKQd3pOqADtL
         mfBg==
X-Gm-Message-State: AC+VfDwNFdJdCmfkSmAXLjGj2TCZmXhXzw73WgLluQeklVgbe2zj0LAL
	loPtvp42A4eDuY22elDTh5+mKg==
X-Google-Smtp-Source: ACHHUZ4O1wFDHonDAt4o3zgFrpiAG47R8DbHaXAWXu0IVs5q3bQKTSlvn1fgFIYPRsi6pLeRT+VCWA==
X-Received: by 2002:a17:907:2d8c:b0:96f:a412:8b03 with SMTP id gt12-20020a1709072d8c00b0096fa4128b03mr4528979ejc.5.1685697307942;
        Fri, 02 Jun 2023 02:15:07 -0700 (PDT)
Received: from krzk-bin.. ([178.197.199.204])
        by smtp.gmail.com with ESMTPSA id z13-20020a170906240d00b0094e597f0e4dsm514255eja.121.2023.06.02.02.15.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jun 2023 02:15:07 -0700 (PDT)
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
	Krzysztof Kozlowski <krzk@kernel.org>,
	replicant@osuosl.org,
	phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	=?UTF-8?q?Martin=20J=C3=BCcker?= <martin.juecker@gmail.com>,
	Henrik Grimler <henrik@grimler.se>,
	Artur Weber <aweber.kernel@gmail.com>
Subject: [GIT PULL 1/3] samsung: drivers for v6.5
Date: Fri,  2 Jun 2023 11:14:59 +0200
Message-Id: <20230602091501.15178-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit ac9a78681b921877518763ba0e89202254349d1b:

  Linux 6.4-rc1 (2023-05-07 13:34:35 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-drivers-6.5

for you to fetch changes up to 538af6e5856b1aa971975c747a2974a74db48928:

  dt-bindings: media: s5p-mfc: convert bindings to json-schema (2023-05-13 19:41:11 +0200)

----------------------------------------------------------------
Samsung SoC driver changes for v6.5

1. Re-introduce Exynos4212: Exynos PMU driver.
2. Convert S5P/Exynos Multi Format Codec bindings to DT schema.

----------------------------------------------------------------
Aakarsh Jain (1):
      dt-bindings: media: s5p-mfc: convert bindings to json-schema

Artur Weber (2):
      dt-bindings: soc: samsung: exynos-pmu: add Exynos4212 compatible
      soc: samsung: exynos-pmu: Re-introduce Exynos4212 support

 .../devicetree/bindings/media/s5p-mfc.txt          |  78 ---------
 .../devicetree/bindings/media/samsung,s5p-mfc.yaml | 184 +++++++++++++++++++++
 .../bindings/soc/samsung/exynos-pmu.yaml           |   5 +
 drivers/soc/samsung/exynos-pmu.c                   |   9 +
 drivers/soc/samsung/exynos-pmu.h                   |   2 +
 drivers/soc/samsung/exynos4-pmu.c                  |  15 +-
 6 files changed, 212 insertions(+), 81 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/samsung,s5p-mfc.yaml
