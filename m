Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F669C49EBE
	for <soc@archiver.kernel.org>; Sat, 12 Jun 2021 16:10:17 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id E8D0E61412; Sat, 12 Jun 2021 16:10:16 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id CFCB76140B;
	Sat, 12 Jun 2021 16:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1623514216;
	bh=1DJgnjPVEPKJSCWns4yD6t/zzV1tYJNOpJn4oZX7kbc=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=kd6tSX1letDxwSooiGuaz6HhJYwBo/YUxhfkipurzSpWEmJCczz8kZeAcFeW1YfrT
	 uM30X0GhQuYPJFrlpAwpgaR81xYxhnFL7oU062gc0f3gNI3FrSF5B0JvbjcGjYCsuF
	 0pUReQYEKS+pP5Pa79ifT1URlzOh5EaBEwuNb6hFbcdSDDlvjAzQCKU0CAUmiK5mBh
	 qRXUAl6jxL/wSSA0JT668seYxlMLaIPgXnF+9YnIDD6Rlc/Fy8+mAweWiVAwgwRAj1
	 RpYNpatsXeLHjzymYsbqxG3ZRwxVRJwO7C0rGS1YHgFE0rB/nla0S4FN4bhXQYMTB9
	 yc3JJ6WjWNTQw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id BC99460A6C;
	Sat, 12 Jun 2021 16:10:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Ux500 DTS changes for v5.14
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <162351421676.27448.8196759609334713612.git-patchwork-notify@kernel.org>
Date: Sat, 12 Jun 2021 16:10:16 +0000
References: <CACRpkdYh9kZJU6PAxghPRGBco_61wRZgUnTZr_3qvySPCo5rBw@mail.gmail.com>
In-Reply-To: <CACRpkdYh9kZJU6PAxghPRGBco_61wRZgUnTZr_3qvySPCo5rBw@mail.gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/for-next):

On Fri, 11 Jun 2021 00:23:19 +0200 you wrote:
> Hi SoC maintainers,
> 
> here is a collection of DTS changes for the Ux500 platform that
> have been circulated on the list, please pull them in!
> Details in the signed tag.
> 
> Thanks,
> Linus Walleij
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Ux500 DTS changes for v5.14
    https://git.kernel.org/soc/soc/c/fb755b075d97

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


