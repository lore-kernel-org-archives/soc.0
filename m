Return-Path: <SRS0=iMD+=LI=linaro.org=bjorn.andersson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05136C2B9F4
	for <soc@archiver.kernel.org>; Mon, 14 Jun 2021 21:55:55 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id DFD586128B; Mon, 14 Jun 2021 21:55:54 +0000 (UTC)
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A7D7061209
	for <soc@kernel.org>; Mon, 14 Jun 2021 21:55:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A7D7061209
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=bjorn.andersson@linaro.org
Received: by mail-oo1-f46.google.com with SMTP id i8-20020a4aa1080000b0290201edd785e7so3016579ool.1
        for <soc@kernel.org>; Mon, 14 Jun 2021 14:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kf+ubk5dO3qWw7TN9/qRwxXr2oNPOTNaRKSsNGShNAA=;
        b=GDqbFuweeTGZ2a1SSvdb2YxqmPw22uySKFenjY118WSwDgtend8M/LDZYCO+EW8lNk
         9WQWvr33aABEtxB+jhvAR1guKvaWaSn87URRr1Kb3HFJaYMgSzHlX/6BMD6FdfzEuRt1
         G2uCVV/zmkISVT+PNPdagwrfKLV9ewWQNZah4d9a7P5LMbIm3ig8FwGUeDBKBykO//5y
         M0wZkhw80DM124JUnmIHTpOXIEMF4GIuoqx7xYFDnlXS+hhF2pRGCK13Vj9VcQ2q9C8X
         J2zCl4XEvB0iEDONZOE4gfur+jcGqfFNHyQy6L8ZbWKRWOLAA796+RxPAGWRBFruKuiD
         lJsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kf+ubk5dO3qWw7TN9/qRwxXr2oNPOTNaRKSsNGShNAA=;
        b=YnC/qMZL7ipmCSuB+wXLAyKlKGdHrTE0/RKee/dcLQq4eGEwVDOF7Ez0J6JdZdWagi
         eLjl23FSrEXUh7anxLE24wN4U57MNFv7ODbrjAueDxrkgNY7YHJ8mSq7lhw9Cn+vL2uw
         ufLxgBk/ovOk4zI+pS4U1MwmG4PARSa6Lil2HlXYksAWZzS/9tIiykM6x/TQobBXKKKd
         qU/47Zcnpv8x9HykzK9ZtKjp62nP8kHYrg3Oaj7WuanJctJGGPL4+9LTIiKp+PHrij/B
         ajJlRTfGEFC3hF175lwzRMGF3PwtvltSzew+PLmu6azBRTaYS+E1eLr4roAIOTvA3WUo
         11Cw==
X-Gm-Message-State: AOAM532svomv1IvP/7aKr/DMKnzbA1kQ6LuM6wJPMu0Y75tmvl2WQWKV
	EjnnbjYtuSQr5c9Wms+azAxuQg==
X-Google-Smtp-Source: ABdhPJze60kY0BnVIC/EqWz/84ZLD/HN9a08aQnVqGtT9Kobfrdym6lfnyDs9jYH3P0ec10qMMDv4w==
X-Received: by 2002:a4a:a744:: with SMTP id h4mr14827938oom.26.1623707753931;
        Mon, 14 Jun 2021 14:55:53 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 3sm3362790oob.1.2021.06.14.14.55.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jun 2021 14:55:53 -0700 (PDT)
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
	Manivannan Sadhasivam <mani@kernel.org>
Subject: [GIT PULL] Qualcomm DTS fixes for v5.13
Date: Mon, 14 Jun 2021 16:55:52 -0500
Message-Id: <20210614215552.391887-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-dts-fixes-for-5.13

for you to fetch changes up to 0fa1baeedf06765ec6b441692ba2a2e83b7d17dc:

  ARM: dts: qcom: sdx55-telit: Represent secure-regions as 64-bit elements (2021-05-29 11:24:27 -0500)

----------------------------------------------------------------
Qualcomm DTS fixes for v5.13

Failure to properly define "secure-regions" as 64-bit ranges prevents
the two SDX55 boards from booting, so correct this.

----------------------------------------------------------------
Manivannan Sadhasivam (2):
      ARM: dts: qcom: sdx55-t55: Represent secure-regions as 64-bit elements
      ARM: dts: qcom: sdx55-telit: Represent secure-regions as 64-bit elements

 arch/arm/boot/dts/qcom-sdx55-t55.dts             | 2 +-
 arch/arm/boot/dts/qcom-sdx55-telit-fn980-tlb.dts | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)
