Return-Path: <SRS0=gyVr=75=gmail.com=thierry.reding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1419C761A6
	for <soc@archiver.kernel.org>; Thu,  6 Apr 2023 12:48:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BFB6CC4339C; Thu,  6 Apr 2023 12:48:08 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BC71EC433EF;
	Thu,  6 Apr 2023 12:48:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org BC71EC433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f43.google.com with SMTP id 18so1090757ejo.13;
        Thu, 06 Apr 2023 05:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680785286;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C/oNPSXF4DEXkM4iJ7WzDu31Vha4rpo63BbtWEOYdL4=;
        b=B3OhMfX5OZYNer0C9NNK+6rM1YKacqHCOa2H7QCFZAui3hQe59xMIAsZxWTDdTi2T9
         +sPauCztyvgty/T7zEbnstVmr2ZUxadFhGT9PC2csPtE7NtV/9WlB2p0HSA+uUzpouK8
         2cKbTwzshxRH0lhe/v9z4q14bT9XlN11NjJCRgKGBW9m5d0QLM9gJ2KCcE8VcdHCYaMg
         B7pMf520mzhvX7Ex3nJO/R6Y+dzfIHUY+b5YDkp/uQbmIrI0jXWvzRVxMReGWe4Ephfu
         m/mmmFHmDNZ60zKxkIFP0pSQcQZYG83GkhjVSEOaDeApJImsrlB5wfTKic49QQDhjruC
         j7NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680785286;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C/oNPSXF4DEXkM4iJ7WzDu31Vha4rpo63BbtWEOYdL4=;
        b=184KQcP0oapEJpIdN707RmgQStyXRrbdcrotAtn5qKXPfVvjPZz/jFYUDZ9f1hhc7Y
         ifdKmq8iF1j/hTtU2QYdHSPpaLVhHeB7c/lNGx0OIwloGMPElbJSclj45Ycc246oovRs
         n2vsRGr+Swl4JNpdOkdS/dUkZsmUfXFYYYtW43vRK3YoEcN+2dLUyEKarOE/jmM7J9Un
         ZB2cD4CNH0CR7sF1a3CxzRJ0jJl+ScWqpYEU5nRIQdCADzcmHXLcXbyy8KWlerG5m4br
         KR5ckDp0Hkcc4Kpl62c6us234F9r2aaXH5JQtA0zPCE8H4kG3+S55A3YDVOF/7XjgS6m
         OzjA==
X-Gm-Message-State: AAQBX9eNtj2Nd/fEVr+aVAkYqUEXxPiowYA7yzUbWz8WQ9DpF6+IhsdA
	oCztQ3pvTbVw0ydpzRpnXKOQbyLOjTA=
X-Google-Smtp-Source: AKy350bHCWjsKOT+HSqtRAOm/6ukLHpkAF0MU8QVFPLej0KBruxegYeGUhznE2/zgUMPjUEjZLozjg==
X-Received: by 2002:a17:907:77c1:b0:889:58bd:86f1 with SMTP id kz1-20020a17090777c100b0088958bd86f1mr6586345ejc.14.1680785285785;
        Thu, 06 Apr 2023 05:48:05 -0700 (PDT)
Received: from localhost (p200300e41f1c0800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1c:800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id qp4-20020a170907206400b0093048a8bd31sm784093ejb.68.2023.04.06.05.48.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Apr 2023 05:48:05 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 2/7] soc/tegra: Changes for v6.4-rc1
Date: Thu,  6 Apr 2023 14:47:59 +0200
Message-Id: <20230406124804.970394-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230406124804.970394-1-thierry.reding@gmail.com>
References: <20230406124804.970394-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit fe15c26ee26efa11741a7b632e9f23b01aca4cc6:

  Linux 6.3-rc1 (2023-03-05 14:52:03 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.4-soc

for you to fetch changes up to 821d96e3a006d09ca9aa3d982c50f3d86fa55500:

  soc/tegra: fuse: Remove nvmem root only access (2023-04-05 17:10:40 +0200)

Thanks,
Thierry

----------------------------------------------------------------
soc/tegra: Changes for v6.4-rc1

Contains various minor cleanups and fixes as well as support for several
more wake events on Tegra234.

----------------------------------------------------------------
Jon Hunter (1):
      soc/tegra: pmc: Add the PMIC wake event for Tegra234

Kartik (1):
      soc/tegra: fuse: Remove nvmem root only access

Mikko Perttunen (1):
      soc/tegra: bpmp: Actually free memory on error path

Muhammad Usama Anjum (1):
      soc/tegra: cbb: remove linux/version.h

Nick Alcock (1):
      soc/tegra: cbb: Remove MODULE_LICENSE in non-modules

Petlozu Pravareshwar (1):
      soc/tegra: pmc: Support software wake-up for SPE

Sushil Singh (1):
      soc/tegra: pmc: Add wake source interrupt for MGBE

Uwe Kleine-König (1):
      soc: tegra: cbb: Drop empty platform remove function

Yang Yingliang (1):
      soc/tegra: cbb: tegra194: Use of_address_count() helper

Ye Xingchen (1):
      soc/tegra: flowctrl: Use devm_platform_get_and_ioremap_resource()

 drivers/soc/tegra/cbb/tegra-cbb.c    |  1 -
 drivers/soc/tegra/cbb/tegra194-cbb.c |  6 +-----
 drivers/soc/tegra/cbb/tegra234-cbb.c |  8 --------
 drivers/soc/tegra/flowctrl.c         |  4 +---
 drivers/soc/tegra/fuse/fuse-tegra.c  |  4 ++--
 drivers/soc/tegra/pmc.c              | 26 +++++++++++++++++++++++++-
 drivers/soc/tegra/powergate-bpmp.c   |  2 +-
 7 files changed, 30 insertions(+), 21 deletions(-)
