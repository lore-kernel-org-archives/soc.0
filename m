Return-Path: <SRS0=wwgT=HG=linaro.org=bjorn.andersson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9022C433E0
	for <soc@archiver.kernel.org>; Thu,  4 Feb 2021 05:23:00 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id A893064DDA; Thu,  4 Feb 2021 05:23:00 +0000 (UTC)
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 73A3964F55
	for <soc@kernel.org>; Thu,  4 Feb 2021 05:23:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 73A3964F55
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=bjorn.andersson@linaro.org
Received: by mail-ot1-f52.google.com with SMTP id 36so2298926otp.2
        for <soc@kernel.org>; Wed, 03 Feb 2021 21:23:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DdzXXZfVky7bYs1orc7IE9J5miYIkRPeW5sycyboBg4=;
        b=uVJcATAX3yR8sE2iv4IogQa2vjXQZmYJD0O0xkvyPwuEv3zpcSiA4tnXqAL4K7nzWv
         Ue1FamtLQDRenEvvpPTUOl0Wv24mQOMtu6+DrAiMPc7wxZPEKTpojIkKYXi9B9kZx6Q4
         igaisY69MdQ/lbxC3gJ8KCSizPAPP9s/nDHAhqj+3O5pwDEL/4veR+CLTu7nfRYtRSNt
         y6xwWZXVqzPan1s99Y3NF016EGPYpS9Gp/JCGAZKJpmeklwWbODeT7O4Hhs7a3YB039X
         JiS5DVp23Y396DYG/ptmdUcwFIbJXRasuBcE/iHTznHHuw0xaWPWZLReNFR6RpvHG23v
         gTrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DdzXXZfVky7bYs1orc7IE9J5miYIkRPeW5sycyboBg4=;
        b=iMEQjaOW4d2b2k3NEihUYlSv51TiNJTtt9e2VPVvSUWxceHWBnWwHznIewkQ4TdnrX
         rSfUz+Vs9+3FmgkjmS1QRUNWsP9QNbNjrO0OpCbT6EZ9wd5bjYFyYxL89ASPk087EXhR
         hZFna+oIzhWfEIiOH0Deq3jlj8yNxRNywHzhv0qjwN5dusLlwCGumnDh34kCrITsHdrW
         4T95YKqmPKmdtrA0RulpN1CyL0U8yi3Ca8M3Sbh2LlClKzjYDqyFd7bWPKjRDFXOBhRY
         KrycUfK4V+K6YnJC4Uc7rzsyZtpSar2PRSqo2jN980fK0aMFOiAikHM7kgoB9YAn61w6
         OG4Q==
X-Gm-Message-State: AOAM532yl1W36TpAzswIPJkc4XQ/fFMfTeSVQCMK9lBuP6daG2pkH17t
	CnQPJpFEYljhfiNTLqAaCyFVUA==
X-Google-Smtp-Source: ABdhPJypjdhXu0KOvBqfelMNks1LQHuv1Qj7pBpGFvYqrFrTANF7iRIX7aiVoacmiEWCNBaIO9FzVg==
X-Received: by 2002:a9d:21b6:: with SMTP id s51mr4448172otb.13.1612416179580;
        Wed, 03 Feb 2021 21:22:59 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id b7sm934193oib.53.2021.02.03.21.22.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Feb 2021 21:22:59 -0800 (PST)
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
	Lina Iyer <ilina@codeaurora.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Colin Ian King <colin.king@canonical.com>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	Konrad Dybcio <konradybcio@gmail.com>,
	Luca Weiss <luca@z3ntu.xyz>,
	Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
	Stephen Boyd <swboyd@chromium.org>,
	Vinod Koul <vkoul@kernel.org>
Subject: [GIT PULL] Qualcomm driver updates for 5.12
Date: Wed,  3 Feb 2021 23:22:58 -0600
Message-Id: <20210204052258.388890-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-for-5.12

for you to fetch changes up to 01f937ffc4686837d6c43dea80c6ade6cbd2940a:

  soc: qcom: ocmem: don't return NULL in of_get_ocmem (2021-02-02 15:39:13 -0600)

----------------------------------------------------------------
Qualcomm driver updates for 5.12

The socinfo driver gains support for dumping information about the platform's
PMICs, as well as new definitions for a number of platforms. The LLCC driver
gains SM8250 support, AOSS QMP gains SM8350 support and the RPMPD driver gains
support for MSM8994 power domains. In addition to this it contains a few minor
fixes in the ocmem, rpmh and llcc drivers.

----------------------------------------------------------------
Andy Shevchenko (1):
      soc: qcom: smem: use %*ph to print small buffer

Colin Ian King (1):
      soc: qcom: socinfo: Fix off-by-one array index bounds check

Dan Carpenter (1):
      soc: qcom: socinfo: Fix an off by one in qcom_show_pmic_model()

Dmitry Baryshkov (5):
      dt-bindings: soc: qcom: convert qcom,smem bindings to yaml
      soc: qcom: socinfo: add qrb5165 SoC ID
      soc: qcom: socinfo: add several PMIC IDs
      soc: qcom: socinfo: add info from PMIC models array
      soc: qcom: socinfo: Remove unwanted le32_to_cpu()

Konrad Dybcio (4):
      soc: qcom: socinfo: Add SoC IDs for 630 family
      soc: qcom: socinfo: Add SoC IDs for APQ/MSM8998
      soc: qcom: socinfo: Add MDM9607 IDs
      drivers: soc: qcom: rpmpd: Add msm8994 RPM Power Domains

Lina Iyer (2):
      drivers: qcom: rpmh-rsc: Do not read back the register write on trigger
      soc: qcom: rpmh: Remove serialization of TCS commands

Luca Weiss (1):
      soc: qcom: ocmem: don't return NULL in of_get_ocmem

Manivannan Sadhasivam (2):
      dt-bindings: msm: Add LLCC for SM8250
      soc: qcom: llcc-qcom: Add support for SM8250 SoC

Sai Prakash Ranjan (1):
      soc: qcom: llcc-qcom: Extract major hardware version

Stephen Boyd (1):
      soc: qcom: socinfo: Open read access to all for debugfs

Vinod Koul (1):
      soc: qcom: aoss: Add SM8350 compatible

 .../devicetree/bindings/arm/msm/qcom,llcc.yaml     |   1 +
 .../devicetree/bindings/power/qcom,rpmpd.yaml      |   1 +
 .../devicetree/bindings/soc/qcom/qcom,aoss-qmp.txt |   1 +
 .../devicetree/bindings/soc/qcom/qcom,smem.txt     |  57 -----------
 .../devicetree/bindings/soc/qcom/qcom,smem.yaml    |  72 ++++++++++++++
 drivers/soc/qcom/llcc-qcom.c                       |  50 ++++++++++
 drivers/soc/qcom/ocmem.c                           |   8 +-
 drivers/soc/qcom/qcom_aoss.c                       |   1 +
 drivers/soc/qcom/rpmh-rsc.c                        |  24 ++---
 drivers/soc/qcom/rpmpd.c                           |  28 ++++++
 drivers/soc/qcom/smem.c                            |   4 +-
 drivers/soc/qcom/socinfo.c                         | 105 ++++++++++++++++-----
 include/dt-bindings/power/qcom-rpmpd.h             |   9 ++
 include/linux/soc/qcom/llcc-qcom.h                 |   3 +
 include/soc/qcom/tcs.h                             |   9 +-
 15 files changed, 273 insertions(+), 100 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,smem.txt
 create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,smem.yaml
