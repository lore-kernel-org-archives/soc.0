Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F7D0CCA480
	for <soc@archiver.kernel.org>; Tue, 14 Jun 2022 20:33:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7B219C341D7; Tue, 14 Jun 2022 20:33:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 65A0DC341CF;
	Tue, 14 Jun 2022 20:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655238815;
	bh=0jNpGC6f/KrFV/RJIhf/IoN+ifOlk54XuGmqmX+IoiU=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=tB6Neo5MpNlwWiSJR94ni0w0JR+YJ0gSCut07moNBllqPb1W3yzeuU8Mfff4riHNa
	 it2R5l5iigSKOSOh23U5jmF+xbdXZaK0Roi1mNmvnVh59UQISV0qC/OpKgthgrsPJJ
	 8yC3pghn76plSvLCrQ6RsLE6IY51fuZZlWpBcROel8PPNVoFC5MBWAl/de5WemDvjn
	 kuPqW2otFUhFau960OK6sJZfX8zZOInvxZJ24BICSrKQ99VGmgxUybOF4Hioxy1nSv
	 rq3graR/QgXj6f7aFH9pOnkgTq5hp+8GMbnlVgkQTzcHTCWb9qUFAU6LTGzk+12l2s
	 GUpgoMxQEsFkw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 50FDEE73856;
	Tue, 14 Jun 2022 20:33:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] firmware: arm_scmi: Fixes for v5.19
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165523881532.29335.1081101221098766452.git-patchwork-notify@kernel.org>
Date: Tue, 14 Jun 2022 20:33:35 +0000
References: <20220614100007.1029881-1-sudeep.holla@arm.com>
In-Reply-To: <20220614100007.1029881-1-sudeep.holla@arm.com>
To: Sudeep Holla <Sudeep.Holla@arm.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 14 Jun 2022 11:00:07 +0100 you wrote:
> Hi ARM SoC Team,
> 
> Please pull !
> 
> Regards,
> Sudeep
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] firmware: arm_scmi: Fixes for v5.19
    https://git.kernel.org/soc/soc/c/002ec157477c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


