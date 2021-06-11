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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71F21C48BE0
	for <soc@archiver.kernel.org>; Fri, 11 Jun 2021 16:43:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 55F346100A; Fri, 11 Jun 2021 16:43:07 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C80261357;
	Fri, 11 Jun 2021 16:43:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2C80261357
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=thierry.reding@gmail.com
Received: by mail-wm1-f49.google.com with SMTP id y13-20020a1c4b0d0000b02901c20173e165so1024412wma.0;
        Fri, 11 Jun 2021 09:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1PGvWqmX79u2BDZddtKUNdJQ6hsV0VE7RF8nOBTNFPA=;
        b=QA5BVIhdRSLFSHl4Nt2kT2P14yFLZ/x9o/azS5r3wS6A3DFy5r2knf3shzwsymne/W
         TiACsvGeFHuftNHEQ+LeZ/mzkB2stV9I/xvCadQ4fk7M3IxVpvomQI+t5WoBWX2bwG7h
         QVpBJtR/56OTEQhnaWLquAokQvUmTFo7mZWp0H1BXTz0PHjfAmOk8xywHZ8+H06zGyq3
         q6oP9pp3VpqWpJxCp2met1k5d6zniIHx8Ehuv6d/bg+6umfQgi11EDv2fwrjw0OlH1Zv
         stZPAZ/m0lg+V51fWQZX8NLMQv5uRR20oYe7hgliN4hgBoD/5DKPmMwbOktJMxmiyFzP
         NEFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1PGvWqmX79u2BDZddtKUNdJQ6hsV0VE7RF8nOBTNFPA=;
        b=NZmJ9U23rbLGIW5cA//dE/CMd0jWX2NNLUD4QE8j5BTVc10DKdHMguQUEFBWVMN9CD
         vRFS0biGfhycB7uRKKsEKpE+6bEFLrTOMjV+psuNV63CCsIXIMz4BL312xSAixjV583Z
         VusFuMEMu7Qdh5Ub7CHUXH6yCP/JRcQz1qOtbTJdu0rH0Wj3Prhp61p/Ie9/DrABAmt7
         zroWgD4blO3yoL8FcQwM2rCQ9K52J30VGaNIwzbifDK2pD7hXAm13HWQPoKFaPfuBM00
         6mKrBpJ0ricVq3d1Oq/59s5S3vT6vRcPb0q7YkqAH3JUVVWXijM66XTfT2AX1uNaYpG2
         2N+w==
X-Gm-Message-State: AOAM532FNJuheqWMP+b2Ksk/6/I98SD/QJfUNN39WkSfb6GEJ/pHw4w3
	iXkkU7+wQAN0JDl9E02nL9VEWmJgOWI=
X-Google-Smtp-Source: ABdhPJx2UkSalCYd1QzObIlllEjvyEnv67FhhSHetKO+GWfONxgJYkAlN+YEcB4wtkH8YeCbtfpIaA==
X-Received: by 2002:a1c:a516:: with SMTP id o22mr21577690wme.136.1623429785287;
        Fri, 11 Jun 2021 09:43:05 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id l31sm6502345wms.31.2021.06.11.09.43.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jun 2021 09:43:04 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 2/6] soc/tegra: Changes for v5.14-rc1
Date: Fri, 11 Jun 2021 18:44:33 +0200
Message-Id: <20210611164437.3568059-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210611164437.3568059-1-thierry.reding@gmail.com>
References: <20210611164437.3568059-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit 380d2b2d5a0491e47dfa250b40e3d849a922871d:

  regulator: core: Add regulator_sync_voltage_rdev() (2021-06-01 12:13:30 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.14-soc

for you to fetch changes up to e2d0ee225e49a5553986f3138dd2803852a31fd5:

  soc/tegra: fuse: Fix Tegra234-only builds (2021-06-11 13:31:01 +0200)

Thanks,
Thierry

----------------------------------------------------------------
soc/tegra: Changes for v5.14-rc1

These changes implement the core power domain for the PMC, and fix a
couple of minor issues as well as add stubs to help some drivers be
compile tested more easily.

----------------------------------------------------------------
Dmitry Osipenko (7):
      soc/tegra: regulators: Bump voltages on system reboot
      soc/tegra: Add stub for soc_is_tegra()
      soc/tegra: Add devm_tegra_core_dev_init_opp_table()
      soc/tegra: fuse: Add stubs needed for compile-testing
      soc/tegra: pmc: Add core power domain
      soc/tegra: pmc: Add driver state syncing
      soc/tegra: regulators: Support core domain state syncing

Thierry Reding (2):
      Merge branch 'for-5.14/regulator' into for-5.14/soc
      soc/tegra: fuse: Fix Tegra234-only builds

Yang Yingliang (1):
      soc/tegra: fuse: Don't return -ENOMEM when allocate lookups failed

 drivers/soc/tegra/Kconfig              |   2 +
 drivers/soc/tegra/common.c             |  97 ++++++++++++++++++++++
 drivers/soc/tegra/fuse/fuse-tegra.c    |   6 +-
 drivers/soc/tegra/fuse/fuse-tegra30.c  |   3 +-
 drivers/soc/tegra/pmc.c                | 144 +++++++++++++++++++++++++++++++++
 drivers/soc/tegra/regulators-tegra20.c |  94 ++++++++++++++++++++-
 drivers/soc/tegra/regulators-tegra30.c |  93 ++++++++++++++++++++-
 include/soc/tegra/common.h             |  31 +++++++
 include/soc/tegra/fuse.h               |  20 ++++-
 include/soc/tegra/pmc.h                |   7 ++
 10 files changed, 485 insertions(+), 12 deletions(-)
