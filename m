Return-Path: <SRS0=Yn7A=LT=canonical.com=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA850C2B9F4
	for <soc@archiver.kernel.org>; Fri, 25 Jun 2021 07:36:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 8821D61428; Fri, 25 Jun 2021 07:36:10 +0000 (UTC)
Received: from youngberry.canonical.com (youngberry.canonical.com [91.189.89.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 31F3C613FA
	for <soc@kernel.org>; Fri, 25 Jun 2021 07:36:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 31F3C613FA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=krzysztof.kozlowski@canonical.com
Received: from mail-wm1-f69.google.com ([209.85.128.69])
	by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <krzysztof.kozlowski@canonical.com>)
	id 1lwgNk-0003jG-F7
	for soc@kernel.org; Fri, 25 Jun 2021 07:36:08 +0000
Received: by mail-wm1-f69.google.com with SMTP id o29-20020a05600c511db02901e8210bb40dso235615wms.0
        for <soc@kernel.org>; Fri, 25 Jun 2021 00:36:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nbaaKHR5ZpYe85F3BN+ohVLxdeR5Xvy5GBXCZuo0Jew=;
        b=cRKZZbg8ukO9qxIw2EqXy+EkZPvOoa10ELCzFrwjg4P/W59DR/+lM5lvRWN7DeyUKO
         R5ETP1+6YPbKBd+fEJtJVrEd6kYmjvZzPO7Nt1QOd10wgIGlwSdsuuifmOUU/p706JcR
         9dxrHRlbHWF1bXF4KGjhC1M0rLZscA2AQhIU0YY2QrQ8OfthLAQLJAK9OWsHRX3lYm14
         WfccIKIWGsRI+mbtEhLzfm5/d5pfZbARAAw1PKqiXmW4XFj6M6F3eVMao9EuD9G0TQVb
         uKMUT/aDVDGw2bZvzw7Sz/Jl46DSKx8r/iFRESInpVNkWzSq0y68FLQFwil0KRAStvAM
         ui7g==
X-Gm-Message-State: AOAM532zgq8R6lCD+oWF5xeUk2rlXyByarm0+/QtzNcB8tPPH2BhZuLY
	ozzCzrlPX81LTu476juFZH7szj6iMEfRKTwKWgSDAupXSkk26NoHdm2bIuXDDTB6FbTxpPwP3I9
	JwJTPwtz76vqZK8K1EYQ4dg8=
X-Received: by 2002:adf:f48c:: with SMTP id l12mr9338947wro.194.1624606568268;
        Fri, 25 Jun 2021 00:36:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz3dKrCURHFg3PIpYiy6kcKs/cc8ALeRf55hqXv9kAgRiaHVuodNNseBYhflvBvEBS/f5ZiPg==
X-Received: by 2002:adf:f48c:: with SMTP id l12mr9338931wro.194.1624606568114;
        Fri, 25 Jun 2021 00:36:08 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-177-222.adslplus.ch. [188.155.177.222])
        by smtp.gmail.com with ESMTPSA id d3sm5343681wrx.28.2021.06.25.00.36.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jun 2021 00:36:07 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>,
	Arnd Bergmann <arnd@arndb.de>,
	arm@kernel.org,
	soc@kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Thierry Reding <treding@nvidia.com>
Subject: [GIT PULL] memory: tegra for v5.14, late fixes
Date: Fri, 25 Jun 2021 09:36:04 +0200
Message-Id: <20210625073604.13562-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Late fixes for Tegra memory controllers drivers for issues introduced in this
branch in previous tags.

On top of previous pull (memory-controller-drv-tegra-5.14-2).

If it is too late, I can send as fixes after merge window, but maybe better to
get these into merge windows earlier.

Best regards,
Krzysztof


The following changes since commit 2c1bc371268862a991a6498e1dddc8971b9076b8:

  iommu/arm-smmu: Use Tegra implementation on Tegra186 (2021-06-11 08:44:53 +0200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl.git tags/memory-controller-drv-tegra-5.14-3

for you to fetch changes up to bf3ec9deaa33889630722c47f7bb86ba58872ea7:

  dt-bindings: arm-smmu: Fix json-schema syntax (2021-06-23 07:55:10 +0200)

----------------------------------------------------------------
Memory controller drivers for v5.14 - Tegra SoC, late fixes

Two fixes for recent series of changfesi n Tegra SoC memory controller
drivers:
1. Add a stub for tegra_mc_probe_device() to fix compile testing of
   arm-smmu without TEGRA_MC.
2. Fix arm-smmu dtschema syntax.

----------------------------------------------------------------
Thierry Reding (2):
      memory: tegra: Add compile-test stub for tegra_mc_probe_device()
      dt-bindings: arm-smmu: Fix json-schema syntax

 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 6 ++----
 include/soc/tegra/mc.h                                | 9 +++++++--
 2 files changed, 9 insertions(+), 6 deletions(-)
