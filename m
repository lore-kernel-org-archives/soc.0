Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7D632F236E
	for <soc@lists.linux.dev>; Fri,  4 Jul 2025 09:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751620184; cv=none; b=POulhMICca82sNOKgoOxKSd1VdXYCMPlvUuMxscAxEnyJoFuIj31AnxxR+A+vSnXeGiK6aJG1qWUi83st8t+dUx0FuR0+ItOaNvxsmA5IITiHiZ3TS0e/pK0t6RpI8qmBZIPk3iVw4wY1ekToP89ZNE6Cmv8ZqlDSt+tSf1sJiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751620184; c=relaxed/simple;
	bh=SMT7qT4lTP3XZpVEJg7qnVoIpTbDQ9Z+3vkdf5b7KCw=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=irasX1DT4UuYaiIdVcbCon95MhqWJwhe4+UEc+ExAoIm9EWuCLlMk0LCKFoDLteQ+vlupKjrESIms64XbwGleihR9u9/JYP3VYqeIthVD3B84Moq5ZVYCXJOnra/EgmcBEdGhv0jt3QcI+LZ95UZteQdH7xqtDrZ2wtA5zgAQ6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NN71G3Ah; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NN71G3Ah"
Received: by smtp.kernel.org (Postfix)
	id B4208C4CEF2; Fri,  4 Jul 2025 09:09:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EAFBC4CEE3;
	Fri,  4 Jul 2025 09:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751620184;
	bh=SMT7qT4lTP3XZpVEJg7qnVoIpTbDQ9Z+3vkdf5b7KCw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=NN71G3Ahhdkik5SPB9cWPu/psNJdbpsYh8Bw6bXzCYT+rwqri1MPowG6n9K1Azvyq
	 5zIrny2amZI9wmLyT33O12fNZxigBvYNzmzwB7Sqi+tFAmmsm263vwAuN6JgVPskqd
	 4raxMeYZY7KLrIsjmwNn2vBlj92nQ1b9jeDPLTRufOfyjQfIaceUglNLAhdPvslzUl
	 8mPsWd1aPsBHN5T+6ReWqWaL5OknDoEyOMJM6iVPn3gJxm5VqwJbYf2wxNvcwQxra2
	 n0lC729uO43IuqsX0QXpSOoKDV6Beapuz9gIerbq1X5q3JhSpNvhlaeasDaokh/cR5
	 k+IRwM71LPGag==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAD68383BA01;
	Fri,  4 Jul 2025 09:10:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v6] ARM: Switch to new sys-off handler API
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <175162020874.1782818.14669389423698227266.git-patchwork-notify@kernel.org>
Date: Fri, 04 Jul 2025 09:10:08 +0000
References: <20250624184245.343657-1-afd@ti.com>
In-Reply-To: <20250624184245.343657-1-afd@ti.com>
To: Andrew Davis <afd@ti.com>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 24 Jun 2025 13:42:45 -0500 you wrote:
> Kernel now supports chained power-off handlers. Use
> register_platform_power_off() that registers a platform level power-off
> handler. Legacy pm_power_off() will be removed once all drivers and archs
> are converted to the new sys-off API.
> 
> Signed-off-by: Andrew Davis <afd@ti.com>
> Reviewed-by: Andre Przywara <andre.przywara@arm.com>
> Acked-by: Alexey Charkov <alchark@gmail.com>
> 
> [...]

Here is the summary with links:
  - [v6] ARM: Switch to new sys-off handler API
    https://git.kernel.org/soc/soc/c/990cd3e93a76

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


