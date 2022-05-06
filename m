Return-Path: <SRS0=HH3A=VO=gmail.com=thierry.reding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18EB4C433F5
	for <soc@archiver.kernel.org>; Fri,  6 May 2022 14:30:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D8E30C385B0; Fri,  6 May 2022 14:30:12 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3D8DCC385A8;
	Fri,  6 May 2022 14:30:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3D8DCC385A8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id x18so10316332wrc.0;
        Fri, 06 May 2022 07:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aQb6q3Qhc7TawpXFz11bbETIKo6ryfU6AXp8dhF5Rgg=;
        b=GRQLL9711f6FIy3dhpp0e5+ua2CsBcVHf7VlgfAu7znBi/Rrcw36mU+GiYNULKwp7p
         VKOME+IQ+mdBdlONnT7HItI0RboHKHddY5D7i+IJI4Z1F9klbkimxexxsqlFkhTnQax0
         CakCWlrO0SIPWRIKp9uFNfqpEm8Q5tc73KKRnnMCuyQLQj5oCBrI8yp7Ayv8CZzwYjbl
         4IUqzLzBi3tKei1kJNCIkKV0/zKo0HMAdI8YhmpPYeUC3Ul4llgluvGeokJafZC2du3b
         p9feCnkyLaLBZQA7/2ynl4EGH7pOVtlp7jFH1f3y4xGgz4wZRRdd6ea7tSorxE0+OJUv
         5WBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aQb6q3Qhc7TawpXFz11bbETIKo6ryfU6AXp8dhF5Rgg=;
        b=lXZgJ5TTrtLVxCHYCdrXjdp/ToaI/Oe7FcAAhQyuh5Sr0yjhPojkREeO0yuscllsmK
         qmZ7m6UIwi8dTDYQW6Z2s/lt0oLVtgELVki4f9QpVhBb3XssOHeMrZGYLFK+q8eFnIO5
         aozShinQyq5FcS/Hh+7iVhmdCJ40QCRnT5r+rmWzIlltXriySANqsb9892g1ehGoSNus
         VO6B/NwWog2a9sAM4pze5QYCUmj/Mx+mS8vIE4VrI9ViSg14NvCfXPTbwMFKj+F6P5of
         FYA5EGo6HH3WI7LLsn13uL8ciamotTzPDx/sH0PtpgSuvcr6vqfGEhjkOy3OQyrjRc6h
         ztWg==
X-Gm-Message-State: AOAM531hDA/5aO+Dts9KbOAfZ2a6r0/bxK1I02YdGxVLRmbMjb3RN2gE
	BVJtJizAZ0qy2HuJXnImK0o4UziTCfY=
X-Google-Smtp-Source: ABdhPJxdvPALns7toTxtoaOjGVFh/2dhjEXKbiAkLNhgLxBvXvEyyUhyd7p6fTYCe05SQa2mVHujbg==
X-Received: by 2002:a5d:6489:0:b0:20c:6c3b:d49e with SMTP id o9-20020a5d6489000000b0020c6c3bd49emr3024054wri.75.1651847410056;
        Fri, 06 May 2022 07:30:10 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id a7-20020a05600c348700b003942a244ed7sm4143558wmq.28.2022.05.06.07.30.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 May 2022 07:30:09 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 2/6] soc/tegra: Changes for v5.19-rc1
Date: Fri,  6 May 2022 16:30:01 +0200
Message-Id: <20220506143005.3916655-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220506143005.3916655-1-thierry.reding@gmail.com>
References: <20220506143005.3916655-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:

  Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.19-soc

for you to fetch changes up to d3a20dcbca4880ada8974b2d0167df99161bbfaf:

  soc/tegra: pmc: Document core domain fields (2022-05-06 10:53:19 +0200)

Thanks,
Thierry

----------------------------------------------------------------
soc/tegra: Changes for v5.19-rc1

This set of changes adds nvmem cell lookup entries for Tegra194 that are
used to read calibration data from the SoC fuses, and updates the reset
sources for Tegra234.

Other than that, included is a minor build fix for a missing dependency
that can be encountered very rarely in random config builds. Lastly some
kerneldoc comments are added to avoid build warnings.

----------------------------------------------------------------
Sagar Kamble (1):
      soc/tegra: fuse: Add nvmem cell lookup entries for Tegra194

Sandipan Patra (1):
      soc/tegra: pmc: Update Tegra234 reset sources

Thierry Reding (2):
      soc/tegra: pmc: Select REGMAP
      soc/tegra: pmc: Document core domain fields

 drivers/soc/tegra/Kconfig             |  1 +
 drivers/soc/tegra/fuse/fuse-tegra.c   |  8 ++++----
 drivers/soc/tegra/fuse/fuse-tegra30.c | 17 ++++++++++++++++-
 drivers/soc/tegra/pmc.c               | 35 +++++++++++++++++++++++++++--------
 4 files changed, 48 insertions(+), 13 deletions(-)
