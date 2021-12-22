Return-Path: <SRS0=nqVE=RH=gmail.com=joel.stan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D28FC433F5
	for <soc@archiver.kernel.org>; Wed, 22 Dec 2021 01:55:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E49A6C36AE9; Wed, 22 Dec 2021 01:55:52 +0000 (UTC)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 349B3C36AE8
	for <soc@kernel.org>; Wed, 22 Dec 2021 01:55:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 349B3C36AE8
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f182.google.com with SMTP id bp39so322277qtb.6
        for <soc@kernel.org>; Tue, 21 Dec 2021 17:55:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=KmpwSeOQl/QXGSnivi72HaYeJIGlBFlV9jlga5Atti8=;
        b=XTjBGn0w756fQPrPI26L5to+oyhssIy2zdDvxoDGjoJrW8qnEz+oyLd4APhv/T/447
         lLmYjGD4p6NGNEZgtqhXAmYD/upSrvTX59E00hbjiNyN8lggW7BqKbtk3Sf/tr8PCpku
         eXORwRYHsgGFKBewyivNB9iKqrHqPA85Au7kM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=KmpwSeOQl/QXGSnivi72HaYeJIGlBFlV9jlga5Atti8=;
        b=IoDOe3XIeYWR1ar0Bs09cCFeb4xZL8SeniXuz2zWWygl9lwb5lAlnvNa9icd9voik7
         buldkiLcp4X0eZJblAAA2dwH66qm8PRIRuoHuLAxfRJhXFEoI4O6d06fEaDFyxo8ZDII
         R7r7EpGJnUsc90epjzfk8tLAxFv6umK6jCPILY7wOm2h6tzTb0pLfWuLpdVWs2t7iszG
         FDId0QTjFvpBGONh2ZunlWguCWmyXmflRhisxZh7egtXGGrgLRL5IS9jz78icM4fWiCd
         4sqzvea8KKbqyd2y+yOyqnyNK+5A9bwnggu63PrGrh25sj3dkWyAP9ZyWALz7zEExMMH
         l7Rg==
X-Gm-Message-State: AOAM531SOfyKlILmcwQdS6BDHLc8peCxoIQ4bE6c3hpwjYPtrUXUeeMi
	dsW8FZj86NPJpsYgLzqIDKc2Lfi9krOLvBweleZTs6IOaYs=
X-Google-Smtp-Source: ABdhPJyF7ZbgfJsQdSxtdlu7B7xBtMb507XLSR6NmqaZmoheT4ZN5mE79OYaqyVfY+EyNgs+lTNxfCA7quoz9F4+CC4=
X-Received: by 2002:a05:622a:38d:: with SMTP id j13mr740008qtx.159.1640138150024;
 Tue, 21 Dec 2021 17:55:50 -0800 (PST)
MIME-Version: 1.0
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 22 Dec 2021 01:55:38 +0000
Message-ID: <CACPK8Xc6q=N6iFLnHt8RHhxvBhqu73WN9jBvitbwU3L6SJv85Q@mail.gmail.com>
Subject: [GIT PULL] ARM: aspeed: soc changes for 5.17
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	linux-aspeed <linux-aspeed@lists.ozlabs.org>, Andrew Jeffery <andrew@aj.id.au>
Content-Type: text/plain; charset="UTF-8"

Hello Soc maintainers,

Here are the aspeed soc changes for v5.17.

The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:

  Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/joel/bmc.git
tags/aspeed-5.17-soc

for you to fetch changes up to 79ee56da2e4f49adf174dd7a2e10ce488506c865:

  ARM: aspeed: Add secure boot controller support (2021-12-21 15:56:30 +1030)

----------------------------------------------------------------
ASPEED soc updates for 5.17

 * Fix for deferred probing of LPC clock

 * Display secure boot status when on AST2600

----------------------------------------------------------------
Jae Hyun Yoo (1):
      soc: aspeed: lpc-ctrl: Block error printing on probe defer cases

Joel Stanley (1):
      ARM: aspeed: Add secure boot controller support

 drivers/soc/aspeed/aspeed-lpc-ctrl.c |  7 ++--
 drivers/soc/aspeed/aspeed-socinfo.c  | 73 ++++++++++++++++++++++++++++++++++++
 2 files changed, 76 insertions(+), 4 deletions(-)
