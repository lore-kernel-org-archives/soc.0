Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E587C48BF6
	for <soc@archiver.kernel.org>; Mon,  4 Mar 2024 08:01:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id F191FC433A6; Mon,  4 Mar 2024 08:01:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D9E2DC433C7;
	Mon,  4 Mar 2024 08:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709539274;
	bh=eFr7eXJ84tR3SfDEEuh/RPoXVppVRQ4MxCJkqjje/fM=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=jzv2W1bB1kJG9kW12HOGDME+C+IrxSEi6GQGTv7me3ZPgtOw+Tm5clfIz6TkdyUuY
	 ooou01A8lUHMR1fx5Y0LpRUTDJIuXovJ6869dluDG0S5th1POAUpz2hFk6MYurtNH+
	 C0RjqzjU8RgmhafId4oXl/AAgiC5ehbc57qYCRPfbDzAPEmxJbCFTe/Fu9OeF1gPDR
	 mWwu/QqrSEdrtCh1GS+J9Dxqy2Nt2k+Fu5pxcw+CTwg4HcGANioIUry0ZtRKkqEkDZ
	 KicnSaUFe90IW3cpKyDjFcTstpeEl8eXISwV4AqxsSd1c/LZ7uleMw5uor4PvSs8Or
	 0FrR/GqpbdzOQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id BC795D88F88;
	Mon,  4 Mar 2024 08:01:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Rockchip dts64 changes for 6.9 #2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170953927476.27833.209709009384517059.git-patchwork-notify@kernel.org>
Date: Mon, 04 Mar 2024 08:01:14 +0000
References: <3695004.ElGaqSPkdT@phil>
In-Reply-To: <3695004.ElGaqSPkdT@phil>
To: =?utf-8?q?Heiko_St=C3=BCbner_=3Cheiko=40sntech=2Ede=3E?=@ci.codeaurora.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sat, 02 Mar 2024 13:16:36 +0100 you wrote:
> Hi Arnd, Kevin, Olof,
> 
> please find below and in a subsequent pull-request
> some additional Rockchip changes for for 6.9 that
> would go on top of the first round I sent.
> 
> Some new boards and a bit of dt-binding wiggling.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Rockchip dts64 changes for 6.9 #2
    https://git.kernel.org/soc/soc/c/b74638bbda9d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


