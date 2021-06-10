Return-Path: <SRS0=05Gg=LE=canonical.com=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF56CC48BDF
	for <soc@archiver.kernel.org>; Thu, 10 Jun 2021 07:41:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 891C2613C8; Thu, 10 Jun 2021 07:41:05 +0000 (UTC)
Received: from youngberry.canonical.com (youngberry.canonical.com [91.189.89.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5DE06613DF
	for <soc@kernel.org>; Thu, 10 Jun 2021 07:41:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5DE06613DF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=krzysztof.kozlowski@canonical.com
Received: from mail-wr1-f72.google.com ([209.85.221.72])
	by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <krzysztof.kozlowski@canonical.com>)
	id 1lrFJH-0001ZE-P7
	for soc@kernel.org; Thu, 10 Jun 2021 07:41:03 +0000
Received: by mail-wr1-f72.google.com with SMTP id h104-20020adf90710000b029010de8455a3aso474179wrh.12
        for <soc@kernel.org>; Thu, 10 Jun 2021 00:41:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CKFgI/XB09fK9EatvqSa+BvVfDN0LbVVk60PnCcv8+M=;
        b=oDv8Vtjw/a8J0MjUjLLjgzVYQTP5tAXMFqF47V/csq7xN6GYmuRwiu/NwRKvNtu1uF
         Dg4xgQAGW0hayOO9MoGuEr7dW7vUQQWxfD4+m/WG0ezj42Nl93E1e/jt6xdOdkkd+Ice
         2Mdrye7W422vpa24qh5PsDsWYzV2AfslvjpQ2yAj+hdncylbIMV6721g1yFFyHTxoTM4
         rP4SvXftvUnYDC32Kzt7RhG7WfM37lU2psVG6NsgUZjAy1fZ0BRmW3prNZ0syd2MmbsG
         Ho1UVLGW/eebnbSdvOjJa0+jJv6nERSFZ1kDkz63FTzQzuh49tEeNu+cdxVP00LkJdeM
         FnAA==
X-Gm-Message-State: AOAM532NN5YrnRaI5Vs+ce5Vltz5D9PpXUs+DbfUx8GnIe5J+Y+pNQfT
	amCJ3srPxZ5jhPN7wMw8V+VHQU0lzzGLNCX1IrlZWpwl35T1LetCuDC7OlqIGpYNsn20Q5UqtrF
	3vjpVod+apSIOqBGMEaEGRWU=
X-Received: by 2002:a5d:6405:: with SMTP id z5mr3739147wru.39.1623310863445;
        Thu, 10 Jun 2021 00:41:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzVxKzzDYrUeVcjhdd9+2Z+ibNjojMlpPJWvTPtnCppc/0gdckdpbdXOxJdd1bHuCaxQPU7Jg==
X-Received: by 2002:a5d:6405:: with SMTP id z5mr3739117wru.39.1623310863233;
        Thu, 10 Jun 2021 00:41:03 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-177-222.adslplus.ch. [188.155.177.222])
        by smtp.gmail.com with ESMTPSA id k11sm8417229wmj.1.2021.06.10.00.41.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jun 2021 00:41:02 -0700 (PDT)
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
Subject: [GIT PULL 2/2] ARM: samsung: mach/soc for v5.14
Date: Thu, 10 Jun 2021 09:40:55 +0200
Message-Id: <20210610074055.12474-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210610074055.12474-1-krzysztof.kozlowski@canonical.com>
References: <20210610074055.12474-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-soc-5.14

for you to fetch changes up to a6419e53c779302f8d5dd409eccf5b41ffa184a4:

  MAINTAINERS: Include Samsung PWM in Samsung SoC entry (2021-05-27 11:59:48 -0400)

----------------------------------------------------------------
Samsung mach/soc changes for v5.14

1. Fix: add missing of_node_put.
2. Extend Samsung maintainers entry to cover Samsung PWM driver files,
   because they do not have a dedicated entry.
3. Minor cleanups.

----------------------------------------------------------------
Krzysztof Kozlowski (3):
      ARM: exynos: add missing of_node_put for loop iteration
      soc: samsung: pmu: drop EXYNOS_CENTRAL_SEQ_OPTION defines
      MAINTAINERS: Include Samsung PWM in Samsung SoC entry

Wan Jiabing (1):
      ARM: s3c: Remove unnecessary break in RX1950

 MAINTAINERS                                 | 3 +++
 arch/arm/mach-exynos/exynos.c               | 2 ++
 arch/arm/mach-s3c/mach-rx1950.c             | 1 -
 include/linux/soc/samsung/exynos-regs-pmu.h | 6 ------
 4 files changed, 5 insertions(+), 7 deletions(-)
