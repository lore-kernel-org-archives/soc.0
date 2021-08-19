Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CA8EC4320A
	for <soc@archiver.kernel.org>; Thu, 19 Aug 2021 15:50:06 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 5CE8C6112E; Thu, 19 Aug 2021 15:50:06 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 4624A6108F;
	Thu, 19 Aug 2021 15:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1629388206;
	bh=XFExNA6QPX4iL7qkXsfRL1KSmCkx8KK05wp4Zyt0YHI=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=RrZ/LY4STztIG7R8B22QriGBUdi037ZKDFXMBUZojXbrfCpkp2c7rb+0o5Um3ifr3
	 onuQ0D8yiNodZPPOM1/qHVLDSlqdOfXCYLMT2eQbzrc2y+H7cRrPZ4Uc3EbcmYVcDk
	 VhwOQgu2EWhSSzeYDduMhjCv++rT9lJvzuWw8MO88d4LisheehTB36DxWQak+uYL+R
	 AAMpPW/IbBwxfITQbo6FDLd+5LdepCBj7G0CDskOaRjVBMOJCgh3te2z2YeqJE+94n
	 4E79dg6QKCLnUPBOsfe4ET1HzRd/kUnHSrxwVNQFP3hckxzfPjpKDLAJVimmW5FJyM
	 UgcQbBpXxwqlw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 3C3CD60A2E;
	Thu, 19 Aug 2021 15:50:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: aspeed: soc changes for 5.15
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <162938820524.21569.5103095426015687496.git-patchwork-notify@kernel.org>
Date: Thu, 19 Aug 2021 15:50:05 +0000
References: <CACPK8XdyT0rCkoeE7x2EQyvFy1Z7ZwFNdm1SQfCG9yC_Z7UbxA@mail.gmail.com>
In-Reply-To: <CACPK8XdyT0rCkoeE7x2EQyvFy1Z7ZwFNdm1SQfCG9yC_Z7UbxA@mail.gmail.com>
To: Joel Stanley <joel@jms.id.au>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/for-next):

On Thu, 19 Aug 2021 05:31:53 +0000 you wrote:
> Hello Soc maintainers,
> 
> Here are some soc changes for 5.15.
> 
> The following changes since commit 2734d6c1b1a089fb593ef6a23d4b70903526fe0c:
> 
>   Linux 5.14-rc2 (2021-07-18 14:13:49 -0700)
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: aspeed: soc changes for 5.15
    https://git.kernel.org/soc/soc/c/9dbacd465ab7

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


