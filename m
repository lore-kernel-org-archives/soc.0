Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57215C2BB48
	for <soc@archiver.kernel.org>; Wed,  9 Dec 2020 17:10:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id ED25B23C84; Wed,  9 Dec 2020 17:10:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1607533810;
	bh=7wr6Af/Knpt5IuCuS4G3KKk9LCyidz+uL9RMG1AC6gI=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=GyUCfrhP/3csX0Y7Da4WSDP2gs8FI2kc+lUn/0yErdirz6E4xNDkLktVHWLTRaRoK
	 HPzdO5gC9Tnc/ZC+736EXYfAOkcY4RxtjWoAQxhrPEpH+2pNfgntr9Obs5OD0oi/ke
	 Q3v6dx9RIViAHD61wxIGNuWuZN8235GBdAiKGNDTsasSqjiJJSNHbSknweq6w55uqy
	 UmPGwTQMa5bScXFNVRU8TUOKA2hOhyNahMp8PV8aXWUzz8Zm/seoJCho7OCMLWXBXL
	 gF1PzWgge0Qgf9IwCDRhfkL+rMgIxazjMzwmEjQHOUrhI380TXxuX/wDtfHQagwrtX
	 A6dSewjl6LurQ==
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: aspeed: soc changes for 5.11
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <160753381082.14869.17605012572854925926.git-patchwork-notify@kernel.org>
Date: Wed, 09 Dec 2020 17:10:10 +0000
References: <CACPK8Xfd7AmuEaUdFfYLu4ktcrpTnYUgwQSxUbC-McB02hvo_g@mail.gmail.com>
In-Reply-To: <CACPK8Xfd7AmuEaUdFfYLu4ktcrpTnYUgwQSxUbC-McB02hvo_g@mail.gmail.com>
To: Joel Stanley <joel@jms.id.au>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/for-next):

On Mon, 30 Nov 2020 06:30:44 +0000 you wrote:
> Hello Soc maintainers,
> 
> Here are some ASPEED changes for the 5.11 merge window.
> 
> The following changes since commit 2ba56f464f0c1a7264160f8675063b3df92e7966:
> 
>   ARM: dts: aspeed: ast2600evb: Add MAC0 (2020-11-19 22:31:18 +1030)
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: aspeed: soc changes for 5.11
    https://git.kernel.org/soc/soc/c/419fd286274e

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


