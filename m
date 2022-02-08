Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C71DDC433EF
	for <soc@archiver.kernel.org>; Tue,  8 Feb 2022 09:21:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id AE517C36AE2; Tue,  8 Feb 2022 09:21:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9790CC340EF;
	Tue,  8 Feb 2022 09:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1644312109;
	bh=TqU0Xy7o6be4pwGsrmg1Z2y1y6gNQgf+AA3tFCeMQ2E=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=apeK9vzx8CqoYJ6HFsCS/v/csyK81N9cH1s/IEkIPg39wH5OQ0FVwsXSSXjs60R63
	 M+TILEx6M3B59oN0mTKU6V4oMfML2jLXH62zv7Xi7AVYmr5QmKo5z7QRzYxY34QmgW
	 IXTE9TExVX2uAXg6YOKT1qCVh94WjTlEqWavQREE3lP4Dwyel/HMlpwBfGnzscMMbd
	 qjqMg0OjoJfEte6EyCCdl5/Wuo+SLbBwtcuuVg5utdD2YIz0aMnNQp3q9Zom2BhRjy
	 07w/JW/KAdINc3OPcOnb52TBrZjj6wbUGXVxcQ8Mw7T1vUqI7hlBylbXJvY0tpJl8v
	 1S/Firha+ZwkA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 80919E5D084;
	Tue,  8 Feb 2022 09:21:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: socfpga: fix for v5.17
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164431210952.18327.17343166169217934485.git-patchwork-notify@kernel.org>
Date: Tue, 08 Feb 2022 09:21:49 +0000
References: <20220207101002.7566-1-dinguyen@kernel.org>
In-Reply-To: <20220207101002.7566-1-dinguyen@kernel.org>
To: Dinh Nguyen <dinguyen@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon,  7 Feb 2022 04:10:02 -0600 you wrote:
> Hi Arnd/Olof,
> 
> please pull in this fix for v5.17.
> 
> Thanks,
> Dinh
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: socfpga: fix for v5.17
    https://git.kernel.org/soc/soc/c/6efb9f739d41

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


