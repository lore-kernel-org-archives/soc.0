Return-Path: <SRS0=dXuL=PB=canonical.com=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 241BAC433FE
	for <soc@archiver.kernel.org>; Wed, 13 Oct 2021 16:24:26 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 009DF611BD; Wed, 13 Oct 2021 16:24:26 +0000 (UTC)
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7D80261181
	for <soc@kernel.org>; Wed, 13 Oct 2021 16:24:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7D80261181
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com [209.85.167.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 248133F077
	for <soc@kernel.org>; Wed, 13 Oct 2021 16:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1634142264;
	bh=8hqDFlw7QAqCClE2bspMVwGa558c3XYDAHMGeAZ8O74=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=as71Kdc64OWRd5Ec7u2lh83K7h011+DHoW5BiFkGQ2lxDt8AcFCUIpOoI8ZkVmthb
	 n2MJp5VFdtQkwHDKu+h0i7QWK1WZ59PVTOJmn29NKF+2fx6n+6Z+AOlanXzNSZV41V
	 V/342G9UHqitRFb9HPrRa/iax63OEZVNFWbxcROdAaorG2/9G4+/rWgRq7bVa5zO5y
	 frg/B06/FogZaBNJSWKvF3v/PJrKZWQjVUiO67CvBE6coDQ78MK0o0beWw66sbPsjs
	 ACHBe4qbhvb2GOb9sWaIeRXcD6LrnmpaSWSzN0AgCzimsARHaNHZwypmNT5kE0m79S
	 hro00Tk715idA==
Received: by mail-lf1-f72.google.com with SMTP id k8-20020a0565123d8800b003fd6e160c77so2373150lfv.17
        for <soc@kernel.org>; Wed, 13 Oct 2021 09:24:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8hqDFlw7QAqCClE2bspMVwGa558c3XYDAHMGeAZ8O74=;
        b=dd/FFVBaIJ00QaSQ29MMMyKFLi47gAR6QR8/UWVe8NNGn/H2nRLDruPwIPCVQwrz7U
         JhM6+UHhIvxfzdDjLIn2ct3LsL32HBxY2RA4a+CiWSBhsYNl1EgX1W22jRcAYig2UAGY
         vhUtvX25Lpx5VOMQQExtJp4Q4lBQg1zT+iOnL87MHMLb1IOt/+7MPFu8EyZ9gj7mi/Qx
         DDxFJfFRa19X8alTGH7cYd7HUmPfB51mv4f3RAiz/mRFmRqgnBHJvQ7j9xHxNYoXQ2JU
         laTFPLGx+tt98AzzyjeaWsFxWb34zw7qnUvTpZBv+MQ46kBuurIgCU1+yV3VuLym6SBh
         HBSw==
X-Gm-Message-State: AOAM532A2t+sMMWrr62h2gD8eaLrVJTyQXO1GCHUuc3V6y8RO/7LaC43
	0IicncKxpAtZ/R3hz91mDvBZ6WqlJFl1jQj3JoisRtDwQX2erRNrUtZOKJaCOWStnKDRGUwy4CY
	E2U0kMoIpWe8QNCFNg+fSPsU=
X-Received: by 2002:a05:6512:3e11:: with SMTP id i17mr42098287lfv.613.1634142263620;
        Wed, 13 Oct 2021 09:24:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyHolWBkWOXzX0f51ubgW0eqGFbNEBJQRBguxvNwraBslq04UV0jSTXrux+0AdM94v1s4Wm+w==
X-Received: by 2002:a05:6512:3e11:: with SMTP id i17mr42098266lfv.613.1634142263460;
        Wed, 13 Oct 2021 09:24:23 -0700 (PDT)
Received: from kozik-lap.lan (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id r3sm1372281lfc.169.2021.10.13.09.24.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Oct 2021 09:24:22 -0700 (PDT)
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
Subject: [GIT PULL 2/2] arm64: dts: samsung: dts64 for v5.16
Date: Wed, 13 Oct 2021 18:24:18 +0200
Message-Id: <20211013162418.43072-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211013162418.43072-1-krzysztof.kozlowski@canonical.com>
References: <20211013162418.43072-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt64-5.16

for you to fetch changes up to 2b663ae7152f785732d35ce38ad20ad10aca3116:

  arm64: dts: exynos: add minimal support for exynosautov9 sadk board (2021-10-12 14:20:57 +0200)

----------------------------------------------------------------
Samsung DTS ARM64 changes for v5.16

1. Match Exynos5433 DTS with dtschema.
2. Add an Exynos Auto v9 SoC and SADK board. The Exynos Auto v9 is a
   design for automotive for In-vehicle Infotainments (IVI) and Advanced
   Driver-Assistance Systems (ADAS).
   This pull request brings very basic support (pinctrl, UART and UFS
   storage) with a development SADK (Samsung Automotive Development Kit)
   board.

----------------------------------------------------------------
Chanho Park (2):
      arm64: dts: exynos: add initial support for exynosautov9 SoC
      arm64: dts: exynos: add minimal support for exynosautov9 sadk board

Krzysztof Kozlowski (2):
      arm64: dts: exynos: align operating-points table name with dtschema in Exynos5433
      arm64: dts: exynos: add proper comaptible FSYS syscon in Exynos5433

 .../bindings/arm/samsung/samsung-boards.yaml       |    6 +
 arch/arm64/boot/dts/exynos/Makefile                |    3 +-
 arch/arm64/boot/dts/exynos/exynos5433-bus.dtsi     |   10 +-
 arch/arm64/boot/dts/exynos/exynos5433.dtsi         |    6 +-
 .../boot/dts/exynos/exynosautov9-pinctrl.dtsi      | 1189 ++++++++++++++++++++
 arch/arm64/boot/dts/exynos/exynosautov9-sadk.dts   |   56 +
 arch/arm64/boot/dts/exynos/exynosautov9.dtsi       |  301 +++++
 7 files changed, 1562 insertions(+), 9 deletions(-)
 create mode 100644 arch/arm64/boot/dts/exynos/exynosautov9-pinctrl.dtsi
 create mode 100644 arch/arm64/boot/dts/exynos/exynosautov9-sadk.dts
 create mode 100644 arch/arm64/boot/dts/exynos/exynosautov9.dtsi
