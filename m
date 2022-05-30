Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4816C433F5
	for <soc@archiver.kernel.org>; Mon, 30 May 2022 09:10:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A0FBEC341C4; Mon, 30 May 2022 09:10:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7D414C3411E;
	Mon, 30 May 2022 09:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1653901814;
	bh=io+bt5er3qm4A8dmdbXouOae2r5JgT3x+/8LeDgoPAs=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=vGZZ7nBGSQkhyhbHVFiaCcPXa7j3ASmHXLw8yqEoo603u3l6Zd5vwgW7femLOkChe
	 WwNDsj0yzw3dETg5SOz5C3GjsSpJYT4yYVUJxOmvA0UDYEQMo5791oX9jPNKno0YpU
	 l8jydYzPGkawL+a5G34xzAhVQf4PYlrGDi7cxP3/Vr4DJiBfF7pmTDNtfIUOJO4NPX
	 8ZISsLUMHKIrDKzlrMrvj2I8d9iAGaU7Hj7/eZU/QgE0YUA/bNoIUpdp0U7bRFsCEU
	 o9wrXHYmnlCo91FZ6b+vUX7YzRNt6oatYYK8++ByJfZltEClAjC4nFwn18wLTR2vFU
	 CWZkI+/ZEGF1A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 65258EAC09C;
	Mon, 30 May 2022 09:10:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: aspeed: devicetree changes for 5.19
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165390181440.1903.14208201493475542843.git-patchwork-notify@kernel.org>
Date: Mon, 30 May 2022 09:10:14 +0000
References: <CACPK8XfUmFxU8Y6C+aZ2+=dT7=fCfs2=2_aYqyRjoXCoeQaUWQ@mail.gmail.com>
In-Reply-To: <CACPK8XfUmFxU8Y6C+aZ2+=dT7=fCfs2=2_aYqyRjoXCoeQaUWQ@mail.gmail.com>
To: Joel Stanley <joel@jms.id.au>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 20 May 2022 03:34:50 +0000 you wrote:
> Hi Soc maintainers,
> 
> Here is the (second) device tree pull request for aspeed socs. The
> first ended up being the fixes I sent, which Arnd decided to put in
> -next.
> 
> The following changes since commit 32e62d1beab70d485980013312e747a25c4e13f7:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: aspeed: devicetree changes for 5.19
    https://git.kernel.org/soc/soc/c/725523dd3634

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


