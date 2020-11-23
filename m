Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB97CC2D0E4
	for <soc@archiver.kernel.org>; Mon, 23 Nov 2020 16:49:16 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 85F16208DB; Mon, 23 Nov 2020 16:49:16 +0000 (UTC)
Received: from threadripper.lan (HSI-KBW-46-223-126-90.hsi.kabel-badenwuerttemberg.de [46.223.126.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id E1A0520717;
	Mon, 23 Nov 2020 16:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1606150156;
	bh=UsauQ/cAkGlH/x2V0/QOuKus30OUflJDLn9+xA344G8=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hZKGcwxi8daP3uMobCUhlMY/cI99yCFmoazzzs5Cuii3JW6fuY+ABa+7xfUQFj1kP
	 IAddo7ZXXorF4CWSBlCjPHTYBl4sIG8TYxYAZizDmC+kSrK3A1Cl8yaOZIyPYIG7B2
	 Y1q7SuAeAapjr6b7L2yNAOwfuO9c1yq6N3yTsiXU=
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>,
	arm-soc <soc@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-renesas-soc@vger.kernel.org,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL 3/4] Renesas driver updates for v5.11
Date: Mon, 23 Nov 2020 17:49:08 +0100
Message-Id: <160615008041.69276.12679600047968735212.b4-ty@arndb.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201113150854.3923885-4-geert+renesas@glider.be>
References: <20201113150854.3923885-1-geert+renesas@glider.be> <20201113150854.3923885-4-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 13 Nov 2020 16:08:53 +0100, Geert Uytterhoeven wrote:
> The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:
> 
>   Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-drivers-for-v5.11-tag1
> 
> [...]

Merged into arm/drivers, thanks!

merge commit: ec565b0e1a9e9670052c29259b80bfb3c405427e

       Arnd
