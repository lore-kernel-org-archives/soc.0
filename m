Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36F63C4332F
	for <soc@archiver.kernel.org>; Thu, 26 May 2022 14:40:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 09300C3411D; Thu, 26 May 2022 14:40:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DE6EDC34114;
	Thu, 26 May 2022 14:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1653576013;
	bh=kpOqFM4oPBA7NDGXh1jmHWH6EPsBqQdu5h/V4B6yEQI=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=NHN6JSiCAdejFUJ/pTq334o50O4mb60B3jbgIGCTFUQVPUh/ocDJjGqfojetDlLRk
	 gzFCdGwu6oFV1wvRdSPhao/ZIaulmx0uXCzrfXIY19btzrPN8XLYWnSRDVysPtApoq
	 7+IounZtDUVuF7tVPZH0VAJvqWMZNt8UHmAODEWFqFXy7BTxKS4QFXGuBkItXyib2F
	 rmcWmtjIuCYyBp0rHHaDdGCVY1FaQAnLaVUvAHLUTqGDVB0uk2gWsvsZdGkkfxm4P9
	 PTwQtMLKKpo0Sp+eIfGksSPmBSm/QPFpMQ8Q2uKR07VVKY/fqdgYpY3esDvGnbrta1
	 10cZTcFiC5nSQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id C0DA4F03944;
	Thu, 26 May 2022 14:40:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] ARM: ep93xx: clock: Do not return the address of the freed
 memory
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165357601378.28072.13602111867170701177.git-patchwork-notify@kernel.org>
Date: Thu, 26 May 2022 14:40:13 +0000
References: <20220523050421.322555-1-alexander.sverdlin@gmail.com>
In-Reply-To: <20220523050421.322555-1-alexander.sverdlin@gmail.com>
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 23 May 2022 07:04:21 +0200 you wrote:
> From: Genjian Zhang <zhanggenjian123@gmail.com>
> 
> Avoid return freed memory addresses. Modified to the actual error
> return value of clk_register().
> 
> Fixes: 9645ccc7bd7a ("ep93xx: clock: convert in-place to COMMON_CLK")
> Signed-off-by: Genjian Zhang <zhanggenjian@kylinos.cn>
> [AS: Added "ARM:" prefix, punctuation]
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
> 
> [...]

Here is the summary with links:
  - ARM: ep93xx: clock: Do not return the address of the freed memory
    https://git.kernel.org/soc/soc/c/201155540334

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


