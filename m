Return-Path: <SRS0=bnFl=JB=linaro.org=bjorn.andersson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02F5FC433ED
	for <soc@archiver.kernel.org>; Sun,  4 Apr 2021 16:49:54 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id C5EE561368; Sun,  4 Apr 2021 16:49:53 +0000 (UTC)
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A22F61246
	for <soc@kernel.org>; Sun,  4 Apr 2021 16:49:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9A22F61246
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=bjorn.andersson@linaro.org
Received: by mail-ot1-f52.google.com with SMTP id g8-20020a9d6c480000b02901b65ca2432cso9423708otq.3
        for <soc@kernel.org>; Sun, 04 Apr 2021 09:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7xTMgW45Pf8wC7ZRL/3TK62BwJGeS6Chx/bVTjL7mA8=;
        b=nk2BEyZT3RueLrxOExLKWBZJ4EKVhn3pOd321Mci6cTy9UF10XDahELujCxuwySvUG
         B2Ncy1Ibr8C/BV431PRL+pG/rtYU7DgQRQ/QBZtv9lQzB+gV/6gw9EnpQZHFNoileHEl
         aJk+FKh0d9iL+K+GwmkuQvvLH2lekIAZFXFnwENU2TMsCLeFpDg97YQdSuBkqAVD7ukn
         S1akeMTq+egbXQjJH87qf2r9+Dwyk6HU588mMZtrkqo4ZjxaMwmYjI6cemLhElQbPnLE
         c27XVgHV2hb9IK1ukCiis03sxeNkl2iF+HA5GDj6FKOPX+CIGd9StpJT+8vwzRZZ4DH5
         Fuvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7xTMgW45Pf8wC7ZRL/3TK62BwJGeS6Chx/bVTjL7mA8=;
        b=UYa9fF23Q60JtmZVrO3t6oNTRK71r6zhAxpNkOFx2C7mKkYvvbxTFy3/BDxXIDHPLH
         /kn1FzCgU3xq6gbSxgRYR/6a87SC3lrc0OKyOk0983Wvpt/1cA+BAzOEE6ldozWZOqtH
         47K3+Fe4x05oQN1jmmzUkIcP7VKmbRi3ITI7CTUocmlet/kfNjftDfnS6JQUwTKpG/qi
         +69LwhJE8MkH13HyfuGxnCUd4Pu9N0/xGRjun7Z0jOSrc6fexG/yPCosQXp5rOYjNJ+U
         VX544iEIzDYWy6AeH1hUAS3C6HrBJtlYIh79lG8T1xhruVk5AHqJdxxAjrVD8Ff9xBkp
         wrww==
X-Gm-Message-State: AOAM533dRqNq/ZkcUM3231XbWLT2fu3v6jddyTTiSTEo2oop4lhxNPCX
	bhyibTaXAIdb7V3/xe+ReQ0uIQ==
X-Google-Smtp-Source: ABdhPJzsBh85jkPN+kupmkbaUDVIvy3owM/rhUReliF+WgCmBH3OAadg8PUmUrCoHGwPT+2ljycS0g==
X-Received: by 2002:a05:6830:164e:: with SMTP id h14mr19956152otr.200.1617554992963;
        Sun, 04 Apr 2021 09:49:52 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id e34sm3379081ote.70.2021.04.04.09.49.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Apr 2021 09:49:52 -0700 (PDT)
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
	Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
	Rajendra Nayak <rnayak@codeaurora.org>,
	Stephen Boyd <swboyd@chromium.org>,
	Vinod Koul <vkoul@kernel.org>,
	Bhaskar Chowdhury <unixbhaskar@gmail.com>,
	Pan Bian <bianpan2016@163.com>,
	Sibi Sankar <sibis@codeaurora.org>
Subject: [GIT PULL] Qualcomm driver updates for 5.13
Date: Sun,  4 Apr 2021 11:49:51 -0500
Message-Id: <20210404164951.713045-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:

  Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-for-5.13

for you to fetch changes up to ac6ad7c2a862d682bb584a4bc904d89fa7721af8:

  bus: qcom: Put child node before return (2021-03-29 22:01:27 -0500)

----------------------------------------------------------------
Qualcomm driver updates for 5.13

This introduces SC7280 and SM8350 support in the RPMH power-domain
driver, SC7280 support to the LLCC driver, SC7280 support tot he AOSS
QMP driver, cleanups to the RPMH driver and a few smaller fixes to the
SMEM, QMI and EBI2 drivers.

----------------------------------------------------------------
Bhaskar Chowdhury (1):
      soc: qcom: Fix typos in the file qmi_encdec.c

Pan Bian (1):
      bus: qcom: Put child node before return

Rajendra Nayak (3):
      dt-bindings: power: rpmpd: Add sc7280 to rpmpd binding
      soc: qcom: rpmhpd: Add sc7280 powerdomains
      dt-bindings: firmware: scm: Add sc7280 support

Sai Prakash Ranjan (4):
      dt-bindings: arm: msm: Add LLCC for SC7280
      soc: qcom: llcc: Add configuration data for SC7280
      dt-bindings: soc: qcom: aoss: Add SC7280 compatible
      soc: qcom: aoss: Add AOSS QMP support for SC7280

Sibi Sankar (1):
      soc: qcom: smem: Update max processor count

Stephen Boyd (3):
      soc: qcom: rpmh-rsc: Remove tcs_is_free() API
      soc: qcom: rpmh-rsc: Loop over fewer bits in irq handler
      soc: qcom: rpmh-rsc: Fold WARN_ON() into if condition

Vinod Koul (2):
      dt-bindings: power: Add rpm power domain bindings for SM8350
      soc: qcom: rpmhpd: Add SM8350 power domains

 .../devicetree/bindings/arm/msm/qcom,llcc.yaml     |  1 +
 .../devicetree/bindings/firmware/qcom,scm.txt      |  1 +
 .../devicetree/bindings/power/qcom,rpmpd.yaml      |  2 +
 .../devicetree/bindings/soc/qcom/qcom,aoss-qmp.txt |  1 +
 drivers/bus/qcom-ebi2.c                            |  4 +-
 drivers/soc/qcom/llcc-qcom.c                       | 19 +++++++
 drivers/soc/qcom/qcom_aoss.c                       |  1 +
 drivers/soc/qcom/qmi_encdec.c                      |  8 +--
 drivers/soc/qcom/rpmh-rsc.c                        | 65 ++++++++--------------
 drivers/soc/qcom/rpmhpd.c                          | 56 +++++++++++++++++++
 drivers/soc/qcom/smem.c                            |  2 +-
 include/dt-bindings/power/qcom-rpmpd.h             | 26 +++++++++
 12 files changed, 137 insertions(+), 49 deletions(-)
