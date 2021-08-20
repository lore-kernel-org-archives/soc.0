Return-Path: <SRS0=+Tkq=NL=gmail.com=joel.stan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C48FCC4338F
	for <soc@archiver.kernel.org>; Fri, 20 Aug 2021 06:57:37 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 9491060EBC; Fri, 20 Aug 2021 06:57:37 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9EEA761042
	for <soc@kernel.org>; Fri, 20 Aug 2021 06:57:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9EEA761042
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f47.google.com with SMTP id f7so5015067qvt.8
        for <soc@kernel.org>; Thu, 19 Aug 2021 23:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=lkqLAJOtyy+YUdhrYPA+bRzMAzOf22GDg+DJ02DtLVc=;
        b=ez0h2GnAsw9nyE6vHO8RTsKE7gM+sQUsTEeXabzp3YmS25OfoZLxlpR4L/D7yWeEIe
         uspj/QajhSi908C79vGMfY6GEk6fH3/h3oGGSJncmlbOJEEzO5UfZU6UUkz90WY2bCJB
         qmSQlbolBZgfAe3wg+3Lct26+ViHXBvax6/Ec=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=lkqLAJOtyy+YUdhrYPA+bRzMAzOf22GDg+DJ02DtLVc=;
        b=guGaJH9zRhTUUpmteoiHu52s89VvqYFEdbprMn9ADoP9l9O7Gh9fpCLfX1EQlu1e93
         upMcD5oSnCCmqQD1hQbVdcVAOqHwhTY55J/SKFKXwmpD459t9xrn4wR/QJVXvOeNjnw6
         Ep0TL0r0gO50bibd1JfDCsKCI8BBVdS8uIoYhAJTpQwHIonvJzOBNLaouPcoygRybwME
         xaSfxQq08xwJshz7yOgpcMP2fYAkY76SNNzUV9tuFbGmDoTuqUVFyhhmdwyI+7Q7XYjV
         FGWcqKk2CsOJ9BwiFFa1gh5ewoD7PPuvR/aj08DIJgmxlD/+AW+J9GabFF3H97Xyyt3J
         OJgw==
X-Gm-Message-State: AOAM531ewodq1zLqD3llGkzdkjX8YU34hsjEJ1bavrN3Geq16B5yHUB8
	01icQlkwhJ8P0fQfXRPiqUdTLs7IgM+eIxoZwzmg1rXjATA=
X-Google-Smtp-Source: ABdhPJz6OTbflJCYACZ7DsAZ4MzA345+fqJTPHx13X/1ctgZxWuqPYzlVf9y9O4aPTz7L1d2eL6e/6Tkw7sevDTQTeo=
X-Received: by 2002:a05:6214:cc9:: with SMTP id 9mr18358394qvx.43.1629442655136;
 Thu, 19 Aug 2021 23:57:35 -0700 (PDT)
MIME-Version: 1.0
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 20 Aug 2021 06:57:24 +0000
Message-ID: <CACPK8XdzKdnyrpjKukGWieBhLgQnBs+y=LuSr_weot=Ovy3+9A@mail.gmail.com>
Subject: [GIT PULL] ARM: aspeed: defconfig changes for 5.15
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	linux-aspeed <linux-aspeed@lists.ozlabs.org>, Andrew Jeffery <andrew@aj.id.au>
Content-Type: text/plain; charset="UTF-8"

Dear Soc maintainers,

This is the last of the aspeed pull requests for v5.15.

Apologies for drip feeding them, I was pressed for time so I started
with the most important and worked down the list.

The following changes since commit 2734d6c1b1a089fb593ef6a23d4b70903526fe0c:

  Linux 5.14-rc2 (2021-07-18 14:13:49 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/joel/bmc.git
tags/aspeed-5.15-defconfig

for you to fetch changes up to a4836d5ad127fe31fecb29878d81f2e9b4a5591c:

  ARM: config: aspeed: Regenerate defconfigs (2021-08-19 16:33:43 +0930)

----------------------------------------------------------------
ASPEED defconfig updates for 5.15

 - Enable new KCS SerIO driver

 - Enable SGPIO and EDAC for AST2400 now they are supported there

 - Switch to SLUB and enable SLAB_FREELIST_HARDENED

 - Regenerate defconfigs atop v5.14-rc2

----------------------------------------------------------------
Joel Stanley (4):
      ARM: config: aspeed: Enable hardened allocator feature
      ARM: config: aspeed: Enable KCS adapter for raw SerIO
      ARM: config: aspeed_g4: Enable EDAC and SPGIO
      ARM: config: aspeed: Regenerate defconfigs

 arch/arm/configs/aspeed_g4_defconfig | 16 +++++-----------
 arch/arm/configs/aspeed_g5_defconfig | 25 +++++++++----------------
 2 files changed, 14 insertions(+), 27 deletions(-)
