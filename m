Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E82BCC2BB40
	for <soc@archiver.kernel.org>; Tue,  8 Dec 2020 23:50:29 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 7CB0623B26; Tue,  8 Dec 2020 23:50:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1607471429;
	bh=kLnxNE/9Ffp094IVRsEX7f2fcyJpQub0hfP992l0VnI=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=bRZNywpG8aCVXQz1fVN1f/vPXZsAchpuAHfTHChZ0uUP8heWTzBPMGZYMXHcNiGis
	 60JBqLZ9wzDY79H5u+5yszb5XzLnAdAIuCpK2d2FDdC9DwYmAWJfeujizlfeyNYB6T
	 Jd+KeNv9xwmWd9eEiFv0VAxY/0FrlNjT3s/EdOQgiHlDSHJx2X/KOze6/mi61t5Vvr
	 /Ym3MaX9y2TxVIG1mx+S41VFln2AUpfs9dGV1BcTQk/Vzt/anPfmaxYEsSuxia86xL
	 fVif1gteHh4r4QBJsmLzSvW38DPd7H+uxHH20RdhJgPHKfuT/YekwEN0GWHXyn7kmt
	 qepwVDl9a0HIw==
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Rockchip dts64 changes for 5.11
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <160747142937.19687.17453594870368824625.git-patchwork-notify@kernel.org>
Date: Tue, 08 Dec 2020 23:50:29 +0000
References: <4278011.LvFx2qVVIh@phil>
In-Reply-To: <4278011.LvFx2qVVIh@phil>
To: Heiko Stuebner <heiko@sntech.de>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/for-next):

On Sun, 06 Dec 2020 19:30:06 +0100 you wrote:
> Hi Arnd, Kevin, Olof,
> 
> please find below and in the following pull-requests Rockchip-changes
> aimed at 5.11
> Please pull!
> 
> Thanks
> Heiko
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Rockchip dts64 changes for 5.11
    https://git.kernel.org/soc/soc/c/261078ab9002

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


