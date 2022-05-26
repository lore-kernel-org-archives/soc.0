Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CFDBC43219
	for <soc@archiver.kernel.org>; Thu, 26 May 2022 14:40:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 210A6C3411F; Thu, 26 May 2022 14:40:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F2ACAC34116;
	Thu, 26 May 2022 14:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1653576014;
	bh=UaxrFWxFvHy1fAfGzreyLEzcb8aa50VNjzA05zChauM=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=XlYlqx3YI3WJQkkbz0zSXi0/9tdA0Zgg7rXkM912ZdHivxipCIgDA++EsoRi7iUnY
	 W138c/5kenEhn14jLvapePDUQbbq8E1xSX8EX9axERNMw7J5JZawNeEA1SdXiU2pmc
	 eAdKv8ORoWdnLQDINEDLq+EwY72xVBgGDZNcnNf7+0ohKGMsJ6HTSiHbMlbgIPIM8W
	 sVSOyVagnhQwpRdhL0EJugWkibmGm7unsiWRlPea1P6evemK/tpH+SnzdA/wxxldxo
	 mbCAuIuqGvhyFHfU9rveIWWerxnvH7ACgc8jrsZ8eMEPbtirhUKx2gUwOJFW3mEgUK
	 Lxp/jUp1OC1fw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id CEDC0F03949;
	Thu, 26 May 2022 14:40:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: mvebu: arm for v5.19 (#1)
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165357601384.28072.10506922361684730593.git-patchwork-notify@kernel.org>
Date: Thu, 26 May 2022 14:40:13 +0000
References: <87o801r2ss.fsf@BL-laptop>
In-Reply-To: <87o801r2ss.fsf@BL-laptop>
To: Gregory CLEMENT <gregory.clement@bootlin.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 13 May 2022 15:16:03 +0200 you wrote:
> Hi,
> 
> Here is the first pull request for arm for mvebu for v5.19.
> 
> Gregory
> 
> The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: mvebu: arm for v5.19 (#1)
    https://git.kernel.org/soc/soc/c/426ecc585102

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


