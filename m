Return-Path: <SRS0=R97b=LI=canonical.com=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0850FC48BE6
	for <soc@archiver.kernel.org>; Mon, 14 Jun 2021 19:33:20 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id E33E06128B; Mon, 14 Jun 2021 19:33:17 +0000 (UTC)
Received: from youngberry.canonical.com (youngberry.canonical.com [91.189.89.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7CBC861153
	for <soc@kernel.org>; Mon, 14 Jun 2021 19:33:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7CBC861153
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=krzysztof.kozlowski@canonical.com
Received: from mail-ed1-f70.google.com ([209.85.208.70])
	by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <krzysztof.kozlowski@canonical.com>)
	id 1lssKi-0000AG-79
	for soc@kernel.org; Mon, 14 Jun 2021 19:33:16 +0000
Received: by mail-ed1-f70.google.com with SMTP id p24-20020aa7c8980000b0290393c37fdcb8so9664100eds.6
        for <soc@kernel.org>; Mon, 14 Jun 2021 12:33:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qoNs0rkeMMUPf/jH63Pbn4GEa6xEussm8RBcM0JZAj0=;
        b=Buedwq9UkIlnAVn3Obf+h19HN9lixmRA5ztCz3x6ySS6hjOoleuWXjNpKn8LZYxgjB
         BL4FzOoKBRksTHYVURwmBGvizKJiaENhxuzO97udlfL1vAUUtYD/15KN71sRIFo/+YPw
         /jn1btOxdmp2bE0zYekm6oF7DXKgX2f6fL1FPHoOnTPLos6sj6CofjSCbuJh2kzP/QgV
         G97EeD69uyAbYcPwKqFHrXDDZsxaw4NoD3hZCyvLDHU/tqT9xsnhy77KoBg9BHx0Xi4m
         ODmIsvUZ44rO/6bNuvE+5iZHscw2Jc426Q6WvX8ekhWS05GUui32ka0aY/xUujo1BzuF
         g8Qw==
X-Gm-Message-State: AOAM532lKzUx1NoyeXSGFTcQWTuA2GM4KDwId5Wwc0OHNJHrvZH6+4AV
	1T08a6G1/RRtKAtWnPseuoD+WFlnbz6Uhh2Xz2NGVHmE/gEaGYdVgqoqIgaE3IT2ZXr5H3aaepw
	mNYZz901B2vA83+XBhSVzh9A=
X-Received: by 2002:aa7:c818:: with SMTP id a24mr19448643edt.53.1623699196022;
        Mon, 14 Jun 2021 12:33:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzq1B8upiBsEetFmAjSMtxkDRFzyHcPey+4IkR631CQiOXVzgOKDik6rb85uCWnTOZsFAP0FQ==
X-Received: by 2002:aa7:c818:: with SMTP id a24mr19448632edt.53.1623699195929;
        Mon, 14 Jun 2021 12:33:15 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-177-222.adslplus.ch. [188.155.177.222])
        by smtp.gmail.com with ESMTPSA id gw7sm8029291ejb.5.2021.06.14.12.33.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jun 2021 12:33:15 -0700 (PDT)
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
Subject: [GIT PULL 2/2] ARM/arm64: defconfig: samsung: pull for v5.14
Date: Mon, 14 Jun 2021 21:33:09 +0200
Message-Id: <20210614193309.20248-3-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210614193309.20248-1-krzysztof.kozlowski@canonical.com>
References: <20210614193309.20248-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-defconfig-5.14

for you to fetch changes up to 38f61ef1a0cefb4e3b37c3e7b16c0f68df34a3dc:

  ARM: exynos_defconfig: restore framebuffer support (2021-06-11 12:54:33 +0200)

----------------------------------------------------------------
Samsung defconfig changes for v5.14

1. Enable Exynos Universal Flash Storage (UFS) driver for Exynos7 arm64
   boards.
2. Restore framebuffer support in exynos_defconfig.

----------------------------------------------------------------
Alim Akhtar (1):
      arm64: defconfig: Enable Exynos UFS driver

Marek Szyprowski (1):
      ARM: exynos_defconfig: restore framebuffer support

 arch/arm/configs/exynos_defconfig | 1 +
 arch/arm64/configs/defconfig      | 2 ++
 2 files changed, 3 insertions(+)
