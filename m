Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2D17C6FA94
	for <soc@archiver.kernel.org>; Wed, 28 Sep 2022 21:00:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B5C9AC43153; Wed, 28 Sep 2022 21:00:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A0021C433C1;
	Wed, 28 Sep 2022 21:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664398829;
	bh=2omM+oks5fcf8K4WKoj1Wpk+qE6da6waVIipbZ/shX4=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=lswb8TovT2cTQ22oKT77GyjVKQnafCY8/1wm01qLa52q+aLa848fu8WhgbI3uIiBE
	 Ie9Wa16Zi1SkRiyKR9mZrIDugSDX9hRMIxPYwa99I9+lU0No1OJfAC5r0kuV4TEpgC
	 kDoSqKFakfIRNdGbPmmNlp33dmLv+Lbns2azrN3QUAraMQuD+stWEaKNIOYay0RSLs
	 M+JHd+FqhhbyaKo0bPD2tHeau4mQkUAsyKsoB31cV3jd8ui4bCxZGSds3pblFEoXsM
	 j0tCmEae3hsy4Wz2hvvsWGZon55yofVo17xpmzeU08seaVWJ6015qMXeg/+KBtrBvi
	 gG+qMzBJMaxZg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 8E229C395DA;
	Wed, 28 Sep 2022 21:00:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] ARM: Drop CMDLINE_FORCE dependency on !ARCH_MULTIPLATFORM
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166439882957.18494.717185617464308022.git-patchwork-notify@kernel.org>
Date: Wed, 28 Sep 2022 21:00:29 +0000
References: <c557b149780faa2299700585afc9d270ede7f78b.1664285062.git.geert+renesas@glider.be>
In-Reply-To: <c557b149780faa2299700585afc9d270ede7f78b.1664285062.git.geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 27 Sep 2022 15:26:26 +0200 you wrote:
> On older platforms that boot an image with an appended DTB, or where
> the boot loader has no support for updating chosen/bootargs, it is
> common to rely on CMDLINE_FORCE.
> 
> While a fixed command line can make the kernel unbootable on other
> platforms, it is not guaranteed to cause that.  E.g. all Renesas boards
> use the same chosen/bootargs in upstream DTS, which works fine if your
> DHCP server hands out proper nfsroot parameters.
> 
> [...]

Here is the summary with links:
  - ARM: Drop CMDLINE_FORCE dependency on !ARCH_MULTIPLATFORM
    https://git.kernel.org/soc/soc/c/502647105a1d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


