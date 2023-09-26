Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DE36E7F134
	for <soc@archiver.kernel.org>; Tue, 26 Sep 2023 21:03:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 727B2C43142; Tue, 26 Sep 2023 21:03:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5CF89C07618;
	Tue, 26 Sep 2023 21:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695762233;
	bh=61s8Emtgg7vL52csivvBajyg9Uxp+6PTIeA+ORl7pzU=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=IcLJDahvUqX58fafObXN79Ztl2BMWfFe8ZqhTdXeG69tIudKDn/VL3Hz6pZN3qtO3
	 8afvhO0xItY/2y3A9emlibVIqdWwRhgLn/NeE5iqqKxlzBIp67t/tH4VC/TbKlcwR5
	 Goix87xlQbsatPrEoDtyc6kjs+AxfxIbWpajvoBV/I+LxJWFAcFDbGtuH4kFazQXBZ
	 zXijonoPgXejeBVPx5x86PzpcmokofSR12CTEgOspRrYLplSKbL1ZjpgtNuB18o6SK
	 j9Myw8OWVWv3RGohqkXg535FE6/g1ohQfPtFm0NbU6SYyMO0O0ox8JRWlunuKyND0Y
	 d413vd5+uYV1w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 4B88BC73FE9;
	Tue, 26 Sep 2023 21:03:53 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] ARM: uniphier: fix cache kernel-doc warnings
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169576223330.24546.17567297510676281201.git-patchwork-notify@kernel.org>
Date: Tue, 26 Sep 2023 21:03:53 +0000
References: <20230926003548.22066-1-rdunlap@infradead.org>
In-Reply-To: <20230926003548.22066-1-rdunlap@infradead.org>
To: Randy Dunlap <rdunlap@infradead.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 25 Sep 2023 17:35:48 -0700 you wrote:
> Fix kernel-doc warning(s) as reported by lkp:
> 
> arch/arm/mm/cache-uniphier.c:72: warning: cannot understand function prototype: 'struct uniphier_cache_data '
> cache-uniphier.c:82: warning: Function parameter or member 'way_ctrl_base' not described in 'uniphier_cache_data'
> 
> Fixes: e7ecbc057bc5 ("ARM: uniphier: add outer cache support")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Reported-by: kernel test robot <lkp@intel.com>
> Link: lore.kernel.org/r/202309260130.Uvwh8ceE-lkp@intel.com # fixes only one item
> Cc: Masahiro Yamada <masahiroy@kernel.org>
> Cc: Olof Johansson <olof@lixom.net>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: soc@kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
> Cc: Masami Hiramatsu <mhiramat@kernel.org>
> 
> [...]

Here is the summary with links:
  - ARM: uniphier: fix cache kernel-doc warnings
    https://git.kernel.org/soc/soc/c/361be2db8e8d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


