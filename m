Return-Path: <SRS0=Lymt=FE=gmail.com=joel.stan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9CAFC63777
	for <soc@archiver.kernel.org>; Mon, 30 Nov 2020 06:41:49 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 53192206D8; Mon, 30 Nov 2020 06:41:49 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D4B42206CB
	for <soc@kernel.org>; Mon, 30 Nov 2020 06:41:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=jms.id.au header.i=@jms.id.au header.b="l6bODzPG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D4B42206CB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=joel.stan@gmail.com
Received: by mail-qv1-f50.google.com with SMTP id ec16so5149794qvb.0
        for <soc@kernel.org>; Sun, 29 Nov 2020 22:41:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=CdHx5KiLyaEyJOC9X9oNjng2qNlznD6EoCcuDCWrNT8=;
        b=l6bODzPGxrdcLVgrkechssNiqLkRpX9WT8LeswM/031xZokPqcNgulSTnmyVeosJtJ
         +p4niSgGUL3kf8ugVnFCEAMAFktMyu5W0sejbPS/OW9MSDzIgEk0t12JqwE352+1Q1UM
         tJj2nQskac0vytch8rLOPsoJdCwufHdXO1l44=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=CdHx5KiLyaEyJOC9X9oNjng2qNlznD6EoCcuDCWrNT8=;
        b=GZdZv4kNhIl7gX2AWItFa12GKQvKIk94e0oMc0dHTQZ8L9ZasejfNRFDuxpu1aWyCc
         bpKo7QGTLLN+354cRrA0o8oz/r6abyn7RPExihJAavahT9eZnU5uGA3ijHUeQoI4I/vn
         RcZKxu6z//A8cZzLsPNI4vZjlkO5frIYSGgpjUIc5Gol3VpGU1RQKQcr/RVMYq7e23fs
         xP4acJbDyFdnoXi/UuLGXAICyNMsD/UHchp2tfKFCVKuGT3TGUOH83c2XtRLEzNPAjtB
         rFsk8W4TI1hm1daGHB3svtWkZIWdpksWWca5Q5bpqdtTlMkZ1UTMfbtdD8pOG4D84Inj
         fXGw==
X-Gm-Message-State: AOAM5337gcE4gERBE9/hjUpBZIoscfzd6YZaG2kZA5JDG8ix9WyirgUP
	NgXMEozxHv2LroxbsUd2iNGiHI7jx6FyiB/EQ0n73lyEhNJW8g==
X-Google-Smtp-Source: ABdhPJxa/Le1uLRFRYP53fUxHYNmUKAq37dxseEtROHnYq1o89Km+OP/pXw2TYoyxUv2xqW7yinMpFianyxDaV+jmtU=
X-Received: by 2002:a0c:aed4:: with SMTP id n20mr20713780qvd.16.1606718506893;
 Sun, 29 Nov 2020 22:41:46 -0800 (PST)
MIME-Version: 1.0
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 30 Nov 2020 06:41:35 +0000
Message-ID: <CACPK8Xe=9ezhyWRMqVOEQr7SU1YoYfVBGGdGzjmE4SiBr--vJQ@mail.gmail.com>
Subject: [GIT PULL] ARM: aspeed: actually the soc changes for 5.11
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>
Cc: linux-aspeed <linux-aspeed@lists.ozlabs.org>, Andrew Jeffery <andrew@aj.id.au>
Content-Type: text/plain; charset="UTF-8"

Hello Soc maintainers,

Here are some ASPEED SoC changes for the v5.11 merge window.

These are mostly the 5.10 changes without the XDMA driver, which I
didn't get a response on my question about where we wanted that to
live[1]

https://lore.kernel.org/linux-arm-kernel/CACPK8XcLOopkx0k14k25puD3YkwHzZS0+3TLcEL43xbxCZBphA@mail.gmail.com/

The following changes since commit 4da595ddc06909d9ba8fcedcce0c4e1e0a4c3244:

  soc: aspeed: Enable drivers with ARCH_ASPEED (2020-11-19 23:01:36 +1030)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/joel/aspeed.git
tags/aspeed-5.11-soc

for you to fetch changes up to 4da595ddc06909d9ba8fcedcce0c4e1e0a4c3244:

  soc: aspeed: Enable drivers with ARCH_ASPEED (2020-11-19 23:01:36 +1030)

----------------------------------------------------------------
ASPEED soc driver updates for 5.11

New drivers:

 - SoC info driver to expose revision information

New features:

 - AST2600 support for the LPC control driver. This includes
   setting the LPC2AHB bridge up in a backwards compatible manner.

Cleanups:

 - LPC control
 - Kconfig
 - Bindings updates for AST2600 strings

----------------------------------------------------------------
Andrew Jeffery (1):
      soc: aspeed-lpc-ctrl: Fail probe of lpc-ctrl if reserved memory
is not aligned

Brad Bishop (2):
      dt-bindings: aspeed-lpc: Add AST2600 compatible strings
      soc: aspeed: lpc: Add AST2600 compatible strings

Dan Carpenter (1):
      soc: aspeed: Fix a reference leak in aspeed_socinfo_init()

Joel Stanley (8):
      soc: aspeed: Improve kconfig
      dt-bindings: aspeed: Add silicon id node to SCU
      soc: aspeed: Add soc info driver
      ARM: dts: aspeed: Add silicon id node
      soc: aspeed-lpc-ctrl: LPC to AHB mapping on ast2600
      soc: aspeed-lpc-ctrl: Fix whitespace
      soc: aspeed-lpc-ctrl: Fix driver name
      soc: aspeed: Enable drivers with ARCH_ASPEED

Tom Rix (1):
      soc: aspeed: remove unneeded semicolon
