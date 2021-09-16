Return-Path: <SRS0=U2WW=OG=gmail.com=joel.stan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1DA1C433EF
	for <soc@archiver.kernel.org>; Thu, 16 Sep 2021 08:26:27 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id D5E3C61207; Thu, 16 Sep 2021 08:26:27 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 631B96120C
	for <soc@kernel.org>; Thu, 16 Sep 2021 08:26:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 631B96120C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f182.google.com with SMTP id b64so6604012qkg.0
        for <soc@kernel.org>; Thu, 16 Sep 2021 01:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=7Rct0wxwR3oFXMND7vzY4QU1vkyKpfX925qIsFciJhk=;
        b=NOqInXBtppRbkqGyfjRBKjoqezYMjP9oqBCi2yd+xyxGpF0uPJR94CDRl+r/6Z9XkZ
         790DURD8mThd8ldC3RUYbWpAPSi1Au2a5ko6mg9YGo4AdF2yKsa1MQzu8te48acVNkjB
         VeR2nG3ecgbSgW5Y23lEW7N68l5PKr47ZmnXM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=7Rct0wxwR3oFXMND7vzY4QU1vkyKpfX925qIsFciJhk=;
        b=t/0+2TjOfIHiLx+BJtfV+Fc5J9U58cfbyBwGJ05zNTUdG5w76kXMCTM6ZPHMMh/FDz
         VICSxh4MnLcUw+KZtVTDyA5EqOuU8dlWeUj7LMNWgjeCG1E6kG0WkNQ8XiDzV3WVdmsS
         TrjKCgUNny+dMXemDL1pAWA5BPqvPkCCmt1TLV5YdIo0LGrEmrtyM6E3vin8E2Fnp5w8
         BQmR5ptLNnmrvlZLndCY3ynStHa0Wn2TonLf+epOznIJsXrjc7Uki5voHxb3cD3vlOuc
         SVUMYZYjUrH4N37sQiDrh9YNBQS0jAiy2ragpa/ARBN2zNpDqXMHPAMpzG43s304mk8p
         n4pg==
X-Gm-Message-State: AOAM533U33TM9JKTiK/d8sAoELfwTaiZNPjepp4OJ9SGgpSkmC/4RTmQ
	b0odpT5oBtpI9Cmyg/K6uVSCv2bFnZWsVhLGPu3Q/v36NNs1tg==
X-Google-Smtp-Source: ABdhPJxPp/BaYSMVCvnILhfHvZwrIcNJiTkW9EBfdo6RciEiPrlfODO+6UtmOaj/AMnqFq6VSVTBUTJhu9Q9007ySb4=
X-Received: by 2002:a05:620a:149c:: with SMTP id w28mr3970119qkj.292.1631780785804;
 Thu, 16 Sep 2021 01:26:25 -0700 (PDT)
MIME-Version: 1.0
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 16 Sep 2021 08:26:14 +0000
Message-ID: <CACPK8XfTHOOksA8q7MeHW=7ijP_49iOyq1pDj2SQnqSBTDUoaA@mail.gmail.com>
Subject: [GIT PULL] ARM: config: multi v7 defconfig cleanups
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hello soc maintainers,

Arnd has taken a few of the series through the fixes tree. The rest
can probably wait for v5.16.

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/joel/bmc.git
tags/multiv7-defconfig-5.16

for you to fetch changes up to 6c5faa6e07d3d42c5e6dd5a19ea1e1d9d097cf0f:

  ARM: config: multi v7: Regenerate defconifg (2021-09-16 17:06:38 +0930)

----------------------------------------------------------------
ARMv7 multiplatform defconfig updates

A cleanup of the mutliplatform defconfig to make it easier to maintian.

----------------------------------------------------------------
Joel Stanley (4):
      ARM: config: multi v7: Drop unavailable options
      ARM: config: multi v7: Clean up enabled by default options
      ARM: config: multi v7: Add renamed symbols
      ARM: config: multi v7: Regenerate defconifg

 arch/arm/configs/multi_v7_defconfig | 87 +++++++++++++------------------------
 1 file changed, 30 insertions(+), 57 deletions(-)
