Return-Path: <SRS0=hZui=PA=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B5EDC433F5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Oct 2021 17:45:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 26B07610C9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Oct 2021 17:45:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 26B07610C9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xExkaYZYuJz4zWDcIWm7x68+8I6LcPQX9TeKWxxajfQ=; b=EBYneW1yIsyg+8
	OPwMdl/U+jns/LyYD1vkFMaHujuyHzSfN/qcxLAcFFzdq5UHbAS3gO3qKHEcxuKFoslLElV4RcUnb
	1RTVy+ezwWNw5E3B6Satx2+pol9c/5OrQ9HCwGIoJhpsytGmCNuYS0wbQ3SdZ9oz8p8Og1BQY11Fz
	rGNXcRcwA+D3FL4NDsS3f6t2b+CKUU0h1/d6NkUrsfL/JkL/ajIu3/VRfWoKbDP7Z62QsJpwxncHK
	Gyy+G9YJMMT0E0k5Nm192fbMZ5TAo4rOo1Clsec2DWvrUU27ZC0vhxBzZFAmGTfPsORKxNrcoYIpp
	x2k5/Lq7EKd3e9gzZ2Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maLo6-00Ddu2-NN; Tue, 12 Oct 2021 17:43:18 +0000
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maLo2-00Ddtb-Tf
 for linux-arm-kernel@lists.infradead.org; Tue, 12 Oct 2021 17:43:16 +0000
Received: by mail-oi1-x234.google.com with SMTP id z11so348065oih.1
 for <linux-arm-kernel@lists.infradead.org>;
 Tue, 12 Oct 2021 10:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
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
 b=eTPxGyIh+PKVrDXR5l010XuXQ07/RCBIwUAkGxwh3dJGwYnoedDXHUOanHOI6nbAna
 DuvwKasT1hSKJSr04MPKXTSnXOpf+5GssXC1PM1GrC/NRd7pBpGaU0gt6+L0JJ62kcAL
 DMejWgYqZU5ritSpaCcH4jE9tJpozgdjUIUjuVZEM3yJ0H28sR2hiJ7DCFwIZ8dCC5Oc
 x5olK4EX8GtRMactokmVCEj954CUNUXTGueAd0sED2mUo+sm+5/rF3Kj5B9iP9BS4oWV
 hRrOVjC3gB02d1Si5KW6LpezAEVYAunUSWguboLO+eP5G+9NwG+VCpOASp1L/28MpD+p
 kBxw==
X-Gm-Message-State: AOAM532kufcuk3LTvjfdcoibPAYvD5VIxXRavBSO6ZZEKfmCHvDztSGI
 k7gOGj2Zeml7ssGhFDr1uWB57Q==
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
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Andy Gross <agross@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, Kevin Hilman <khilman@baylibre.com>,
 David Heidelberg <david@ixit.cz>, Luca Weiss <luca@z3ntu.xyz>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Vamsi krishna Lanka <quic_vamslank@quicinc.com>
Subject: [GIT PULL] Qualcomm DTS updates for v5.16
Date: Tue, 12 Oct 2021 12:43:10 -0500
Message-ID: <20211012174310.1017857-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211012_104314_981719_AF7B3D3F 
X-CRM114-Status: GOOD (  12.52  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20211012174310.q08h_zfAk75ZxxIAQoXN5SWTKwQZkLvpZSJ8vJfgB_8@z>

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

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
