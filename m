Return-Path: <SRS0=NGH2=F3=gmail.com=thierry.reding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51A88CDB482
	for <soc@archiver.kernel.org>; Fri, 13 Oct 2023 15:37:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 19762C433C9; Fri, 13 Oct 2023 15:37:28 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 47C36C433C8;
	Fri, 13 Oct 2023 15:37:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 47C36C433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-53e2308198eso2923322a12.1;
        Fri, 13 Oct 2023 08:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697211445; x=1697816245; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7RR80S9VVoI26pp6PPSfkckIvUSInMqHwCFYPrN8cEo=;
        b=b6lVllftWy4TopUpvMXwLpSnLvBW28B2pQVsVTN+fJqO+a+Y2J6DJRq4p8EAgVjQ94
         NHWNXAPaiK6L8c3mrDEmySl9Lf/Yx2bZKxIj145uyKiy48FwneJA9XC0T9FcfeULpOK2
         QCqMp2xC5ZNyQNB48ZleCT5Dd8wUKcJSO0UXIjGbZJa4MpouJg+FpshZtaLfpdsDdVuo
         VSsXZVj/lWZt7X1AJkJVZ3r1kNyqero9DEdDvWqSLQ+g/ycX0ZrimmIwIO5jMKCNBoAL
         LI+//uPTZo2Y0xhTcvPCcDJxz5LZeda2hASH8CLTJ+RTp8xUvVyEXjb4Uk5wi/wtIRaY
         QoZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697211445; x=1697816245;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7RR80S9VVoI26pp6PPSfkckIvUSInMqHwCFYPrN8cEo=;
        b=DTVn3OXB2k1B2L7ndFtOCxcJ0EdluEf3hmLRZnUmxMHArL1+eHKZmMETz+mdb5KsuY
         vvjxu3SSgGKu3CJoeipTvlg59wEShO3XgINpXzm6Azen8TJVTsIz3ax4wsUwKjSNuL3e
         m5mlNbQia49tewVizypJG4Qj/C5IS5/YHVPEWPkTGDjRSgOYGWbmJCMsA/DZfJY+Rcrb
         12j2+VRS6IV5UkwHnXGFtv+kXi3NHjhgMkQMKS9lUEAHcEHToi95voNPmYEVyIb3TO90
         Lt/IX8y7J5TVuCoKuvHI4WWFP1DnUNjtVkg/E6P+mThMYOTvJW70iSiBnGO+qsosDtJG
         KQ2Q==
X-Gm-Message-State: AOJu0YzrNWrcZ+mwGwHdfRnJbiVpGXSNqzwG7zj/hAOp5kQ3hefkyQ4V
	vfRtcQAhC5Y9IOArgcrlbD1PDva+KpM=
X-Google-Smtp-Source: AGHT+IG5PxYwOsDh+FYajoOlxlehnSCwwf3OTVC3VUnLrvW1x5jPaopvsu6MPB+7CANkPirBN9MyDg==
X-Received: by 2002:a05:6402:f25:b0:53d:d4e7:af5f with SMTP id i37-20020a0564020f2500b0053dd4e7af5fmr8435837eda.13.1697211444873;
        Fri, 13 Oct 2023 08:37:24 -0700 (PDT)
Received: from localhost (p200300e41f3f4900f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f3f:4900:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id c25-20020aa7d619000000b0053622a35665sm11456083edr.66.2023.10.13.08.37.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 08:37:24 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 1/6] soc/tegra: Changes for v6.7-rc1
Date: Fri, 13 Oct 2023 17:37:17 +0200
Message-ID: <20231013153723.1729109-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.42.0
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit 0bb80ecc33a8fb5a682236443c1e740d5c917d1d:

  Linux 6.6-rc1 (2023-09-10 16:28:41 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.7-soc

for you to fetch changes up to cda263907a6f88c75fb97cf7adecffaafb6237ec:

  soc/tegra: pmc: Drop the ->opp_to_performance_state() callback (2023-10-13 13:58:36 +0200)

Thanks,
Thierry

----------------------------------------------------------------
soc/tegra: Changes for v6.7-rc1

This contains a few minor cleanups for PMC and CBB.

----------------------------------------------------------------
Ulf Hansson (1):
      soc/tegra: pmc: Drop the ->opp_to_performance_state() callback

Uwe Kleine-König (1):
      soc/tegra: cbb: tegra194-cbb: Convert to platform remove callback returning void

 drivers/soc/tegra/cbb/tegra194-cbb.c | 6 ++----
 drivers/soc/tegra/pmc.c              | 8 --------
 2 files changed, 2 insertions(+), 12 deletions(-)
