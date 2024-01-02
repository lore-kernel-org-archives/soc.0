Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08311C47079
	for <soc@archiver.kernel.org>; Tue,  2 Jan 2024 10:11:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id F20AAC43397; Tue,  2 Jan 2024 10:11:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DB7B3C433CC;
	Tue,  2 Jan 2024 10:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704190300;
	bh=aFy1LGuDIBf8i4Q9eHypdKOGH3yZbnefGxNHXdjqIFI=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=Qe3FvfG2ZKU9SglVndtsWY3BV+cVv6y9LyubWDx9y+uHNrvGmasTD8gxsVC1B9fth
	 jULlDTIhmWPKqE0MsvA5ubbwbjSgw2oGALa5yrA05NHTOCyUml9dw3hY3oj3RtLf3o
	 +I+lxbE6GZLb+3PPpe4883uUt+iZkfYKPVbiJOxYc8WIf+4u1VrXrNSgC5GYwLK7i4
	 78nWYpENQlXHLyqouAbrXXEiAQnKuDu0dmYgCYBV130I39pqL8a90YoIAB/O5tLLc0
	 Q4/tnBXvxqYJhUBxXjALyfM1b7CL9wu+Bm3Jsio5UVsat35nO556gqWt7yZsvGdV6y
	 u9YeKXdZwx1DA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id C5C77DCB6CE;
	Tue,  2 Jan 2024 10:11:40 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] ARM: Delete ARM11MPCore perf leftovers
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170419030080.6407.14717880504246066119.git-patchwork-notify@kernel.org>
Date: Tue, 02 Jan 2024 10:11:40 +0000
References: <20231224-drop-11mpcore-fix-v1-1-d8b16d1c1fae@linaro.org>
In-Reply-To: <20231224-drop-11mpcore-fix-v1-1-d8b16d1c1fae@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sun, 24 Dec 2023 23:24:38 +0100 you wrote:
> My commit deleting the PB11MPCore apparently left a few dangling
> structs in the perf event code. Fix it up.
> 
> Fixes: 2560cffd2134 ("ARM: Delete ARM11MPCore (ARM11 ARMv6K SMP) support")
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> This fixes a warning reported in the SoC tree, it's not even
> in next yet. Now that I turned on ARMv6 in my builds it is
> also tested.
> 
> [...]

Here is the summary with links:
  - ARM: Delete ARM11MPCore perf leftovers
    https://git.kernel.org/soc/soc/c/ced296f63635

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


