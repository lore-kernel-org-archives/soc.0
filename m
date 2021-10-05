Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4E1BC43219
	for <soc@archiver.kernel.org>; Tue,  5 Oct 2021 14:40:32 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 646086152B; Tue,  5 Oct 2021 14:40:32 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 496F361503;
	Tue,  5 Oct 2021 14:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1633444832;
	bh=s4p4b2GD4kRYMuEgc3ID62tuDDtphZNjtjtkzGFvOd4=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=S8PLCc/O+W+UhgPSJrV69PZzD9asvS7g65tGJG/e+vgpP/qKHYaiBf9rsHVS50yg9
	 OyK6YdQ2FDwn2qU0Pq6qayDSS3Y8+Q6JEbSNjQBjMngqforHoUBTVZO5LQgxz7XJoP
	 LUHyQcNfgArBUR6nJ7fuMozFgwYlJ6AfQ4f49AH+eoudjJ23PYcmy2CrP1H4oGOP70
	 wFyNlqlFhoy82hRSoyZKCLjhyfdGWdxBFO8Sd6qt5yEctavgqlArLKHjNMQ6NW30ES
	 6RPwq/G7UrL7HDOzSauOU6qlXJAhlbVV2s4i4MLQ6X7ZVaHJ4PsHXwqlRa80+mDnu8
	 Nw2dpwumEqUfw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 379FF60A53;
	Tue,  5 Oct 2021 14:40:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Rockchip dts32 changes for 5.16
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <163344483222.23473.11275201623635384423.git-patchwork-notify@kernel.org>
Date: Tue, 05 Oct 2021 14:40:32 +0000
References: <5121280.Lt9SDvczpP@phil>
In-Reply-To: <5121280.Lt9SDvczpP@phil>
To: =?utf-8?q?Heiko_St=C3=BCbner_=3Cheiko=40sntech=2Ede=3E?=@ci.codeaurora.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/for-next):

On Mon, 27 Sep 2021 11:43:25 +0200 you wrote:
> The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:
> 
>   Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v5.16-rockchip-dts32-1
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Rockchip dts32 changes for 5.16
    https://git.kernel.org/soc/soc/c/f86f3e40a77f

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


