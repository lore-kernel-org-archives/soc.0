Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 414B8C07E9D
	for <soc@archiver.kernel.org>; Fri, 23 Sep 2022 20:50:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 11C93C433D7; Fri, 23 Sep 2022 20:50:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E3437C433D6;
	Fri, 23 Sep 2022 20:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663966216;
	bh=Jfd6+ry5COeO5stKKp0evYyTLNSyTGiZYLXdEyFR0e0=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=LhOzsdALgqPMr54pUWDEdRSfZhcyfJWz8IkfdR7gWvPj9itvffJTme0ub7JOHbzg8
	 VpKpPOZP7DWCpUrxTlI7ENdxYN/wE9C7mR0nzQMFwYAF38oSObo+nqjlFehKXWTFx4
	 lZCFpMVNcw7GEPwHzJcJv65EekGvJWFyXZUoyOM79Ei60uuoN9o6VQzdNAIlplyZPo
	 Y5bv510mUmIJQHuj45VmaM4Vf6aEw5I/C8Dn8VwqpCzx+9wt5W3uF2oy9jJqQaPVzG
	 hRvGrd6cdFjHAgopomBynx78ZO+DyA7Cn3UZpTwmokbn2ElbZ+ojlvbuVESLPhgS/M
	 rOpUnx2PTix4Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id C92FDC070C8;
	Fri, 23 Sep 2022 20:50:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 0/2] Renesas SoC updates for v6.1 (take two)
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166396621581.24262.9209679745815048116.git-patchwork-notify@kernel.org>
Date: Fri, 23 Sep 2022 20:50:15 +0000
References: <cover.1663588772.git.geert+renesas@glider.be>
In-Reply-To: <cover.1663588772.git.geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 19 Sep 2022 14:03:53 +0200 you wrote:
> Hi SoC folks,
> 
> This is my second pull request for the inclusion of Renesas SoC updates
> for v6.1.
> 
> It consists of 2 parts:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/2] Renesas ARM DT updates for v6.1 (take two)
    (no matching commit)
  - [GIT,PULL,2/2] Renesas ARM SoC updates for v6.1
    https://git.kernel.org/soc/soc/c/1ee41d92f1a0

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


