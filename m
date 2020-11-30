Return-Path: <SRS0=Lymt=FE=gmail.com=joel.stan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C38DFC5519F
	for <soc@archiver.kernel.org>; Mon, 30 Nov 2020 06:38:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 78310206CA; Mon, 30 Nov 2020 06:38:08 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A3537206C0;
	Mon, 30 Nov 2020 06:38:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=jms.id.au header.i=@jms.id.au header.b="dnf1RaF9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A3537206C0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=joel.stan@gmail.com
Received: by mail-qk1-f169.google.com with SMTP id n132so9960780qke.1;
        Sun, 29 Nov 2020 22:38:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8aZH7xH1QClemQN3cgWizp/vs6QuuxBKUGXhMGD3Yrw=;
        b=dnf1RaF9He5u7B7kCVjE3mq49sOOHfEKNobnfTtzM9J1L3A8BY+SLwQCUALTbVtjQ9
         CtTG+NlxBt0Ibuwgt9p/fBWHT9seZvEiNKfp1hwdSGjGaoULJadvpudwhJJKx51XkjDS
         86hnkjOjf6PlCqqgNJbCmQeF4Ggc3QCNKwqJs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8aZH7xH1QClemQN3cgWizp/vs6QuuxBKUGXhMGD3Yrw=;
        b=NPhh6jV1bTDh0ti8AoJQlbA25QZIYtIGyXSc3HzXMzHH2Wdp4A2yjn3B5bm7VUJ95M
         5bjUyoZUhsWiYFwyp6buYP8d2ab+iCDWldrd+P3je5TCIEcQNCbbDIFz/WHaYNjq15hH
         aQS69653b0SHKyAw+ayxyAJJZfnMcUgu0LcyuNu8nQEwwEsScWKl/gVrYMFwoAwav93V
         VZadxepE3E9Y111ZvTBcV4/ECNBZ/WyHM6/+HrN8iCkfWvuDKuK14OAaTsl0Y1zSlNzP
         FLGhvD54eJGpQMcap0X3f3FPjjVOAM/85MOfyMhEAX/LiAmN8X4T+jTfF1g2oekUk5Uo
         EodA==
X-Gm-Message-State: AOAM530GOksNRxK5FoUcBMIl4/U/jnwUrH4hSYTukbYi5hDb7iX09zYB
	Ib999AX2aBD7vx6snqylfafbzXgKl1HmE1Zj5eCST5vAPRs=
X-Google-Smtp-Source: ABdhPJxAEMvfikp/jML+4aNUOqTwtkbn7fThOwCxc075GAV7c9ruhKnxeHHLCnRB2VLfe8V0zUi3fQ8Kl5Ulo0RaUV4=
X-Received: by 2002:a37:6805:: with SMTP id d5mr21254604qkc.66.1606718285247;
 Sun, 29 Nov 2020 22:38:05 -0800 (PST)
MIME-Version: 1.0
References: <CACPK8Xfd7AmuEaUdFfYLu4ktcrpTnYUgwQSxUbC-McB02hvo_g@mail.gmail.com>
In-Reply-To: <CACPK8Xfd7AmuEaUdFfYLu4ktcrpTnYUgwQSxUbC-McB02hvo_g@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 30 Nov 2020 06:37:53 +0000
Message-ID: <CACPK8Xf-agBq2iBJyXOn_XKBoOaE1FPtY00P+n3Z2gNDuy88QA@mail.gmail.com>
Subject: Re: [GIT PULL] ARM: aspeed: soc changes for 5.11
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>, arm <arm@kernel.org>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>, Andrew Jeffery <andrew@aj.id.au>, 
	linux-aspeed <linux-aspeed@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 30 Nov 2020 at 06:30, Joel Stanley <joel@jms.id.au> wrote:
>
> Hello Soc maintainers,
>
> Here are some ASPEED changes for the 5.11 merge window.

Despite the subject, these are the device tree changes. Apologies for
the confusion.

>
> The following changes since commit 2ba56f464f0c1a7264160f8675063b3df92e7966:
>
>   ARM: dts: aspeed: ast2600evb: Add MAC0 (2020-11-19 22:31:18 +1030)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/joel/aspeed.git
> tags/aspeed-5.11-devicetree
>
> for you to fetch changes up to 2ba56f464f0c1a7264160f8675063b3df92e7966:
>
>   ARM: dts: aspeed: ast2600evb: Add MAC0 (2020-11-19 22:31:18 +1030)
>
> ----------------------------------------------------------------
> ASPEED device tree updates for 5.11
>
>  - New machines
>
>    * Bytedance G220A, an AST2500 BMC for an x86 server
>    * Facebook Galaxy100, an AST2400 BMC for a network switch
>    * IBM Rainier 4U, an AST2600 BMC for a PowerPC server
>
>  - Reworking of Facebook device trees to use common dtsi
>
>  - A 64MB flash layout used by the G220A
>
>  - Misc updates to tiogapass, ethanolx, s2600wf, tacoma and rainier
>
> ----------------------------------------------------------------
> Andrew Jeffery (4):
>       ARM: dts: tacoma: Fix node vs reg mismatch for flash memory
>       ARM: dts: rainier: Add reserved memory for ramoops
>       ARM: dts: tacoma: Add reserved memory for ramoops
>       ARM: dts: aspeed: rainier: Don't shout addresses
>
> Billy Tsai (1):
>       ARM: dts: aspeed-g6: Fix the GPIO memory size
>
> Eddie James (2):
>       ARM: dts: aspeed: rainier: Add 4U device-tree
>       ARM: dts: aspeed: rainier: Mark FSI SPI controllers as restricted
>
> George Liu (1):
>       ARM: dts: Fix label address for 64MiB OpenBMC flash layout
>
> Joel Stanley (2):
>       ARM: dts: aspeed: s2600wf: Fix VGA memory region location
>       ARM: dts: aspeed: ast2600evb: Add MAC0
>
> John Wang (2):
>       ARM: dts: Add 64MiB OpenBMC flash layout
>       ARM: dts: aspeed: g220a: Add some gpios
>
> Konstantin Aladyshev (4):
>       ARM: dts: aspeed: amd-ethanolx: Update KCS nodes to use v2 binding
>       ARM: dts: aspeed: amd-ethanolx: Enable KCS channel 3
>       ARM: dts: aspeed: amd-ethanolx: Enable devices for the iKVM functionality
>       ARM: dts: aspeed: amd-ethanolx: Add GPIO line names
>
> Lotus Xu (1):
>       ARM: dts: aspeed: Add Bytedance g220a BMC machine
>
> Paul Fertser (1):
>       arm: dts: aspeed: tiogapass: Enable second MAC
>
> Tao Ren (6):
>       ARM: dts: aspeed: Common dtsi for Facebook AST2400 Network BMCs
>       ARM: dts: aspeed: wedge40: Use common dtsi
>       ARM: dts: aspeed: wedge100: Use common dtsi
>       ARM: dts: aspeed: Add Facebook Galaxy100 (AST2400) BMC
>       ARM: dts: aspeed: wedge400: Fix FMC flash0 layout
>       ARM: dts: aspeed: minipack: Fixup I2C tree
>
> Vijay Khemka (1):
>       ARM: dts: aspeed: tiogapass: Remove vuart
