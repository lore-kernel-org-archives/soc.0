Return-Path: <SRS0=fHdP=DM=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E87C3C0015E
	for <soc@archiver.kernel.org>; Wed, 26 Jul 2023 08:48:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B66D5C433C8; Wed, 26 Jul 2023 08:48:19 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EED1DC433C9
	for <soc@kernel.org>; Wed, 26 Jul 2023 08:48:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org EED1DC433C9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-51d95aed33aso9196786a12.3
        for <soc@kernel.org>; Wed, 26 Jul 2023 01:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690361296; x=1690966096;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pBt6LabizIPlGKQw7TnJxCRLQnfQUO6NlY0tbyWu7+M=;
        b=WCBv0DeY0PiKsTPetO22VSX3HdQmMlsw/msR2qHb9PdpkvZ5LJ2duWV9dNTPu45izc
         lqtwn3XVOu4SHNEQxE7ee13sC+RoIGaPV6DoLXZE+uobutKPYyw7qYNTGiaFdAIUTZeg
         L7ir9j2etXNQ/FfJrN5QkImu904ZO9XQlRy1c6RmxN8kq+u5Hx9PQfJ1ZwCzSxg+fYAD
         ygecbWaJaLfA6b0Xcc5Q2sIOEkUyZ90wpzI1Pqb40+rFbP3udiOkTe08Hui9AUgCTQA6
         gRMuLm6ui0E6AFAZ5nm3Ve//FOCTgAQd7RYL+Rs1aMY0nQMiJVHbH0mXfO8oEDt8xWjG
         Re0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690361296; x=1690966096;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pBt6LabizIPlGKQw7TnJxCRLQnfQUO6NlY0tbyWu7+M=;
        b=JtLoLrEaiaE2Zy7cPM70iyveAJEFDHrqzctn6AajTlf9PfCTQ00bkH3r9NMSddvrv2
         I++1ducEwyULSZHVQbZzBlMWZ1tu+0cMAwjWdXFigfifzFNF4939kPMNCMavWJnjG/Am
         6g3+1XsGoWqSHzldozsM9SsDS5g0BFb7vyRN1f7GBH+0Y1QqgfI31QFCRbgLF/W2Ib43
         gb1cThox4tb1zhjFbsU+apZ354+RPuh4L7iD8kkjA6k35UbkxwP8uh4pgpCgKzu7fBKC
         3TCLzgK81dqLVbiRdPrym79wJMZZrNjzmQQqIXNAi93XAFIYYQkxBvyeN+U/2Y32FS7c
         Dq5w==
X-Gm-Message-State: ABy/qLbUXddiXs+vuIR/u9HFINGGhPxjsRZ3eIo/u8woEITz2NIqhTKg
	jd+I26l4y/DWCt0MP8ipDrmXWO0gEvQRDNpJNwk=
X-Google-Smtp-Source: APBJJlEtwc0nAd/v1e2LQoPdUChw3xWAxiQ1w6NNikuEi4EKj3d0tYxESZEY6zC9Qdyb6DWkEZwbPA==
X-Received: by 2002:aa7:cd5a:0:b0:522:5778:ee2d with SMTP id v26-20020aa7cd5a000000b005225778ee2dmr1127763edw.19.1690361295341;
        Wed, 26 Jul 2023 01:48:15 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id n23-20020a056402515700b00521da86cbcdsm8494107edd.7.2023.07.26.01.48.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jul 2023 01:48:14 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>,
	Arnd Bergmann <arnd@arndb.de>,
	arm@kernel.org,
	soc@kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Thierry Reding <treding@nvidia.com>,
	Jon Hunter <jonathanh@nvidia.com>
Subject: [GIT PULL] memory: fixes: Tegra drivers for v6.5
Date: Wed, 26 Jul 2023 10:48:11 +0200
Message-Id: <20230726084811.124038-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Arnd and Olof,

Two fixes for current cycle.

Best regards,
Krzysztof


The following changes since commit 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5:

  Linux 6.5-rc1 (2023-07-09 13:53:13 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl.git tags/memory-controller-drv-fixes-6.5

for you to fetch changes up to faafd6ca7e6e7100d21d3f43ec17674f36c9f843:

  memory: tegra: make icc_set_bw return zero if BWMGR not supported (2023-07-25 22:09:20 +0200)

----------------------------------------------------------------
Memory controller drivers - fixes for v6.5

Two fixes are needed for Tegra194 memory controllers caused by the same
Tegra PCI commit merged in v6.5-rc1.  The Tegra PCI requires now
interconnect from the memory controller, which was set only for
Tegra234, but not for Tegra194, causing probe deferrals.  Expose some
dummy interconnect provider for Tegra194, to satisfy PCI driver needs.

----------------------------------------------------------------
Sumit Gupta (1):
      memory: tegra: make icc_set_bw return zero if BWMGR not supported

Thierry Reding (1):
      memory: tegra: Add dummy implementation on Tegra194

 drivers/memory/tegra/mc.c       | 37 +++++++++++++++++++++++++++++++++++++
 drivers/memory/tegra/tegra194.c |  1 +
 drivers/memory/tegra/tegra234.c | 27 +++------------------------
 include/soc/tegra/mc.h          |  3 +++
 4 files changed, 44 insertions(+), 24 deletions(-)
