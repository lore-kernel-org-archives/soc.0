Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF6CEC63797
	for <soc@archiver.kernel.org>; Mon,  9 Jan 2023 22:41:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B99ADC433A4; Mon,  9 Jan 2023 22:41:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A0DDFC4339E;
	Mon,  9 Jan 2023 22:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673304083;
	bh=Ud9bkcVaKTlRkBXkv9Y89BO7KjogDs0nzclej4bO4+Q=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=PiBotAdpIUzgWE54bukiZfg9iQYzDWumECkrniwNazadB7XwSDoD7/DifoA/dsISl
	 +aBbxQtjsYX1nCD2JyBMjrY9Q9JJ90E0k1+CC9vhv7ykHQesuSfcy0UuyT6aJ16UsD
	 tJ03IbQsTGBX8hA3UEuAL6tZvfng+Mvkw8ONy6IR6xkk1r39wb0w+2dTLy/dhZpIuf
	 nAMPBeI1lt8HrCf5gVB6+zoA/HUwh90rUGP6vWGFdl661M3vmMlRPtnyWAv2hCz6f+
	 m05VfRjnTMU7jZaghIFKSRkanWcBk6i9dMNvsnmoqCJ15In7m6c3VYSW6VW5wLfWN5
	 lhxGdTXdY6P6A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 7B658E50D66;
	Mon,  9 Jan 2023 22:41:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] amlogic fixes for v6.2-rc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167330408350.13717.17940401187564655910.git-patchwork-notify@kernel.org>
Date: Mon, 09 Jan 2023 22:41:23 +0000
References: <7915c3f8-57bc-25e2-0314-c78af7a79d6a@linaro.org>
In-Reply-To: <7915c3f8-57bc-25e2-0314-c78af7a79d6a@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 6 Jan 2023 09:12:28 +0100 you wrote:
> Hi,
> 
> Here's a DT revert for v6.2-rc1 which fixes USB on Odroid-HC4, having both USB2 PHYs
> enabled is necessary to have functional USB on Amlogic SoCs, even if one port is unused.
> 
> Neil
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] amlogic fixes for v6.2-rc
    https://git.kernel.org/soc/soc/c/13d159553ef2

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


