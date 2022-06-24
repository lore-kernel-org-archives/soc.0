Return-Path: <SRS0=MFSJ=W7=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 696ECCCA473
	for <soc@archiver.kernel.org>; Fri, 24 Jun 2022 08:07:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2A641C34114; Fri, 24 Jun 2022 08:07:53 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4ADE4C341CC
	for <soc@kernel.org>; Fri, 24 Jun 2022 08:07:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4ADE4C341CC
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f51.google.com with SMTP id fi2so3074149ejb.9
        for <soc@kernel.org>; Fri, 24 Jun 2022 01:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=a3ke34b4cDdKP8BuzxSOi78JgE06gxAc6TUkX4cmsZ4=;
        b=A+uDdmAZi12ZjPIEvjhqc0qsqIssqQRyf5S4TrxBebRr0lIwrWjnFabzQwwtQJ632a
         L2uUeg+OxKFRE7iE56Yg8quIvAdRabWj5WnR/u9rWkqkiOTaQFpO3Z35pUg4fWKc9v3n
         zB+iGL6+di1nh0AxAldNjYT53rZ4Aib4izGXQPpu1XMOYJOa0+ZV4d7ClxSw8mdCL93B
         f0phNcsdIo50wbqN7gTgUauASc2zKszufO+ixNw7sXl+YPI5lUGUjaATbtGzRs5jItns
         onXHtHJEevF8e1l3+qFIsB9pOy4DpaoO9D41LXCgAoDKjXej4lMNKfibGCz7CDn/wn3C
         Lhbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=a3ke34b4cDdKP8BuzxSOi78JgE06gxAc6TUkX4cmsZ4=;
        b=oLhWzJrMxQQ1oKVeOnP5zDvSJlK1wueuD25eGtTenH4Ferm++g1pl7VITfOP2CLQlU
         TPkwy7B+/BNyb5jqrZJWlKZTvgkOewyeMg2c/TVxWcdR9NqIrlLT6eCf8Yh4gOypvNN3
         vCsYCBK6VdjgLdl39i8YA2e0liiMoJAzxWeCjlLjA47ZWux3l0xUqsq6GENPJrAvNyaj
         Msq0DM+S3ACm5d4POCexR4JiTjz7BXiIi5BBe1TBdDlOIH5SnbJdIC+JdEPcw5K1vCYi
         crulSqz/9+YNYIjSTN6l4LdoBAobUmQX692Fgd91P/GtxPhQ1hR1weUBGPLL1AL9V4aS
         JKRQ==
X-Gm-Message-State: AJIora8ho5Ll8SpOrz19bzqVogGdE525x13VyZIPrxTU+djn2KKdQJNo
	TkAbMo2F76/SI9JlsuPI8EJTdA==
X-Google-Smtp-Source: AGRyM1tq7NkXMJBQnC7xYZQAE5QB8ihpO5WhMQvkJ8X1H9TpPtpdmkP512zLWBKoSoZOg5QKrvqTTw==
X-Received: by 2002:a17:907:30cb:b0:722:e898:c9c8 with SMTP id vl11-20020a17090730cb00b00722e898c9c8mr12054781ejb.465.1656058070532;
        Fri, 24 Jun 2022 01:07:50 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id j15-20020aa7ca4f000000b0043559d9e8b9sm1363573edt.53.2022.06.24.01.07.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jun 2022 01:07:49 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>,
	Arnd Bergmann <arnd@arndb.de>,
	arm@kernel.org,
	soc@kernel.org
Cc: linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [GIT PULL 2/3] arm64: dts: samsung: dts for v5.20
Date: Fri, 24 Jun 2022 10:07:45 +0200
Message-Id: <20220624080746.31947-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220624080746.31947-1-krzysztof.kozlowski@linaro.org>
References: <20220624080746.31947-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This includes bindings headers which were shared with Samsung clk tree (Sylwester).

Best regards,
Krzysztof


The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a56:

  Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt64-5.20

for you to fetch changes up to 1a4f20cab6411c6e73dd22d28b6595b728cc2829:

  Merge branch 'for-v5.20/exynos7885-emmc-clk' into next/dt64 (2022-06-24 09:12:47 +0200)

----------------------------------------------------------------
Samsung DTS ARM64 changes for v5.20

1. Add CPU cache, UFS to Tesla FSD.
2. Add reboot-mode (boot into specific bootloader mode) to ExynosAutov9.
3. Add watchdogs to ExynosAutov9.
4. Add eMMC to Exynos7885 JackpotLTE (Samsung Galaxy A8).
5. DTS cleanup: white-spaces, node names, LED color/function.
6. Switch to DTS-local header for pinctrl register values instead of
   bindings header.  The bindings header is being deprecated because it
   does not reflect the purpose of bindings.

----------------------------------------------------------------
Alim Akhtar (2):
      arm64: dts: fsd: Add cpu cache information
      arm64: dts: fsd: add ufs device node

Chanho Park (6):
      dt-bindings: soc: add samsung,boot-mode definitions
      arm64: dts: exynos: add syscon reboot/reboot_mode support in ExynosAutov9
      arm64: dts: exynos: add watchdog in ExynosAutov9
      arm64: dts: exynos: adjust DT style of ufs nodes in ExynosAutov9
      arm64: dts: exynos: add secondary ufs devices in ExynosAutov9
      arm64: dts: exynos: enable secondary ufs devices ExynosAutov9 SADK

David Virag (3):
      dt-bindings: clock: Add bindings for Exynos7885 CMU_FSYS
      dt-bindings: clock: Add indices for Exynos7885 TREX clocks
      arm64: dts: exynos: Add internal eMMC support to jackpotlte

Krzysztof Kozlowski (5):
      arm64: dts: exynos: adjust whitespace around '='
      arm64: dts: exynos: align MMC node name with dtschema
      arm64: dts: exynos: use local header for pinctrl register values
      arm64: dts: fsd: use local header for pinctrl register values
      Merge branch 'for-v5.20/exynos7885-emmc-clk' into next/dt64

 .../bindings/clock/samsung,exynos7885-clock.yaml   |  27 +++++
 arch/arm64/boot/dts/exynos/exynos-pinctrl.h        |  79 ++++++++++++++
 arch/arm64/boot/dts/exynos/exynos5433-pinctrl.dtsi |   2 +-
 arch/arm64/boot/dts/exynos/exynos5433.dtsi         |   6 +-
 arch/arm64/boot/dts/exynos/exynos7-espresso.dts    |   6 +-
 arch/arm64/boot/dts/exynos/exynos7-pinctrl.dtsi    |  72 ++++++-------
 .../boot/dts/exynos/exynos7885-jackpotlte.dts      |  20 ++++
 arch/arm64/boot/dts/exynos/exynos7885-pinctrl.dtsi |   2 +-
 arch/arm64/boot/dts/exynos/exynos7885.dtsi         |  32 ++++++
 arch/arm64/boot/dts/exynos/exynos850-pinctrl.dtsi  |   2 +-
 .../boot/dts/exynos/exynosautov9-pinctrl.dtsi      |   2 +-
 arch/arm64/boot/dts/exynos/exynosautov9-sadk.dts   |  18 ++++
 arch/arm64/boot/dts/exynos/exynosautov9.dtsi       |  83 ++++++++++++--
 arch/arm64/boot/dts/tesla/fsd-evb.dts              |   4 +
 arch/arm64/boot/dts/tesla/fsd-pinctrl.dtsi         | 106 ++++++++++--------
 arch/arm64/boot/dts/tesla/fsd-pinctrl.h            |  33 ++++++
 arch/arm64/boot/dts/tesla/fsd.dtsi                 | 120 +++++++++++++++++++++
 include/dt-bindings/clock/exynos7885.h             |  54 ++++++++--
 include/dt-bindings/soc/samsung,boot-mode.h        |  18 ++++
 19 files changed, 578 insertions(+), 108 deletions(-)
 create mode 100644 arch/arm64/boot/dts/exynos/exynos-pinctrl.h
 create mode 100644 arch/arm64/boot/dts/tesla/fsd-pinctrl.h
 create mode 100644 include/dt-bindings/soc/samsung,boot-mode.h
