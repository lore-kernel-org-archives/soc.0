Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB718C04A94
	for <soc@archiver.kernel.org>; Sat, 12 Aug 2023 10:20:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id AC80DC433CB; Sat, 12 Aug 2023 10:20:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 91989C433CA;
	Sat, 12 Aug 2023 10:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691835621;
	bh=cdYkYGXH8KypbQ8FIWCa1RbAYIgqBkJY6S2JHSFIpeE=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=k3GSeJailvK9RQUKyLEh2gvXQTMOTqjXJivu9ymFRS98IOipULAlIvZyyOzDn6+dJ
	 baXTQhCguW3gfUFASp/U0sgemEgyoH+eup3IJYkr5Cfc3MYfQUAFNF5auj19J5JBpq
	 gYYquB7a+XytT2198nQCCmig+D1KPNWuxfdOQbXZ4CWnc7fRRNoArPQ6CpvXlI9MlU
	 rBsYiDNimOcJ3NRMC4cMx/txNUbMfAZ91YihzXDC/YNs+iX5agIYBUmM5e49noQ178
	 LjWuqnuh4BLlR9ItVT89qWDq/5Vlw5lfJX5HEuvpQCUYxzN7HeJDtzGSDnhbkLpbrk
	 1HDCC7b41kbtw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 77BC3C3274B;
	Sat, 12 Aug 2023 10:20:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] soc: aspeed: uart-routing: Use __sysfs_match_string
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169183562148.32343.4130909088062268839.git-patchwork-notify@kernel.org>
Date: Sat, 12 Aug 2023 10:20:21 +0000
References: <20230810122941.231085-1-joel@jms.id.au>
In-Reply-To: <20230810122941.231085-1-joel@jms.id.au>
To: Joel Stanley <joel@jms.id.au>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 10 Aug 2023 21:59:41 +0930 you wrote:
> From: Zev Weiss <zev@bewilderbeest.net>
> 
> The existing use of match_string() caused it to reject 'echo foo' due
> to the implicitly appended newline, which was somewhat ergonomically
> awkward and inconsistent with typical sysfs behavior.  Using the
> __sysfs_* variant instead provides more convenient and consistent
> linefeed-agnostic behavior.
> 
> [...]

Here is the summary with links:
  - soc: aspeed: uart-routing: Use __sysfs_match_string
    https://git.kernel.org/soc/soc/c/e4ad279ae345

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


