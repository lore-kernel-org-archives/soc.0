Return-Path: <SRS0=zFty=JG=gmail.com=joel.stan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73BBDC433ED
	for <soc@archiver.kernel.org>; Fri,  9 Apr 2021 06:30:06 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 49EA060FED; Fri,  9 Apr 2021 06:30:06 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC07961178
	for <soc@kernel.org>; Fri,  9 Apr 2021 06:30:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DC07961178
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=joel.stan@gmail.com
Received: by mail-qk1-f172.google.com with SMTP id g15so4854156qkl.4
        for <soc@kernel.org>; Thu, 08 Apr 2021 23:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=t6sfaiKhpJzm6PSIf/ddHU0ldz4ZXvQKkmw7oDKOIyg=;
        b=PXJMuB/sRtry0TFRSRVSvL9b1Obex34q0EYuMI0KevjzaahGxSYOdPJj3p7uQMktf/
         SmDk9QgSUPq+OoXavw9h2kYvWLge9VXenmNjZbO+kUFE75AhlFQGG35rCT128ILSFQJa
         hfO1qs7pyU+lY9CFAMh9YRXev0ZMrHy0InAZQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=t6sfaiKhpJzm6PSIf/ddHU0ldz4ZXvQKkmw7oDKOIyg=;
        b=IQEznZyiUdn6rj/Br0FJcT10Jw6vEuSvBIzQ8HqNevnc6g1TD52dqpYSyiwcVUK9Xm
         8gAujT4jLqIF/egTA99tRTmdP1loBIqtEpO/Mzp0NKLrn0To0MrOBF6hI8vIiUc7q5+X
         lTQ2lAHnmBFVHNG5i7d/yuiqBMcfjLo+AHg27ntwDX8jNuW/hdjwmFMAfHA+w5nZkNTg
         rd7m1F1mRNr+nUPYpBEQ+hynCu+O2BInqyyK1vS5V1SuzVeKZ6g7nD+f/b4tiaSbwI+t
         6si26vKO7GePSrkwx93b5uGaFR7OKR/P3UU8DQjhNBqr8teKNBiGHXOligvtAz2gFMIm
         dtaw==
X-Gm-Message-State: AOAM531gbj50L6e1chzbsXKP/J85LR3lJY/2jOa3W67r6DexZLc2aKW4
	VwqS6eTSvIqryt17cIqa4nxRmtODMOzdS1BfoFdbnRhle1s87g==
X-Google-Smtp-Source: ABdhPJxgu3cBHKkUKgRIxfjzhkmIIhaArUkzZ7ELQ+REDApTFFkya83HBLiA9F2iqAllfdJfMfC0rTiuwzYTrj86UsY=
X-Received: by 2002:a05:620a:c11:: with SMTP id l17mr12472020qki.487.1617949804254;
 Thu, 08 Apr 2021 23:30:04 -0700 (PDT)
MIME-Version: 1.0
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 9 Apr 2021 06:29:52 +0000
Message-ID: <CACPK8Xcb12LsVr7CUaXXjQskKbVjb7x+jgueG1Hik-kBPWtDSg@mail.gmail.com>
Subject: [GIT PULL] ARM: aspeed: lpc changes for 5.13
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>
Cc: Corey Minyard <cminyard@mvista.com>, Linus Walleij <linus.walleij@linaro.org>, 
	"Chia-Wei, Wang" <chiawei_wang@aspeedtech.com>, Andrew Jeffery <andrew@aj.id.au>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	linux-aspeed <linux-aspeed@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"

Hello Soc maintainers,

This is a pull request containing a slightly messy device tree and
associated driver changes for the ASPEED systems. It corrects some
design decisions made when first mainlining support for the BMC
devices on the LPC bus that have stopped us from being able to write
drivers for eg. KCS.

Andrew has worked with Chai-Wei from ASPEED on this process. These set
of changes have acks from the maintainers, and allow Andrew to go
ahead with fixing the KCS drivers in the future. The branch should
apply with no conflicts no matter which order it is merged.

If you would like to handle this another way then let me know.

The following changes since commit 489774ff5db943642751f4f0fdac9033239208c6:

  soc: aspeed: Adapt to new LPC device tree layout (2021-04-09 13:39:22 +0930)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/joel/bmc.git
tags/aspeed-5.13-lpc

for you to fetch changes up to 489774ff5db943642751f4f0fdac9033239208c6:

  soc: aspeed: Adapt to new LPC device tree layout (2021-04-09 13:39:22 +0930)

----------------------------------------------------------------
ASPEED LPC updates for 5.13

These patches fix the ASPEED LPC bindings and LPC-related device drivers
so in the future the KCS driver can properly use the hardware.

----------------------------------------------------------------
Chia-Wei, Wang (5):
      dt-bindings: aspeed-lpc: Remove LPC partitioning
      ARM: dts: Remove LPC BMC and Host partitions
      ipmi: kcs: aspeed: Adapt to new LPC DTS layout
      pinctrl: aspeed-g5: Adapt to new LPC device tree layout
      soc: aspeed: Adapt to new LPC device tree layout
