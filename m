Return-Path: <SRS0=YdSh=D3=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5244C001B0
	for <soc@archiver.kernel.org>; Thu, 10 Aug 2023 15:12:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7DAFBC433CA; Thu, 10 Aug 2023 15:12:58 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 76694C433C9
	for <soc@kernel.org>; Thu, 10 Aug 2023 15:12:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 76694C433C9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-4fe0c566788so1543712e87.0
        for <soc@kernel.org>; Thu, 10 Aug 2023 08:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691680375; x=1692285175;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Atb0jrTiyZhB6Vba51W4Bj3vyiqmbf0UlTzWhJceDM4=;
        b=r7C9lnpMgM4Js8CG5h1thqpG4k+iWowsNEeDSDDiLm888xblWp7LiXr6tzMlVODlOt
         4m+d+Ni4XLkVm51w7O1TaEm265a2br61qqr4fcZAK2YmTjVXZsFMxn+Pys/Eh6jIqKeP
         viMzwOFfEx8SP6bSCPSVcWYwB6XqBma/gIyJ2y3qK5v1ggGespboZ8Efoadeaq6EpRqR
         yynWNOCe9dw8/r8lJcFxWOkwv/vFsB71SoL+bhAgZ704LDdWdxXsZyMpNWdABGdptRHE
         G8au4PIjfAJDPN33RorGMXNYmLFBQcZ5nffRo7w3eCrGckfLX8ojAdlGMqdFIv9aGlJj
         czig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691680375; x=1692285175;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Atb0jrTiyZhB6Vba51W4Bj3vyiqmbf0UlTzWhJceDM4=;
        b=GCO9xryJzsL8Nyuj91dKdtvpWDjjOR2I0edHv3c6Txk8d8dSXp5sf6vRiZ2Rigp52x
         ZtYrf955i2/Vo+mk7GsnSPO+xxgWVEzhM1ThzOH79YlsKn7EH5kdHBVzYYJviz41NckB
         QUrAVrRTdrxT7/wF8GhWXqEbBd+xjwBC64Dc5BjTIFmtT2ofBNtxkxF/SJ7c8xhXXb8F
         BBLSdO9a3YImdYhMkYQKWoF4XAd5GCK30GLbkhBy5tPhIy+pPQ2zpge7fbbt3U2PQOeb
         Vv/JkK9V5TUo3iAAEellBwoUqpwILmvgKd/hOsX8hgi6itlxWL7f0aqfJj2DPHN3OVRi
         /EwQ==
X-Gm-Message-State: AOJu0YzNhd50C5wGoiDXnucchBw8twA3///G6iexq2y3hGleiGLEsUSB
	yPtmW/VJLOpOaovfODvAtwNqyg==
X-Google-Smtp-Source: AGHT+IELhKUyC2Ck6DRpg9YZOxR7vxC4ZUjcUDDjABEw+6deoYPNnB//97RRqPn1xIXH1Cq1Cu/obA==
X-Received: by 2002:a05:6512:4013:b0:4fb:8771:e898 with SMTP id br19-20020a056512401300b004fb8771e898mr2355684lfb.15.1691680375326;
        Thu, 10 Aug 2023 08:12:55 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.113])
        by smtp.gmail.com with ESMTPSA id 5-20020a05600c020500b003fe29dc0ff2sm2416242wmi.21.2023.08.10.08.12.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Aug 2023 08:12:54 -0700 (PDT)
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
Subject: [GIT PULL 1/3] samsung: drivers for v6.6
Date: Thu, 10 Aug 2023 17:12:48 +0200
Message-Id: <20230810151250.220202-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5:

  Linux 6.5-rc1 (2023-07-09 13:53:13 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-drivers-6.6

for you to fetch changes up to eecff3319287179032600eeec5fa357a53ae0fe1:

  MAINTAINERS: mfd: Un-support Maxim and Samsung PMIC drivers (2023-07-28 10:39:41 +0200)

----------------------------------------------------------------
Samsung SoC driver changes for v6.6

Minor cleanup of headers and maintainer entries for Samsung SoC drivers.

----------------------------------------------------------------
Krzysztof Kozlowski (2):
      MAINTAINERS: samsung: Un-support cpuidle and clock drivers
      MAINTAINERS: mfd: Un-support Maxim and Samsung PMIC drivers

Rob Herring (1):
      soc: samsung: Explicitly include correct DT includes

 MAINTAINERS                         | 10 +++++-----
 drivers/soc/samsung/exynos-chipid.c |  1 -
 drivers/soc/samsung/exynos-pmu.c    |  2 +-
 drivers/soc/samsung/pm_domains.c    |  3 ++-
 4 files changed, 8 insertions(+), 8 deletions(-)
