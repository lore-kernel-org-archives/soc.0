Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A438BC49361
	for <soc@archiver.kernel.org>; Sat, 12 Jun 2021 16:10:16 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 4E714613C0; Sat, 12 Jun 2021 16:10:16 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 313C7611CD;
	Sat, 12 Jun 2021 16:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1623514216;
	bh=Akh42ab6/MWNImxN/RvJyFBE9klYjLcaZU9wzQkqyuw=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=jMfhh+PwX15sxq30/MqZ/+1rBmYKAMwJjHH1eSk83ti62PgxyqN7+ggVWsAuB4r7R
	 WX68H+MB04UBIREPO2hWOWYkizLQq2gB6LVJtPblriHOoZzdyD9zPl6SxigxKH5LcN
	 khNjNxHnztUO/TxflwhiWPP9g3nezngKK0fekqOFGy0WPx+b7IgE0Mcj9DI5lb0ptd
	 Yt5hIRD1gRR9cnkJ2HIoEyfXFki9D8ylhTEaKmMijHtpobGHC+QodMnV/1HPFA4R9o
	 rcsll8Xx2odibqrqxBg/sLJC82vqy3+w1oeUoKM5zu3cSq+9j9XigAUKfjIgIhae07
	 FBvCYwemdnDhg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 2831A60D09;
	Sat, 12 Jun 2021 16:10:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/2] memory: drivers for v5.14
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <162351421616.27448.13197826515723274541.git-patchwork-notify@kernel.org>
Date: Sat, 12 Jun 2021 16:10:16 +0000
References: <20210611140659.61980-1-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210611140659.61980-1-krzysztof.kozlowski@canonical.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/for-next):

On Fri, 11 Jun 2021 16:06:58 +0200 you wrote:
> Hi,
> 
> This branch contains one change for pl353-smc driver, so might create merge
> with my second pull request here - tags/memory-controller-drv-pl353-5.14.
> 
> I did not experience conflict and git shows the merge as:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/2] memory: drivers for v5.14
    https://git.kernel.org/soc/soc/c/1216037a5589
  - [GIT,PULL,2/2] memory: pl353-smc for v5.14
    https://git.kernel.org/soc/soc/c/361aa4be7095

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


