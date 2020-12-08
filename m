Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05545C1B0D9
	for <soc@archiver.kernel.org>; Tue,  8 Dec 2020 23:50:30 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 74A8D23B1F; Tue,  8 Dec 2020 23:50:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1607471429;
	bh=j8i0TSkFud+IoeSB/GLdo+IbU+k41cB4YRohV+NwGl0=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=KoKAXgYkVXFZamQwWHavwkOee1GGx2QYbmsU4vyjjgGNaYm1N49N+pbzQ4cDrYTE9
	 kR1TvQSardpoButp6vXpwKzBPb+sCE0+NcwyjsKv47XWIar47OiOQpZHMLmwQ1w+U5
	 vtVJWLMjZ2gspOwgUlD75BC3kJ2wOWzT+KVRY8uuKGOHXvsOhfG+N736I6Zb/o5zcl
	 esXwUzoVa2qwcGYJotTq+G/0wsb8KdOm/hLXd6tY5tnI/wOOdFjg+Z01SgInvdxwY9
	 6cmoyJ/hlOz+ldesbTfDGzyzQaryQ6v1RFtNwne5joFdeLApEaRJUQjKxflnJ/walh
	 30pVN+VhtFdmw==
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: nuvoton: devicetree changes for 5.11
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <160747142933.19687.11638825485884587667.git-patchwork-notify@kernel.org>
Date: Tue, 08 Dec 2020 23:50:29 +0000
References: <CACPK8Xd8RaLv_p6t9ckBwCwtZww+2YYOAoAYQdvni0dxc2mS7A@mail.gmail.com>
In-Reply-To: <CACPK8Xd8RaLv_p6t9ckBwCwtZww+2YYOAoAYQdvni0dxc2mS7A@mail.gmail.com>
To: Joel Stanley <joel@jms.id.au>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/for-next):

On Mon, 30 Nov 2020 06:57:59 +0000 you wrote:
> Hello Soc maintainers,
> 
> Here's a different one from me. A little while back during a
> discussion about the OpenBMC ventor kernel tree, and how we could get
> the Nuvoton patches upstream, Tomer asked if I could help prepare a
> pull request.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: nuvoton: devicetree changes for 5.11
    https://git.kernel.org/soc/soc/c/f458d69bf7ca

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


