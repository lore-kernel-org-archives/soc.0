Return-Path: <SRS0=iMD+=LI=linaro.org=bjorn.andersson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54E4AC2B9F4
	for <soc@archiver.kernel.org>; Mon, 14 Jun 2021 22:38:42 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 30E9C61378; Mon, 14 Jun 2021 22:38:42 +0000 (UTC)
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 111E06124B
	for <soc@kernel.org>; Mon, 14 Jun 2021 22:38:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 111E06124B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=bjorn.andersson@linaro.org
Received: by mail-ot1-f48.google.com with SMTP id 6-20020a9d07860000b02903e83bf8f8fcso12394588oto.12
        for <soc@kernel.org>; Mon, 14 Jun 2021 15:38:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EdHc/AxSkP+B70QGXtT/aVMYWMcBsbv+TEZwsL21ckU=;
        b=mCb2TXDTwhE4FEtPNA/TpAkjiNGklA6mfl8axXo4tK525o5v+zfhoPrKoNzw/MXKNe
         z5eb+9p6ss5BpDJEccjK4Q+onsgxWc+bUHOnnYR9GN4as/c7C1easVB8kQVMtFIc+gwN
         9XeDq3olp87AqtVR/P7S90ILEEQAxpOJkDvXGBIarf//sMJIIkPLYZL9n1apNqQK4YTy
         NSobicHh2yUs8IzJaWQMn7jBJb8EUED9oiRXzBbs/2cyjJflPr472oMUhR9mcEQuBtyF
         cNawO38eIrt/e+3AAvesAkUWkjHkRfmtUDZEVHdlNWMH4osSwqaaTpc8CWu4lagZhOrp
         UoVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EdHc/AxSkP+B70QGXtT/aVMYWMcBsbv+TEZwsL21ckU=;
        b=Tck6vQOXQC6McyyD9Rrtaz9Tgl/p7+1gPK6EJ5hBPMHIrSDHSIcmEDcXO7EtyeqCrm
         kWlhThMmCexaCVKCk/2XvTq/ryhuYt2J4nRlWZVyeOBPxsm7ts14uTQXEsmtMxR1l5R1
         5U4f+4Hk4ULyV1CsYhPIe6I8g5N0iJKudWmSFp66PKE2CDjb1xntexS5CyPrwWSGPFcH
         jlY4WYeeHVm+BtEZefoFled6Xu0cXcFOzii15stPUyzsev4Bsg143DLNGk0slXUYc8kl
         9rTBm43XV8As3Y1uXZk3kq3v9NjrK0vU0qm2OxffDvH0vlVipRfcoNXhMAtFkjght4CD
         z+Ag==
X-Gm-Message-State: AOAM5323Gr1DAvNHnm9BS4no5E1J4oASUdzERgBEIo04jdGu3rdKtVIj
	ymfO36VD7oD3+LXuEYQus7wVMQ==
X-Google-Smtp-Source: ABdhPJyX5H0T9BOTWQ6nUh3uF2mKqVo3hx7K8ZqUddihisusNh3QjDfIZMhEGBGypewfXbeE+lgBuA==
X-Received: by 2002:a9d:6b83:: with SMTP id b3mr15358658otq.325.1623710321397;
        Mon, 14 Jun 2021 15:38:41 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id p1sm3423879oou.14.2021.06.14.15.38.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jun 2021 15:38:41 -0700 (PDT)
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
	Jonathan McDowell <noodles@earth.li>
Subject: [GIT PULL] Qualcomm DTS updates for v5.14
Date: Mon, 14 Jun 2021 17:38:40 -0500
Message-Id: <20210614223840.393224-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-dts-for-5.14

for you to fetch changes up to 2011fc7a8b5b7415d7cd885fc84ada88d37569d3:

  ARM: dts: qcom: Enable NAND + USB for RB3011 (2021-05-31 10:56:25 -0500)

----------------------------------------------------------------
Qualcomm DTS updates for v5.14

This adds DMA, NAND controllers, USB controller and PHY, RPM, L2CC,
thermal sensors and defines thermal zones. It them enables these for the
RB3011.

----------------------------------------------------------------
Jonathan McDowell (5):
      ARM: dts: qcom: Add ADM DMA + NAND definitions to ipq806x
      ARM: dts: qcom: Add tsens details to ipq806x
      ARM: dts: qcom: Add USB port definitions to ipq806x
      ARM: dts: qcom: add L2CC and RPM for IPQ8064
      ARM: dts: qcom: Enable NAND + USB for RB3011

 arch/arm/boot/dts/qcom-ipq8064-rb3011.dts |  58 ++++
 arch/arm/boot/dts/qcom-ipq8064.dtsi       | 425 ++++++++++++++++++++++++++++++
 2 files changed, 483 insertions(+)
