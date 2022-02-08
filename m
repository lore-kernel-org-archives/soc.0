Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23F4DC4321E
	for <soc@archiver.kernel.org>; Tue,  8 Feb 2022 09:12:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D896AC340F6; Tue,  8 Feb 2022 09:12:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BF360C340F4;
	Tue,  8 Feb 2022 09:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1644311578;
	bh=t7nB1wExAlp3rC1TEuJpAroWOcM1zwIdBrAWO9Lb3x0=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=Ysb9Wq2rTkfKPUAbMnxyrtroonn7Qj9RK05rlE2DH3xgJ2S4pHbPcp+xlFL+qrseq
	 SyC5XggblE3GMMb73QMv+OsxAx/EBP/QaBCkRN8wwuBm/1WNFgaRrEJ727ICFUoIYA
	 0uK1on/2vjm2BgF52ShnTwjawoT4tlygoBkFZVp7/4i54UGrHpFupLudWLyqlYTsj5
	 o4qZnStZ60fGwKYt68t0YEobpNp1ZyOsUE82u5au3K4/TgImw+dI/xoY2KxPZM8HAc
	 /FOwfuZuP2cxg1e/Ym8SHQtHhylju9Vd+/zVG1UjJXwJLk0Jx9jq6BAEUZiz9wOpoN
	 lNVNTAfY89i0w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id A0EDAE6D45A;
	Tue,  8 Feb 2022 09:12:58 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] soc: aspeed: lpc-ctrl: Block error printing on probe defer
 cases
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164431157865.18327.11861110417933093406.git-patchwork-notify@kernel.org>
Date: Tue, 08 Feb 2022 09:12:58 +0000
References: <20220201070118.196372-1-joel@jms.id.au>
In-Reply-To: <20220201070118.196372-1-joel@jms.id.au>
To: Joel Stanley <joel@jms.id.au>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Tue,  1 Feb 2022 17:31:18 +1030 you wrote:
> From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> 
> Add a checking code when it gets -EPROBE_DEFER while getting a clock
> resource. In this case, it doesn't need to print out an error message
> because the probing will be re-visited.
> 
> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
> Reviewed-by: Iwona Winiarska <iwona.winiarska@intel.com>
> Link: https://lore.kernel.org/r/20211104173709.222912-1-jae.hyun.yoo@intel.com
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> 
> [...]

Here is the summary with links:
  - soc: aspeed: lpc-ctrl: Block error printing on probe defer cases
    https://git.kernel.org/soc/soc/c/301a5d3ad243

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


