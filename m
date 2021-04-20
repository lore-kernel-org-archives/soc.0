Return-Path: <SRS0=oAPY=JR=gmail.com=joel.stan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 112D0C433B4
	for <soc@archiver.kernel.org>; Tue, 20 Apr 2021 07:14:21 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id C316361154; Tue, 20 Apr 2021 07:14:20 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8DE2260FF1
	for <soc@kernel.org>; Tue, 20 Apr 2021 07:14:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8DE2260FF1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=joel.stan@gmail.com
Received: by mail-qv1-f44.google.com with SMTP id dp18so13498596qvb.5
        for <soc@kernel.org>; Tue, 20 Apr 2021 00:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=Q0PEKAL00lh2HdvWmuae23ebc0u44/mLh1vdqQvcbYA=;
        b=epN9bBJkCDeaCFZK4qljnKoh/ZCer6Rl808fLEaqfAI61COv6SK8+5txip0nKWOV2T
         8YivqJwZJji6p5MTPqJcsIxSzaIMmefZbS36FWMBs4iDJ9zVmLm7d0VaONZU01tSTrH8
         KXFE/4cldW0e4ppsjxfhrGpVyFeb/Q6Kk5b9k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=Q0PEKAL00lh2HdvWmuae23ebc0u44/mLh1vdqQvcbYA=;
        b=pMJcpeQK4j/0iAnVPlhJnzxNCaMDlbs2t1kmWMQ15AtJRHKJXktbghTIKuyXu8DJtT
         DSTz8SsaA7Z5sO/GAtvK7mHzy0lFO+hTD9IgsOlY/hIsVg0KjeBxke18DrkVOTwHZGxR
         uAfRS6Smq97+mFBu6yl8zOUt4I0Je2fEPB6cw+7hQ3vYah0s/q5Nl2P1w6ttW/eTtS6F
         j96Uk08jaJ4WlWPGbGTdxN4myrRB0Ujbth4+pQYesXkZT3RhMj9SJhVusA0WulwUJOkX
         7Fy9oX+rwuJEPvIxrfxEhdN9i17nBNv/b3WDWsZUNgoAVx0wNcCeebr/KotCqZMuY1iJ
         01qA==
X-Gm-Message-State: AOAM533FaPEQD5tyD/je+0Z8NvvsTQeT4VRpRhqto00yWHdHhc7MFL8B
	T6ekZzq4JunhVn6vXRaohH+rhjJI8M4rJm2usmTTRDvM7Zo=
X-Google-Smtp-Source: ABdhPJzifDtmp1KOcVZM5c1KCJUCPffdbs83Eym8asAMyev9EXi87+eBIcYJ56aJG0CRxMAUN9hKeYSoXSxnjqXJPt0=
X-Received: by 2002:a0c:e950:: with SMTP id n16mr25332659qvo.43.1618902858747;
 Tue, 20 Apr 2021 00:14:18 -0700 (PDT)
MIME-Version: 1.0
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 20 Apr 2021 07:14:07 +0000
Message-ID: <CACPK8XeJdHmxyJn43Ju5hmxJ7+rJgHmx=ANFaL17YUmp+gOtJg@mail.gmail.com>
Subject: [RESEND GIT PULL] ARM: bmc: devicetree changes for 5.13, v2
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	linux-aspeed <linux-aspeed@lists.ozlabs.org>, Andrew Jeffery <andrew@aj.id.au>
Content-Type: text/plain; charset="UTF-8"

Hello Arnd,

Here we go! The second try at a second set of changes for v5.13. I
think I've sorted out the gremlins, thank you for your patience.

The following changes since commit ee33e2fb3d70267de00f7c0b09e7e3b309a686df:

  ARM: dts: nuvoton: Add Quanta GBS BMC Device Tree (2021-04-08 11:21:05 +0930)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/joel/bmc.git
tags/bmc-5.13-devicetree-2

for you to fetch changes up to f0145db24e65f6cf13347a90ffb86e5ef2ff2ca2:

  ARM: dts: aspeed: tiogapass: add hotplug controller (2021-04-16
12:28:38 +0930)

----------------------------------------------------------------
BMC device tree updates for 5.13, round two

 - Fixes to the first pull request for Rainier

 - Small changes for Rainier, EthanolX and Tiogapass

----------------------------------------------------------------
Eddie James (4):
      ARM: dts: aspeed: Rainier: Fix PCA9552 on bus 8
      ARM: dts: aspeed: Rainier: Fix humidity sensor bus address
      ARM: dts: aspeed: Rainier 1S4U: Fix fan nodes
      ARM: dts: aspeed: Rainier: Update to pass 2 hardware

Konstantin Aladyshev (1):
      ARM: dts: aspeed: amd-ethanolx: Enable all used I2C busses

Paul Fertser (1):
      ARM: dts: aspeed: tiogapass: add hotplug controller

 arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts      |  30 ++
 .../arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts |   5 +
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier-1s4u.dts  |   2 +-
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts       | 306 +++++++++++----------
 4 files changed, 201 insertions(+), 142 deletions(-)
