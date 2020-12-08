Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C597C2BB40
	for <soc@archiver.kernel.org>; Tue,  8 Dec 2020 17:10:33 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 10FA823B2A; Tue,  8 Dec 2020 17:10:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1607447433;
	bh=3Gjq831xLA+mwM2NegeH0CfI3L8dmvVWH2lYi/jt1UQ=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=g9LuW6TnsE8BZqsY/nCt/UjQHtiHlWQFgyxj9yEC4OBDPmimziiP8MpSTe9OcWtw1
	 GInn3ak9ff5cchOFib8KgGSlmMlhSR18Hdj+TwsTVZKXe8n/7lupHQuiM5IIPjAJY9
	 Wm6/clDeF981JS6iUvjg12f3GIfw071MsSbDtIr7ZfSbqY+sxf15TwDHZA2r7L6Ei/
	 tEKrghmEexRJiPuy+6wRaq2NARG+H0W7uellG2M4DraeNa84m0KNXwvxR7+LDlh7Os
	 pSx0iaKaD3geO/drx5IGZGgr8WAUxLWlWltBo7MMrxIToZohlS8a7UKobx7YLpm5i3
	 x28HVw3nfsknQ==
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] arm64: TI K3 SoC configs changes for v5.11
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <160744743294.1206.2118382412428346301.git-patchwork-notify@kernel.org>
Date: Tue, 08 Dec 2020 17:10:32 +0000
References: <20201130174850.ni4sdyz3qp67j3sz@upstart>
In-Reply-To: <20201130174850.ni4sdyz3qp67j3sz@upstart>
To: Nishanth Menon <nm@ti.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/for-next):

On Mon, 30 Nov 2020 11:48:50 -0600 you wrote:
> Hi,
> 
> Here is a config changes for TI K3 SoCs. This is needed for booting
> the J721E board from an SD card.
> 
> I do have a follow up cleanup patch[1] once drivers/soc/ti merges are in,
> which I think I will need to request later on.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] arm64: TI K3 SoC configs changes for v5.11
    https://git.kernel.org/soc/soc/c/2ede693874c9

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


