Return-Path: <SRS0=cfCK=XN=gmail.com=thierry.reding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83AB1C433EF
	for <soc@archiver.kernel.org>; Fri,  8 Jul 2022 18:56:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 66947C341C7; Fri,  8 Jul 2022 18:56:19 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B8E03C341C0;
	Fri,  8 Jul 2022 18:56:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B8E03C341C0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id l23so7335478ejr.5;
        Fri, 08 Jul 2022 11:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=r0JEUoJ9sLpu19V7f0ElwVX49+IBRyb0Lpv1dEzhHh8=;
        b=VmpweFDi+OafWV5aWSH9HtVEJYnuHfM44Efd6dSa2MkVwF4y+n7N0IsJkcu9M1Pc5y
         4nUvQ1dQ7aOijk6OX9eH78VewXu32I0X6bBZexP9WAWBt88Irzc0APifYxzs9wjvmV3Y
         P7BqO4ryIz1+S1yi42h/4G2/6J3455sxN9SuuByZAKMLz9W8cY+8GGuznIOiJ+M5Zj7v
         3vMEZYb1cnENSXKVSuzcVwpAyrug9eNwl5wi2qKIRwitFJ8e5PCAR5APDWN9AKzzoxeS
         TuHFEazUvj+Ueio/NFo421CLTv9oK8WZa/Bp7LYf6k5buGQp5FlQMuzlVGTZ/i47q6Nb
         LLwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=r0JEUoJ9sLpu19V7f0ElwVX49+IBRyb0Lpv1dEzhHh8=;
        b=JqRvlwVc+rShyJlploRNNTYI405oeqttkoBH+ZHiW2Fpn7lyOJvrtvzVJTkPWY1Mgj
         51HG+w9AbAvMeDOz6/prMBJWHehkUVn+bcCpMANR9qX3yUkbiVHuFdg165ZTWFsgk1Fx
         JVnjfcO2KiC93S5B+xhjoIUyuRgD87UqGzgqdfcQk81+gBo2qIj95l4hzX2ILRTrm9t7
         EbjlyftfAkPL5rTjIP3fwcdfZhMlcHOQ5pT1ddq2uYq8RmcWF+KDBX533EOKpBkk403m
         WZiqcFtGSgV4Ze8vCQBC5w1B1fbVeVEKpeZ2QXq3kGRZLLMfVlirSQ1tOt5H6Amf2SGv
         rD9g==
X-Gm-Message-State: AJIora8AfAWbiluzHEAUc2Mar1gXI1ytADowL8UkrSrfLNZzKlvIoj78
	x3d5wPLFB9IOEDhJ4ZLtImTHcVKLPQA=
X-Google-Smtp-Source: AGRyM1uRj3lk2FdQ9Ud+l7xbThhBTVjVsoNCB5hV86Gzx8jafj4F/5EbmBtdiNCWfmXDjd86IW+Ugw==
X-Received: by 2002:a17:906:99c1:b0:6fe:b01d:134 with SMTP id s1-20020a17090699c100b006feb01d0134mr5093379ejn.598.1657306576430;
        Fri, 08 Jul 2022 11:56:16 -0700 (PDT)
Received: from localhost (p200300e41f12c800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f12:c800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id d13-20020a170906304d00b0072b31123174sm350717ejd.62.2022.07.08.11.56.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jul 2022 11:56:15 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 2/7] firmware: tegra: Changes for v5.20-rc1
Date: Fri,  8 Jul 2022 20:56:03 +0200
Message-Id: <20220708185608.676474-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220708185608.676474-1-thierry.reding@gmail.com>
References: <20220708185608.676474-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a56:

  Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.20-firmware

for you to fetch changes up to afcdb8e55c91c6ff0700ab272fd0f74e899ab884:

  firmware: tegra: Fix error check return value of debugfs_create_file() (2022-07-08 17:56:03 +0200)

Thanks,
Thierry

----------------------------------------------------------------
firmware: tegra: Changes for v5.20-rc1

Contains a fix that avoids unaligned accesses to IPC memory, which in
turn helps in suppressing speculative reads from out-of-bounds memory.

Another patch performs some minor cleanup around debugfs API usage.

----------------------------------------------------------------
Lv Ruyi (1):
      firmware: tegra: Fix error check return value of debugfs_create_file()

Timo Alho (1):
      firmware: tegra: bpmp: Do only aligned access to IPC memory area

 drivers/firmware/tegra/bpmp-debugfs.c | 10 +++++-----
 drivers/firmware/tegra/bpmp.c         |  6 +++---
 2 files changed, 8 insertions(+), 8 deletions(-)
