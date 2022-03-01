Return-Path: <SRS0=PV0F=TM=linaro.org=bjorn.andersson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6152C433F5
	for <soc@archiver.kernel.org>; Tue,  1 Mar 2022 04:20:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 788E6C340F5; Tue,  1 Mar 2022 04:20:59 +0000 (UTC)
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7BCE9C340F1
	for <soc@kernel.org>; Tue,  1 Mar 2022 04:20:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7BCE9C340F1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ot1-f47.google.com with SMTP id a7-20020a9d5c87000000b005ad1467cb59so11250126oti.5
        for <soc@kernel.org>; Mon, 28 Feb 2022 20:20:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZgheNeV6VrgCPvvzDNqhywBXqs/fZYu3BC+daTMfd98=;
        b=tq8MBO3V0zr88DDeg89MfKWnSi8V7O7E88Ji6hGxsAjoouxnJYBshPC3Q7Mk9Ft4vS
         UcQy/Svc98lQ5E5rsI/9X+m74GEiJ3H6axrZLnbKfX/2xiJgcugHBdm1IE17E5GkN6t5
         6pH1OK9zet+kGbtmm6SAkYSN6S5phi/IdZEvLRzEKSYEZ7xFix52udh+CzIB5gV0iMBt
         oyqLm8KMEu+tWKc8vlnDJLz+mAvWsaO9gYASSn2THmbny3x20jCub+IWTKOsfZ4bIGIM
         JmgYkvLrruEIELEg8VPyjAoT8QAc/cAKTb9VJKQRXjQ6XkbwoPxwOlS/XTupRh/hoMPf
         RN2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZgheNeV6VrgCPvvzDNqhywBXqs/fZYu3BC+daTMfd98=;
        b=Uz8VPgdUP9VNedqKnp+LMRi+h6K+ulKTwwg+gKCQSaOcEDo0SFa6YbkgtYzs4iiWMk
         ov+WCLdMrYbkBoN3hEtGMu0z1m14K5HBjADdLyOStbw1q7WFmrEgh7YI2WjnS0oMSIFT
         0YtjOFsewlAycl1HbVxKtCZTaGCOPefzXdzTllc7NSo4iAQqg5rVWTwT9/+BOPUdsx5J
         Yrh4vsodvQNwvM1qzyWbVzVP2FkqVfQ7koJDHtNedl7xHVQYWnacbYAvNjnU/UYDwKMF
         Ob60AzyZ/iWuyo6E9N7wswfTC9QipuBWfg8yQCffcI5x7M1jeEPSIoAzPI1+66meUMYg
         KfzQ==
X-Gm-Message-State: AOAM531sQ6+BPevUvvgTvkAkmFFj+KUoSCuddJzcUsVupxuuRoN19fVJ
	7b7tkQEOgZE364UK7xAVi8TQKw==
X-Google-Smtp-Source: ABdhPJyBKG8Npw9lGTXw5Vd8d2rCiuknyYix4lQxzx5/5XgM7tkN6QTTj6l9z/JNu5hlFbALW/9lhw==
X-Received: by 2002:a05:6830:b92:b0:5af:44c9:f115 with SMTP id a18-20020a0568300b9200b005af44c9f115mr11386307otv.24.1646108457198;
        Mon, 28 Feb 2022 20:20:57 -0800 (PST)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id bh42-20020a056808182a00b002d538a8d5afsm7512671oib.7.2022.02.28.20.20.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Feb 2022 20:20:56 -0800 (PST)
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
	Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
	Stephan Gerhold <stephan@gerhold.net>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
	Luca Weiss <luca@z3ntu.xyz>,
	Miaoqian Lin <linmq006@gmail.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Daniel Thompson <daniel.thompson@linaro.org>,
	Huang Yiwei <hyiwei@codeaurora.org>,
	Jiasheng Jiang <jiasheng@iscas.ac.cn>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Xu Wang <vulab@iscas.ac.cn>,
	Yang Li <yang.lee@linux.alibaba.com>
Subject: [GIT PULL] Qualcomm driver updates for v5.18
Date: Mon, 28 Feb 2022 22:20:55 -0600
Message-Id: <20220301042055.1804859-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07:

  Linux 5.17-rc1 (2022-01-23 10:12:53 +0200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-for-5.18

for you to fetch changes up to 20f36361b7dd45787fa9872b3591f7148001eb6f:

  soc: qcom: rpmpd: Add MSM8226 support (2022-02-24 14:12:34 -0600)

----------------------------------------------------------------
Qualcomm driver updates for v5.18

This refactors the Qualcomm mdt file loader, to partially decouple it
from the SCM peripheral-authentication-service. This is needed as newer
platforms, such as the Qualcomm SM8450, require the metadata to remain
accessible to TrustZone during a longer time. This is followed by the
introduction of remoteproc drivers for SM8450 (Snapdragon 8 Gen 1).

It changes the way hardware version differences are handled in the LLCC
driver and introduces support for Qualcomm SM8450. While updating the dt
binding for LLCC it also introduces the missing SM8350 compatible.

The ocmem and aoss drivers gains missing put_device() calls and rpmpd
gains a missing check for kcalloc() failure.

The SPM driver is updated to avoid instantiating the SPM cpuidle devices
if the CPUs aren't controlled by SPM, such as when Snapdragon 8916
operates in 32-bit mode without PSCI.

The RPM power-domain driver gains MSM8226 support.

Lastly the socinfo driver gains knowledge about a few new SoCs and
PMICs.

----------------------------------------------------------------
AngeloGioacchino Del Regno (2):
      firmware: qcom: scm: Add function to set the maximum IOMMU pool size
      firmware: qcom: scm: Add function to set IOMMU pagetable addressing

Bjorn Andersson (13):
      firmware: qcom: scm: Introduce pas_metadata context
      soc: qcom: mdt_loader: Split out split-file-loader
      soc: qcom: mdt_loader: Allow hash segment to be split out
      soc: qcom: mdt_loader: Allow hash to reside in any segment
      soc: qcom: mdt_loader: Extend check for split firmware
      soc: qcom: mdt_loader: Reorder parts of __qcom_mdt_load()
      soc: qcom: mdt_loader: Always invoke PAS mem_setup
      soc: qcom: mdt_loader: Extract PAS operations
      remoteproc: qcom: pas: Carry PAS metadata context
      dt-bindings: remoteproc: qcom: pas: Add SM8450 PAS compatibles
      remoteproc: qcom: pas: Add SM8450 remoteproc support
      soc: qcom: socinfo: Add some more PMICs and SoCs
      soc: qcom: mdt_loader: Fix split-firmware condition

Christophe JAILLET (1):
      soc: qcom: llcc: Use devm_bitmap_zalloc() when applicable

Daniel Thompson (1):
      soc: qcom: aoss: remove spurious IRQF_ONESHOT flags

Huang Yiwei (1):
      soc: qcom: llcc: Add support for 16 ways of allocation

Jiasheng Jiang (1):
      soc: qcom: rpmpd: Check for null return of devm_kcalloc

Luca Weiss (2):
      dt-bindings: power: rpmpd: Add MSM8226 to rpmpd binding
      soc: qcom: rpmpd: Add MSM8226 support

Marijn Suijten (1):
      firmware: qcom: scm: Remove reassignment to desc following initializer

Miaoqian Lin (2):
      soc: qcom: ocmem: Fix missing put_device() call in of_get_ocmem
      soc: qcom: aoss: Fix missing put_device call in qmp_get

Sai Prakash Ranjan (7):
      soc: qcom: llcc: Update the logic for version info extraction
      soc: qcom: llcc: Add write-cache cacheable support
      soc: qcom: llcc: Add missing llcc configuration data
      soc: qcom: llcc: Update register offsets for newer LLCC HW
      soc: qcom: llcc: Add configuration data for SM8450 SoC
      dt-bindings: arm: msm: Add LLCC compatible for SM8350
      dt-bindings: arm: msm: Add LLCC compatible for SM8450

Stephan Gerhold (4):
      cpuidle: qcom-spm: Check if any CPU is managed by SPM
      firmware: qcom: scm: Simplify set_cold/warm_boot_addr()
      firmware: qcom: scm: Drop cpumask parameter from set_boot_addr()
      firmware: qcom: scm: Add support for MC boot address API

Xu Wang (1):
      soc: qcom: apr: Remove redundant 'flush_workqueue()' calls

Yang Li (1):
      firmware: qcom: scm: Fix some kernel-doc comments

 .../devicetree/bindings/arm/msm/qcom,llcc.yaml     |   2 +
 .../devicetree/bindings/power/qcom,rpmpd.yaml      |   1 +
 .../devicetree/bindings/remoteproc/qcom,adsp.yaml  |  16 ++
 arch/arm/mach-qcom/platsmp.c                       |   3 +-
 drivers/cpuidle/cpuidle-qcom-spm.c                 |  28 ++-
 drivers/firmware/qcom_scm.c                        | 215 ++++++++++---------
 drivers/firmware/qcom_scm.h                        |   7 +
 drivers/remoteproc/qcom_q6v5_mss.c                 |   7 +-
 drivers/remoteproc/qcom_q6v5_pas.c                 |  36 +++-
 drivers/soc/qcom/apr.c                             |   1 -
 drivers/soc/qcom/llcc-qcom.c                       | 107 ++++++++--
 drivers/soc/qcom/mdt_loader.c                      | 232 ++++++++++++++-------
 drivers/soc/qcom/ocmem.c                           |   1 +
 drivers/soc/qcom/qcom_aoss.c                       |   8 +-
 drivers/soc/qcom/rpmpd.c                           |  20 ++
 drivers/soc/qcom/socinfo.c                         |  12 ++
 include/dt-bindings/power/qcom-rpmpd.h             |   5 +
 include/linux/qcom_scm.h                           |  16 +-
 include/linux/soc/qcom/llcc-qcom.h                 |   9 +-
 include/linux/soc/qcom/mdt_loader.h                |  17 +-
 20 files changed, 528 insertions(+), 215 deletions(-)
