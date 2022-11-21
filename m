Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10237C47089
	for <soc@archiver.kernel.org>; Mon, 21 Nov 2022 14:52:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E4FCAC43157; Mon, 21 Nov 2022 14:52:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CD2AFC4314F;
	Mon, 21 Nov 2022 14:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669042343;
	bh=R7cAU2iduWJq7fl4vu3EWRFMs7o274q2+hI0Gv/1oe8=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=GcIjTJt8JSdU4QlJn6OjQvT83dISocHML6fcMvTKHA7/5J9DnKy3+7hOYXaTu4wHV
	 H3gGasNHDkdY6a8yU298ob9VXAKDA3GVvXCOj20GM0HXrIkwCsIhATmNY1CSgHgaCQ
	 W9Hv/J9xEMCsTS/QE+iVboTurjYio9mEswbRFpGvTfj6nMiKH2EMK//J9ENpJn+83E
	 PzI1F/AOThdKuwpZSpjLZ/iXL7r0cnFXbTze2a03rr+1lapzssxuiv+Dd2g9TuA1oc
	 LnGiSuhH6rHnfHzQgk4mbuIep952xOd8o0T7lq9GygdoyRRzwbR+RXn5eu7ijEnJXm
	 c98/oSpldStBQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id BA798E29F40;
	Mon, 21 Nov 2022 14:52:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Allwinner device tree changes for 6.2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166904234375.4359.6003654194001020005.git-patchwork-notify@kernel.org>
Date: Mon, 21 Nov 2022 14:52:23 +0000
References: <Y3fuAosinWbrj+Dy@jernej-laptop>
In-Reply-To: <Y3fuAosinWbrj+Dy@jernej-laptop>
To: Jernej Skrabec <jernej@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 18 Nov 2022 21:41:38 +0100 you wrote:
> Hi!
> 
> Please pull following device tree changes for 6.2.
> 
> Best regards,
> Jernej
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Allwinner device tree changes for 6.2
    https://git.kernel.org/soc/soc/c/55aa08a5be90

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


