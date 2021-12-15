Return-Path: <SRS0=qgX8=RA=gmail.com=thierry.reding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 367B2C433F5
	for <soc@archiver.kernel.org>; Wed, 15 Dec 2021 16:26:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 16486C36AE3; Wed, 15 Dec 2021 16:26:26 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 92685C36AE0;
	Wed, 15 Dec 2021 16:26:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 92685C36AE0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id s1so5015578wrg.1;
        Wed, 15 Dec 2021 08:26:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=i7wWXueumBpxvpt3CRkJLtH1idEzNW/GlYM9K5fnKu4=;
        b=k1rETn9HkIBex934GCnqta61OfsBUR7z4i6lwLcketY2a1OhrOXyyFlxybBMk2Tk6w
         iX6IkpwuUrGKaoHEKnXkvTrZn/ey5UMlrjcEjj1Tdp04ZKLrPOyQoUOQJbW1tZ7n858H
         cJqJSPdwCBbumYvVoEVZiCxrorFd8PwG48iOLLIfyLQ0pzP8TJtzMnP/jiI1og10pdM/
         /iXI2ZDfdCShqRC+UHcZhUi3ZjELjF7Myf76ZHcIjAKZkwdro6XHONojrX+gJzu9OP6i
         QUaBiC36PhZvgrkNO/d9Ga6FYUxPlMIFYAj0cTGLZH+gxE2togTySfPHi0ean7vY4P2O
         Gopg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=i7wWXueumBpxvpt3CRkJLtH1idEzNW/GlYM9K5fnKu4=;
        b=FyIodALJE45gQQUBJmnSirB4n+NctEfPo2DGAOpgDX0n6f+xm7r8jHYVTFGVHRg9CW
         xWxgYN1gY+HoM/iIWWcqCpmjLIJkxt5A4NOZl+KMRyLLLD54LMcbwr4HIi9H+8cVRick
         cor+tpTatlkWBG8LZ/VYDUsEAijKrGr92qCPuXtxmdkwlAT6HMDzwaeCPys81znTkIRr
         D4Kd4mT1MNluAwjsmzgxsrkF2w3PekxI+XGg4tHHSKgDk47u7jTFbDsniBJUTA872WBt
         YJhXzcvb+wSPmn1L7KX+BL4+yWO4YKQVK98hTQ3DmV50iqC6ys2sqB98jUd5LteA6yUl
         +mKg==
X-Gm-Message-State: AOAM533PwNAlTgHEKFIjaDqwj7rR0PwbZJf13WnMOK1kGH/mPt4P9PLH
	gZkA4gBeog1+KDPq/KVNEfbV6+M3w4Du8A==
X-Google-Smtp-Source: ABdhPJyDN7900ndzWAS8GYNF/EXE9loh52/7cQL418PjO9H2GbjhCUu/JMKwaKr3/K8lzWKUC6bv+w==
X-Received: by 2002:a05:6000:89:: with SMTP id m9mr5147846wrx.427.1639585583545;
        Wed, 15 Dec 2021 08:26:23 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id j32sm2157957wms.40.2021.12.15.08.26.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Dec 2021 08:26:22 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] soc/tegra: Fixes for v5.16-rc6
Date: Wed, 15 Dec 2021 17:26:18 +0100
Message-Id: <20211215162618.3568474-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit 76d89474310e05d9c592a8beed2aefe4d3396d2d:

  soc/tegra: pmc: Use devm_platform_ioremap_resource() (2021-10-08 21:42:41 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.16-soc-fixes

for you to fetch changes up to a7083763619f7485ccdade160deb81737cf2732f:

  soc/tegra: fuse: Fix bitwise vs. logical OR warning (2021-12-15 17:19:06 +0100)

Thanks,
Thierry

----------------------------------------------------------------
soc/tegra: Fixes for v5.16-rc6

This contains a single build fix without which ARM allmodconfig builds
are broken if -Werror is enabled.

----------------------------------------------------------------
Nathan Chancellor (1):
      soc/tegra: fuse: Fix bitwise vs. logical OR warning

 drivers/soc/tegra/fuse/fuse-tegra.c | 2 +-
 drivers/soc/tegra/fuse/fuse.h       | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
