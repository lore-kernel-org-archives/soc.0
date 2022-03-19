Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99336C433EF
	for <soc@archiver.kernel.org>; Sat, 19 Mar 2022 22:00:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4964CC340F4; Sat, 19 Mar 2022 22:00:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 22204C340F2;
	Sat, 19 Mar 2022 22:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1647727211;
	bh=bThyptE4MupUZzLLnrOiPzm/8F2CFokcMtZ+mN5Xpr4=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=pZDLZjyar5wvoiykmj1+AO7s2XJxHVBLG6AbCXmZ8Y1K5coyMES45t0jJPlmK5V/L
	 SCII3/Mt6DPs7+rbZl7sQCkh07Jpox7Wa6uGgvFRp0OnYrJXyUp0O691FUm0seAYtT
	 DYa5uoXqyGTZIAIHy6KHE2IeHyFLED8tFWaYsSR0nSfLHSVwMBHYguw3T+fRpU9y1e
	 bGaKVcDEQv3lg/b6g1M/jTLdzImZEsVD3cSx34xE0QueQqdPX+VYW0wf3ZDthjq7PW
	 V24a/Lqp+qJnp81e97+w6wKA/jhFxx3L8SOtiUKeSFLdDAxJuhJ0de8CFTHvLGvQrX
	 +8Tc22cTWaiog==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 06B33EAC09C;
	Sat, 19 Mar 2022 22:00:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] ARM: spear: fix typos in comments
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164772721102.21632.16520774977965134029.git-patchwork-notify@kernel.org>
Date: Sat, 19 Mar 2022 22:00:11 +0000
References: <20220318103729.157574-21-Julia.Lawall@inria.fr>
In-Reply-To: <20220318103729.157574-21-Julia.Lawall@inria.fr>
To: Julia Lawall <julia.lawall@inria.fr>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 18 Mar 2022 11:37:16 +0100 you wrote:
> Various spelling mistakes in comments.
> Detected with the help of Coccinelle.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>
> 
> ---
>  arch/arm/mach-spear/spear13xx.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Here is the summary with links:
  - ARM: spear: fix typos in comments
    https://git.kernel.org/soc/soc/c/339ac71b233e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


