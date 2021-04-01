Return-Path: <SRS0=6LjJ=I6=gmail.com=thierry.reding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0E4CC433B4
	for <soc@archiver.kernel.org>; Thu,  1 Apr 2021 17:26:03 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 73CDC613BA; Thu,  1 Apr 2021 17:26:03 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 04CF9613B9;
	Thu,  1 Apr 2021 17:26:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 04CF9613B9
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=thierry.reding@gmail.com
Received: by mail-ej1-f50.google.com with SMTP id b7so4046890ejv.1;
        Thu, 01 Apr 2021 10:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=REwstNQho+0HF6CmmQ9jvF2oPascfGsNa3A+M63+ZoA=;
        b=sxlOIJzZWh+CM7b7PEGZxLFNmCHPX6k8wsPuZ6h2RIHxQ0LKn/Lxg1y+Y3CEr8pR1L
         vyBGPjPtURl7QlifNLXLDJondO6It08jh0ZWcQVaKiQFiZ/U688PazfVCeubkHrMduUi
         9Kp7t9jF33JvgaMh8/eoiN2GNvhCfsXLfW7OWr/xpSQo8ThPPPqqyk9+Z9YME8uh9ssT
         vN+W3bpuoF/G0RPRTWrN199/fhPtfcyc8RIOWVgXdd0CFycQU2BjKZKDDdWZ3KOIjLsp
         GbRm/AyKxmCKL1oOee0YjrY0UOI0N+SEThm6AJHL3Ccr7fBEyLnfb8LqBLBh7xG5GGYp
         DYcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=REwstNQho+0HF6CmmQ9jvF2oPascfGsNa3A+M63+ZoA=;
        b=oeh2K/JKZvZo2MjJcBIQfEA608NAyVefdUo8mvyL3Zej2dCLrmhK/+aAbb7uTJELVZ
         Zqz+QekcxtHoMAEG4yXWRUGyIR8MskG3vIT5I8MAzvd/aA7i93CsoXf6R8yoQzhhCYsC
         17bv2j3MYJlZepIy1jZtrR/Io4xONkOX/mm+nA3ahnZLfQzIL2K4RY1apVl8pehZJbRh
         /gNfPv6UVn2NPPd+AvIYXCefNflPrl91eVzj/DXajF9AXqkM3azVXIkfZ70eRkHTQOWk
         /NPWKnbr7hvpVuCfbZzG1je5Zq1GD4lIuoNFaTLSry9J76VGct27hi+7GStrkNUiZVSO
         yfAQ==
X-Gm-Message-State: AOAM532EM3ZFpZy7okKk9ogWgfLBjLUA2GWwI47ysngc0l5ivRqmydQq
	IXnekcFhrbVfGphsQjW2JxIrVXZow3U=
X-Google-Smtp-Source: ABdhPJxE13Lorh6skVD7dPNFfE3hH5Aow2jkICl6k92P5R+PgadH2/fn/9VFL8Fy9EYLRoXz6Hzn1g==
X-Received: by 2002:a17:907:629c:: with SMTP id nd28mr10385959ejc.267.1617297960950;
        Thu, 01 Apr 2021 10:26:00 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id hd8sm2995528ejc.92.2021.04.01.10.25.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 10:25:59 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 2/5] clk: tegra: Changes for v5.13-rc1
Date: Thu,  1 Apr 2021 19:26:19 +0200
Message-Id: <20210401172622.3352990-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210401172622.3352990-1-thierry.reding@gmail.com>
References: <20210401172622.3352990-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:

  Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.13-clk

for you to fetch changes up to 0c7ea2b1c850756140fef03bed0fbaf0957f120a:

  clk: tegra: Don't enable PLLE HW sequencer at init (2021-03-24 14:02:14 +0100)

Thanks,
Thierry

----------------------------------------------------------------
clk: tegra: Changes for v5.13-rc1

This adds PLLE HW sequencer support which is necessary for USB sleepwalk
functionality.

----------------------------------------------------------------
JC Kuo (2):
      clk: tegra: Add PLLE HW power sequencer control
      clk: tegra: Don't enable PLLE HW sequencer at init

 drivers/clk/tegra/clk-pll.c      | 12 ---------
 drivers/clk/tegra/clk-tegra210.c | 53 +++++++++++++++++++++++++++++++++++++++-
 include/linux/clk/tegra.h        |  4 ++-
 3 files changed, 55 insertions(+), 14 deletions(-)
