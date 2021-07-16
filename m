Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AA9BC636CD
	for <soc@archiver.kernel.org>; Fri, 16 Jul 2021 21:22:06 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id CF04E613FE; Fri, 16 Jul 2021 21:22:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id B555C613F1;
	Fri, 16 Jul 2021 21:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1626470525;
	bh=NWsHYG84YeWx0coUHtyB3dZWq4lFj20eX/b1sDvgbcg=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=KO1Y4LCCGHzv65ZpGLRAmb1RMf9S4z5wIg/i7zLGkAN0xJpCzaQxJLttE74mqHh6G
	 ekw45+fRXanuXffDK3xdX6PvHK/R7qGvoscWgiO6AxMXvxAhkAEz43GTOwy3b86yaN
	 cgGug41hFhyRHkl7YWRSF99yPKcEfzP+v4fsuJJ4TIH+aYKrJRODJx7yOhllXTfShd
	 wtRLhZ7XD/yUtVAbLjBGJIhHlvNut16E4J26MX+fp3lQkOKLiREU0cJLBlQ3NKl8Bd
	 K76dLIytF98EniIAVZ72zeu3e1FgWnXXkdbvOk3DWmdK8Mmq1Chsub9pAVaBwp5Eds
	 cbWBNY6X50KwQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id AABFE60970;
	Fri, 16 Jul 2021 21:22:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] firmware: arm_ffa: Updates for v5.14(part 2)
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <162647052569.25202.1871182000116909102.git-patchwork-notify@kernel.org>
Date: Fri, 16 Jul 2021 21:22:05 +0000
References: <20210625102807.206112-1-sudeep.holla@arm.com>
In-Reply-To: <20210625102807.206112-1-sudeep.holla@arm.com>
To: Sudeep Holla <Sudeep.Holla@arm.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/arm/fixes):

On Fri, 25 Jun 2021 11:28:07 +0100 you wrote:
> Hi ARM SoC Team,
> 
> Please pull !
> 
> Regards,
> Sudeep
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] firmware: arm_ffa: Updates for v5.14(part 2)
    https://git.kernel.org/soc/soc/c/e73153ba0c7f

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


