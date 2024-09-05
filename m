Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E36DCD5BC9
	for <soc@archiver.kernel.org>; Thu,  5 Sep 2024 15:40:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7D68CC4CEC7; Thu,  5 Sep 2024 15:40:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67382C4CEC3;
	Thu,  5 Sep 2024 15:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725550835;
	bh=Z7CTHW+sEiFGQfw42LRedNVmVnd3sUu0KPqPCYMAus0=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=nk4Xm1NZN+33EOTPDlokOMWwVMjNXiZDYfjYoCXJ9vBhWyVPBzRBzDZuXVnlSDgB+
	 OfHJeB3BJ3rsc10C0f2JpN6gkG8W6TxbtJDFF5p8K4WQrARnRp8lXg6drAeJ0td2uK
	 4QBqrZ37pZ0HSAELII/rup1EvvghhpYtor0GRzonQhRljNgCcWIx5VWISe4A9MQvrp
	 pns/XpzwoB6SlA629BjHZPtaje+OMHrBQGZbwcF6mqxQ8ORb9DibeHinUvhzDL/h0h
	 CH+PZKyBWEpwTNT+sikZ9c67UbdYwSwG0PvFsXbjr8hkte7fukcWTxxT763QLO65gS
	 Dx8tqrnjQHLsw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70CF03806651;
	Thu,  5 Sep 2024 15:40:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] amlogic ARM64 DT updates for v6.12
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <172555083623.1737985.13832328564199775341.git-patchwork-notify@kernel.org>
Date: Thu, 05 Sep 2024 15:40:36 +0000
References: <cc8fb460-5ac0-4b16-8490-8ac9f89f1b7f@linaro.org>
In-Reply-To: <cc8fb460-5ac0-4b16-8490-8ac9f89f1b7f@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 5 Sep 2024 14:50:24 +0200 you wrote:
> Hi,
> 
> Here's a set of Amlogic ARM64 DT changes for v6.12, with:
> - The final DT fixes to solve all remaining bindings check errors
> - Amlogic A4/A5/T7/C4 & S4 base peripheral nodes
> - New Amlogic C3 AW419 Reference Board
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] amlogic ARM64 DT updates for v6.12
    https://git.kernel.org/soc/soc/c/828b70ea7fd1

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


