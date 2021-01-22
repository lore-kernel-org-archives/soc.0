Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9829C433E9
	for <soc@archiver.kernel.org>; Fri, 22 Jan 2021 23:00:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 5D9AD23B09; Fri, 22 Jan 2021 23:00:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 4650623AF8;
	Fri, 22 Jan 2021 23:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1611356411;
	bh=UtOLDJJ5iJRaLgt7ccWYqX/sOwFbO/hj/xSwnHhTzas=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=tO9N1Tc5G2JUxPKQpEuRIThyW/P9nTcYnWA+lUSQCBNXJt/U/LZp/Xc9nJUMFIkYD
	 kOD68BeKSLIomQmu8oxOfkMt68KTe/o6T+3phm7ceLX2EtZTYunO/Tcg2jWTnfQPGZ
	 Vm0ceUOy53EOA9N1zAjuwVnlAAC0VaIC67UzhNo6UFrM2Zs+hSbX4XEGaZ8FlLawFm
	 WcDYUFj55CbQKi8ooGuq4QVoSKjzb3xA+HT2nu5AXYF0O49qNGbghEGLJLmBz9wwvg
	 TcvGuXv/Is7CYqcQbWDcye8tRkdquncDBG3eFUuw3+gWo+w8fmS4ceaqXp6FW8Fma3
	 li0N91ILDh6Rg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 352A3652D8;
	Fri, 22 Jan 2021 23:00:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] i.MX fixes for 5.11, round 2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <161135641121.29035.3441602141055876432.git-patchwork-notify@kernel.org>
Date: Fri, 22 Jan 2021 23:00:11 +0000
References: <20210119091949.GD4356@dragon>
In-Reply-To: <20210119091949.GD4356@dragon>
To: Shawn Guo <shawnguo@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/arm/fixes):

On Tue, 19 Jan 2021 17:19:49 +0800 you wrote:
> The following changes since commit 5a22747b76ca2384057d8e783265404439d31d7f:
> 
>   ARM: dts: imx6qdl-gw52xx: fix duplicate regulator naming (2021-01-11 11:41:17 +0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-fixes-5.11-2
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] i.MX fixes for 5.11, round 2
    https://git.kernel.org/soc/soc/c/e49c24c8cd00

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


