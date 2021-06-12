Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93C6BC49EC9
	for <soc@archiver.kernel.org>; Sat, 12 Jun 2021 16:10:17 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id F3D5561418; Sat, 12 Jun 2021 16:10:16 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id D430A6140C;
	Sat, 12 Jun 2021 16:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1623514216;
	bh=rJHwPo5Yhyy3s6y+e0Iw9vvY8ekRts/KeDWe+RUaGcQ=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=kBv0O58Nzv17SwGAjDa2A8cRcZIZT6mq5/p0zGynjXs5xx0f4DnHhmOb74juozv2v
	 QYuo/rB9Wa6PH+RsyO10f0Ooegv5JBjON98/KE8o5TaCRey4wsMVx3FR5q5PBaz3EG
	 CevaD+aT15LaalFMWI6/YeRq60Ol3yXk8raugqRajLFLnh7eap8htMSEn9Fy2c8Vp8
	 9j9uGxyDKGn6oeaZ6fkA5a7QwpcZquW//oR3E0vgdJIdWUEmOh/hV1ujO1Kmzmgn92
	 ITqVHfKzdf9FBPlZ3sTSniZW2BsUSS1BmCnJszfYs6nur0K0ozSKLoT7CAit48jioZ
	 kIdBhD6e1WL2g==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id CD2B660CE0;
	Sat, 12 Jun 2021 16:10:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: aspeed: devicetree changes for 5.14
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <162351421683.27448.4703516399340434858.git-patchwork-notify@kernel.org>
Date: Sat, 12 Jun 2021 16:10:16 +0000
References: <CACPK8XduV9F=piu1qh56g+YNOZOBYTW7b2Y=XVYafpYDwWmDYA@mail.gmail.com>
In-Reply-To: <CACPK8XduV9F=piu1qh56g+YNOZOBYTW7b2Y=XVYafpYDwWmDYA@mail.gmail.com>
To: Joel Stanley <joel@jms.id.au>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/for-next):

On Tue, 8 Jun 2021 02:31:19 +0000 you wrote:
> Hello Soc maintainers,
> 
> A normal looking Aspeed pull request for the next merge window.
> 
> The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:
> 
>   Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: aspeed: devicetree changes for 5.14
    https://git.kernel.org/soc/soc/c/131dc51df2af

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


