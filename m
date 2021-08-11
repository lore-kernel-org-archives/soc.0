Return-Path: <SRS0=vXx5=NC=canonical.com=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CE1CC4338F
	for <soc@archiver.kernel.org>; Wed, 11 Aug 2021 08:56:37 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id EAA6D60EB2; Wed, 11 Aug 2021 08:56:36 +0000 (UTC)
Received: from smtp-relay-canonical-0.canonical.com (smtp-relay-canonical-0.canonical.com [185.125.188.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 54E9F60EBD
	for <soc@kernel.org>; Wed, 11 Aug 2021 08:56:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 54E9F60EBD
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com [209.85.218.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPS id C89383F230
	for <soc@kernel.org>; Wed, 11 Aug 2021 08:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1628672194;
	bh=AkfNVRo7hHf9V8Un9aQjkE6FARkV1KO6bGOPkL8pwsg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
	b=id8JtcjH3xJFhY+hcsRjXJkV21xaGm30LVc8zvQvR6rT8FdqfQY/viIcmmA5wVMXt
	 NwM9NpGOaZsy2oU3Iv97v7PDo1feZ0ouPacw7QEQFOHQl+Cln2JN77jfacEzvbloTP
	 PfD0ZoMttc2oBd10tHuA+n0CW3mJ5cnxRn1hjoKB2/jE6Ioi3uTE4WrQ+2mGRcp/YX
	 WpIItxI5gyImZSh0XAIY1bNZZa/+C2YskHSchSdu3Ty0iSM/4Cm9KhaTIlAIfhWgyB
	 2rkVKLbUBEnx3LbiTldX18litXjk35i3p2YPATiRmXbkAUnMlNNk6tJHzWk9NLbh9k
	 +F3OAO7W9FZKA==
Received: by mail-ej1-f72.google.com with SMTP id a19-20020a1709063e93b0290551ea218ea2so416880ejj.5
        for <soc@kernel.org>; Wed, 11 Aug 2021 01:56:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AkfNVRo7hHf9V8Un9aQjkE6FARkV1KO6bGOPkL8pwsg=;
        b=k/2mrVdFNP52EbM0lsoD/8BiXqD0dZsaZnSQrpZA/DZsURhVEsM5Jkjqj7QN93NU/V
         D3rzKu4cb7AymOY4YUmO7TnI9cfICGrLHSQOqEu0hlauFkGo+CsSLLnC699H+6UiNGPi
         lNhJtOa15GZY8O7cMmg72s/aWjZHApwLbhSOAnfYfjwFw3OxEGK+xut4guGVLSi6kxYi
         T4Us66BICLfcYKF37IV4xcc3lsGD+5lsIrC7EFiRquh4elDWO/sgQlHAoTPPZXG4z3KA
         ODAL2jjyNxyINvX67FU2tqjomnS7ljuXai1osaQX/GsxN935K27/FI9Bld+SfumK3FHr
         B7Xg==
X-Gm-Message-State: AOAM5316HEr5DYlgm89s9jQ/iHWyZpUEoeimeZG56TokuL5k48T8Hz29
	hbYCJZKMmBigLJt/N0B7mmSRio1o3CSEXzlnp5JCiBxTepMJJClGDtwRuI3IOi7IM32yNx4eOn1
	m7VkklQizD9/e1Xg2YqJjf7s=
X-Received: by 2002:a05:6402:d49:: with SMTP id ec9mr10099878edb.333.1628672194555;
        Wed, 11 Aug 2021 01:56:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwLaINYImBffGAxkeivDUKOJNEzYPQrtsNvBTAbFcoUG0Xlm7TBEfwmQhiR9WGSnXf07gHdDg==
X-Received: by 2002:a05:6402:d49:: with SMTP id ec9mr10099869edb.333.1628672194408;
        Wed, 11 Aug 2021 01:56:34 -0700 (PDT)
Received: from localhost.localdomain ([86.32.42.198])
        by smtp.gmail.com with ESMTPSA id x4sm7834003ejb.106.2021.08.11.01.56.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Aug 2021 01:56:34 -0700 (PDT)
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
Subject: [GIT PULL 1/2] ARM: dts: samsung: DT for v5.15
Date: Wed, 11 Aug 2021 10:51:27 +0200
Message-Id: <20210811085128.30103-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:

  Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt-5.15

for you to fetch changes up to 6cad6db75231a18f25dc7d610d5a0683160ac545:

  ARM: dts: exynos: add CPU topology to Exynos5422 (2021-08-05 09:24:04 +0200)

----------------------------------------------------------------
Samsung DTS ARM changes for v5.15

Add CPU topology to all Exynos DTSI files.

----------------------------------------------------------------
Krzysztof Kozlowski (7):
      ARM: dts: exynos: add CPU topology to Exynos3250
      ARM: dts: exynos: add CPU topology to Exynos4210
      ARM: dts: exynos: add CPU topology to Exynos4412
      ARM: dts: exynos: add CPU topology to Exynos5250
      ARM: dts: exynos: add CPU topology to Exynos5260
      ARM: dts: exynos: add CPU topology to Exynos5420
      ARM: dts: exynos: add CPU topology to Exynos5422

 arch/arm/boot/dts/exynos3250.dtsi      | 11 ++++++++++
 arch/arm/boot/dts/exynos4210.dtsi      | 11 ++++++++++
 arch/arm/boot/dts/exynos4412.dtsi      | 17 +++++++++++++++
 arch/arm/boot/dts/exynos5250.dtsi      | 11 ++++++++++
 arch/arm/boot/dts/exynos5260.dtsi      | 38 ++++++++++++++++++++++++++++------
 arch/arm/boot/dts/exynos5420-cpus.dtsi | 32 ++++++++++++++++++++++++++++
 arch/arm/boot/dts/exynos5422-cpus.dtsi | 32 ++++++++++++++++++++++++++++
 7 files changed, 146 insertions(+), 6 deletions(-)
