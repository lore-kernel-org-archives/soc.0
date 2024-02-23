Return-Path: <SRS0=8G8C=KA=gmail.com=thierry.reding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 808D5C5478C
	for <soc@archiver.kernel.org>; Fri, 23 Feb 2024 17:48:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 460A7C43399; Fri, 23 Feb 2024 17:48:54 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 513B6C433F1;
	Fri, 23 Feb 2024 17:48:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 513B6C433F1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2d2533089f6so11930781fa.1;
        Fri, 23 Feb 2024 09:48:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708710530; x=1709315330; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jWqHEoxxzUOvlYupo07VDA1pvQHF1z0gFvXnzb45H8Y=;
        b=Gt75+ePfdYKBF9hWRSeBMq9IQP7paUg7mYVz/O0fylMEHjUJZaASHr/1TEk9fHeJfL
         ErijN+LMzZ9qXguGxF3LRrJ1bZV4iix1ngUsNtpwXJRH5qXKwP882ahVkkfQoWxG50oK
         Dy5sCxbE+QOseyUplhfdRzklNP8s1k9rV/lhta0eNrYPTCpKk8bAZJBoxJ/0OaSnbLfO
         tPzYmu8/a2ZqeOv4aE9UkPIt/+DmS0ORR621Zq4SwOK6MT4ctKVBvDOiydyPQmkBIX2H
         soDAFsBjB8GX2FjS0llcXsk78zUzNjdG9nrQuUmKTpCLVYCzn6omaMLnAqx/hI7oH2sF
         6EuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708710530; x=1709315330;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jWqHEoxxzUOvlYupo07VDA1pvQHF1z0gFvXnzb45H8Y=;
        b=dj9vxa1Pa4mbhRJyuswXBra1RmYZtCpjxJwY2rCcr6m/7EPaidEzV0+b9CVlkPrdbO
         MACfOpKlw6vH1B5SHC/ZItQD/22M8UbpmZKfySk6IX/4/DOkzXJXWr4UoS9A5SXGLnln
         YGOiIBn3dZjYZm9nzGg+QeAF7U4+ZvRDufMFf7nx3uAZiD6FmBcv2z7u+qwdBfkMCwpV
         v0xhoESMylI8wBZj63Qwb9kQAP9zir1QSh1cywTScheqooqLRFVmOuutzxa1QzFaiQtI
         lNaOX7adEgYBsHDWsWrk81C2qZLmkUvthOgety7V4P3E7J3vR/FEcqlBcvjl06j9RCwz
         0zEQ==
X-Forwarded-Encrypted: i=1; AJvYcCXU0/Lt1z1g9/0ZiCMsRvek9geq1j6Vk+zPSyJuJyfrYGriUqogGFvH60+MyruvDol+O0yTAn+TWxyAqlXpYA==
X-Gm-Message-State: AOJu0YxIJwt6bs4vN8OI6puiOU+7jtkCqgmYV5PVGIrxr4APXkS16sgv
	/TR2hVU8H8jlark6ufmGLdL4VHmLLSXH7uLrojE+K3VTdHH5CQbYzRW0RDZi
X-Google-Smtp-Source: AGHT+IF+YHxf6+N4f7BSNbZgJbWUlupChV5Rx5tgLoc4hLGB+ca4OnJ85aye3A1U9orIOsnFVcxZlA==
X-Received: by 2002:a19:8c5c:0:b0:512:e051:ac2c with SMTP id i28-20020a198c5c000000b00512e051ac2cmr333457lfj.3.1708710530282;
        Fri, 23 Feb 2024 09:48:50 -0800 (PST)
Received: from localhost (p200300e41f2d4600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f2d:4600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id r16-20020a1709067fd000b00a3e88f99cf1sm5459033ejs.149.2024.02.23.09.48.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Feb 2024 09:48:49 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 1/5] soc/tegra: Changes for v6.9-rc1
Date: Fri, 23 Feb 2024 18:48:44 +0100
Message-ID: <20240223174849.1509465-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.43.2
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit 6613476e225e090cc9aad49be7fa504e290dd33d:

  Linux 6.8-rc1 (2024-01-21 14:11:32 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.9-soc

for you to fetch changes up to ae7d2d9b8ebe9f107c500808d5bcd68397645720:

  soc/tegra: pmc: Add SD wake event for Tegra234 (2024-02-16 12:35:56 +0100)

Thanks,
Thierry

----------------------------------------------------------------
soc/tegra: Changes for v6.9-rc1

This set of changes adds ACPI support for the APBMISC driver and cleans
up a few things like dependencies and unused code.

----------------------------------------------------------------
Arnd Bergmann (1):
      soc/tegra: Fix build failure on Tegra241

Christophe JAILLET (1):
      soc/tegra: pmc: Remove some old and deprecated functions and constants

Jon Hunter (1):
      soc/tegra: fuse: Fix crash in tegra_fuse_readl()

Kartik (9):
      mm/util: Introduce kmemdup_array()
      soc/tegra: fuse: Use dev_err_probe for probe failures
      soc/tegra: fuse: Refactor resource mapping
      soc/tegra: fuse: Add tegra_acpi_init_apbmisc()
      soc/tegra: fuse: Add function to add lookups
      soc/tegra: fuse: Add function to print SKU info
      soc/tegra: fuse: Add ACPI support for Tegra194 and Tegra234
      soc/tegra: fuse: Add support for Tegra241
      soc/tegra: fuse: Define tegra194_soc_attr_group for Tegra241

Peter Robinson (1):
      bus: tegra-aconnect: Update dependency to ARCH_TEGRA

Petlozu Pravareshwar (2):
      soc/tegra: pmc: Update address mapping sequence for PMC apertures
      soc/tegra: pmc: Update scratch as an optional aperture

Prathamesh Shete (1):
      soc/tegra: pmc: Add SD wake event for Tegra234

 drivers/bus/Kconfig                    |   5 +-
 drivers/soc/tegra/Kconfig              |   5 ++
 drivers/soc/tegra/fuse/fuse-tegra.c    | 118 +++++++++++++++++++++++++--------
 drivers/soc/tegra/fuse/fuse-tegra30.c  |  23 ++++++-
 drivers/soc/tegra/fuse/fuse.h          |   8 ++-
 drivers/soc/tegra/fuse/tegra-apbmisc.c | 108 +++++++++++++++++++++++++-----
 drivers/soc/tegra/pmc.c                |  87 +++++++++++-------------
 include/linux/string.h                 |   1 +
 include/soc/tegra/fuse.h               |   1 +
 include/soc/tegra/pmc.h                |  18 -----
 mm/util.c                              |  17 +++++
 11 files changed, 277 insertions(+), 114 deletions(-)
