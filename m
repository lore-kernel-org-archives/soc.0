Return-Path: <SRS0=xdQ+=XR=linaro.org=bjorn.andersson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B94C2C433EF
	for <soc@archiver.kernel.org>; Tue, 12 Jul 2022 02:18:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 81885C341CD; Tue, 12 Jul 2022 02:18:34 +0000 (UTC)
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7D6BAC341CA
	for <soc@kernel.org>; Tue, 12 Jul 2022 02:18:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7D6BAC341CA
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ot1-f46.google.com with SMTP id a14-20020a0568300b8e00b0061c4e3eb52aso2806981otv.3
        for <soc@kernel.org>; Mon, 11 Jul 2022 19:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=emByWjbQoqud23XK8P6B7AoXGAPFJzuBuFTm+2tiWB4=;
        b=cWl/t1aOV1TQ05HVXLQoXEGM25sY6G/zgfTfA8Y4iM/XeS8mkYsq1ZU2JKLf5MahkK
         eqAA/m2cNtXBbubAPhMJfeyI7oHWMGlVBeoQDGE1n8XJYYtTvG9q9gpqOeQczOUq5LBz
         L0Qu3PcJ30zfYUm+c07PuYLZxpEwRO2XtGTdwcG7yUrvYdoC6nUVrgAoQDOxlEuCsJk4
         Yb+t39CUaXzlmJK7WuXBnc5gVxM20qlRtOpP0oeKL5gKfn0t2G1R6CvNRrAzA/Kztppa
         CaQMv655wbIPOhVhEk/ibaofBVsHrAteLl3GqBHfWjKEgV/yIzlrz319zSAyr5ROAcNK
         UmFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=emByWjbQoqud23XK8P6B7AoXGAPFJzuBuFTm+2tiWB4=;
        b=76fgjV/mnzduWabpSpsLgeWk7+elB1aEuN+NHNloEgBEeM6voOs5SGmG2Lg35yOJDB
         LTDMyOncbWLxX69B233ITL5lXiPXelW6Ose22eU3x6+D8zIRA55EQjmzgpGsCDH6DjlD
         wOMZimBmL/nlDKk/vaSGpxO7OVtEsfRJUpFL3UL3Oyj0fC68L6p4quTvBFOZdDdiqtFB
         kkDye3sVWRGh9x8QuSvXCmPk7Wm2OmG3NI20yCFyAfuDuzIgpbZw72kwS3PJ2Ch1fbIQ
         TZWoo3Z06yHvqUkamkfdy3eAEkKKCRSE7EpGwcp8fLiyiBi/y5iJA+xTYwhcpdP0Vmar
         nGmQ==
X-Gm-Message-State: AJIora+9qbhK39HCjHEmDbrFdjbZRi1TEid5bgYqZLfJ/NI53SGGFUw5
	jESlQ86VOzhbG4UadryPjbAZ2A==
X-Google-Smtp-Source: AGRyM1vtKEPOJdQqpPB0C3TxwcCYMGXA+6ldK99qt54xFY7Xz5WoR1dYBM1Yh0stZUXqSP84yliR/Q==
X-Received: by 2002:a05:6830:6004:b0:616:ecd9:129b with SMTP id bx4-20020a056830600400b00616ecd9129bmr8187582otb.232.1657592312452;
        Mon, 11 Jul 2022 19:18:32 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id s3-20020acadb03000000b0032e442f6a72sm3469573oig.40.2022.07.11.19.18.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jul 2022 19:18:31 -0700 (PDT)
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
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Douglas Anderson <dianders@chromium.org>,
	Miaoqian Lin <linmq006@gmail.com>,
	Sibi Sankar <quic_sibis@quicinc.com>,
	Jiang Jian <jiangjian@cdjrlc.com>,
	Julia Lawall <Julia.Lawall@inria.fr>,
	Konrad Dybcio <konrad.dybcio@somainline.org>,
	Rohit Agarwal <quic_rohiagar@quicinc.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Xiang wangx <wangxiang@cdjrlc.com>
Subject: [GIT PULL] Qualcomm driver updates for v5.20
Date: Mon, 11 Jul 2022 21:18:30 -0500
Message-Id: <20220712021830.1271398-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a56:

  Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-for-5.20

for you to fetch changes up to b9c2ae6cac403dee3195fda9eb28d8ee733b225b:

  soc: qcom: icc-bwmon: Add bandwidth monitoring driver (2022-07-06 15:57:51 -0500)

----------------------------------------------------------------
Qualcomm driver updates for v5.20

This introduces a new driver that requests interconnect bandwidth based
on throughput measurements of the bwmon hardware blocks found associated
with, among other things, the CPU subsystem on many Qualcomm platforms.

It introduces support for the SCM wrapper driver to vote for
interconnect bandwidth for operations that needs bandwidth to the crypto
engine. This ensures both performance and guards against issues caused
by lacking votes for this path.

The socinfo driver gains knowledge about the SC7180P SoC.

It contains a range of fixes for spelling mistakes, refcount leaks in
various drivers and removes some redundant code from the apr remove
path.

The SCM DT bindings are updated to declare support for QCS404, SM6125
and SDX65.

The command db driver has a strncpy() converted to strscpy_pad() and
then back again with proper documentation to why this was the right API.

----------------------------------------------------------------
Douglas Anderson (2):
      soc: qcom: socinfo: Add an ID for sc7180P
      soc: qcom: cmd-db: replace strscpy_pad() with strncpy()

Jiang Jian (1):
      firmware: qcom_scm: drop unexpected word "the"

Julia Lawall (1):
      soc: qcom: rpmhpd: fix typos in comment

Konrad Dybcio (1):
      soc/qcom: Make QCOM_RPMPD select PM_GENERIC_DOMAINS/_OF

Krzysztof Kozlowski (8):
      dt-bindings: firmware: document Qualcomm QCS404 and SM6125 SCM
      firmware: qcom_scm-legacy: correct kerneldoc
      soc: qcom: cmd-db: replace strncpy() with strscpy_pad()
      soc: qcom: correct kerneldoc
      dt-bindings: arm: qcom: switch maintainer to Bjorn
      dt-bindings: soc: qcom,wcnss: remove unneeded ref for names
      dt-bindings: interconnect: qcom,msm8998-cpu-bwmon: add BWMON device
      soc: qcom: icc-bwmon: Add bandwidth monitoring driver

Miaoqian Lin (2):
      soc: qcom: ocmem: Fix refcount leak in of_get_ocmem
      soc: qcom: aoss: Fix refcount leak in qmp_cooling_devices_register

Rohit Agarwal (1):
      dt-bindings: firmware: scm: Add compatible for SDX65

Sibi Sankar (2):
      dt-bindings: firmware: qcom-scm: Add interconnects property
      firmware: qcom_scm: Add bw voting support to the SCM interface

Uwe Kleine-König (1):
      soc: qcom: apr: Drop redundant check in .remove()

Xiang wangx (1):
      soc: qcom: llcc: Fix syntax errors in comments

 Documentation/devicetree/bindings/arm/qcom.yaml    |   2 +-
 .../devicetree/bindings/firmware/qcom,scm.txt      |   4 +
 .../bindings/interconnect/qcom,msm8998-bwmon.yaml  |  86 +++++
 .../devicetree/bindings/soc/qcom/qcom,wcnss.yaml   |   1 -
 MAINTAINERS                                        |   7 +
 drivers/firmware/qcom_scm-legacy.c                 |   4 +
 drivers/firmware/qcom_scm.c                        |  71 +++-
 drivers/soc/qcom/Kconfig                           |  17 +
 drivers/soc/qcom/Makefile                          |   1 +
 drivers/soc/qcom/apr.c                             |  15 +-
 drivers/soc/qcom/cmd-db.c                          |   8 +-
 drivers/soc/qcom/icc-bwmon.c                       | 421 +++++++++++++++++++++
 drivers/soc/qcom/llcc-qcom.c                       |   2 +-
 drivers/soc/qcom/mdt_loader.c                      |   4 +-
 drivers/soc/qcom/ocmem.c                           |   3 +
 drivers/soc/qcom/qcom_aoss.c                       |   4 +-
 drivers/soc/qcom/rpmhpd.c                          |   4 +-
 drivers/soc/qcom/smp2p.c                           |   3 +
 drivers/soc/qcom/socinfo.c                         |   1 +
 19 files changed, 639 insertions(+), 19 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml
 create mode 100644 drivers/soc/qcom/icc-bwmon.c
