Return-Path: <SRS0=FYTr=XZ=linaro.org=bjorn.andersson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AA5CC433EF
	for <soc@archiver.kernel.org>; Wed, 20 Jul 2022 23:06:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 23EA0C341C7; Wed, 20 Jul 2022 23:06:52 +0000 (UTC)
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3F27DC341CA
	for <soc@kernel.org>; Wed, 20 Jul 2022 23:06:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3F27DC341CA
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ot1-f50.google.com with SMTP id a14-20020a0568300b8e00b0061c4e3eb52aso15294749otv.3
        for <soc@kernel.org>; Wed, 20 Jul 2022 16:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9l1HeQDiotjqJIv5Il7K5ATLOcCGvQ53f+vdiVnWUvY=;
        b=Qk7zS8c0PgkoGxfjIoIPmT+Jj4O8j4dX9JWQkAgBDhsVZXps/h11yjwALceKU+NH+l
         dsIiRw1a3LVLZevDTSq+Fe7L+zTC+XPHsuLKLoPsrpUHlZ6fsT1eG74L9eqI/Ai9mr7b
         ptJBvi3+zbz5ba+VKs9eZrjcR1WK1i9haqEZSJwCeugcBNHjkCQ/cT0UgHfQTbC+j0NN
         vhVevwg7WcsHFIyaVDb1Mr4iEtU79QdVdPSE7ZuJ0ZLIIcAo26ne8443pTjoeByU5/+A
         N+KGnUFnM5NPUs+UmglRENjS+ek2lYQust8wTTXCn0F7i9MdnH+iZzssEk/ym5qwB/5l
         r+9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9l1HeQDiotjqJIv5Il7K5ATLOcCGvQ53f+vdiVnWUvY=;
        b=JGkC6aFNX4owPzAc87Xc9i/fslHDnwBHHjnLKNsj+RI/k/zqJhGx+Fx5HezoHPIWPE
         xgoFYjB+JfX/UFH8zOmm+t5LcPkl99uL0hlDBZ4sQ+KzBadHWy+3gMj1yYjNwebxfMMY
         np89E+BZJNJ8PosxWuI9NvMLJ6wYwV4m2G0mph3wSNX5NKYSTplJJwj+HanlmGrWWx17
         70lwWYQ2nTXY+HttFoTLFVkRypF5+l2gyS72yN4B2miwqZGua/oiYWRGlE5RtjbvIouj
         FPg56X+i+YpTTu1u4sZ8ENKTPoG3OSHe3Uenpy3TCvb4yl5/1nrxMnkAnIWs0JrdXpuG
         BXnA==
X-Gm-Message-State: AJIora9LtHKk6Lp7lcBI1u3YoaHB9AyCIgrbvseWmch14IOWSyuPS4uq
	X5J0rvKMiWcSYB43My9cWKz1dQ==
X-Google-Smtp-Source: AGRyM1teuAqc54sPbqVd5WQINGjAiYqQewnHwR8RmMeDUacYjp5xeL+BxSYUyX17DbixxSurTrHW2w==
X-Received: by 2002:a05:6830:314f:b0:61c:bb6e:331 with SMTP id c15-20020a056830314f00b0061cbb6e0331mr2864558ots.283.1658358410185;
        Wed, 20 Jul 2022 16:06:50 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id r1-20020acaa801000000b0032e548d96e0sm20976oie.23.2022.07.20.16.06.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 16:06:49 -0700 (PDT)
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
	Stephan Gerhold <stephan.gerhold@kernkonzept.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Konrad Dybcio <konrad.dybcio@somainline.org>,
	Parikshit Pareek <quic_ppareek@quicinc.com>,
	Yang Li <yang.lee@linux.alibaba.com>
Subject: [GIT PULL] More Qualcomm driver changes for v5.20
Date: Wed, 20 Jul 2022 18:06:48 -0500
Message-Id: <20220720230648.2113609-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit b9c2ae6cac403dee3195fda9eb28d8ee733b225b:

  soc: qcom: icc-bwmon: Add bandwidth monitoring driver (2022-07-06 15:57:51 -0500)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-for-5.20-2

for you to fetch changes up to c23b7d4967892430674f03f97d5fbd2f37a6732a:

  dt-bindings: soc: qcom: qcom,smd-rpm: add power-controller (2022-07-20 10:12:03 -0500)

----------------------------------------------------------------
More Qualcomm driver changes for v5.20

This adds support for booting secondary cores, SPM, SMD-RPM and RPM
power-domain support for the MSM8909 platform.

It drops an unnecessary print in icc-bwmon, corrects SA8540P entries in
socinfo and a Kconfig build dependency for QCOM_RPMPD.

Lastly it continues to clean up up the Devicetree bindings for the
Qualcomm drivers.

----------------------------------------------------------------
Konrad Dybcio (1):
      soc: qcom: Make QCOM_RPMPD depend on PM

Krzysztof Kozlowski (3):
      dt-bindings: soc: qcom,rpmh-rsc: simplify qcom,tcs-config
      dt-bindings: soc: qcom: aoss: document qcom,sm8450-aoss-qmp
      dt-bindings: soc: qcom: qcom,smd-rpm: add power-controller

Parikshit Pareek (1):
      soc: qcom: socinfo: Fix the id of SA8540P SoC

Stephan Gerhold (8):
      dt-bindings: soc: qcom: smd-rpm: Add MSM8909
      soc: qcom: smd-rpm: Add compatible for MSM8909
      dt-bindings: power: qcom-rpmpd: Add MSM8909 power domains
      soc: qcom: rpmpd: Add compatible for MSM8909
      dt-bindings: soc: qcom: spm: Add MSM8909 CPU compatible
      soc: qcom: spm: Add CPU data for MSM8909
      dt-bindings: arm: cpus: Document "qcom,msm8909-smp" enable-method
      ARM: mach-qcom: Add support for MSM8909

Yang Li (1):
      soc: qcom: icc-bwmon: Remove unnecessary print function dev_err()

 Documentation/devicetree/bindings/arm/cpus.yaml    |  1 +
 .../devicetree/bindings/power/qcom,rpmpd.yaml      |  1 +
 .../bindings/soc/qcom/qcom,aoss-qmp.yaml           |  1 +
 .../bindings/soc/qcom/qcom,rpmh-rsc.yaml           | 33 ++++++++--------------
 .../devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml |  4 +++
 .../devicetree/bindings/soc/qcom/qcom,spm.yaml     |  1 +
 arch/arm/mach-qcom/Kconfig                         |  4 +++
 arch/arm/mach-qcom/platsmp.c                       |  1 +
 drivers/soc/qcom/Kconfig                           |  1 +
 drivers/soc/qcom/icc-bwmon.c                       |  4 +--
 drivers/soc/qcom/rpmpd.c                           |  1 +
 drivers/soc/qcom/smd-rpm.c                         |  1 +
 drivers/soc/qcom/socinfo.c                         |  3 +-
 drivers/soc/qcom/spm.c                             | 14 +++++++++
 include/dt-bindings/power/qcom-rpmpd.h             |  7 +++++
 15 files changed, 51 insertions(+), 26 deletions(-)
