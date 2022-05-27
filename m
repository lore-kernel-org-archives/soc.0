Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A2C2C433FE
	for <soc@archiver.kernel.org>; Fri, 27 May 2022 20:40:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D4861C3411C; Fri, 27 May 2022 20:40:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BE445C3411A;
	Fri, 27 May 2022 20:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1653684012;
	bh=1HX5eibBV+1OjDl2XcoGuQZjZTEn89HlLrBjllejSP4=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=frD0T+yqPXZtJ9DyArAT+aa4UXIr/cmlVGRuJiKom2lUCZGJEQwaLMdTQtQguhU8a
	 Qhx4vLo1ActREQJSOyfIhDBb+nyHiX+mLqH3uRymW5hTuj/Kv5JzFqvkYahrLQWu8L
	 A8FtfUGxfvF4R5GMS03FWsoAtmnK5KZkKa+SShL5Yyu+l+23Lt1in1gOAEWQo8bMu/
	 shDfq04LG/uXdRjsaedjr2qcodRrTrhD/y2fAzQzN6ncROock2o2JvtqZ/FsJenC8f
	 mrJ4AjdDSE2dWjYWImMrWX4zXVPVtZa2V81bVAXzfVcgJS4E4sPW8zokVWRmfbKb7T
	 G7vhPiLI00s4w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 9EDE6F03944;
	Fri, 27 May 2022 20:40:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL v2] Rockchip dts64 changes for 5.19 #2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165368401264.3222.2248535386634551084.git-patchwork-notify@kernel.org>
Date: Fri, 27 May 2022 20:40:12 +0000
References: <7695907.Sb9uPGUboI@phil>
In-Reply-To: <7695907.Sb9uPGUboI@phil>
To: Heiko Stuebner <heiko@sntech.de>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 27 May 2022 20:25:16 +0200 you wrote:
> The following changes since commit bc405bb3eeee4b711830ab569e7f3811b92196ab:
> 
>   arm64: dts: rockchip: enable otg/drd operation of usb_host0_xhci in rk356x (2022-05-11 06:09:55 +0200)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v5.19-rockchip-dts64-2
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,v2] Rockchip dts64 changes for 5.19 #2
    https://git.kernel.org/soc/soc/c/8a1e75c53c7a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


