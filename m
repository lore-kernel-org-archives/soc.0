Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1A782F39D1
	for <soc@lists.linux.dev>; Fri, 14 Nov 2025 23:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763162643; cv=none; b=TUZg5EqdJxZ4gsTYFq2ZuFcmzrUfwVzBdjPfq4xLwp/WmX2m4JYEAySIyIfOUpS9LXsrmpp9fblYmQ9X/8VdFqlP30704KSFUkkSaPuKAVfrSBVc+Vof0G3c3OHOHDQpSdN+6LbvH5zLDHu+oPnMH3RfDlKKg6DzKgwmYe80yGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763162643; c=relaxed/simple;
	bh=r+k4ZyBGtbADVAbWv83UWeZWj0UZVsV3x+/ycNzkD00=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=lef++rFxbwqWEsCwJGEJx2F44olicqsXpnsvayIa03kjOTLWXTJr6wGppDvKa849rb53X9voB9uc0ojIpVtj3ifJDeAuIcA1b16VtyZRzWTbUQonZljAIMI0o8g/0ZgUEimeIZralCTpGon+lqKTcyV2ZJ7CvpRNur9gmEo0Uiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O3oYrRO5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O3oYrRO5"
Received: by smtp.kernel.org (Postfix)
	id 5E9B0C4CEF5; Fri, 14 Nov 2025 23:24:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49500C4CEF1;
	Fri, 14 Nov 2025 23:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763162643;
	bh=r+k4ZyBGtbADVAbWv83UWeZWj0UZVsV3x+/ycNzkD00=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=O3oYrRO5m5l1laPejnmuxcHJJrbuiaoC4VT4zDgxFa9m3Sr6KhuKRqDM0Unj+f1tF
	 A0KmrtPtMOtjU/Tsg16OcdFw8D23yoUtxBZgV2WHLCI4ct0KTD9VHOxrJi/tteqFLw
	 p/0lBo4X3lLJnV0ygX7FaAnJVMbowi4F6r++9EU/os0+jv9+RdY4pGr+qLJe7oz7Ef
	 /jW9uKShIi5cQuvzOih9KTqEiHUwCaWf5aa8NC6fx/v+uOVrcymIz8QAnd6RIKwhSZ
	 bXvRyLw8R8WtMvqlD3F7fZFVl1zwODz929/gWJYiPa5M4eel0zInjPvogaEMW1eIDZ
	 KoBuOkR2YE4bQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAE253A78A5F;
	Fri, 14 Nov 2025 23:23:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] TEE fix for v6.18
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <176316261174.1867843.17135785224631624281.git-patchwork-notify@kernel.org>
Date: Fri, 14 Nov 2025 23:23:31 +0000
References: <20251114073627.GA1362600@rayden>
In-Reply-To: <20251114073627.GA1362600@rayden>
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 14 Nov 2025 08:36:27 +0100 you wrote:
> Hello arm-soc maintainers,
> 
> Please pull this small kernel-doc fix for the TEE subsystem.
> 
> Thanks,
> Jens
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] TEE fix for v6.18
    https://git.kernel.org/soc/soc/c/124c98b10001

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


