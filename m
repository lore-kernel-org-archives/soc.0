Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D9C0C1B0D8
	for <soc@archiver.kernel.org>; Tue,  8 Dec 2020 17:10:33 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 0B51723B28; Tue,  8 Dec 2020 17:10:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1607447432;
	bh=mxfa3fMUw38JJ/IYO7QDfdPITlepU6s4DTdRP+lZvBM=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=mFr9cyeaBIjztWstUg/oM/R2fc4UsxRm6Z2h91JHDDxk1hJPf0/j442LE1w/ssPhp
	 qneJEhzzASbODksDsikSbFpVR5wlL300xJXmRXupxREImb1e5KvdkuwSjEvsHzg0At
	 CrqAeGCtLljvfjLoK4GqZAD+PkO4bXqYkz/xgAoLQJPRdiYSzSc9gHLG2k+srfsS/v
	 Q30QyZ3NNxY81NAgJvcYMmzjKENpNweks7SeINGFeyDSeMF60AM+ahqYkR8VGqiaLv
	 qPZKEiDMrFEen/zKD28Pkg/B7efORz50uDpFeqQwNzUko64peG36Yw/KMstjAs9W6a
	 bRuypsYuneD8Q==
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: aspeed: actually the soc changes for 5.11
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <160744743290.1206.7208506250143270854.git-patchwork-notify@kernel.org>
Date: Tue, 08 Dec 2020 17:10:32 +0000
References: <CACPK8Xe=9ezhyWRMqVOEQr7SU1YoYfVBGGdGzjmE4SiBr--vJQ@mail.gmail.com>
In-Reply-To: <CACPK8Xe=9ezhyWRMqVOEQr7SU1YoYfVBGGdGzjmE4SiBr--vJQ@mail.gmail.com>
To: Joel Stanley <joel@jms.id.au>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/for-next):

On Mon, 30 Nov 2020 06:41:35 +0000 you wrote:
> Hello Soc maintainers,
> 
> Here are some ASPEED SoC changes for the v5.11 merge window.
> 
> These are mostly the 5.10 changes without the XDMA driver, which I
> didn't get a response on my question about where we wanted that to
> live[1]
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: aspeed: actually the soc changes for 5.11
    https://git.kernel.org/soc/soc/c/00c543f6f3f4

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


