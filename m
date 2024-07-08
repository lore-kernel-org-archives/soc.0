Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78D49C3DA47
	for <soc@archiver.kernel.org>; Mon,  8 Jul 2024 14:31:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 69612C4AF0C; Mon,  8 Jul 2024 14:31:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 530CDC116B1;
	Mon,  8 Jul 2024 14:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720449061;
	bh=Y+cyndhfqT1sdYyO2PBSYlJAk6ngixYP0QSxcSUwkik=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=PbhtNe8iRbXwV6aTrGvAfgKBpBJnJZMUazIVTPsjcTWdXqDTUyMSPuPTuNN/28Z6p
	 sZTafizu1HbybUQRPIhxcGiHVlKYTW1/rGxFlyGaNKvbcb1EAqK1o/qhGHOBFgzfg8
	 GU+/dX9sAVqSQcXV9fu0JL8J+bnlUf0BpX2ovvHufkx9rrFvxk4/8Bv8TDLcfQHKWA
	 oWnkG2MhODiruBtKUE70b7Q/q+NEAKD4Kp9xkvERMRs787cGxGc9nb8WVaJ4wUyEcC
	 FrleIQZMEYcIGyok0lt4wEnkGyNFEI0bcvenvrWx2+IFE2QzGRLqWDZtUzu3cF7cxd
	 x1jDxtft6r9Gg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 31933DF3716;
	Mon,  8 Jul 2024 14:31:01 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/3] Allwinner SoC fixes for 6.10
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <172044906119.22805.16034483083133244788.git-patchwork-notify@kernel.org>
Date: Mon, 08 Jul 2024 14:31:01 +0000
References: <ZoQY5k21RQLOrBQ3@wens.tw>
In-Reply-To: <ZoQY5k21RQLOrBQ3@wens.tw>
To: Chen-Yu Tsai <wens@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 2 Jul 2024 23:12:38 +0800 you wrote:
> Hi SoC maintainers,
> 
> We have one fix for 6.10. Please pull.
> 
> 
> Thanks
> ChenYu
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/3] Allwinner SoC fixes for 6.10
    https://git.kernel.org/soc/soc/c/74de3f227ecc
  - [GIT,PULL,2/3] Allwinner SoC driver changes for 6.11
    (no matching commit)
  - [GIT,PULL,3/3] Allwinner SoC device tree changes for 6.11
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


