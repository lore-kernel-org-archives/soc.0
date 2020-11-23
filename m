Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC4EBC2D0E4
	for <soc@archiver.kernel.org>; Mon, 23 Nov 2020 16:49:52 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id B140F2080A; Mon, 23 Nov 2020 16:49:52 +0000 (UTC)
Received: from threadripper.lan (HSI-KBW-46-223-126-90.hsi.kabel-badenwuerttemberg.de [46.223.126.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 4E0D720717;
	Mon, 23 Nov 2020 16:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1606150192;
	bh=wtxrWHiHkUJ6z/inA1E4kMFPt1c5qXpOw1gn+8Wnohw=;
	h=From:To:List-Id:Cc:Subject:Date:In-Reply-To:References:From;
	b=IJq518indwg33XKnc/W/XS1bU5Ji8x9oJPInU/ZNmX3uiowmg15/RUDiPO54WCaNT
	 4ewdBZQj+hYttZEp6bsen/UP0cPinRFzE1BUahiokiA4ajoZLjiJpwQ15lo4hY6v0a
	 OLJ1n5siQgDiCSyCOeBT7MIm6No0GMo/xzEPBsNk=
From: Arnd Bergmann <arnd@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>,
	arm@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	soc@kernel.org
Subject: Re: [GIT PULL] Rockchip dts fixes for 5.10
Date: Mon, 23 Nov 2020 17:49:47 +0100
Message-Id: <160615017104.69574.17136500205364184007.b4-ty@arndb.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <11641389.O9o76ZdvQC@phil>
References: <11641389.O9o76ZdvQC@phil>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Sun, 22 Nov 2020 14:33:05 +0100, Heiko Stuebner wrote:
> please find below some Rockchip devicetree fixes for the 5.10 cycle.
> Please pull!
> 
> Thanks
> Heiko
> 
> The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:
> 
> [...]

Merged into arm/fixes, thanks!

merge commit: 4765df4d3a132764077a83ed0df4ee4cc7866fbb

       Arnd
