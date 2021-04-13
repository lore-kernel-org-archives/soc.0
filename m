Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A4D9C43460
	for <soc@archiver.kernel.org>; Tue, 13 Apr 2021 09:30:12 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 0CF2E613BA; Tue, 13 Apr 2021 09:30:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id E9349613B6;
	Tue, 13 Apr 2021 09:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1618306211;
	bh=uplRy7uwXpOFMWodgW9/T2Q7/sx3eBj2JIoSD4gKh9Q=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=IS5QmuSAoyYPsyF7uigEqgGAsnwFRkcP31Rio9kFpUwofSSzNztU3pNbCURMvoQ/x
	 cRhNp4+ptNFCByYKrowh8MPEkzv+SV7jW3GV6aLPQwARKg/dtfs4yO0LZaKfWWLn/V
	 3tMlV/CHYTrAuHg5RtRayTvF0WKKKJGFi6eKIO67UbYxTj+PTe0VJ/FUkvGdpo5TcA
	 rINJ9Fr+eqT1bA1CAq+m+DEpx5Rf4kHL3PPSfzJZCwdjsdG0ZmU52e5kE4SpZnTMtG
	 ink7aO1W61CiFgCJotMYLYnaQet/VRzkQlpnBDBFv7b2aQC5JwRdYPyxGplkJEdafL
	 32uaDE1mD63rA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id D53BA609B9;
	Tue, 13 Apr 2021 09:30:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Rockchip dts32 changes for 5.13
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <161830621086.20348.4287708763848447706.git-patchwork-notify@kernel.org>
Date: Tue, 13 Apr 2021 09:30:10 +0000
References: <4638723.31r3eYUQgx@phil>
In-Reply-To: <4638723.31r3eYUQgx@phil>
To: =?utf-8?q?Heiko_St=C3=BCbner_=3Cheiko=40sntech=2Ede=3E?=@ci.codeaurora.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/for-next):

On Sun, 11 Apr 2021 11:43:57 +0200 you wrote:
> Hi Arnd, Kevin, Olof,
> 
> please find below (and in the next mail) dts changes for
> Rockchip platforms for 5.13.
> 
> Please pull
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Rockchip dts32 changes for 5.13
    https://git.kernel.org/soc/soc/c/91f059a0fc23

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


