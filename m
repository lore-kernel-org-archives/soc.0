Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BE6CC3F6B0
	for <soc@archiver.kernel.org>; Tue,  2 Aug 2022 14:20:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5875EC4347C; Tue,  2 Aug 2022 14:20:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 41FC2C433D7;
	Tue,  2 Aug 2022 14:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1659450031;
	bh=VJIBUFoxmJ+0AA7Ptn/4EOLYn6kpXYk+fXLyCPDgQkI=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=tHqwiDNClqGs4K9lk9RtM1m1kYKdn2xWJY1Io2g4PNKOWm3EyU7Gsrie3gRRzBpgk
	 IkMsyqHNbYNQWrPqM8opxs/wcs+MpNdR0icWdDombAaFs+djsre+yKglgTTLnJAquj
	 SWvF4/S6JiYg8SDtne7MZc3EHYJp53l28qlK9O3AlDuS8zfH9M42UqHofJriMtadpM
	 s1QqwUNLupnn8/y9GiYeLI6EIdIfkANWzIv8QyzWXfb/vA1l4dNQngiXDKUo7utLoe
	 8BLKoXT70STHnPsFAEQhLFTsCItBsLLN8p0IyzEai3vF52Uj307JWrf3YcYw20bMpg
	 0+H89L/4xuKfQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 1D009C43143;
	Tue,  2 Aug 2022 14:20:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] arm64: dts: socfpga: dts updates for v5.20, part 2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165945003111.4474.2659286717801345151.git-patchwork-notify@kernel.org>
Date: Tue, 02 Aug 2022 14:20:31 +0000
References: <20220728223237.3184243-1-dinguyen@kernel.org>
In-Reply-To: <20220728223237.3184243-1-dinguyen@kernel.org>
To: Dinh Nguyen <dinguyen@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 28 Jul 2022 17:32:37 -0500 you wrote:
> Hi Arnd/Olof,
> 
> Please pull in this patch for v5.20.
> 
> Thanks,
> Dinh
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] arm64: dts: socfpga: dts updates for v5.20, part 2
    https://git.kernel.org/soc/soc/c/0d98fbcf72f1

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


