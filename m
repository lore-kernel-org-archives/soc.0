Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 977E2C3DA40
	for <soc@archiver.kernel.org>; Sat, 12 Aug 2023 09:14:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5AF01C433B6; Sat, 12 Aug 2023 09:14:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4370BC43395;
	Sat, 12 Aug 2023 09:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691831689;
	bh=wUHVT4x8WToPk6KvIEerz1ZNfyytW6myT4SVGg0zbO8=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=brpIDdMSNDDSPwB1e5L262zTB7ivqDCGl/Um9wPPPYKNyNUl0vnjloiQoj7ou/hL4
	 6lX61MKgimR+L0gSzmP2Mvpggleaeej5lJJSxaqOxbixRX6ng4H5/f5wZzCxx7kilE
	 xHMD0nGqy4tuvrFLL9Tjgu3FCJPVYfKfP5Kv5fFnNtEW5jSDURT0jXnLI7WqWYVWH2
	 o5CjeUMDsVW4xQ7r384wQTVLojMvM3lZWQCoANSYIX6I6X/a8pthcEXw1OskFtDr79
	 IG8EZJVpy7QYya3Jgc/Zvcpwf8b/yvaAFGtYikjj6GdbPszODqSC9N5U8HP2T2miRA
	 uPMTgWGGTV58Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 25D4FE3308E;
	Sat, 12 Aug 2023 09:14:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 0/3] Renesas SoC updates for v6.6
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169183168915.30475.3726261531711803462.git-patchwork-notify@kernel.org>
Date: Sat, 12 Aug 2023 09:14:49 +0000
References: <cover.1690545139.git.geert+renesas@glider.be>
In-Reply-To: <cover.1690545139.git.geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 28 Jul 2023 13:56:59 +0200 you wrote:
> Hi SoC folks,
> 
> This is my first pull request for the inclusion of Renesas SoC updates
> for v6.5.
> 
> It consists of 3 parts:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/3] Renesas ARM defconfig updates for v6.6
    (no matching commit)
  - [GIT,PULL,2/3] Renesas ARM SoC updates for v6.6
    https://git.kernel.org/soc/soc/c/d69ba6fe6677
  - [GIT,PULL,3/3] Renesas DTS updates for v6.6
    https://git.kernel.org/soc/soc/c/8be4ee0ee081

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


