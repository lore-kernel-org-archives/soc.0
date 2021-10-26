Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 401FFC43219
	for <soc@archiver.kernel.org>; Tue, 26 Oct 2021 16:30:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id E7113610A0; Tue, 26 Oct 2021 16:30:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id CD57760EB9;
	Tue, 26 Oct 2021 16:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1635265810;
	bh=8blz9c6faHv9tLenJGAmnuKFqfNXHGDp3ghmQKdVOOs=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=XUsY1oAyE0Qak/9lRm9J5wx2sDWgTTPOBlK4h3DEvgsj3TJtKQwVq3MLmRDf13Ge2
	 i+5h0mhDj3QhKia06mqfvTG/HFm5XkhJyQkbzoarz7ieSIp5iMdswFPU2enLS8RLjf
	 OfL3gYh+xsROtxHnCfedD3kDucwhWwSXj1UpnWNJkwSPrNY0t9IdhCxHC6ZInzJave
	 nFEPSoCPIJ52n+vszNRJotmGGdb3ARajh5KYqMcimg/mIE//VBoDPsP9iXyz1+j3aN
	 a9wcL68b0oCSIHf2DRgtBvEe2ca4YLsPa6Sg9LeZoFuxWYDzbPqwcZ1dMPp+9YThg8
	 BdGKWtK2l3Vng==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id C4EED609CC;
	Tue, 26 Oct 2021 16:30:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] firmware: arm_ffa: Updates for 5.16
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <163526581080.16112.18149521780742648534.git-patchwork-notify@kernel.org>
Date: Tue, 26 Oct 2021 16:30:10 +0000
References: <20211026141535.1920602-1-sudeep.holla@arm.com>
In-Reply-To: <20211026141535.1920602-1-sudeep.holla@arm.com>
To: Sudeep Holla <Sudeep.Holla@arm.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 26 Oct 2021 15:15:35 +0100 you wrote:
> Hi ARM SoC Team,
> 
> Sorry for the late pull request. It is not too big and has been in next
> for a week now. I hope it can be still merged.
> 
> Please pull !
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] firmware: arm_ffa: Updates for 5.16
    https://git.kernel.org/soc/soc/c/2275be723d8a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


