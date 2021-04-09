Return-Path: <SRS0=SKgf=JG=linaro.org=bjorn.andersson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B9E4C433B4
	for <soc@archiver.kernel.org>; Fri,  9 Apr 2021 16:39:52 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 1CAB1610CA; Fri,  9 Apr 2021 16:39:52 +0000 (UTC)
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E1779610C8
	for <soc@kernel.org>; Fri,  9 Apr 2021 16:39:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E1779610C8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=bjorn.andersson@linaro.org
Received: by mail-oo1-f49.google.com with SMTP id n12-20020a4ad12c0000b02901b63e7bc1b4so1470779oor.5
        for <soc@kernel.org>; Fri, 09 Apr 2021 09:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=c2I7vz5xvNaGcHWWThHF1IEDKnVReToEcusVQ2zMISA=;
        b=xETKEtGItsm/JmQqTLBVMoGDGLl19hQrTN/Dfm0DMLD3wMYWkv3tRExvjFFLjPCQP1
         1XLul0HkC1L1NrUEYsvavEqYaANvmUw4JAtg5kjfNp8cNprhb5P6cXmpzRXTkCUd+MUf
         AHpCv8qCpMJrJ7C2wfRQcEshG4pQp1KyP0IUAtaenJ7z8bmtFZgkt5oREVYQvcNJQ0bA
         giT7+BMNgK6LF2429vGSoAZWRm59fx9/yRmPC0Xpvlnn/lYHJmVlQwzemfaXSNnrAzw9
         EObzKZMpRUjwZfZJV47BOPQkNbKGuP/m4fn8jOfpxKaobaiNAfQwehIFAJksXYx7Yju+
         c0FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=c2I7vz5xvNaGcHWWThHF1IEDKnVReToEcusVQ2zMISA=;
        b=JTnkycv1nKdPYUWTUm18uuy1220/vPIi8cri2pmEqfi4P0vC4SzeYpIDI9oJzHOSE3
         hp3ZLPZUOYxjUPkHYtGQJggHNg0hHue6hv1dWejEFojBtrOmCEfD/QN2ShhhG2NKHpEc
         KRwCbuQH877L+yB8XulOSZjSvbiQv8YfBhK6h3N9/sMCQeeJddzvYRDCllbttmmAurEq
         tudgLb7/m8uRHZsVjKq5H3RLkGjKAL2+abI9MixPHVJyoB2ucc65sW817BHrxxCM22rk
         04WsSSLlD0ppivz2dhyBoj6l2nIFIo9iW5ubjuzEmmWqfuhLXISC7JyYLEq6+dcZddIZ
         V41w==
X-Gm-Message-State: AOAM5309vdG295+9GpkBzDrUd0guDdjTgw/Lbaa4Lu2d4CTj9Bu/oQES
	ZLBbCjWuQfCM5S/x+25Y9FywPbPP2nxsuQ==
X-Google-Smtp-Source: ABdhPJwH2uVxpLp9og2voqCtDqUvyt9JU3NklXdAiwRoO2+CRgGLOQC7Oz/xUUXxDRmLGh4js5eNXQ==
X-Received: by 2002:a4a:b787:: with SMTP id a7mr12582747oop.18.1617986391161;
        Fri, 09 Apr 2021 09:39:51 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id n104sm43979ota.27.2021.04.09.09.39.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Apr 2021 09:39:50 -0700 (PDT)
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
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
	Caleb Connolly <caleb@connolly.tech>,
	Jami Kettunen <jamipkettunen@gmail.com>,
	Jonathan Marek <jonathan@marek.ca>,
	Robert Foss <robert.foss@linaro.org>,
	Ajit Pandey <ajitp@codeaurora.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
	Stephan Gerhold <stephan@gerhold.net>,
	Sujit Kautkar <sujitka@chromium.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Vinod Koul <vkoul@kernel.org>,
	satya priya <skakit@codeaurora.org>
Subject: [GIT PULL] More Qualcomm ARM64 DT updates for 5.13
Date: Fri,  9 Apr 2021 11:39:49 -0500
Message-Id: <20210409163949.776530-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit e9269650db2f5b4aeeafced1a42b2e51d10bcdf5:

  arm64: dts: qcom: qrb5165-rb5: switch into using GPIO for SPI0 CS (2021-03-18 09:35:42 -0500)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-for-5.13-2

for you to fetch changes up to 7178d4cc0702bfe6a7e0f21e37d6e3dfe8e40f11:

  arm64: dts: qcom: update usb qmp phy clock-cells property (2021-04-08 10:23:25 -0500)

----------------------------------------------------------------
More Qualcomm ARM64 DT updates for 5.13

This adds RPMh regulators, coresight, AOSS qmp, ipcc, llcc for the
SC7280. It adds interconnect, PRNG and thermal pieces to SM8350. It
specifies the now required clocks for the SDM845 gcc, corrects the
firmware-name for adsp and cdsp on the db845c and defines DSI and panel
bits for Xiaomi Pocophone F1.

SM8150 gains iommu settings and the remaining I2C controllers and SM8250
gains Venus and the QMP PHY is updated to include the DP portion.

It adds the MSM8998 based OnePlus 5/5T device and enables sound support
on the Trogdor device family.

Lastly it adds the GIC hypervisor registers & interrupt for when Linux
is booted in EL2 on MSM8916.

----------------------------------------------------------------
Ajit Pandey (1):
      arm64: dts: qcom: sc7180-trogdor: Add lpass dai link for I2S driver

Bryan O'Donoghue (1):
      arm64: dts: qcom: sm8250: Add venus DT node

Caleb Connolly (2):
      arm64: dts: qcom: sm8150: add other QUP nodes and iommus
      arm64: dts: qcom: sm8150: add i2c nodes

Dmitry Baryshkov (4):
      arm64: dts: qcom: sdm845: add required clocks on the gcc
      arm64: dts: qcom: sm8250: switch usb1 qmp phy to USB3+DP mode
      arm64: dts: qcom: use dp_phy to provide clocks to dispcc
      arm64: dts: sdm845-db845c: make firmware filenames follow linux-firmware

Jami Kettunen (2):
      arm64: dts: qcom: msm8998: Disable MSS remoteproc by default
      arm64: dts: qcom: Add support for OnePlus 5/5T

Jonathan Marek (2):
      arm64: dts: qcom: sm8250: fix display nodes
      arm64: dts: qcom: update usb qmp phy clock-cells property

Robert Foss (2):
      arm64: dts: qcom: sm8350: Add thermal zones and throttling support
      arm64: dts: qcom: sm8350: Add support for PRNG EE

Sai Prakash Ranjan (4):
      arm64: dts: qcom: sc7280: Add device tree node for LLCC
      arm64: dts: qcom: sc7280: Add IPCC for SC7280 SoC
      arm64: dts: qcom: sc7280: Add AOSS QMP node
      arm64: dts: qcom: sc7280: Add Coresight support

Srinivasa Rao Mandadapu (1):
      arm64: dts: qcom: Add sound node for sc7180-trogdor-coachz

Stephan Gerhold (1):
      arm64: dts: qcom: msm8916: Add GICv2 hypervisor registers/interrupt

Sujit Kautkar (1):
      arm64: dts: qcom: Move rmtfs memory region

Sumit Semwal (1):
      arm64: dts: qcom: sdm845-xiaomi-beryllium: Add DSI and panel bits

Vinod Koul (1):
      arm64: dts: qcom: sm8350: Add interconnects

jonathan@marek.ca (1):
      arm64: dts: qcom: sm8250: Add videocc DT node

satya priya (1):
      arm64: dts: qcom: sc7280: Add RPMh regulators for sc7280-idp

 arch/arm64/boot/dts/qcom/Makefile                  |   2 +
 arch/arm64/boot/dts/qcom/msm8916.dtsi              |   4 +-
 arch/arm64/boot/dts/qcom/msm8998-clamshell.dtsi    |   4 +
 arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi          |   4 +
 .../boot/dts/qcom/msm8998-oneplus-cheeseburger.dts |  42 +
 .../boot/dts/qcom/msm8998-oneplus-common.dtsi      | 514 ++++++++++++
 .../boot/dts/qcom/msm8998-oneplus-dumpling.dts     |  25 +
 arch/arm64/boot/dts/qcom/msm8998.dtsi              |   2 +
 .../arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi |  10 +
 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi       |  60 +-
 arch/arm64/boot/dts/qcom/sc7180.dtsi               |   4 +-
 arch/arm64/boot/dts/qcom/sc7280-idp.dts            | 212 +++++
 arch/arm64/boot/dts/qcom/sc7280.dtsi               | 520 ++++++++++++
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts         |   4 +-
 .../boot/dts/qcom/sdm845-xiaomi-beryllium.dts      |  71 ++
 arch/arm64/boot/dts/qcom/sdm845.dtsi               |  16 +-
 arch/arm64/boot/dts/qcom/sm8150.dtsi               | 553 ++++++++++++-
 arch/arm64/boot/dts/qcom/sm8250.dtsi               | 128 ++-
 arch/arm64/boot/dts/qcom/sm8350.dtsi               | 911 +++++++++++++++++++++
 19 files changed, 3048 insertions(+), 38 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/msm8998-oneplus-cheeseburger.dts
 create mode 100644 arch/arm64/boot/dts/qcom/msm8998-oneplus-common.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/msm8998-oneplus-dumpling.dts
