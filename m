Return-Path: <SRS0=vmoh=FB=gmail.com=thierry.reding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40E16C64E75
	for <soc@archiver.kernel.org>; Fri, 27 Nov 2020 14:43:39 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 10D7E22242; Fri, 27 Nov 2020 14:43:39 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6E6D22223D;
	Fri, 27 Nov 2020 14:43:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sBlnwK92"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6E6D22223D
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=thierry.reding@gmail.com
Received: by mail-wr1-f43.google.com with SMTP id l1so5815559wrb.9;
        Fri, 27 Nov 2020 06:43:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KEKSlpfgpbLCs7hwatanNSP8US33gujVVxIHTOMhDYo=;
        b=sBlnwK92jyAt/OQ350OygpGMZnhlU48PAlUqKkAjF66DgKP4v+G6YcpCEng54vcb40
         20KzalTs5LizLFMhwEpbAEzuWGrx7cKQxSFEgSDOG2tC2RCaL1d2rNtiQIP4EjmjCOK2
         N8hf93NzX5pNnqbXPcrIu4eAztOyS+MYjrYFOfnCLqDaUVddZf1cVSyybhX6XFKCOTPs
         f9S0OqpsokQrziT1AT9amePClJILR2fMvVUjctHsk19pItAINMRweIbpDBwO9BpOcA7p
         etmQ1iy+QSK6yHVtkOc8+62+cUbvoyHOyEGx+QSAHdhLZxJasfpwHJEaOoq0hivHgV85
         5Npg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KEKSlpfgpbLCs7hwatanNSP8US33gujVVxIHTOMhDYo=;
        b=BFHjS3G6pI9W2I+w9ijNyIZDIZyUKpjz9cW8OCL8lB3swTY28lXesnpUjetOkINyeM
         d8i2xXOIo0kdLNqdkNK12WwBbm3kd2IQ4YpOwK0TWoP74lmZhXMrQlT5O33muDRyFHv2
         /dxfKLW8n+2G8EfPEWPXMGKJFizMFgMsPYHYSZQMdMMDKAP/xOEVPYuNRAbqHRNovE4S
         uUwrSYEHhwHlLD1LqZCC4ZIk6AnLn+1gg1F0vpF2PvafLxt6ecbt5ScdZB/JhEz7qN0H
         O6AWG9Nl9G7cIh9rKgBk+qO/Aktg5nFaZKFdjIILEAe22X3mIbJxy7njTSPAhmooV2Ko
         1+ew==
X-Gm-Message-State: AOAM533+xMPH1ONR/Co1TI0oqO44O6eGQAb1Ku5WcD2soqSeZU1yEdhj
	nS9aDeYYNu3w1CPFljlBoUCaYSy+sqQ=
X-Google-Smtp-Source: ABdhPJwpGWTkgzcQN4p6Qs7NL384aOExPblrvngk8bGoyYH3HKpuBmjn4V3udouj2HkRyHehxLR/tw==
X-Received: by 2002:a5d:4604:: with SMTP id t4mr10867775wrq.411.1606488216389;
        Fri, 27 Nov 2020 06:43:36 -0800 (PST)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id f18sm14839458wru.42.2020.11.27.06.43.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2020 06:43:35 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 3/6] firmware: tegra: Changes for v5.11-rc1
Date: Fri, 27 Nov 2020 15:43:26 +0100
Message-Id: <20201127144329.124891-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201127144329.124891-1-thierry.reding@gmail.com>
References: <20201127144329.124891-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:

  Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.11-firmware

for you to fetch changes up to 9294996f0be40e9da818ed891c82397ab63c00d0:

  firmware: tegra: fix strncpy()/strncat() confusion (2020-11-10 20:15:17 +0100)

Thanks,
Thierry

----------------------------------------------------------------
firmware: tegra: Changes for v5.11-rc1

Contains a single fix for a strncpy()/strncat() issue that some versions
of GCC are reporting.

----------------------------------------------------------------
Arnd Bergmann (1):
      firmware: tegra: fix strncpy()/strncat() confusion

 drivers/firmware/tegra/bpmp-debugfs.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)
