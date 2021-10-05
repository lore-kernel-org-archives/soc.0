Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7363C43219
	for <soc@archiver.kernel.org>; Tue,  5 Oct 2021 13:50:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 7967D617E3; Tue,  5 Oct 2021 13:50:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 5C31C61502;
	Tue,  5 Oct 2021 13:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1633441809;
	bh=q9GjuMsu2GfNwOvpYTsCUfQ9bxiw1WLcWM9Nt+np1nk=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=f8bBUjLfcIpQp+dd/VLpspAZUPc35IRYwWtmaoLn4k1noMXyxDaDZykK4eR2mu82O
	 j6XweXxKUeKRtjNf5nZx7sVSwqO1SKnWCRChjAbm8Gg3kIh/AnzmDA9AAN+LT4o+Ym
	 Ezql9d1U8HrR9Dr1A7iFQNZDKychlPn7SkyW+jNJiCGgtd8v4v5QXqXg4MLn8rhi0H
	 g3TvCt8Urx3dmF1Av/NlXvp4H5c/Dt4dBHzMLJ6eMJjSep8f1BdziEqS9/zd2027a0
	 NKQzWftcqwsk5XEYsiUrPpn3FuRvxnQUmqdZdHMtUtHa3yASbMvEzRhwnFMSoCkhgU
	 lJ07hFLqx7N5w==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 56602609D8;
	Tue,  5 Oct 2021 13:50:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] OP-TEE fix for v5.15
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <163344180934.2242.16391229814488465154.git-patchwork-notify@kernel.org>
Date: Tue, 05 Oct 2021 13:50:09 +0000
References: <20210915113813.GA509196@jade>
In-Reply-To: <20210915113813.GA509196@jade>
To: Jens Wiklander <jens.wiklander@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/arm/fixes):

On Wed, 15 Sep 2021 13:38:13 +0200 you wrote:
> Hello arm-soc maintainers,
> 
> Please pull this small OP-TEE driver fix for the shared memory pool
> handler. The fix doesn't change the generated code, but it's still relevant
> since the problem obviously triggers warnings with some tools.
> 
> Thanks,
> Jens
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] OP-TEE fix for v5.15
    https://git.kernel.org/soc/soc/c/f81fd2147618

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


