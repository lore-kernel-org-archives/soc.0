Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AED2C2BBCD
	for <soc@archiver.kernel.org>; Tue,  8 Dec 2020 23:50:30 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 9FD3C23B45; Tue,  8 Dec 2020 23:50:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1607471429;
	bh=LPhrpVSTzF5G5P13P6lrL1ptynot7iNWZ5UAF4MlUg8=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=TGTrcLiR2XDxd2Uoz0ELIAy3LtquPXwfbq54lqe7o89bXsbBmELB+wvJEwCL6ZPFC
	 h6zhpZxyf44v3RkIkBMlv9HWzXMTWpQpElp6xMTngck8ekNAjhiV2X1Amu7RfakMgS
	 kdUXhyyl4F4uq5dDwbL+ATKOhoz4xtR8Ko/lkQe0GanDwZZLE+EU1+tgT5iSHw6NXV
	 fZ0JLtP4TvSMeC/fD8KNs4SSTL0stqm+XD+pnKGjafncxXiyNE40lxHudOYo2cf7bA
	 sQffomRp2A4RnspQ+J7lCHRqLiCorSFNi6IO4pADWYJFhkwgulwzfqU0A+IK/Gdpef
	 KVEuAWhUSdWbQ==
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: mvebu: dt64 for v5.11 (#1)
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <160747142950.19687.963513864142185016.git-patchwork-notify@kernel.org>
Date: Tue, 08 Dec 2020 23:50:29 +0000
References: <87eekaj0i4.fsf@BL-laptop>
In-Reply-To: <87eekaj0i4.fsf@BL-laptop>
To: Gregory CLEMENT <gregory.clement@bootlin.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/for-next):

On Mon, 30 Nov 2020 17:02:59 +0100 you wrote:
> Hi,
> 
> Here is the first pull request for dt64 for mvebu for v5.11.
> 
> It is based on v5.10-rc2 because some fixes on the device tree has been
> merged after v5.10-rc1.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: mvebu: dt64 for v5.11 (#1)
    https://git.kernel.org/soc/soc/c/a2f9886a9ea5

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


