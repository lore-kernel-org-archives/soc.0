Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44E43CCA473
	for <soc@archiver.kernel.org>; Fri, 24 Jun 2022 16:00:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1A643C341CD; Fri, 24 Jun 2022 16:00:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EF2E2C341C6;
	Fri, 24 Jun 2022 16:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656086414;
	bh=eUa7euVofAhkfOMWurExiFE0Fe/A8/HqDpUh1N/3axE=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=PUx+gseo0fz48Yi8ziEbz3kHynMOqd8qMjxc8667oeEpOVAltughSMD3PHbhuv6Oi
	 7aYBHqEbPk2pT+pv6S+gtfFa6du2hudbUh2wvV5q1V4EE3gkkZhgpdehyhJhF+TZ/J
	 t/N7cAAHjvMWS6K8aElehKbOrcz1+vSdT5qfYNX5IEy0pG6jnzCVfPm3zJnk3e1sVy
	 /MXuF2uhNGJYcHI7xyTjIRmfUAENoUoomSS6dOfWx1A3V8AKWsoLkmtWW9W8UPuW6U
	 16NB+hOG42KnolK1xeyfkZgK1sXCrcVexYkWew6Sdtx1phI1dQBtgRFO9VOR1u1YyZ
	 TpsW4NXt2PSNw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D0CF0E8DBCB;
	Fri, 24 Jun 2022 16:00:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] arm: mach-spear: Add missing of_node_put() in time.c
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165608641385.3411.14846732936120198725.git-patchwork-notify@kernel.org>
Date: Fri, 24 Jun 2022 16:00:13 +0000
References: <20220616093027.3984903-1-windhl@126.com>
In-Reply-To: <20220616093027.3984903-1-windhl@126.com>
To: Liang He <windhl@126.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 16 Jun 2022 17:30:27 +0800 you wrote:
> In spear_setup_of_timer(), of_find_matching_node() will return a
> node pointer with refcount incrementd. We should use of_node_put()
> in each fail path or when it is not used anymore.
> 
> Signed-off-by: Liang He <windhl@126.com>
> ---
>  changelog:
> 
> [...]

Here is the summary with links:
  - [v2] arm: mach-spear: Add missing of_node_put() in time.c
    https://git.kernel.org/soc/soc/c/2c629dd2d14f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


