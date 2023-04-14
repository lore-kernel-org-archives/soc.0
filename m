Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06976C77B7F
	for <soc@archiver.kernel.org>; Fri, 14 Apr 2023 13:10:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DC974C43322; Fri, 14 Apr 2023 13:10:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C0AC7C433B4;
	Fri, 14 Apr 2023 13:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681477830;
	bh=2+v59VPSYGeL9gXODYiPV9BDOcy3R+etDJBidWnblFM=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=cN3rMPPfjc3P7c6MDh7MCmdVzndF2WCYaa2/HfzALUuTY8zNa0wa3djDpvPguV/s7
	 noXMbb/QPSzKa0V1ugI4f8lMYKGjvpESi4sAKeL0KBdDQFHb8ZgMmL8YOy8lDMjhoO
	 7UXdcq7q2J1acl3yUS98kYFt5sAiKFoOth+9t38ZvMPJoqDuYZpzlc57WVT8+IFkpa
	 ToK1W8dEo3JGZBGbdl5/Bq+J/NhoZell4UoFzVJaaYepQNETxr1UzSsVPCb25pI4cr
	 +R0NhexoEDhKNUHMhDjheizWFFegmyG5N9kTDx5T8Y6ZEKTzxZg3e9nRZih2WSYVk4
	 wwhIBvililM5A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id AA964E4508F;
	Fri, 14 Apr 2023 13:10:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] ARM: multi_v7_defconfig: Add OPTEE support
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168147783069.23940.8780552709386026531.git-patchwork-notify@kernel.org>
Date: Fri, 14 Apr 2023 13:10:30 +0000
References: <20230413072042.30657-1-alexandre.torgue@foss.st.com>
In-Reply-To: <20230413072042.30657-1-alexandre.torgue@foss.st.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 13 Apr 2023 09:20:42 +0200 you wrote:
> STM32MP13 platform relies on OPTEE to boot: Clocks and regulators are
> handled in the secure world by OPTEE and exported to the non secure world
> (LINUX) thanks to ARM SCMI protocol.
> 
> Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>
> 
> 
> [...]

Here is the summary with links:
  - ARM: multi_v7_defconfig: Add OPTEE support
    https://git.kernel.org/soc/soc/c/24c159793238

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


