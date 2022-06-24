Return-Path: <SRS0=MFSJ=W7=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E7C8C43334
	for <soc@archiver.kernel.org>; Fri, 24 Jun 2022 08:07:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5BFEAC341CE; Fri, 24 Jun 2022 08:07:52 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E387FC341CA
	for <soc@kernel.org>; Fri, 24 Jun 2022 08:07:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E387FC341CA
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f49.google.com with SMTP id eo8so2402080edb.0
        for <soc@kernel.org>; Fri, 24 Jun 2022 01:07:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=A8EtIQkJmmrWLyA8LyDJx0TBrOGXs8kEw1M4fz0P4tE=;
        b=O/iRUaO20jkKOBlagd2L5pohLOvXaheDJKekt/Eb/1WIC3+HmI4+Jk7n1WqjabhEos
         cZ6QlvVtZO39HhqYvG51ziRvB8M0oN+aYuy1v9zKD6fzT2ZFMpj1iAh8xbLAxmxkCDKz
         h8L+ETw89KcrLChGJBrvW+eGQqlJK8tZAVV+eovYGkPzza2+a1emAB6hzzrVlfsRuE7V
         xmkjvvxnkKFt7lphhpl790GAbtImPv98jexZeAr+RO6P2sjnK20lXJ0o3jm/kZ7JdRkr
         3aN03tr/qZVQZSuBgQ4uaVprEPEt7WsgEliXCrEbPxpdmNU7PuaO21hDQplvsq+W0Y5u
         6kaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=A8EtIQkJmmrWLyA8LyDJx0TBrOGXs8kEw1M4fz0P4tE=;
        b=xZfIVuKD4I9R3DtwXKUM16kOHyia0ezOgrhlkq9tc7I1XmyDHlTvVO4e9NaIvyP4Ra
         dmjctNYqjiq9WZDndIDPZrXcVUXfmWRlumHdSi1UP/d7U+Vj1nbJnk0pHK9OclBptRok
         a+vM/cOprgG/XGGgOHoHIua+tont7RtrMLI+TU+QcvOEfIevaLH3Lj0jpmhBfVk8FKTF
         zV8Xu4cXnhrFaAvaSMSbSMCoTEX8pkaHwgDKL/OTsdZoFlzoZqJaVUOee8ag8OMhS19t
         mPPCA3kV8j6iXQL/ZJS/A8QlCX4cNQGKHmwCbcIHQXXcP5DwZUR/WMZ4/AAkR9z0c5zV
         ZvnA==
X-Gm-Message-State: AJIora+nzAAdri91bZXlB6p/XprJmXaejpIpL9y8vDy5BT3QB9YdaHxo
	UYzm2Na5svA0gwWutu7Q8vOehA==
X-Google-Smtp-Source: AGRyM1vYOkOZDMZh7kQgwpGDbpUSGRTv2ABuhuvEF2LdhEgnjA8bWNar+nM83AKIvs6uh2TSurogIw==
X-Received: by 2002:a05:6402:2816:b0:434:ed38:16f3 with SMTP id h22-20020a056402281600b00434ed3816f3mr15931672ede.116.1656058069157;
        Fri, 24 Jun 2022 01:07:49 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id j15-20020aa7ca4f000000b0043559d9e8b9sm1363573edt.53.2022.06.24.01.07.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jun 2022 01:07:48 -0700 (PDT)
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
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 1/3] ARM: dts: samsung: dts for v5.20
Date: Fri, 24 Jun 2022 10:07:44 +0200
Message-Id: <20220624080746.31947-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a56:

  Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt-5.20

for you to fetch changes up to 82cd16902a51773cfc0ee05bbd1ab470db5181ab:

  ARM: dts: exynos: add function and color to LED nodes in Odroid XU/XU3 (2022-06-22 13:58:01 +0200)

----------------------------------------------------------------
Samsung DTS ARM changes for v5.20

1. Add display panel and backlight to P4 Note family (Samsung Galaxy
   Note 10.1).
2. DTS cleanup: white-spaces, node names, LED color/function.
3. Switch to DTS-local header for pinctrl register values instead of
   bindings header.  The bindings header is being deprecated because it
   does not reflect the purpose of bindings.

----------------------------------------------------------------
Krzysztof Kozlowski (18):
      ARM: dts: exynos: adjust whitespace around '='
      ARM: dts: exynos: align MMC node name with dtschema
      ARM: dts: s3c2410: use local header for pinctrl register values
      ARM: dts: s3c64xx: use local header for pinctrl register values
      ARM: dts: s5pv210: use local header for pinctrl register values
      ARM: dts: exynos: use local header for pinctrl register values
      ARM: dts: exynos: align gpio-key node names with dtschema
      ARM: dts: s5pv210: align gpio-key node names with dtschema
      ARM: dts: exynos: align aat1290 flash LED node with bindings in Galaxy S3
      ARM: dts: exynos: add function and color to aat1290 flash LED node in Galaxy S3
      ARM: dts: exynos: add function to LED node in Origen 4210
      ARM: dts: exynos: add function to LED nodes in Tiny4412
      ARM: dts: exynos: add function and color to LED nodes in Itop Elite
      ARM: dts: exynos: add function and color to LED node in Odroid U3
      ARM: dts: exynos: add function and color to LED nodes in Odroid X/X2
      ARM: dts: exynos: add function and color to LED node in Odroid HC1
      ARM: dts: exynos: add function and color to LED node in Odroid XU4
      ARM: dts: exynos: add function and color to LED nodes in Odroid XU/XU3

Martin Jücker (1):
      ARM: dts: exynos: add panel and backlight to p4note

 arch/arm/boot/dts/exynos-pinctrl.h              |  55 +++
 arch/arm/boot/dts/exynos3250-artik5.dtsi        |   2 +-
 arch/arm/boot/dts/exynos3250-pinctrl.dtsi       |   2 +-
 arch/arm/boot/dts/exynos3250.dtsi               |   6 +-
 arch/arm/boot/dts/exynos4210-i9100.dts          |   8 +-
 arch/arm/boot/dts/exynos4210-origen.dts         |  12 +-
 arch/arm/boot/dts/exynos4210-pinctrl.dtsi       |   2 +-
 arch/arm/boot/dts/exynos4210-trats.dts          |   2 +-
 arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi     |   8 +-
 arch/arm/boot/dts/exynos4412-itop-elite.dts     |  15 +-
 arch/arm/boot/dts/exynos4412-midas.dtsi         |   3 +-
 arch/arm/boot/dts/exynos4412-odroidu3.dts       |   4 +-
 arch/arm/boot/dts/exynos4412-odroidx.dts        |   5 +-
 arch/arm/boot/dts/exynos4412-p4note.dtsi        |  86 ++++-
 arch/arm/boot/dts/exynos4412-pinctrl.dtsi       |   2 +-
 arch/arm/boot/dts/exynos4412-tiny4412.dts       |   3 +
 arch/arm/boot/dts/exynos5.dtsi                  |   2 +-
 arch/arm/boot/dts/exynos5250-arndale.dts        |  12 +-
 arch/arm/boot/dts/exynos5250-pinctrl.dtsi       |   2 +-
 arch/arm/boot/dts/exynos5250-snow-common.dtsi   |   2 +-
 arch/arm/boot/dts/exynos5250-spring.dts         |   2 +-
 arch/arm/boot/dts/exynos5260-pinctrl.dtsi       |   2 +-
 arch/arm/boot/dts/exynos5410-pinctrl.dtsi       |   2 +-
 arch/arm/boot/dts/exynos5420-arndale-octa.dts   |   2 +-
 arch/arm/boot/dts/exynos5420-peach-pit.dts      |   2 +-
 arch/arm/boot/dts/exynos5420-pinctrl.dtsi       |   2 +-
 arch/arm/boot/dts/exynos5422-odroidhc1.dts      |   4 +-
 arch/arm/boot/dts/exynos5422-odroidxu4.dts      |   4 +-
 arch/arm/boot/dts/exynos54xx-odroidxu-leds.dtsi |   8 +-
 arch/arm/boot/dts/exynos5800-peach-pi.dts       |   2 +-
 arch/arm/boot/dts/s3c2410-pinctrl.h             |  19 +
 arch/arm/boot/dts/s3c2416-pinctrl.dtsi          |  38 +-
 arch/arm/boot/dts/s3c64xx-pinctrl.dtsi          | 178 ++++-----
 arch/arm/boot/dts/s3c64xx-pinctrl.h             |  27 ++
 arch/arm/boot/dts/s5pv210-aquila.dts            |   4 +-
 arch/arm/boot/dts/s5pv210-aries.dtsi            | 134 +++----
 arch/arm/boot/dts/s5pv210-fascinate4g.dts       |  28 +-
 arch/arm/boot/dts/s5pv210-galaxys.dts           |  42 +--
 arch/arm/boot/dts/s5pv210-pinctrl.dtsi          | 480 ++++++++++++------------
 arch/arm/boot/dts/s5pv210-pinctrl.h             |  39 ++
 40 files changed, 738 insertions(+), 514 deletions(-)
 create mode 100644 arch/arm/boot/dts/exynos-pinctrl.h
 create mode 100644 arch/arm/boot/dts/s3c2410-pinctrl.h
 create mode 100644 arch/arm/boot/dts/s3c64xx-pinctrl.h
 create mode 100644 arch/arm/boot/dts/s5pv210-pinctrl.h
