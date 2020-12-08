Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B400AC433FE
	for <soc@archiver.kernel.org>; Tue,  8 Dec 2020 23:10:43 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 8897923AFB; Tue,  8 Dec 2020 23:10:43 +0000 (UTC)
From: Arnd Bergmann <arnd@kernel.org>
Authentication-Results:mail.kernel.org; dkim=permerror (bad message/signature format)
List-Id: <soc.lore.kernel.org>
To: arm <arm@kernel.org>,
	SoC Team <soc@kernel.org>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Joel Stanley <joel@jms.id.au>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Avi Fishman <avifishman70@gmail.com>,
	Patrick Venture <venture@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Nancy Yuen <yuenn@google.com>
Subject: Re: [GIT PULL] ARM: nuvoton: devicetree changes for 5.11
Date: Wed,  9 Dec 2020 00:09:44 +0100
Message-Id: <160746884519.2839681.4377431235055917877.b4-ty@arndb.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <CACPK8Xd8RaLv_p6t9ckBwCwtZww+2YYOAoAYQdvni0dxc2mS7A@mail.gmail.com>
References: <CACPK8Xd8RaLv_p6t9ckBwCwtZww+2YYOAoAYQdvni0dxc2mS7A@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 30 Nov 2020 06:57:59 +0000, Joel Stanley wrote:
> Here's a different one from me. A little while back during a
> discussion about the OpenBMC ventor kernel tree, and how we could get
> the Nuvoton patches upstream, Tomer asked if I could help prepare a
> pull request.

Sure, that works for me.

> Here it is! These patches have been sitting in the OpenBMC tree for
> varying amounts of time, sometimes dating back to 2018. The Nuvoton
> team is still working on upstreaming their drivers, so the device
> trees are reduced versions that only describe hardware that is in the
> mainline kernel.

Merged into arm/dt, thanks!

merge commit: f458d69bf7cac5da16a9133d226a71e88b33042d

       Arnd
