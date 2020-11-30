Return-Path: <SRS0=GSTU=FE=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD560C5519F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Nov 2020 06:32:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D463720644
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Nov 2020 06:32:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qn7wcalq";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=jms.id.au header.i=@jms.id.au header.b="nMiIsMha"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D463720644
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:MIME-Version:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cX+WIjb0LreeJDQ1M6SsA0CA+TNEdDbRcsHR7S2a9j4=; b=qn7wcalqvD6Wf8dz/4XkuGfbbg
	4Ka6g33ilrc8zwGoycApQ8P2GRfw3+brQiBzQmAao6ZojVUIQPTv9s0WJxl38EitZ/bN98/JGNB2A
	Bz7JEE1RPCk2LmCUigeppzxKS2kTp7KMtVoXwmF7La/ozFRsuZDXD0PjUq6B14AnO6yDCDQ86oztm
	ikDAZ8Yerp8TvLugO2x/bjAOWBYLsmQKHNL8wVJHhWjrf9CuPRKAn4IMELZUFd3nhfLmWSQbIZon2
	xXjoKUFfPtWA+1N190zizU9TmCGRQYthvOokgRWxJt6Vn7Sk2CbBDuwU2UwTb6wGhiqca32Jx1cEU
	cckHD2zw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kjciE-0000WC-43; Mon, 30 Nov 2020 06:31:02 +0000
Received: from mail-qv1-xf29.google.com ([2607:f8b0:4864:20::f29])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kjciB-0000Vt-AB
 for linux-arm-kernel@lists.infradead.org; Mon, 30 Nov 2020 06:31:00 +0000
Received: by mail-qv1-xf29.google.com with SMTP id es6so5125384qvb.7
 for <linux-arm-kernel@lists.infradead.org>;
 Sun, 29 Nov 2020 22:30:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=SkKhQ5M+XjsMOdIyTo4RQMaCEvjK4oB1kdXFcYS/kQA=;
 b=nMiIsMha3UxRAI8vZLScX2bDFT3T4OijJ5bou1n/fEOjUWFYwuS3QnCubsI7It8zaH
 KaGxl/BJ12F2zIBH7MjB/b2ma3DAe1p8rTUmKL8LM1c2UA6SuhToH+hWU+UkcWC9uikN
 Mdz3mQOboxM9l1ANSqEMpMW/QhFM4wiYZk0ng=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=SkKhQ5M+XjsMOdIyTo4RQMaCEvjK4oB1kdXFcYS/kQA=;
 b=SjRkfqkGk/+ZYS/qPrTncMeoyEWcHw2TMATxepG0Css09IzSrxaC4rfRUh3SPr41yd
 XhWxO0OKmFM5ZmhDO6FqR1w9GcldmtmTaD0up1NL6uPBSrLLmr2Wt77jwDULbzSdNiNZ
 dj1b7TzKt2kKdoSlZmYp7gkXQhbSkpYHB4oVmu2qrvzSi9vIvm3ITAUEltKbLrYsU0Nc
 MNW9e7veOIMb3mupWzaCoOE6KEOr/sZz5ncEX4AiWeRFfS5rys8rgl6zjb/tA+Ph9+bc
 rlz6UM9/k6JrUux9X1g/CUgvu0qwBwm+1VaYjOPatvYoGGfvYteuWVv20qKtw78pk1yL
 6Ghg==
X-Gm-Message-State: AOAM532X6samp+FHBusxeGuj7GUpOMGUT0eosGMJqPKRizAgEt+xmBVx
 xpm+C4nUH0gPqMHcB8c4QXKsTp9rIXnBEpF/fFo=
X-Google-Smtp-Source: ABdhPJxqT90NVWY+61RTtkBQ23jQdz+Ls+bu8p2zWyPN3Hhm8Lr/ml00x02T4KEFdUzhoqaueZVNmK39TWk+PZth4FQ=
X-Received: by 2002:ad4:5687:: with SMTP id bc7mr4544845qvb.61.1606717855656; 
 Sun, 29 Nov 2020 22:30:55 -0800 (PST)
MIME-Version: 1.0
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 30 Nov 2020 06:30:44 +0000
Message-ID: <CACPK8Xfd7AmuEaUdFfYLu4ktcrpTnYUgwQSxUbC-McB02hvo_g@mail.gmail.com>
Subject: [GIT PULL] ARM: aspeed: soc changes for 5.11
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>, arm <arm@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201130_013059_511546_842508C9 
X-CRM114-Status: UNSURE (   9.42  )
X-CRM114-Notice: Please train this message.
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
Message-ID: <20201130063044.9a5OXBWGz5dC5m2mJpbwuMFSe1g5nE-_He5tzK0aWRc@z>

Hello Soc maintainers,

Here are some ASPEED changes for the 5.11 merge window.

The following changes since commit 2ba56f464f0c1a7264160f8675063b3df92e7966:

  ARM: dts: aspeed: ast2600evb: Add MAC0 (2020-11-19 22:31:18 +1030)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/joel/aspeed.git
tags/aspeed-5.11-devicetree

for you to fetch changes up to 2ba56f464f0c1a7264160f8675063b3df92e7966:

  ARM: dts: aspeed: ast2600evb: Add MAC0 (2020-11-19 22:31:18 +1030)

----------------------------------------------------------------
ASPEED device tree updates for 5.11

 - New machines

   * Bytedance G220A, an AST2500 BMC for an x86 server
   * Facebook Galaxy100, an AST2400 BMC for a network switch
   * IBM Rainier 4U, an AST2600 BMC for a PowerPC server

 - Reworking of Facebook device trees to use common dtsi

 - A 64MB flash layout used by the G220A

 - Misc updates to tiogapass, ethanolx, s2600wf, tacoma and rainier

----------------------------------------------------------------
Andrew Jeffery (4):
      ARM: dts: tacoma: Fix node vs reg mismatch for flash memory
      ARM: dts: rainier: Add reserved memory for ramoops
      ARM: dts: tacoma: Add reserved memory for ramoops
      ARM: dts: aspeed: rainier: Don't shout addresses

Billy Tsai (1):
      ARM: dts: aspeed-g6: Fix the GPIO memory size

Eddie James (2):
      ARM: dts: aspeed: rainier: Add 4U device-tree
      ARM: dts: aspeed: rainier: Mark FSI SPI controllers as restricted

George Liu (1):
      ARM: dts: Fix label address for 64MiB OpenBMC flash layout

Joel Stanley (2):
      ARM: dts: aspeed: s2600wf: Fix VGA memory region location
      ARM: dts: aspeed: ast2600evb: Add MAC0

John Wang (2):
      ARM: dts: Add 64MiB OpenBMC flash layout
      ARM: dts: aspeed: g220a: Add some gpios

Konstantin Aladyshev (4):
      ARM: dts: aspeed: amd-ethanolx: Update KCS nodes to use v2 binding
      ARM: dts: aspeed: amd-ethanolx: Enable KCS channel 3
      ARM: dts: aspeed: amd-ethanolx: Enable devices for the iKVM functionality
      ARM: dts: aspeed: amd-ethanolx: Add GPIO line names

Lotus Xu (1):
      ARM: dts: aspeed: Add Bytedance g220a BMC machine

Paul Fertser (1):
      arm: dts: aspeed: tiogapass: Enable second MAC

Tao Ren (6):
      ARM: dts: aspeed: Common dtsi for Facebook AST2400 Network BMCs
      ARM: dts: aspeed: wedge40: Use common dtsi
      ARM: dts: aspeed: wedge100: Use common dtsi
      ARM: dts: aspeed: Add Facebook Galaxy100 (AST2400) BMC
      ARM: dts: aspeed: wedge400: Fix FMC flash0 layout
      ARM: dts: aspeed: minipack: Fixup I2C tree

Vijay Khemka (1):
      ARM: dts: aspeed: tiogapass: Remove vuart

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
