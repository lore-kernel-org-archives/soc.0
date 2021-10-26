Return-Path: <SRS0=GGsf=PO=linaro.org=bjorn.andersson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 713C7C433EF
	for <soc@archiver.kernel.org>; Tue, 26 Oct 2021 14:07:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 514F960C51; Tue, 26 Oct 2021 14:07:09 +0000 (UTC)
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2BAAA60724
	for <soc@kernel.org>; Tue, 26 Oct 2021 14:07:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2BAAA60724
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linaro.org
Received: by mail-ot1-f54.google.com with SMTP id v2-20020a05683018c200b0054e3acddd91so17422385ote.8
        for <soc@kernel.org>; Tue, 26 Oct 2021 07:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=G5Qlx1y7ALla3mofzLviDldMhP9x8JiihdYD246zlCY=;
        b=JmNzDIh4MWt3N9J8HsHlhZS+nlhV7KoxC7nizgJuk8hQsmjIouKI6bZ5bpUnuqfv9F
         eYV+4iGHhN5KXAdPqk14uGbuD89z20WMaKbJ3yHzvhJ5b+1OEVg34W+Fze33WKrTBCNg
         ksxMj0PjQNXIkkeWcxguTLeeSKKuYwATCYfMlf+RklW+iae+QVlRAvbAkzB0cnE/D8qn
         1Xa5yEy4VEvsh5vlETy2qNsjMsqnFzPDdIh33FdFP7oSUpmcsfIEI8g6WvNneS0+x86E
         wd7FgHSN0dvPvMXYrXFZsTLwdU/lCpty2XRCuhk+tybAdZ0rGPumQ/58kbLyufSdZ0e6
         GMMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=G5Qlx1y7ALla3mofzLviDldMhP9x8JiihdYD246zlCY=;
        b=vdpQlMZSvi4bDrIXRXq96xDH+FBB9Y7fYtTvMWKqS6TXf629hW7SD0q0fYzKU/LkGm
         2ouGtmivY+5K9NQRu1Iv9/oKfBOcySkbnEV4jkYbp/rvmpFY5Buvo1fC/c46xfEV0a7I
         /e5vlQVTKCFwx3fIWxeAX++XeImDyYKhXTJgoeem7byt//Vfs171d4WOAiuu3lYEMHHT
         UYlv+pJQgNdFuJX0VFDfILOjxqcT44qCSJINJOWA7isK4bApFSh7KVLV3UAnUjpx59Ug
         QaJuz5VHIrSwr8G/f2Z90YSKiREuJ2IxCH6e3j3mmDKcaLLkcE7Q8DQfwmyraeoEdc06
         Bd4g==
X-Gm-Message-State: AOAM531FQ4fETF6oaI4UhbcZ/VmkX5fBbf98ThAzv7NU0ry2lKb0IK2t
	3PssVYajs7xA4QjekHvL1T/h3Q==
X-Google-Smtp-Source: ABdhPJySoYtqBF6E1gZIxLymCcbN+YVTvANHlMP5w77ok+wlM6XMABiz0bKovqVOltEZwyU2aKVweQ==
X-Received: by 2002:a05:6830:60f:: with SMTP id w15mr1773894oti.150.1635257228425;
        Tue, 26 Oct 2021 07:07:08 -0700 (PDT)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id f8sm4473429otp.63.2021.10.26.07.07.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Oct 2021 07:07:07 -0700 (PDT)
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
	Stephan Gerhold <stephan@gerhold.net>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Mahesh Sivasubramanian <msivasub@codeaurora.org>,
	Wan Jiabing <wanjiabing@vivo.com>,
	Chris Lew <clew@codeaurora.org>,
	Guru Das Srinagesh <quic_gurus@quicinc.com>,
	Lina Iyer <lina.iyer@linaro.org>,
	Maulik Shah <mkshah@codeaurora.org>
Subject: [GIT PULL] More Qualcomm driver updates for v5.16
Date: Tue, 26 Oct 2021 09:07:06 -0500
Message-Id: <20211026140706.1205989-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit f27591125a56c8c50491919b159569ab5730878d:

  Merge tag '20210927135559.738-6-srinivas.kandagatla@linaro.org' into drivers-for-5.16 (2021-09-27 22:13:45 -0500)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-for-5.16-2

for you to fetch changes up to c50031f03dfe1c1462f326973ddc5f0db839fb68:

  firmware: qcom: scm: Don't break compile test on non-ARM platforms (2021-10-25 14:21:34 -0500)

----------------------------------------------------------------
More Qualcomm driver updates for v5.16

This introduces the Qualcomm "sleep stats" driver, which aids the
efforts of bringing various Qualcomm platforms into low power mode.

The SMP2P driver gains support for negotiating the "SSR" feature, which
is used to better synchronize some corner cases that might appear as the
remoteproc is recovering from a crash.

The socinfo driver learns about a few new PMICs.

SMEM is updated so that it's possible to put the compatible property
directly in the reserved-memory node, to avoid having to have a separate
node just pointing to the memory-region.

Lastly it fixes some bugs in smp2p, apr, rpmhpd drivers, notably
avoiding the issue where powering on a power-domain using rpmhpd while
keeping the performance_state at 0 is a nop

----------------------------------------------------------------
Bjorn Andersson (6):
      dt-bindings: sram: Document qcom,rpm-msg-ram
      dt-bindings: soc: smem: Make indirection optional
      soc: qcom: smem: Support reserved-memory description
      soc: qcom: rpmhpd: Make power_on actually enable the domain
      soc: qcom: socinfo: Add PM8150C and SMB2351 models
      firmware: qcom: scm: Don't break compile test on non-ARM platforms

Chris Lew (1):
      soc: qcom: smp2p: add feature negotiation and ssr ack feature support

Dmitry Baryshkov (2):
      soc: qcom: socinfo: add two missing PMIC IDs
      soc: qcom: rpmhpd: fix sm8350_mxc's peer domain

Guru Das Srinagesh (1):
      firmware: qcom_scm: Fix error retval in __qcom_scm_is_call_available()

Lina Iyer (1):
      soc: qcom: spm: Add 8916 SPM register data

Mahesh Sivasubramanian (2):
      dt-bindings: Introduce QCOM Sleep stats bindings
      soc: qcom: Add Sleep stats driver

Maulik Shah (1):
      soc: qcom: qcom_stats: Fix client votes offset

Stephan Gerhold (4):
      dt-bindings: soc: qcom: spm: Document qcom,msm8916-saw2-v3.0-cpu
      firmware: qcom: scm: Add support for MC boot address API
      ARM: qcom: Add qcom,msm8916-smp enable-method identical to MSM8226
      dt-bindings: arm: cpus: Document qcom,msm8916-smp enable-method

Wan Jiabing (2):
      soc: qcom: apr: Add of_node_put() before return
      soc: qcom: smp2p: Add of_node_put() before goto

 Documentation/devicetree/bindings/arm/cpus.yaml    |   5 +-
 .../devicetree/bindings/soc/qcom/qcom,smem.yaml    |  34 ++-
 .../devicetree/bindings/soc/qcom/qcom,spm.yaml     |   1 +
 .../devicetree/bindings/soc/qcom/qcom-stats.yaml   |  47 ++++
 Documentation/devicetree/bindings/sram/sram.yaml   |   5 +-
 arch/arm/mach-qcom/platsmp.c                       |   1 +
 drivers/firmware/qcom_scm.c                        |  96 +++++--
 drivers/firmware/qcom_scm.h                        |   4 +
 drivers/of/platform.c                              |   1 +
 drivers/soc/qcom/Kconfig                           |  10 +
 drivers/soc/qcom/Makefile                          |   1 +
 drivers/soc/qcom/apr.c                             |   2 +
 drivers/soc/qcom/qcom_stats.c                      | 277 +++++++++++++++++++++
 drivers/soc/qcom/rpmhpd.c                          |  20 +-
 drivers/soc/qcom/smem.c                            |  57 +++--
 drivers/soc/qcom/smp2p.c                           | 134 +++++++---
 drivers/soc/qcom/socinfo.c                         |   6 +-
 drivers/soc/qcom/spm.c                             |  21 ++
 18 files changed, 645 insertions(+), 77 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom-stats.yaml
 create mode 100644 drivers/soc/qcom/qcom_stats.c
