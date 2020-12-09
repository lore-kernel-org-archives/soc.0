Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4674DC1B0D9
	for <soc@archiver.kernel.org>; Wed,  9 Dec 2020 17:10:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id E053823C83; Wed,  9 Dec 2020 17:10:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1607533810;
	bh=85A6yH9mg331oZbDvQV02lZXa1gzY1HGa9BGgFMSO6g=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=tzpe7NsBF3fW4WaKVOTC/Fo+0pBCLyu0Phuy+/fFJX2q3Jxfb9PPJ26u5L0i43Enl
	 4eut2xmdAem/H1ETJIzp377YbBu5SMpGEo8AYL5QN+oJk03sFIuOyocdRX6Q7KrbKO
	 DDIbblGt7594GgsTU6Jk/0wyrVpsErrQuoa0URajNe/qohXJ/jOV1dNaWH3gSFkR+q
	 CkS5OQCbePbADX9a8nMM9VuAu0UmuX2zlkUsmVHdMVuDf+Pum4QWqQRC8LOGQ6cw20
	 d6q+EMEAY2uUGIkKBks8+T/bpNfTKYgThIeY+EfCNXLd4eOEn9xgJ/Pgkp4MPNIY/C
	 TCnREWB5t8raQ==
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] arm64: dts: ZynqMP DT changes for v5.11
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <160753381078.14869.18066311233745449897.git-patchwork-notify@kernel.org>
Date: Wed, 09 Dec 2020 17:10:10 +0000
References: <f460f6ac-d235-a33b-3d0f-ca904a43e687@monstr.eu>
In-Reply-To: <f460f6ac-d235-a33b-3d0f-ca904a43e687@monstr.eu>
To: Michal Simek <monstr@monstr.eu>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/for-next):

On Wed, 9 Dec 2020 15:56:47 +0100 you wrote:
> Hi,
> 
> please pull the following changes to your tree.
> 
> Thanks,
> Michal
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] arm64: dts: ZynqMP DT changes for v5.11
    https://git.kernel.org/soc/soc/c/c87b013f23c6

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


