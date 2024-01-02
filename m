Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0301DC4707B
	for <soc@archiver.kernel.org>; Tue,  2 Jan 2024 10:11:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E9C65C43391; Tue,  2 Jan 2024 10:11:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D36CAC433CA;
	Tue,  2 Jan 2024 10:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704190300;
	bh=GS2e7boa4LLcf+C8FWZ4OoONrydsYqXn/MlMT2tVLoM=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=jcNvMObOehlFzwBaqb2oMYxnZlfXJ6lrCC4/NtB2sEFJO1IuA9cmSyLsFeuTcjZD7
	 iyWhUh/F449cZ6G46rSLv2cgPLb+82TCfeV7vTeq9QZkUtG5BPvle3+QHBSrFhh8YG
	 dEx6a8peysyXxnC+FPGEzl5hxieI0semj2YSFhYLBWm5S5eNJ8kmoTxJlgEEAuPk4h
	 3rWtBW/2H16T3KjSb6FOtdHL5N+xZ3AgWycOEe6QwAiyvH5EghQXtv8ORWhim13950
	 uFpMC6vgTF0LSAd7FBKPTFpp8l5jN8NLyLUBxiP9zBNwb798QAw5JGnkHw7G45UCIE
	 lbZPpcO6xCFqw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id A86B6DCB6D1;
	Tue,  2 Jan 2024 10:11:40 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] ARM: MAINTAINERS: drop empty entries for removed boards
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170419030068.6407.11942547371229498145.git-patchwork-notify@kernel.org>
Date: Tue, 02 Jan 2024 10:11:40 +0000
References: <20231218134532.50599-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20231218134532.50599-1-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 18 Dec 2023 14:45:32 +0100 you wrote:
> Drop empty and redundant maintainer entries for boards which were
> removed to fix `scripts/get_maintainer.pl --self-test=sections` errors
> like:
> 
>   ./MAINTAINERS:2021: warning: section without file pattern	ARM/CIRRUS LOGIC EDB9315A MACHINE SUPPORT
> 
> Cc: Lennert Buytenhek <kernel@wantstofly.org>
> Cc: Steve Sakoman <sakoman@gmail.com>
> Cc: Mark F. Brown <mark.brown314@gmail.com>
> Cc: Robert Jarzmik <robert.jarzmik@free.fr>
> Cc: Florian Fainelli <florian@openwrt.org>
> Cc: Simtec Linux Team <linux@simtec.co.uk>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> [...]

Here is the summary with links:
  - ARM: MAINTAINERS: drop empty entries for removed boards
    https://git.kernel.org/soc/soc/c/fcf410e050a9

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


