Return-Path: <SRS0=LbBh=XI=linaro.org=bjorn.andersson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 743A3C43334
	for <soc@archiver.kernel.org>; Sun,  3 Jul 2022 03:02:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2F538C341CD; Sun,  3 Jul 2022 03:02:13 +0000 (UTC)
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 740CFC341CA
	for <soc@kernel.org>; Sun,  3 Jul 2022 03:02:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 740CFC341CA
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-10be1122de0so1799269fac.7
        for <soc@kernel.org>; Sat, 02 Jul 2022 20:02:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1lSw9mgHmjRSkAahmySS+PKcK9MN0rRkjUfmzDPwwh8=;
        b=mV7bpm9k/KZFnu73n/GBZbCbmEJ6fA9MXkwyoXVMCsa6B1EPvToNvZOMMExgaU7k1N
         AD7Mq3Tpq9d+GrRNXiScC3UOCTR6u9ZcmXOVVico7eEOVF4/zqulWg5JhK2d9W0OpV4F
         2Qf+ibpLP0T4kTt0JNTq3jhe3a2TzqHFG0GdRR7bbBVZPGmjWVC9QPlWJHmxvPXSgmBt
         wIYY44rSJnW2KaM9NeZ8QAUHrX2WL+psLFkpSuF7EdASZALpnWY95Dl0TJQx9CV8GFUV
         xfWg6nch9vZkU7KAaQXImvxEJwWR5/IHGMjMjOAmxPqs+zjOEApvMRM1KqZmBDRIMylt
         qwfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1lSw9mgHmjRSkAahmySS+PKcK9MN0rRkjUfmzDPwwh8=;
        b=Mlqc0ErP3gxDRPla1uFZLuN4aPrVWmkAXr5oFjiUZxBVDuigk+oiRSZ31XD8XewfQi
         Dk/0hm3vl0fYcqe0o3jeOJQ6YFv/67sUCmBqYAOV2O2V7IK1JzACQcHDEKmsW98llHch
         mrsiMris0G3hDyCWUbctZGaY5RN/Kjq3YzbzuxNv+MoFgojs62CTro/Oid7qia6G8hgz
         vxbX4UmqpG6/VxQ0vjBnZN9R7qu7+UcTvljxbZjnaprBiUvy47cPWXwmSI9Td3QEUABC
         pwJ1oVN2tQX7qcNNbylMiYNfu+rx0Wc6ksdu6wHKPAFVOOyes+swZbxDumArLi6Rm1Kx
         3SiQ==
X-Gm-Message-State: AJIora8MgPO9rxxpxSy17VtNWpnMllFp28XwNAzjz5CDHNGiumRC+bzA
	KYyKrLLOK+Pt/pFCOtK2g8D4/A==
X-Google-Smtp-Source: AGRyM1tg2rW5BLgaSXk2zuvsm05y4qROrAGXD70Go5MLwvOGM2Bltu1sGhZNU9CpPDyjFVX9Gu6GPg==
X-Received: by 2002:a05:6870:9a28:b0:fe:4636:98aa with SMTP id fo40-20020a0568709a2800b000fe463698aamr13186547oab.21.1656817330498;
        Sat, 02 Jul 2022 20:02:10 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id r66-20020acada45000000b0032f7605d1a3sm13191955oig.31.2022.07.02.20.02.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Jul 2022 20:02:09 -0700 (PDT)
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
	Konrad Dybcio <konrad.dybcio@somainline.org>,
	Stephan Gerhold <stephan.gerhold@kernkonzept.com>,
	Stephen Boyd <swboyd@chromium.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Subject: [GIT PULL] Qualcomm ARM64 DT fixes for v5.19
Date: Sat,  2 Jul 2022 22:02:08 -0500
Message-Id: <20220703030208.408109-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a56:

  Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-fixes-for-5.19

for you to fetch changes up to 5fb779558f1c97e2bf2794cb59553e569c38e2f9:

  arm64: dts: qcom: msm8992-*: Fix vdd_lvs1_2-supply typo (2022-06-27 15:09:32 -0500)

----------------------------------------------------------------
Qualcomm ARM64 DT fixes for v5.19

This removes duplicate includes in the sc7180-trogdor files, which
accidentally ended up disabling nodes intended to be enabled.

It corrects identifiers for CPU6/7 on MSM8994. On SM8450 the UFS node's
interconnects property is updated to match the #interconnect-cells,
avoiding sync_state issues and the GIC ITS is defined, to correct the
references from the PCIe nodes. On SDM845 the display subsystem's AHB
clock is corrected and on msm8992 devices, the supplies for lvs 1 and 2
are correctly specified.

Lastly, a welcome addition of Konrad as reviewer for the Qualcomm SoC.

----------------------------------------------------------------
Dmitry Baryshkov (2):
      arm64: dts: qcom: sm8450 add ITS device tree node
      arm64: dts: qcom: sdm845: use dispcc AHB clock for mdss node

Konrad Dybcio (2):
      arm64: dts: qcom: msm8994: Fix CPU6/7 reg values
      MAINTAINERS: Add myself as a reviewer for Qualcomm ARM/64 support

Stephan Gerhold (1):
      arm64: dts: qcom: msm8992-*: Fix vdd_lvs1_2-supply typo

Stephen Boyd (1):
      arm64: dts: qcom: Remove duplicate sc7180-trogdor include on lazor/homestar

Vladimir Zapolskiy (1):
      arm64: dts: qcom: sm8450: fix interconnects property of UFS node

 MAINTAINERS                                           |  1 +
 arch/arm64/boot/dts/qcom/msm8992-lg-bullhead.dtsi     |  2 +-
 arch/arm64/boot/dts/qcom/msm8992-xiaomi-libra.dts     |  2 +-
 arch/arm64/boot/dts/qcom/msm8994.dtsi                 |  4 ++--
 arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar.dtsi |  2 +-
 arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi    |  2 +-
 arch/arm64/boot/dts/qcom/sdm845.dtsi                  |  2 +-
 arch/arm64/boot/dts/qcom/sm8450.dtsi                  | 14 ++++++++++++--
 8 files changed, 20 insertions(+), 9 deletions(-)
