Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48ECEC3DA7A
	for <soc@archiver.kernel.org>; Mon, 19 Dec 2022 16:00:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0B653C4339E; Mon, 19 Dec 2022 16:00:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E733BC433A1;
	Mon, 19 Dec 2022 16:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1671465633;
	bh=eXbOd+qjZrWL9WEvkpokz3jX6/OqOx/9EKfj9k3eI90=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=ViAaEkyevzIqNXUX1c6KLcaklnYYL7Z3TgDjvFUcu5Nry1JIRkGdRln7dVNrNhqTs
	 6BllqT81bpWsGwpzZSfFk+xgpx9afT69b2D5z8PyoxsWvdgQ7PNa8wI9KAVFei9y5x
	 unRZU0JeURhKIeF98AqbK/x9XSQLzqgJibE6phhEd61nobWqTJOtz+7BFhMRx43WqX
	 pwgDrpadrF/dt9CKubcnRk8QgUqqtTEwg+4hE6gsbOPUgaLLGoWmGsJCtWXpnpFC3y
	 UdcrqycqV3uQX1mE1hlS9LvAEeoYtKtyKlOAPzp0kVGsWHWN3CSuFaZJZibSMKO836
	 Ko9qvYopLgATA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id B0832E4D028;
	Mon, 19 Dec 2022 16:00:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] MAINTAINERS: add related dts to IXP4xx
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167146563371.24111.4204493948036779357.git-patchwork-notify@kernel.org>
Date: Mon, 19 Dec 2022 16:00:33 +0000
References: <20221214204223.177807-1-linus.walleij@linaro.org>
In-Reply-To: <20221214204223.177807-1-linus.walleij@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 14 Dec 2022 21:42:23 +0100 you wrote:
> From: Corentin Labbe <clabbe@baylibre.com>
> 
> get_maintainer.pl currently give no maintainer on all IXP4xx DTS files.
> Add them to the set of files handled by IXP4xx maintainers.
> 
> Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
> Link: https://lore.kernel.org/r/20221005105734.3513581-1-clabbe@baylibre.com
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> 
> [...]

Here is the summary with links:
  - MAINTAINERS: add related dts to IXP4xx
    https://git.kernel.org/soc/soc/c/4c03c4188cfb

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


