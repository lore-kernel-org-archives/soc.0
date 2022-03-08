Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19F58C433F5
	for <soc@archiver.kernel.org>; Tue,  8 Mar 2022 16:30:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 01E9EC340FB; Tue,  8 Mar 2022 16:30:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E01A9C340F8;
	Tue,  8 Mar 2022 16:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1646757014;
	bh=D7wPIoQ2T+VBi4ZdCE7kT3ZatTKG8CBMA0ZBqBBC2Ts=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=aGjqSqc1jXGKMBrzjLPDiThIbEU3o2JCucW2kn0LRSubx1UONOEFwSjt+ABCVdzL5
	 PAOjrxFzVREN0yj87VnCKkSBOPn5bdg1+66I6LH8VnTLxyhplOGhtopX+GDB2PX56E
	 AHRVyEp0JedaJb5pXRHxt5HazhYs8EcrPCjrgbN/uoGSE35cwTDMEeSncJ6X1sSUR4
	 dKK24wTVejf0mhMZDyrLKVHv17iTarITciEoTrDybv9+w17RTBfty3FFQsz/Nucu9Y
	 7A91hsMnoY1tI0yT7GMYpVgS7PgGjLSmAvK5pw2OYIRzK3XLfv44Qt0Q2+1TK3SVyq
	 ywIwJjW0Abszg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id C4A35F0383C;
	Tue,  8 Mar 2022 16:30:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] arm64: zynqmp: Xilinx DT changes for v5.18
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164675701480.9628.4411052594268909198.git-patchwork-notify@kernel.org>
Date: Tue, 08 Mar 2022 16:30:14 +0000
References: <19464dc6-eca9-f9a7-8aba-43af094d7c37@xilinx.com>
In-Reply-To: <19464dc6-eca9-f9a7-8aba-43af094d7c37@xilinx.com>
To: Michal Simek <michal.simek@xilinx.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 3 Mar 2022 16:24:50 +0100 you wrote:
> Hi,
> 
> please pull these 3 patches to your tree. The only thing to be aware of is that
> there is a conflict with one patch which goes via Greg's USB tree.
> Stephen reported this issue some time ago also with simple resolution which is
> visible here.
> https://lore.kernel.org/all/20220210141550.56359523@canb.auug.org.au/
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] arm64: zynqmp: Xilinx DT changes for v5.18
    https://git.kernel.org/soc/soc/c/756f4ae14562

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


