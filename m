Return-Path: <SRS0=0ETL=PA=linaro.org=bjorn.andersson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FB9FC433EF
	for <soc@archiver.kernel.org>; Tue, 12 Oct 2021 17:43:13 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 147BC610CE; Tue, 12 Oct 2021 17:43:13 +0000 (UTC)
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB4556109E
	for <soc@kernel.org>; Tue, 12 Oct 2021 17:43:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EB4556109E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linaro.org
Received: by mail-oi1-f169.google.com with SMTP id z11so348064oih.1
        for <soc@kernel.org>; Tue, 12 Oct 2021 10:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Oieb4OrqRN1dvVsQsrZ8bxCmGZsPPNS5A9M+zq6bmd4=;
        b=K5eo+RZXFaThvBbu7DX1pVieUg0Ax/2kCH4lBO8oCVsnT6wlWfzWhQ/VUqAdiT63LX
         8YgG3SnMuRQbyqmNpGn3CrsCXCEdzeRzgDx7lQyg0t1S7RQKnXvIRD6cy/NyLNNwlnwp
         Jney/AUPnZeOMGvFKmz717WFO+/qdoHBnaO8cSptQt/raO7M81Z0BYqQzhXp9Hp6nWoX
         v1y3ZHSV1PUF+lCPH4gd3RyHiCRW9rRzLulPlhLPZ/LvaijClq7iho/36MAneaPU9fSR
         3Ho+ImD4dXeNx792rH2HKgQzW34q+YM4idwmZGGG1RUgALwSsdqBwQdu0WK8NazHMLcZ
         0B+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Oieb4OrqRN1dvVsQsrZ8bxCmGZsPPNS5A9M+zq6bmd4=;
        b=mNJxBOWsju6IOhZQtbdVBP8Ae4nzmbbBWDk1o/oxqbbDe0bmuQT53grOCW/TxVsUFb
         XVwGO0HMnvwHSpnHy3MY3LEjod+N1hN1AYGUvSSgU6bmoo18rYXwwkmAmqj4JT9jpwhW
         4iTK5M1OC8fJg8xmXogISMTzM+KYgfcyp3MDtT+lVrtZZ/bULVOML5RPLaCMm4/hhCfC
         E6+J5HL9w6ybHKEHQelnMbly8qxgahlq1N3X8GkBMa/dJPPDJFUAxHCzoXiy8M+yZ+aG
         gttlfKdCiKiunvDfSLQLSZScoCfHrL4EtJFHHO6uT/LMeG5z304SqJ4brAVd8bmgDGY4
         opaw==
X-Gm-Message-State: AOAM530GghnYAggfK5G99OyL+f+e6bYGcaNAf4boQN9+jUNTYif9CDSo
	46KOvfSToe0etaSQZGnz2CsSuw==
X-Google-Smtp-Source: ABdhPJwbRYpYCOiC7RrwkZEX7PfVxFvC0rnVgXF0S2YNuSJBtPh+qxPMIrAWKmlSOcroSMAjPb0SMg==
X-Received: by 2002:a54:4807:: with SMTP id j7mr4571885oij.140.1634060592214;
        Tue, 12 Oct 2021 10:43:12 -0700 (PDT)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id s20sm65487oiw.44.2021.10.12.10.43.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Oct 2021 10:43:11 -0700 (PDT)
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
	David Heidelberg <david@ixit.cz>,
	Luca Weiss <luca@z3ntu.xyz>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Vamsi krishna Lanka <quic_vamslank@quicinc.com>
Subject: [GIT PULL] Qualcomm DTS updates for v5.16
Date: Tue, 12 Oct 2021 12:43:10 -0500
Message-Id: <20211012174310.1017857-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-dts-for-5.16

for you to fetch changes up to 9304af37d07b63244e4b3c80e5a245c978beb015:

  dt-bindings: arm: qcom, add missing devices (2021-09-19 23:33:06 -0500)

----------------------------------------------------------------
Qualcomm DTS updates for v5.16

This extends the previous limited description of MSM8226 with SDHC,
UART, I2C, SCM, SMEM, RPM and basic PMIC definitions. Based on this,
initial support for the LG G Watch R smartwatch is introduced.

APQ8064 gets a couple of DT updates, one which will allow the GPU driver
to drop supporting legacy "opp tables" in the future.

DT bindings and DTS files are updated with additional compatibles, for
completeness.

----------------------------------------------------------------
David Heidelberg (4):
      ARM: dts: qcom: apq8064: Convert adreno from legacy gpu-pwrlevels to opp-v2
      ARM: dts: qcom: apq8064: adjust memory node according to specs
      ARM: dts: qcom: fill secondary compatible for multiple boards
      dt-bindings: arm: qcom, add missing devices

Luca Weiss (4):
      ARM: dts: qcom: msm8226: Add more SoC bits
      ARM: dts: qcom: Add pm8226 PMIC
      dt-bindings: arm: qcom: Document APQ8026 SoC binding
      ARM: dts: qcom: Add support for LG G Watch R

Marijn Suijten (1):
      ARM: dts: qcom: msm8974: Add xo_board reference clock to DSI0 PHY

Vamsi krishna Lanka (1):
      dt-bindings: arm: qcom: Document SDX65 platform and boards

 Documentation/devicetree/bindings/arm/qcom.yaml |  16 ++
 arch/arm/boot/dts/Makefile                      |   1 +
 arch/arm/boot/dts/qcom-apq8026-lge-lenok.dts    | 237 +++++++++++++++++++++
 arch/arm/boot/dts/qcom-apq8064.dtsi             |  18 +-
 arch/arm/boot/dts/qcom-ipq4019-ap.dk04.1-c1.dts |   2 +-
 arch/arm/boot/dts/qcom-ipq4019-ap.dk04.1-c3.dts |   2 +-
 arch/arm/boot/dts/qcom-ipq4019-ap.dk07.1-c1.dts |   2 +-
 arch/arm/boot/dts/qcom-ipq4019-ap.dk07.1-c2.dts |   2 +-
 arch/arm/boot/dts/qcom-ipq8064-ap148.dts        |   2 +-
 arch/arm/boot/dts/qcom-msm8226.dtsi             | 263 +++++++++++++++++++++++-
 arch/arm/boot/dts/qcom-msm8974.dtsi             |   4 +-
 arch/arm/boot/dts/qcom-pm8226.dtsi              |  27 +++
 12 files changed, 554 insertions(+), 22 deletions(-)
 create mode 100644 arch/arm/boot/dts/qcom-apq8026-lge-lenok.dts
 create mode 100644 arch/arm/boot/dts/qcom-pm8226.dtsi
