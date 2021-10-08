Return-Path: <SRS0=/M0+=O4=gmail.com=thierry.reding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F402C433F5
	for <soc@archiver.kernel.org>; Fri,  8 Oct 2021 20:11:40 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 371E061177; Fri,  8 Oct 2021 20:11:40 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0DD0C60F93;
	Fri,  8 Oct 2021 20:11:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0DD0C60F93
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id v25so33010400wra.2;
        Fri, 08 Oct 2021 13:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DuOD76MfsujRC/mf1UNyjK0xuxhstBg2jjBGBfCnQDQ=;
        b=cpSlimDtE43CAhY6fWlOlvfboM91zbP1jKnpGHSpM4FnqaHtQU+AJ6F5UiDv5959sI
         FRl8cWkl+E4qWX/qRJIMuZL+bd+q9Yi2QBEGItuMDvjHLbniSkcN/XkLqGeDhbPjz7Nn
         u4PjBCoCPDqDDp95u8AqFhKCeNAso1hpuWy9vziEtMdOALXDYkk4rtasVkCo8COVOeQO
         vsm/Jpc4IDDgnEXBIWQxknw6xLA4Bx2hR53AQSgWwyEb4oG8VvXTaOhHQaCEaqL6f8dJ
         FwJms3XVB2bCwymitvMIurOk1tvWz/Bq1MuMJBHkXptaehKOTMbBS9JM1XiO+T5fPKws
         LQIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DuOD76MfsujRC/mf1UNyjK0xuxhstBg2jjBGBfCnQDQ=;
        b=ziu/AzrS8ZpqDZEMZanHwElb/trqNgE3W9x9S3fkEPTRmEUunfqQWNVgZ38DrTkg1t
         s1AqsHAV0+TCKn3tbxgzqjoT/ZNBhgTxU4yhU+H5Lr4dd6YFy4OSoNRwUdES9UOPUHQj
         q6Vxc2xgVWctFSOVn0KNTiRClUdKeoT9w87y/c6BbUE1adCoiHBmQPOHFj6Mr5hk23Bd
         SLTLmF4iyDO4lsqWhpEnb3FHs1a815UoNYh4elQL4VSQRj1NKWJoZSo6NyZFWlHLjJYK
         B8vzXRrRPW7/5S1VPnoK7k/GBVQF86XVlqJ55R2M+TVbcxICFZSJpAkXPrtbmoBOJg8r
         Fbrw==
X-Gm-Message-State: AOAM532UJQxu0beUGfv5vkBXVfeuKeZ5fHb8hyV1vMnDt+6ntYEQd7mF
	p1lk/SgM82ODUfDNVs7hRNt/2GNgjw8=
X-Google-Smtp-Source: ABdhPJw0aRE8+q0mo6vF86bB5SkpC9YG82bp0sXnutrRfW3iiUP3RCi61ArUw7K6IKRas6Ol7OxOjg==
X-Received: by 2002:a7b:cf24:: with SMTP id m4mr5650335wmg.133.1633723898089;
        Fri, 08 Oct 2021 13:11:38 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id u1sm11734161wmc.29.2021.10.08.13.11.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Oct 2021 13:11:37 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 2/7] firmware: tegra: Changes for v5.16-rc1
Date: Fri,  8 Oct 2021 22:11:27 +0200
Message-Id: <20211008201132.1678814-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211008201132.1678814-1-thierry.reding@gmail.com>
References: <20211008201132.1678814-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.16-firmware

for you to fetch changes up to f11c34bddf8cd2a3107a7d11b6446c66deda9590:

  firmware: tegra: bpmp: Use devm_platform_ioremap_resource() (2021-10-07 20:52:24 +0200)

Thanks,
Thierry

----------------------------------------------------------------
firmware: tegra: Changes for v5.16-rc1

This contains a fix for a stack usage problem that was causing build
failures on 32-bit ARM and a minor janitorial cleanup.

----------------------------------------------------------------
Arnd Bergmann (1):
      firmware: tegra: Reduce stack usage

Cai Huoqing (1):
      firmware: tegra: bpmp: Use devm_platform_ioremap_resource()

 drivers/firmware/tegra/bpmp-debugfs.c  | 26 +++++++++++++++++---------
 drivers/firmware/tegra/bpmp-tegra210.c |  7 ++-----
 2 files changed, 19 insertions(+), 14 deletions(-)
