Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EFD6C27C7C
	for <soc@archiver.kernel.org>; Fri, 20 Jan 2023 10:10:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D0DC6C4339C; Fri, 20 Jan 2023 10:10:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B7505C433D2;
	Fri, 20 Jan 2023 10:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674209417;
	bh=FdZmAK7YGLEXbDtOOnMUqgByMFuuIzJRkfnoJC7A7TE=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=pPudokOG/NKsy1dzGd9fVbLvjT7U51C9+38syWDij4da2JpgA3LzUyl2NjyatGzUF
	 +OlpF/XBfCeXhkdQ36EvUs0ZNGyQuWwd5mN20dX6lkwnSsNplYW9XVtXBzDS2eS6hA
	 1J7T68enQ0dNbHFK3dP2DOtPPvLFvnVbgZIfOiE9MvInnofN57iVeF9kp7hMSCet4b
	 6YqYfot1lnXUBiqGUnLm8C/Ym+lYq8xukF4mLgOUw+X7H/4vgkuVM6tlXZqk1OgJ8V
	 to70oeJTZBL8+QRDe//klduIKgOrn/AjTEh2kpZ6LUQJTvNKa6AV/Zm5DZqIEXirbq
	 15pAJQit0nPBg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 96CF5C395DC;
	Fri, 20 Jan 2023 10:10:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] STM32 DT fixes for v6.2 #1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167420941761.17943.18423011248895823316.git-patchwork-notify@kernel.org>
Date: Fri, 20 Jan 2023 10:10:17 +0000
References: <3fe26bf9-297b-5c78-682b-37fa6d8b6190@foss.st.com>
In-Reply-To: <3fe26bf9-297b-5c78-682b-37fa6d8b6190@foss.st.com>
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 17 Jan 2023 15:58:05 +0100 you wrote:
> Hi ARM SoC maintainers,
> 
> Please consider this first round of STM32 DT fixes for v6.2 cycle.
> 
> Thanks
> Alex
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] STM32 DT fixes for v6.2 #1
    https://git.kernel.org/soc/soc/c/b7b0742883e0

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


