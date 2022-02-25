Return-Path: <SRS0=d2Xh=TI=gmail.com=thierry.reding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CC73C433EF
	for <soc@archiver.kernel.org>; Fri, 25 Feb 2022 16:47:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 09AABC340F2; Fri, 25 Feb 2022 16:47:49 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 61796C340E7;
	Fri, 25 Feb 2022 16:47:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 61796C340E7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id d3so5437854wrf.1;
        Fri, 25 Feb 2022 08:47:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Jqez2ASWm8yfcVM64bGimZztQHH7JgrjZ5N5ycpQJ98=;
        b=dJ583PiDSsc0CTIFoORKzTJnFbabL/WJ3XAuT4T13ac5lop0E1FyKH6kmoaLErKT7y
         +lAF3f3T0vgxm8uitLDHVs+fS5l6/Fln8btcP7eNzIhssGtmTXGfIN3oHpMiixRZSMRT
         XrHwP0B6hXC3pAcz7KLhsonHNk3KMuKGoMFNNP1oo3vgKogKCTejLtowe2iOot8ReZjk
         r5DWMqt4RLfZmygi4TW+NcU2ppdEMxfd3d/3zrgG11G4oAIgtYJYt3EW0t9jG45rEcrS
         E0DOSN+5OuoUHVm0PNbbYGJ1shq2yIugkIvNbALS6TsJAlcIhUBWbnvS5whKPdum1PdL
         6iGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Jqez2ASWm8yfcVM64bGimZztQHH7JgrjZ5N5ycpQJ98=;
        b=qMfL0H6ROjnH1ipSzZ7Jud3PPJO0uRo+P9Ix+0W83OR75hmAj3WGpETjqK1sEuXijH
         Y4etnQS2Ky0o1GvnQp3NrjCzOjKeSF50kJq822OxK4F03hp4w/nb260HSKoCY80NifZh
         gnCUKt61xA0Wk/8nnVINOgYMIDWA4M/6we9AB7chp44a9oyoASaudghsbIIy6QSjYnW8
         rdhGoIaybao2NC0ZbiefiQbtvBpI6BQGPkdKYyql4AqrRVNG63UOed4nXVbYu7hoby/j
         YmiDq1W6p/NvjkwBDQcN3J65N39GFdhax8Q/NmZq9QNe0rKSNV7Zr7nWmiA9J7l+LELR
         C25A==
X-Gm-Message-State: AOAM531Y2p3c/UajYXLao/l9X6naHJaJZw1W3+77dq2nUZqZz/WOVtJc
	5S+Ul+UCS5CnAf9bOdp+tWLkjLnYnjs=
X-Google-Smtp-Source: ABdhPJxt4R2rH0g0wJNhaKs5g/tkqacC9iwePLzEU/roQ9c2kuVZC5CygKyYx4/H7yxxqlz9SpK8DQ==
X-Received: by 2002:adf:8067:0:b0:1ea:9c01:d8f3 with SMTP id 94-20020adf8067000000b001ea9c01d8f3mr6872706wrk.556.1645807665986;
        Fri, 25 Feb 2022 08:47:45 -0800 (PST)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id t14-20020a5d460e000000b001edc107e4f7sm4036873wrq.81.2022.02.25.08.47.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Feb 2022 08:47:45 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 1/5] soc/tegra: Changes for v5.18-rc1
Date: Fri, 25 Feb 2022 17:47:37 +0100
Message-Id: <20220225164741.1064416-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.35.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07:

  Linux 5.17-rc1 (2022-01-23 10:12:53 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.18-soc

for you to fetch changes up to fcfaff508b9fa9ad6d8a17d4855e3ec7382886ae:

  soc/tegra: bpmp: cleanup double word in comment (2022-02-25 14:10:09 +0100)

Thanks,
Thierry

----------------------------------------------------------------
soc/tegra: Changes for v5.18-rc1

This contains the final bit to enable advanced power management on
Tegra20 and Tegra30. It also contains some cleanups and wake event
support on Tegra234.

----------------------------------------------------------------
Dmitry Osipenko (1):
      soc/tegra: pmc: Enable core domain support for Tegra20 and Tegra30

Thierry Reding (1):
      soc/tegra: fuse: Explicitly cast to/from __iomem

Tom Rix (1):
      soc/tegra: bpmp: cleanup double word in comment

kartik (2):
      soc/tegra: fuse: Update nvmem cell list
      soc/tegra: pmc: Add Tegra234 wake events

 drivers/soc/tegra/fuse/fuse-tegra.c | 24 +++++++++++++++++++++---
 drivers/soc/tegra/pmc.c             | 16 +++++++++++-----
 include/soc/tegra/bpmp-abi.h        |  2 +-
 3 files changed, 33 insertions(+), 9 deletions(-)
