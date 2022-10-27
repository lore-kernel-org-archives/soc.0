Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0810FA3741
	for <soc@archiver.kernel.org>; Thu, 27 Oct 2022 16:44:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id AEA24C433D6; Thu, 27 Oct 2022 16:44:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 917EFC433C1;
	Thu, 27 Oct 2022 16:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666889073;
	bh=DuqquMm9aRBRvdSKFDz4jP1XmzGWDIPxbJBwesaCh6g=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=Gh/ZxU9CGCcaQs7XubJFc0HFP8aN5UkXiUjQBBJvYZ1ebzjZ/usxRqhB1pZFRbMNn
	 V59fdq38iDM/9DcREjlJmSURAYenXA+wLJ8tPdtv/ToKUimYHHh89Rfy0GbptKhAN2
	 yOBg0n8Joz/VsXaGGXJe8y4plZDq+Pg14RfiYdMQE5/wiUezbs3uRr+Baf+eioVPE9
	 Kb9PMhO8kzlvGTd+LD7H4/76g5iHO8/jzFMXbOzHnyVOSUWE+gRVe3eJ90U9vihQzM
	 3VsKrhmOfUjCA+UaNae3/rIbGoHNKe7tfo1gXZGqko5vNf0Mb//VkqIExGpe4UrlD8
	 sYsKw0o9q01Tw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 6BAF3E270D8;
	Thu, 27 Oct 2022 16:44:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Ux500 DTS changes for v6.2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166688907343.25139.11831067217902690413.git-patchwork-notify@kernel.org>
Date: Thu, 27 Oct 2022 16:44:33 +0000
References: <CACRpkdaXmmZWsGdTG5tqNragkoefcTeUHjR+ZwNyNaa0S7s-7Q@mail.gmail.com>
In-Reply-To: <CACRpkdaXmmZWsGdTG5tqNragkoefcTeUHjR+ZwNyNaa0S7s-7Q@mail.gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 21 Oct 2022 23:19:44 +0200 you wrote:
> Hi SoC folks,
> 
> here are som DTS updates for the UX500 for the v6.2 kernel.
> 
> Please pull it in!
> 
> Yours,
> Linus Walleij
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Ux500 DTS changes for v6.2
    https://git.kernel.org/soc/soc/c/11976324b724

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


