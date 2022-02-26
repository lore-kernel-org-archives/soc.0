Return-Path: <SRS0=sZ/2=TJ=canonical.com=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6398C433EF
	for <soc@archiver.kernel.org>; Sat, 26 Feb 2022 22:01:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 819D4C340F4; Sat, 26 Feb 2022 22:01:32 +0000 (UTC)
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 80B73C340F5
	for <soc@kernel.org>; Sat, 26 Feb 2022 22:01:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 80B73C340F5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 700B33FCA5
	for <soc@kernel.org>; Sat, 26 Feb 2022 22:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1645912884;
	bh=xV/5bMwc5qAM+A4IvuW3pBdozLYDEc1r9Q3hw04Dixk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=VE/fUGW0KSTweZ7t4JsHvA44LFSfo4TuDaPbM17ddbeM68k1XP3AQ3ZQSudhKZ3de
	 zZC7SfLvTjAW587xOLRwDAIAiRvxBaWC3Y9ADaB9QSzIzXYGH6wThPXkqkQI7t2cgw
	 TxKLwuCsP4gUQI9sz0xsNo7CwnyXEYrdte0SuNgQAciInQFh9ByOmOCpILUbtApV4o
	 A9EcbEGLxfCKOPaCL5Euwup9NQZm84p83W9dfXx9Eaxn0TFKadPunD7OzlSgdvfJ4u
	 oHwPGNDP43v95OCuyKDkmk3BVMwLs8+JdS9Jj7Nn1g9M+fPxEx50TtiGl2UljTUGlS
	 JsgFFOk8SleWA==
Received: by mail-ed1-f69.google.com with SMTP id o5-20020a50c905000000b00410effbf65dso3401259edh.17
        for <soc@kernel.org>; Sat, 26 Feb 2022 14:01:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xV/5bMwc5qAM+A4IvuW3pBdozLYDEc1r9Q3hw04Dixk=;
        b=sTxyhDLpm2glfE0OWj1UGzFqh89e0U+h4SCTgKOgnlvJHDW1Vcz7Gb9VBWtU3xwL0h
         yhueMjsVDUT9qFC9cZoFDamy0mSB0fvNIpajEnql2Zopvd/X20rLwkWcRcjK5kJuLgUD
         HoW1WNdBsthZqxWwsjC2BSJH3NEQj7a4Ggby9O17SPWZL/NksaO0NQtN4rwrlirqwdl6
         Wyi52Red6+lUZ3Eku0q1yaRHNUtCyArZENjWaaNsnAWUvS3DpmHkXB3J7/bwAAx1+nj2
         eVRYF2UOfYs3yMHGnxXLWm2255QLALL4VlgK+c6SUXdSi3ryrQ8HSx+qn5A/T+oMsEP3
         4HOg==
X-Gm-Message-State: AOAM532H+FV06PKMf/MaA/3UYEP9Yig7JUnBu2OH7iYHicrNY+XSx90I
	nxrc+HTI1YE9BUWupsfRC6DEcvqyqBMG/t7/eqaApyYx6kX6FYQeL1qQ6qWb3Sa1QS0O+xBHZ/9
	rLtgLhcfBonIRIitLR3ZL69k=
X-Received: by 2002:a17:906:1be1:b0:6ce:b0a8:17d with SMTP id t1-20020a1709061be100b006ceb0a8017dmr10407904ejg.413.1645912883766;
        Sat, 26 Feb 2022 14:01:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxs93C93YzMJrP3OiKQ/sgLNFsaAgYmkcNTN7UpTw7SIF6jbShVHGKqvZnBavwKBdlkJ/mhZw==
X-Received: by 2002:a17:906:1be1:b0:6ce:b0a8:17d with SMTP id t1-20020a1709061be100b006ceb0a8017dmr10407892ejg.413.1645912883577;
        Sat, 26 Feb 2022 14:01:23 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-181-108.adslplus.ch. [188.155.181.108])
        by smtp.gmail.com with ESMTPSA id s2-20020a056402014200b0041285556b7csm3497424edu.72.2022.02.26.14.01.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Feb 2022 14:01:22 -0800 (PST)
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
	Alim Akhtar <alim.akhtar@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 2/3] arm64: dts: samsung: Second round for v5.18
Date: Sat, 26 Feb 2022 23:01:15 +0100
Message-Id: <20220226220116.13452-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220226220116.13452-1-krzysztof.kozlowski@canonical.com>
References: <20220226220116.13452-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

On top of previous pull request.

Best regards,
Krzysztof


The following changes since commit a0d5455330ece6f50ddf9e71d530f91c302803e9:

  arm64: dts: exynos: adjust USB DRD clocks with dtschema in Exynos7 (2022-02-01 09:17:16 +0100)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt64-5.18-2

for you to fetch changes up to 06874015327ba7bf6aae49ca825a492a2679237f:

  arm64: dts: exynos: Add initial device tree support for Exynos7885 SoC (2022-02-23 14:08:04 +0100)

----------------------------------------------------------------
Samsung DTS ARM64 changes for v5.18, part two

1. Minor fixes and cleanups in newly introduced support for Exynos850.
2. Add basic support for Exynos7885 and  Samsung Galaxy A8 (2018):
   SM-A530F.

----------------------------------------------------------------
David Virag (1):
      arm64: dts: exynos: Add initial device tree support for Exynos7885 SoC

Krzysztof Kozlowski (3):
      arm64: dts: exynos: drop incorrectly placed wakeup interrupts in Exynos850
      arm64: dts: exynos: align pinctrl with dtschema in Exynos850
      arm64: dts: exynos: use dedicated wake-up pinctrl compatible in Exynos850

 arch/arm64/boot/dts/exynos/Makefile                |   9 +-
 .../boot/dts/exynos/exynos7885-jackpotlte.dts      |  92 +++
 arch/arm64/boot/dts/exynos/exynos7885-pinctrl.dtsi | 855 +++++++++++++++++++++
 arch/arm64/boot/dts/exynos/exynos7885.dtsi         | 423 ++++++++++
 arch/arm64/boot/dts/exynos/exynos850-pinctrl.dtsi  |  56 +-
 arch/arm64/boot/dts/exynos/exynos850.dtsi          |  44 +-
 6 files changed, 1405 insertions(+), 74 deletions(-)
 create mode 100644 arch/arm64/boot/dts/exynos/exynos7885-jackpotlte.dts
 create mode 100644 arch/arm64/boot/dts/exynos/exynos7885-pinctrl.dtsi
 create mode 100644 arch/arm64/boot/dts/exynos/exynos7885.dtsi
