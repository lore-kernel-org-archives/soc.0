Return-Path: <SRS0=PH9V=HA=gmail.com=thierry.reding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A37CC433DB
	for <soc@archiver.kernel.org>; Fri, 29 Jan 2021 19:33:00 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 3463E64DFB; Fri, 29 Jan 2021 19:33:00 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D2C6F61477;
	Fri, 29 Jan 2021 19:32:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D2C6F61477
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=thierry.reding@gmail.com
Received: by mail-qv1-f52.google.com with SMTP id j13so4988607qvu.10;
        Fri, 29 Jan 2021 11:32:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=r67InYHj7w0UwUs8Y72vPHBfu31eAHA0VGcwVWjNNEc=;
        b=EdUVY0bLdPbBA2FZrTNiX66oEskosYO2f/QYo+UziRqOcrODVKbpBf3Gl+VaTtfGiA
         niihmJAk00TDIqH52b4XL4ZDnJzQCIN1lUlsuY5QkdNTA5/c/aCPnfWDvzH7dBtoRN+o
         /vWQVRWq6gK52JeBDNAopenV5jEoHjTMMBkTiTS7JhJZWt2o6EJi+YsqBlRO2v7R49a2
         f0ySZXgQsXdaVs5Z4KKyJ4tnR3m6Of2uSN2fk613Q9d8HoOrjBTuKewjwRA2YodNOo9b
         U5QC0ab2pM3BKg8g7LMFHsggSFm1CFbh/l98i/aHUFzf5n7qgSiNkdYaSm/ORndxjuRS
         pxgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=r67InYHj7w0UwUs8Y72vPHBfu31eAHA0VGcwVWjNNEc=;
        b=pReWjeBvRNlhPgBgrlMnpvWoIKf1rCmfNm9i5qInjRkvO0/SRP2bThamoxhJBsynFo
         1uuP/GusuRR1rvv8jN5biw7XF9MNCklKxLV6Aj19lAyPEW9K+g7VkFUyrjD0yypHh8B9
         AtsJXvvuvR6DoisWbxcf2MkJAoNKG5Aootvxm2bTmOKYKDm7ju0ggJb/rVA70GDssRMT
         2z5slMxOMfsGYTf4U/zP0d3A4cXdLp0aUj06GEMFVxagCYzcLHjPqcLXQ2zhzCHohHpR
         Dvm5TzF3OlbXK6wdN+TSoceljnjQObapszBFcdgfDnW5hX7GsZRpr20e7fGMXcRoTDBc
         Qcvg==
X-Gm-Message-State: AOAM530ajH3Z6GEsbiuX/hd7XIWIMCjqutcVlbzsh6hfIRFz6krNyili
	v3Iii4XJZUSB5oNkYwkjHNH5O+gHe60=
X-Google-Smtp-Source: ABdhPJy+w1P0mfYDxPTKAsKLMxfdPnzKm1nQ1m/wfdbrlcGXGt5Vna74AeVZkCwDJts+0hKT8dUcLg==
X-Received: by 2002:a0c:e28c:: with SMTP id r12mr5539465qvl.34.1611948778317;
        Fri, 29 Jan 2021 11:32:58 -0800 (PST)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id v15sm5751291qkv.36.2021.01.29.11.32.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Jan 2021 11:32:57 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 1/6] ARM: tegra: Core changes for v5.12-rc1
Date: Fri, 29 Jan 2021 20:32:49 +0100
Message-Id: <20210129193254.3610492-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.30.0
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.12-arm-core

for you to fetch changes up to 680ae44526ea9b656238ac768c8b6130961a0bdb:

  ARM: tegra: Don't enable unused PLLs on resume from suspend (2021-01-19 18:20:42 +0100)

Thanks,
Thierry

----------------------------------------------------------------
ARM: tegra: Core changes for v5.12-rc1

This contains a single fix that helps properly track the enable state
for various PLLs during suspend/resume.

----------------------------------------------------------------
Dmitry Osipenko (1):
      ARM: tegra: Don't enable unused PLLs on resume from suspend

 arch/arm/mach-tegra/sleep-tegra20.S | 38 +++++++++++++--
 arch/arm/mach-tegra/sleep-tegra30.S | 94 +++++++++++++++++++++++++++++--------
 2 files changed, 108 insertions(+), 24 deletions(-)
