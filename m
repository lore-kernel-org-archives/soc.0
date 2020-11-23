Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05337C2D0E4
	for <soc@archiver.kernel.org>; Mon, 23 Nov 2020 16:51:15 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id C97312080A; Mon, 23 Nov 2020 16:51:14 +0000 (UTC)
Received: from threadripper.lan (HSI-KBW-46-223-126-90.hsi.kabel-badenwuerttemberg.de [46.223.126.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 34D8820717;
	Mon, 23 Nov 2020 16:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1606150274;
	bh=Ku1StqMyifkcyvdr0t2hf2dFPklNhBkz5GcnW25qak8=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=A8MA4zx5HhiK/5vcZH12CsGXphdNRsmco4X0VsSoZzVfcdjSQltJSdBRIbuz9MXdm
	 xW3ybJUoqcijImidxu5V5lTbXkRDYPkKfXglSzYWeNhtZQQlWhVLKTSizrzEh9bYbi
	 N+Sn9MyyEluAd6XVAIOVo+87gZTK7nXJtlx8GraQ=
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	arm-soc <arm@kernel.org>,
	arm-soc <soc@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [GIT PULL 1/4] Renesas ARM defconfig updates for v5.11
Date: Mon, 23 Nov 2020 17:51:06 +0100
Message-Id: <160615024264.69722.13378652650561364218.b4-ty@arndb.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201113150854.3923885-2-geert+renesas@glider.be>
References: <20201113150854.3923885-1-geert+renesas@glider.be> <20201113150854.3923885-2-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 13 Nov 2020 16:08:51 +0100, Geert Uytterhoeven wrote:
> The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:
> 
>   Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-arm-defconfig-for-v5.11-tag1
> 
> [...]

Merged into arm/defconfig, thanks!

merge commit: 4b44b61a683e7b1100559b238867e544899a97e7

       Arnd
