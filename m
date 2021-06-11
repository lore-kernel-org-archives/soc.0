Return-Path: <SRS0=Sd91=LF=gmail.com=thierry.reding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9FDEC48BD1
	for <soc@archiver.kernel.org>; Fri, 11 Jun 2021 16:43:16 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id D1864613D0; Fri, 11 Jun 2021 16:43:16 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A6EA06100A;
	Fri, 11 Jun 2021 16:43:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A6EA06100A
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=thierry.reding@gmail.com
Received: by mail-wm1-f46.google.com with SMTP id l9so8453025wms.1;
        Fri, 11 Jun 2021 09:43:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kf0RMu96Wd7ucBmuszu/MWcsjJuodgKxcHrTJqiSFWM=;
        b=iez4rN3vAMHTJIPw2rqGcFe2ApmgbqvQnn+9CpLUWSibs/OeCbNnSVgv3GGKoghC+S
         5fsnNSjwi1bTmhqRtGLauAxXQjSmMZfp4tRqkkqQ37aqobJPwb+7wRskwfQhe84H6rxL
         Qtf+VZL1AnhmTDrki9VdxooGT7kv8tyfT019TSAKELGgfNNpzdZ/WmsphvV1LQ0l6prQ
         HknaZdlHFXjF7CKEl+8pVYd+CNcAvqAho964qMepsN6pHdfEuTR93zTJ9eRE2/XD8S5P
         wGN8/wLlXytNZ/6f6hu54LCrttPat0uvRyCpUlIBzLXHE7hIEAvK236UR68r9GCTCcIN
         bj3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kf0RMu96Wd7ucBmuszu/MWcsjJuodgKxcHrTJqiSFWM=;
        b=RsFPhgwD6bENeEIBmhDo1UTRIMCluFmfTxESV9uLvZKPLMO1V8pOGNLuU+ktkamBA4
         ymbVfOtOoCSX7IBV6SrIHroOslyvowuoMFvClA7U3ej7dpaWyeN1gcaatpuZ2fl0MGNZ
         Dle4O7aMNkJemHDqgQKtOpWTpbSYhPljgfPK77WVKvj2ECJjjHNzLjlWtPnTFGQoh+as
         MEwP3ypkMlGKlzHhRQIdkUUgJM6NaUvOqPRFMudBaa3MKeqaUs7B6a7ZBSR1B/EjNbrz
         EbFetKIafWdQbGJfpL9o4FC9B74NSlAyi2eFQQCtQey6MFBUTifYUVsu9y5Evt0FIEc5
         Nulg==
X-Gm-Message-State: AOAM533jxDGLTtLApN8vZxa8EZ9VyGjt5BrCWNoaUckPTn6ZN2Aq2yBY
	x8nguthbmFQ7ZDN9bcu/4n3ENB2LnVY=
X-Google-Smtp-Source: ABdhPJxrExfJMaXN5MHYDcipIcjUhjeVg0YmkBliymAlsgthJyItoy35E7ZHDiFs7rW8X5omCVe0Vw==
X-Received: by 2002:a1c:2142:: with SMTP id h63mr4982551wmh.84.1623429794246;
        Fri, 11 Jun 2021 09:43:14 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id m132sm6612796wmf.10.2021.06.11.09.43.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jun 2021 09:43:13 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 6/6] arm64: tegra: Device tree changes for v5.14-rc1
Date: Fri, 11 Jun 2021 18:44:37 +0200
Message-Id: <20210611164437.3568059-6-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210611164437.3568059-1-thierry.reding@gmail.com>
References: <20210611164437.3568059-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.14-arm64-dt

for you to fetch changes up to c7289b1c8a4e10bbbdb7097a71a90652beb767a1:

  arm64: tegra: Enable SMMU support on Tegra194 (2021-06-11 13:33:46 +0200)

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Device tree changes for v5.14-rc1

Contains changes to consolidate audio card names, adds audio support on
Jetson Xavier NX and enables SMMU on Tegra194.

----------------------------------------------------------------
Jon Hunter (1):
      arm64: tegra: Add PMU node for Tegra194

Sameer Pujar (1):
      arm64: tegra: Audio graph sound card for Jetson Xavier NX

Thierry Reding (4):
      arm64: tegra: Consolidate audio card names
      arm64: tegra: Use correct compatible string for Tegra186 SMMU
      arm64: tegra: Hook up memory controller to SMMU on Tegra186
      arm64: tegra: Enable SMMU support on Tegra194

 arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts |   4 +-
 arch/arm64/boot/dts/nvidia/tegra186.dtsi           |   4 +-
 arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts |   4 +-
 .../arm64/boot/dts/nvidia/tegra194-p3509-0000.dtsi | 595 ++++++++++++++++++++-
 arch/arm64/boot/dts/nvidia/tegra194.dtsi           | 100 ++++
 arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts |   2 +-
 arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi     |   2 +-
 arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts |   4 +-
 8 files changed, 705 insertions(+), 10 deletions(-)
