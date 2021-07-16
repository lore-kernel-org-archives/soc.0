Return-Path: <SRS0=4sxi=MI=gmail.com=thierry.reding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00C78C12002
	for <soc@archiver.kernel.org>; Fri, 16 Jul 2021 23:37:02 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id A7389613F1; Fri, 16 Jul 2021 23:37:01 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 76B2B613BB;
	Fri, 16 Jul 2021 23:37:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 76B2B613BB
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=thierry.reding@gmail.com
Received: by mail-wr1-f43.google.com with SMTP id k4so13806263wrc.8;
        Fri, 16 Jul 2021 16:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aFrqnuOxWnNghnHgreX5L4xNHEhiU0UDW3cJN11PLf8=;
        b=MvIuIMqjYumtbh44qjjRozsAAdYcITm/9s2p9OPQdA+GM2Ab66yw1p7V+Nl4ORdsLY
         xFqwMJIvGuB1AaMJ92DoSStF7ZM/UMZyl9Q76N0axfICJ7KsdTOXryahc4b83Cq/OScs
         xrml6AAI6H+uoZDRowqrQL1ZzVKY6wHlcH06/7iaimCIE4QNF3jNrAMWXWyCeMApMlFd
         vl1i+irnZ5haQtHWkY1PT3FpJjZBH/ll/x3G4EyQmedq5+S/tVsSo+LNgSurxWXqItJ9
         R9z4co1Pq34hmrXcIktMqTKQlkyT6i8jKsvlmTfds4yP47N2o65exVjdh3r2CTQCtlD8
         Obmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aFrqnuOxWnNghnHgreX5L4xNHEhiU0UDW3cJN11PLf8=;
        b=HDXWGt3sPX2OXihzj3m3/2tM3qpeAPw9OTyoQ9WfQ4HQ7M7fV6DcGtUP0BiGIX2IPp
         gxzI4o/mrj9aMFmloUoar9/bu3rUb6YUJruIvXg05/OhG42MgNrVCzwJc3EH4mm5jvbI
         L+uoYT/7HeTy63knplyavIDTZOtJ95lyeukEq/hf1rs2uS2rAcdP1zlE/riCu/La+oXC
         9wF+FOL546G0I8+7vlSyrGyhSncK70hGf2itwGoH0+0QsQXjpFvd2jIvk+/RpJJ5Ee9H
         T1iBLCz1hwzpvccL7/psP7tL3D/R68kMaOTkr8y/4qvWx1KUcEmUzXdMfmfENEXL9k2K
         OFUg==
X-Gm-Message-State: AOAM533e0skkAtuckiRdKQi5iV24v8bvZFxJej4KKBb0YCLMZE2RiB23
	4fWIVdU5RUneLbs/S+kVqbC+UlCPKi0=
X-Google-Smtp-Source: ABdhPJz4ustaG9g3xZy9RSyi5wlvAUtBExjgHaBvQOOm6zEhvFpT5mamVE8voUvEkbl79WTJlrq6Zw==
X-Received: by 2002:adf:f292:: with SMTP id k18mr15257499wro.265.1626478619581;
        Fri, 16 Jul 2021 16:36:59 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id o19sm260893wmr.18.2021.07.16.16.36.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jul 2021 16:36:58 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] arm64: tegra: Device tree fixes for v5.14-rc3
Date: Sat, 17 Jul 2021 01:38:58 +0200
Message-Id: <20210716233858.10096-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit c667dcd4dfcd515ad2c9b3953a33d742985a0b5e:

  arm64: tegra: Enable SMMU support for USB on Tegra194 (2021-07-09 16:50:44 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.14-rc3-arm64-dt

for you to fetch changes up to ba02920c51debb9198e72b3a8726a7c5ae4ffb41:

  arm64: tegra: Enable SMMU support for PCIe on Tegra194 (2021-07-17 01:27:10 +0200)

Here's another fix for SMMU support affecting PCIe that Vidya found. We
do have a lack of test coverage in this area that we're working to fix.

Thierry

----------------------------------------------------------------
arm64: tegra: Device tree fixes for v5.14-rc3

This contains one more fix for SMMU enablement on Tegra194, this time
for PCIe.

----------------------------------------------------------------
Vidya Sagar (1):
      arm64: tegra: Enable SMMU support for PCIe on Tegra194

 arch/arm64/boot/dts/nvidia/tegra194.dtsi | 60 ++++++++++++++++++++++++++++----
 1 file changed, 54 insertions(+), 6 deletions(-)
