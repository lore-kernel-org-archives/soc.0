Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC5A2C433FE
	for <soc@archiver.kernel.org>; Thu,  7 Apr 2022 12:24:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DE844C385B6; Thu,  7 Apr 2022 12:24:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C4912C385AA;
	Thu,  7 Apr 2022 12:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1649334247;
	bh=ByUtJYnenU9iIjc3pV0YMaINQyqWQqMLevhsr92z9HQ=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=TuAucFHK0uPuhtNBgj5G9QMoMtCtdg6XslV9JyNmNCZ+y1ZQ2+WjjmaorbdfRoVLK
	 O3h0g23EwqqxABh2l4ZEe6StUb6ZMiiePtNKNBi4+HgCHY6pj211wKTpt6HDj0cjRg
	 lnMCJdr5q3xHm6CSkvU1Wn9Liwy0S6MLEJOq4e8/BCMiT3+b+j1XTKcE22arXuy4Ur
	 6cUI9ntzTnSETTKifYw2YPu/hhSVQhgCFXnaUtlOhiw49VyU7UEGygmXa0JH5eeozm
	 BEqAxYZTZfcp9QXfbopMVzLiidX53UssjiWF1GIvkQgPrwlLl9QfqpkbqFFbQDOO95
	 B4/aNW/ZwYSQg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id AF129E8DD63;
	Thu,  7 Apr 2022 12:24:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [RESEND PATCH] arm: dts: at91: Fix boolean properties with values
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164933424771.10369.13470761073448962630.git-patchwork-notify@kernel.org>
Date: Thu, 07 Apr 2022 12:24:07 +0000
References: <Yk3leykDEKGBN8rk@robh.at.kernel.org>
In-Reply-To: <Yk3leykDEKGBN8rk@robh.at.kernel.org>
To: Rob Herring <robh@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 6 Apr 2022 14:09:47 -0500 you wrote:
> Boolean properties in DT are present or not present and don't take a value.
> A property such as 'foo = <0>;' evaluated to true. IOW, the value doesn't
> matter.
> 
> It may have been intended that 0 values are false, but there is no change
> in behavior with this patch.
> 
> [...]

Here is the summary with links:
  - [RESEND] arm: dts: at91: Fix boolean properties with values
    https://git.kernel.org/soc/soc/c/0dc23d1a8e17

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


