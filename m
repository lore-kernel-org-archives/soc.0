Return-Path: <SRS0=GSTU=FE=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E561C63777
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Nov 2020 06:39:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D077206C0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Nov 2020 06:39:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Nosv4fOJ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=jms.id.au header.i=@jms.id.au header.b="dnf1RaF9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8D077206C0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qp4d26bSnkAvZR80mOsV2moPMGhBe7Rvdsmn+xZz/D8=; b=Nosv4fOJbvz65HFHCNXaPfKk+
	tWW9HlAJM2blkTfpIU8MQdoW5/ctN3TSItmGcywQ4H59G+pWph9dLvUu5LDeQMm+8qwJWrX94dOax
	8PJGM4VUZyNMJPdgw8u1/bwzD8Hzohmrd4huIttDzo6BMxrbB9jlayOY+abS5GFvMgCXaYJRUfG5w
	NcgrjK2xfRAMfUyo0JR78jnQ0fli2VM3bEX6t/FfJ1Bupi3oYNQ/fwDyTA/xdcbAG3Mr3NSDqbSWj
	Y9UBFJb6LSZ5OiyfinWDNxcbuloeXTednL9zz/J0+9AItyxiprrnqkfO2gZahfdNFlYY6psKsOpYU
	d7a4xqBjA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kjcp7-0000w4-KY; Mon, 30 Nov 2020 06:38:09 +0000
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kjcp5-0000vi-1c
 for linux-arm-kernel@lists.infradead.org; Mon, 30 Nov 2020 06:38:08 +0000
Received: by mail-qk1-x733.google.com with SMTP id u4so9911818qkk.10
 for <linux-arm-kernel@lists.infradead.org>;
 Sun, 29 Nov 2020 22:38:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8aZH7xH1QClemQN3cgWizp/vs6QuuxBKUGXhMGD3Yrw=;
 b=dnf1RaF9He5u7B7kCVjE3mq49sOOHfEKNobnfTtzM9J1L3A8BY+SLwQCUALTbVtjQ9
 CtTG+NlxBt0Ibuwgt9p/fBWHT9seZvEiNKfp1hwdSGjGaoULJadvpudwhJJKx51XkjDS
 86hnkjOjf6PlCqqgNJbCmQeF4Ggc3QCNKwqJs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8aZH7xH1QClemQN3cgWizp/vs6QuuxBKUGXhMGD3Yrw=;
 b=lEUm65lWB1QirMVu07kRNqljCH09o6F9DDWV21u2yDmWGVj5+VuAeV7qW9b4rAECL1
 A+AMqdzIFrOiwt0/rRFcty5en0tTcOskTKYEjGrZ3T3pZtw6D/6lR2nhziz+jOa71dwD
 APQKTPos9ofOjbKItLT45LK2JbfP+m9ywh0gj+BDZCaO9AdrNndnoH3Vp/EbZEbM6fr0
 oxtzQnpZW8DrGRrEMcVVbNRVJgjcgp0r4EHWvajWj3lZytd+GX8UWEBOYLvkWdEK48mZ
 1FYyUT5l0jweS5SITmqMGW0kkayvGjsAjRFBuZjeYgR1Oi3hTo+7/ehJxu3uTZHFzZBG
 zFkA==
X-Gm-Message-State: AOAM5309IjAxQ+YHB4VA9cfSFo9hAVtRrJgm67tQWHK/33ur5sogO+FL
 5yp7rErRLI9iG8eOBOs9Td6DhaDPSSoVQScReAU=
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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201130_013807_299423_8486AFF4 
X-CRM114-Status: GOOD (  17.71  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201130063753.SXV4-dVVxIXAptdofXgXoIfibZu3-c5w6c6lHbHJxPw@z>

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

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
