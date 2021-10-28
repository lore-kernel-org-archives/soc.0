Return-Path: <SRS0=Xfx9=PQ=linaro.org=jens.wiklander@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC87BC433F5
	for <soc@archiver.kernel.org>; Thu, 28 Oct 2021 18:51:46 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 8A877610C8; Thu, 28 Oct 2021 18:51:46 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6162D60C4B
	for <soc@kernel.org>; Thu, 28 Oct 2021 18:51:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6162D60C4B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id x27so15627004lfu.5
        for <soc@kernel.org>; Thu, 28 Oct 2021 11:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=xuK+PVCpGoo5TXNGceaR1z13nIhhcB5eydr90mLDPII=;
        b=SGJj+zOmM28+pJw7UAZXKqgJd5UpR393id6/o8uFKPAqrAJpW23gBSZxsOAldjRxsF
         e4TwMTj/tWNPmPCjjFnuG7cPNoSJldpBM2N0l+nwhwXAOvteE4NdqZH+Lsi7d9AkLE0E
         D1Xyn8tY4K7ASs7lQwgm6g2lRraa4+fMddrrA5JILFkt4hp0g8or7Po1jpJuP/v3TRpy
         VfiUj+OUn+RYbzfrr1YwdQag3Yqe4Qcz+Z810ibf//gme58Y/Pwrbxo1pjGSG1yNyOC6
         LTvAfihEiQokhzA/9Hy/kqSyriF8Q3dMH/HUQEuzkvUTXEQB0qy6ZTH9XcbwATyPeuc3
         9MzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=xuK+PVCpGoo5TXNGceaR1z13nIhhcB5eydr90mLDPII=;
        b=mO+ICosp5C4OYk3BnYTdgmKNqH6RFFyGDT/jovnUp7FzZ7lNVe7MknlBxBGwZcvmSs
         7JGQZRw1drRnwMNjmvEnznzh60a3nFmuFkd4oq3Mxa9P4MoYVrTqjlnedv6EY5hOU0RJ
         NDb4iIAxpo5xCxx6Sm9+vTGBgt6JxFSQ6UeVaR4gDOaI7/8ARKIseMG0PlX/vPUFlGWA
         xUiC2pGUemUctcV8B+ygYIVnOxz6UGFjRVxRKx5tOOXHntZdAWUyA2eDP8U3t4/WpnHG
         Xs1Du9ViyLHU+6VEfUI2Y2NW6mpfIOpMEG2lDa0YgqIpk2S9AuwxRzFG8Vw501NmI88j
         xZIw==
X-Gm-Message-State: AOAM5300dOpU2hZ9v/w8NtEyeKveM0BLYQMoBjj/jcRy/a1xrYnmvC6i
	6z0I7nkvoJZoJZk3BCIQuzStK+CQpwFWN72s
X-Google-Smtp-Source: ABdhPJzBnfa4mBA0AnC37UOa9fGUbSIMG7jpPJRp30ImMtv7XDpSn8ilUPF1pyTBhW89l82LvVDBsQ==
X-Received: by 2002:a05:6512:5c7:: with SMTP id o7mr4449258lfo.105.1635447104690;
        Thu, 28 Oct 2021 11:51:44 -0700 (PDT)
Received: from jade (h-94-254-48-165.A175.priv.bahnhof.se. [94.254.48.165])
        by smtp.gmail.com with ESMTPSA id e2sm348226lfs.85.2021.10.28.11.51.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Oct 2021 11:51:44 -0700 (PDT)
Date: Thu, 28 Oct 2021 20:51:42 +0200
From: Jens Wiklander <jens.wiklander@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org
Cc: op-tee@lists.trustedfirmware.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] OP-TEE FF-A fix for V5.16
Message-ID: <20211028185142.GA2489375@jade>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello arm-soc maintainers,

Please pull this small OP-TEE driver fix which takes care of a couple of
spell errors in a few log messages. These log messages was added in the
recently pulled 4615e5a34b95 ("optee: add FF-A support").

Thanks,
Jens

The following changes since commit 4615e5a34b95e0d81467f6d2176f19a5d184cb5d:

  optee: add FF-A support (2021-10-18 11:44:23 +0200)

are available in the Git repository at:

  git://git.linaro.org/people/jens.wiklander/linux-tee.git tags/optee-ffa-fix-for-v5.16

for you to fetch changes up to 1b73a9e4986a4e9065bacf1e5ab2dfda17b54161:

  optee: Fix spelling mistake "reclain" -> "reclaim" (2021-10-28 11:41:39 +0200)

----------------------------------------------------------------
Fix spell errors in OP-TEE FF-A driver log messages

----------------------------------------------------------------
Colin Ian King (1):
      optee: Fix spelling mistake "reclain" -> "reclaim"

 drivers/tee/optee/ffa_abi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
