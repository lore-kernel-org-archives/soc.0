Return-Path: <SRS0=OjpN=LP=linaro.org=bjorn.andersson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9EACC48BC2
	for <soc@archiver.kernel.org>; Mon, 21 Jun 2021 16:49:48 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id B14E460FE3; Mon, 21 Jun 2021 16:49:48 +0000 (UTC)
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8EF9C60FDC
	for <soc@kernel.org>; Mon, 21 Jun 2021 16:49:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8EF9C60FDC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=bjorn.andersson@linaro.org
Received: by mail-ot1-f50.google.com with SMTP id j11-20020a9d738b0000b02903ea3c02ded8so18363536otk.5
        for <soc@kernel.org>; Mon, 21 Jun 2021 09:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bF7QAtOIvA59mvUdHWqxoxtNEuKey+y8GoZWC2X+gMI=;
        b=n78KEmPWL1THyfzZIIOeNDyHVeux4D4TRYL3kp9DI2e6FtU9e+PdLSHFTmlc5mjynZ
         AlGW+GVf5/MNbEvbI5NhluWTCC86LpTrJRY18ZxFyGI1RkQdPEbo1qIIunh0QUM2Rggm
         GwnsRr7n18j30d7L3og1YfwQb/P0i2ntjG9tMXqvK70fZ7SFAgNhbwBnJPdSQr1A25IY
         W/j4Ot2W5fvU6pxvHjZz92B8u6AvZa+a8LF4FNBU3bIuNIFmKkWb/h+pBpHuQEMZ4Nb2
         m+ksW8dVE4YsFu21puTwh5khnb6dUu9ELK/9X/yjvhx/QS/N9OgSGqY/ZmOEgyLgP1pQ
         u0XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bF7QAtOIvA59mvUdHWqxoxtNEuKey+y8GoZWC2X+gMI=;
        b=CQXxo2s2zY0jp4wapn3eiwvwgNr1iw0CWrKFDPx//ZJWuW7yUJb51NohAynu1yocQC
         vIS3zVNEZyQ8+KuYNAbIcgnt7DsxVfg2mv0lP43sYlOsUKUzZYce/eT1OSbiAuPGIRWE
         2Oy6vJN4llVkjkSF0KM0YTwdzIs5v+EM5kwL9GwUwR2Rd9mv3KqWbpnVHHWqeUSliVXj
         RTtbBY3janO+77FU7so3MOtlTiw9o4kr5nUA9lZS+05mPMBFKSrguKtGCEbZk9AewaxR
         R2BlsJd6IyTbFwEy+wYA4YKOHiifpgIK3tCHSjPTScN+8nbpoAvO54RSqeRfxhAuuhhd
         YOeg==
X-Gm-Message-State: AOAM531b34gnVBF/uBPnViV83+M/KCMOjJNlNRWmLcs92J0nTin4iFgR
	7dZ/+0ilo3yzNWxEcUtVOxvBTA==
X-Google-Smtp-Source: ABdhPJwtDbjES/M8XjaVf0m3x5msPOevYePiKWNTzeCbGzJEYnX1+95ULEdO0KfYb1Wj5PxjQXu5Lw==
X-Received: by 2002:a9d:2aa4:: with SMTP id e33mr20918339otb.330.1624294187842;
        Mon, 21 Jun 2021 09:49:47 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id u11sm3726682oot.41.2021.06.21.09.49.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jun 2021 09:49:47 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Andy Gross <agross@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	Kevin Hilman <khilman@baylibre.com>,
	Konrad Dybcio <konrad.dybcio@somainline.org>,
	Bhupesh Sharma <bhupesh.sharma@linaro.org>,
	Robert Marko <robimarko@gmail.com>,
	Shaik Sajida Bhanu <sbhanu@codeaurora.org>
Subject: [GIT PULL] Additional Qualcomm ARM64 DT updates for v5.14
Date: Mon, 21 Jun 2021 11:49:46 -0500
Message-Id: <20210621164946.942956-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi soc@

Sorry for this late pull request being so big, but I hope you're open to merge
these interesting additions that arrived after the previous pull.

Regards,
Bjorn

The following changes since commit 81cfa462e458405f58b23f45ddd9439c70bf5347:

  arm64: dts: qcom: sc7180: Add xo clock for eMMC and Sd card (2021-06-14 11:29:46 -0500)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-for-5.14-1

for you to fetch changes up to abe66bb7a2f6e308f2fb059d60b1076df84306ad:

  arm64: dts: ipq8074: Add QUP6 I2C node (2021-06-21 11:21:11 -0500)

----------------------------------------------------------------
Additional Qualcomm ARM64 DT updates for v5.14

After a series of refactorings and additions to the SM8150 and SM8250
platform definitions, this adds new devicetree definitions for Sony
Xperia 1, 5, 1II and 5II.

It defines the Qualcomm SA8155p automotive platform as a derrivative of
SM8150 and introduces the Automotive Deveopment Platform board.

Lastly ipq8074 gains the definiton of an additiona I2C master and the
SDHCI bus votes for sc7180 are tweaked.

----------------------------------------------------------------
Bhupesh Sharma (5):
      dt-bindings: arm: qcom: Add compatible for sm8150-mtp board
      dt-bindings: arm: qcom: Add compatible for SA8155p-adp board
      arm64: dts: qcom: pmm8155au_1: Add base dts file
      arm64: dts: qcom: pmm8155au_2: Add base dts file
      arm64: dts: qcom: sa8155p-adp: Add base dts file

Konrad Dybcio (18):
      arm64: dts: qcom: sm8250: Don't disable MDP explicitly
      arm64: dts: qcom: sm8250: Add size/address-cells to dsi[01]
      arm64: dts: qcom: sm8250: Fix pcie2_lane unit address
      arm64: dts: qcom: sm8250: Add GPI DMA nodes
      arm64: dts: qcom: sm8250: Disable Adreno and Venus by default
      arm64: dts: qcom: sm8150: Disable Adreno and modem by default
      arm64: dts: qcom: sm8150: Add support for SONY Xperia 1 / 5 (Kumano platform)
      arm64: dts: qcom: sm8250: Add SDHCI2 sleep mode pinctrl
      arm64: dts: qcom: sm8250: Move gpio.h inclusion to SoC DTSI
      arm64: dts: qcom: sm8250: Add support for SONY Xperia 1 II / 5 II (Edo platform)
      arm64: dts: qcom: sm8[12]50-pm8150: Move RESIN to pm8150 dtsi
      arm64: dts: qcom: sm8250-edo: Fix up double "pinctrl-1"
      arm64: dts: qcom: sm8250-edo: Add hardware keys
      arm64: dts: qcom: sm8250: Commonize PCIe pins
      arm64: dts: qcom: sm8250-edo: Enable PCIe
      arm64: dts: qcom: sm8250-edo: Enable ADSP/CDSP/SLPI
      arm64: dts: qcom: sm8250-edo: Enable GPI DMA
      arm64: dts: qcom: sm8250-edo: Add Samsung touchscreen

Robert Marko (1):
      arm64: dts: ipq8074: Add QUP6 I2C node

Shaik Sajida Bhanu (1):
      arm64: dts: qcom: sc7180: bus votes for eMMC and SD card

 Documentation/devicetree/bindings/arm/qcom.yaml    |  13 +
 arch/arm64/boot/dts/qcom/Makefile                  |   5 +
 arch/arm64/boot/dts/qcom/ipq8074.dtsi              |  15 +
 arch/arm64/boot/dts/qcom/pm8150.dtsi               |  12 +-
 arch/arm64/boot/dts/qcom/pmm8155au_1.dtsi          | 135 +++++
 arch/arm64/boot/dts/qcom/pmm8155au_2.dtsi          | 108 ++++
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts           |  98 +---
 arch/arm64/boot/dts/qcom/sa8155p-adp.dts           | 360 ++++++++++++
 arch/arm64/boot/dts/qcom/sc7180.dtsi               |  20 +-
 arch/arm64/boot/dts/qcom/sm8150-hdk.dts            |  28 +-
 arch/arm64/boot/dts/qcom/sm8150-mtp.dts            |  28 +-
 .../dts/qcom/sm8150-sony-xperia-kumano-bahamut.dts |  19 +
 .../dts/qcom/sm8150-sony-xperia-kumano-griffin.dts |  13 +
 .../boot/dts/qcom/sm8150-sony-xperia-kumano.dtsi   | 452 +++++++++++++++
 arch/arm64/boot/dts/qcom/sm8150.dtsi               |   6 +
 arch/arm64/boot/dts/qcom/sm8250-hdk.dts            |  33 +-
 arch/arm64/boot/dts/qcom/sm8250-mtp.dts            |  10 +
 .../dts/qcom/sm8250-sony-xperia-edo-pdx203.dts     |  15 +
 .../dts/qcom/sm8250-sony-xperia-edo-pdx206.dts     |  35 ++
 .../boot/dts/qcom/sm8250-sony-xperia-edo.dtsi      | 636 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8250.dtsi               | 188 +++++-
 21 files changed, 2090 insertions(+), 139 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/pmm8155au_1.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/pmm8155au_2.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sa8155p-adp.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano-bahamut.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano-griffin.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx203.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx206.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo.dtsi
