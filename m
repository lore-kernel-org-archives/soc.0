Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9F3EC49EA3
	for <soc@archiver.kernel.org>; Sat, 12 Jun 2021 16:10:16 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 5B585613C8; Sat, 12 Jun 2021 16:10:16 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 4022261248;
	Sat, 12 Jun 2021 16:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1623514216;
	bh=lcWvxPNUOnCYfrtBPyHYXb3vLzKufRivMTUZHfzu8vI=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=dKTDaGOXEcUu5EJ0DATKvOwYQEqmtxV1O4xW2+e7f2WHOf734E8xRmHAV3V6DAtmq
	 JpeJ/mRJKlhsjLWQGK/70oyQdjWaUNR4Rfh1048o1hJkfK59jWUcuEq475Yj33XWnD
	 SWfjnq9qvAZ96pjhEndCE1+0Gw3gp8H5cgm/lKnrp3zFdEkb/E7VbhY6PhS0mMlRRN
	 oZDvtyaaVqDFy1b2a6NOFMqdopycvfeXqbo7BWfD/DPzQh+Kq02byJJG1zEmSJipSI
	 ApfPLTyo7LY9u5wrlADFkIqzgIa7UdbL9MbvCRHDaY8Q7IA6fMrrjbdY8WOSG1SUVA
	 gtU/fvGw7Yzng==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 3A1CB60972;
	Sat, 12 Jun 2021 16:10:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] arm64: dts: juno: fixes for v5.14
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <162351421623.27448.12001695794657319028.git-patchwork-notify@kernel.org>
Date: Sat, 12 Jun 2021 16:10:16 +0000
References: <20210611075805.2813712-1-sudeep.holla@arm.com>
In-Reply-To: <20210611075805.2813712-1-sudeep.holla@arm.com>
To: Sudeep Holla <Sudeep.Holla@arm.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/for-next):

On Fri, 11 Jun 2021 08:58:05 +0100 you wrote:
> Hi ARM SoC Team,
> 
> Please pull !
> 
> Regards,
> Sudeep
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] arm64: dts: juno: fixes for v5.14
    https://git.kernel.org/soc/soc/c/9bfa3829358f

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


