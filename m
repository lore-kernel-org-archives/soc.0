Return-Path: <SRS0=uson=BW=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97E5AC7EE2E
	for <soc@archiver.kernel.org>; Fri,  2 Jun 2023 09:15:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7D477C4339B; Fri,  2 Jun 2023 09:15:15 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6B24CC433D2
	for <soc@kernel.org>; Fri,  2 Jun 2023 09:15:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6B24CC433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-97000a039b2so271634166b.2
        for <soc@kernel.org>; Fri, 02 Jun 2023 02:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685697312; x=1688289312;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yLdU4Q8ozDdxq74yNihKW+OJlWWA0/2lZXXu2wMUGK0=;
        b=hoTFOaLz93wlq05dLe0Yk0a+roPiXut39EDht3/CVz2w1euedsX2QEBsuiqI4vt0UO
         ia91d0+VlCHK26rzDq4b5PC48HtoK98XO156DGHthjoL1MF8r6a5oF7UgCNpJKebuzqj
         XOLWdPu8Ei1fqkt9r0vqIvn22QUkP29U7TNNUbw8t7M4oP0HJGLRE9yZlbwDjFEjuKgq
         YRYCpUO+WBo/k09VH3awCcm8eWT2zFjk6ElB8XvXFNQTtii76845VRF1Nc8ZMV4qYxpA
         nDqMVLsSnnJSKrjvpV03rHVv5u+p+/5+nThy/XuYR9ka+6KpoqbulEWzXJfLeIsyRx1m
         ULHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685697312; x=1688289312;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yLdU4Q8ozDdxq74yNihKW+OJlWWA0/2lZXXu2wMUGK0=;
        b=XI+V0vnpgitgW09HKgjmY0yWXxTfU606DS8eVaMjCWHge3cDBzSxM1HiAeXD4x9GQU
         m3py7KlU1habHdAZdgSMX3nrvAS1bT4RYMTRHA3xecOzFYLgee+xgv7uKx+AQn5f+lE9
         IaDm5xaxW6zTbSjEXYGqsPDiqDeklim6l8kOU3IFcdUzuQoUwNUx2TnUXa3Os3hi6Opz
         7GfLd63GSlGvhiSYiVVF0tLlIPy6AMd/NX8Rsp3Ok4mvJGFyYWmtXf+5Cc6tXnX8xN5U
         h6Bz6Lj8v5lzxCzaA6QfSim/tD3cK1ivSYzyG1k8B0YilvsVEy3KSHEbDzr1MSA0SLZy
         88Vg==
X-Gm-Message-State: AC+VfDx/o5UMKxlUbQSStnjoqxxgbY1vczVsD8BZ8euGh0cm3FEkus0A
	eVjpvdSj70o71G4p50skdO/c5Q==
X-Google-Smtp-Source: ACHHUZ46P9H+JJXIA3e7YoKj3JBcYOwil7LjToqG+b/wH8fdOhwkND9umKE0x7FpXb0LBZM1aiRffA==
X-Received: by 2002:a17:907:d88:b0:96a:43b9:95b1 with SMTP id go8-20020a1709070d8800b0096a43b995b1mr11242892ejc.59.1685697312691;
        Fri, 02 Jun 2023 02:15:12 -0700 (PDT)
Received: from krzk-bin.. ([178.197.199.204])
        by smtp.gmail.com with ESMTPSA id z13-20020a170906240d00b0094e597f0e4dsm514255eja.121.2023.06.02.02.15.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jun 2023 02:15:12 -0700 (PDT)
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
Subject: [GIT PULL 3/3] ARM: samsung: soc for v6.5
Date: Fri,  2 Jun 2023 11:15:01 +0200
Message-Id: <20230602091501.15178-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230602091501.15178-1-krzysztof.kozlowski@linaro.org>
References: <20230602091501.15178-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit ac9a78681b921877518763ba0e89202254349d1b:

  Linux 6.4-rc1 (2023-05-07 13:34:35 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-soc-6.5

for you to fetch changes up to ca027ae58eaab3632966158ce440a7f50da52bef:

  ARM: s3c: Switch i2c drivers back to use .probe() (2023-05-30 09:40:37 +0200)

----------------------------------------------------------------
Samsung mach/soc changes for v6.5

1. Re-introduce Exynos4212 which was removed because of lack of upstream
   users.  Artur Weber adds now Samsung Galaxy Tab3 with Exynos4212.

2. Minor cleanups.

----------------------------------------------------------------
Artur Weber (1):
      ARM: exynos: Re-introduce Exynos4212 support

Lukas Bulwahn (1):
      ARM: s3c: remove obsolete config S3C64XX_SETUP_IDE

Uwe Kleine-König (1):
      ARM: s3c: Switch i2c drivers back to use .probe()

 arch/arm/mach-exynos/Kconfig             | 5 +++++
 arch/arm/mach-exynos/common.h            | 8 ++++++++
 arch/arm/mach-exynos/exynos.c            | 2 ++
 arch/arm/mach-exynos/firmware.c          | 8 +++++++-
 arch/arm/mach-exynos/pm.c                | 2 +-
 arch/arm/mach-exynos/suspend.c           | 4 ++++
 arch/arm/mach-s3c/Kconfig.s3c64xx        | 6 ------
 arch/arm/mach-s3c/mach-crag6410-module.c | 2 +-
 8 files changed, 28 insertions(+), 9 deletions(-)
