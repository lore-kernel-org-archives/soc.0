Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3ED6C4338F
	for <soc@archiver.kernel.org>; Thu, 12 Aug 2021 21:06:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 9F46460ED5; Thu, 12 Aug 2021 21:06:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 49E5D6103A;
	Thu, 12 Aug 2021 21:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1628802370;
	bh=V2xGOr9LNmSfReQcoltRgi724g6Hq0eSyDQzTUB8oVY=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sfFrvqt49nysMdvhPJrG0TP+vuiOjSuPFClGvzf10RUZ0wmR+0JXiD8vM8WHA/eTF
	 2Q8JAKIkW+TXPHah2LxJt4OOb3rxu6n/2rHKztRqt8NW65RbmmYGJxtW1bb5zIrW5B
	 O0moZjVXpHI//JSTQLect34WjmXaUpqo5hdtj+bwkBYK/AeXtzqASPSRxbAaDBI+WF
	 xNhP572mtKfrHy/QGI6Fb8p0QzJZn/S/hXAKUIwzgeF8Lt2s4QD3q6GloFHmyXCWZX
	 aL+jL1M6H7W7rwjGYs1+nvKruQTP2aGOct07D+x/hdwbITQ7bEjv4N/EbujBX9FYH3
	 fV8AYe1cHxOMg==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	Tony Lindgren <tony@atomide.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	arm@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-omap@vger.kernel.org
Subject: Re: [GIT PULL 3/3] Changes for am3 cpsw and SanCloud for v5.15
Date: Thu, 12 Aug 2021 23:05:45 +0200
Message-Id: <162880206192.1376011.3718743864242008546.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <pull-1628751694-126144@atomide.com-3>
References: <pull-1628751694-126144@atomide.com> <pull-1628751694-126144@atomide.com-3>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Thu, 12 Aug 2021 10:03:44 +0300, Tony Lindgren wrote:
> The following changes since commit 8c054cd2818ea08555efe24a2ffde330833c2f3f:
> 
>   ARM: dts: am57xx: Add PRUSS MDIO controller nodes (2021-08-03 15:25:14 +0300)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.15/dt-am3-signed
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 81b6a285737700c2e04ef0893617b80481b6b4b7

       Arnd
