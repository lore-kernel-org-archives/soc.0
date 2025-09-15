Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57DFF32A3CC
	for <soc@lists.linux.dev>; Mon, 15 Sep 2025 14:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757946613; cv=none; b=gnHLv3U+3oSE4Y4zSv64MX/ppjAUbpvUMVwkUsLZjGKapN1jykqjNwmPScdASdA6uzIomhuQ68aCJECmp59g6XHyf1d+Egx72dxFBF9rn1r28C8ukUztW1X347/fbQisk7UAk0GcdLrBH2qhOQXFZQFX3Y7pcexYDOrgAGNbpec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757946613; c=relaxed/simple;
	bh=QuUnQ2YxKFYUsYfnLKUWhfqGr+eXJAhMTLSzCJ+a1eA=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=GXb6WoEbqpd4+bVybTvMV2PJao+qhXSTXd3OyyzPwdYZanFoGRgrgBifIZuWsnvseESc3J8PkzWWFROoz+GWnuSvhLpSi+xNrWOI6Rb2yTMBC/ev4TKljEWRxxEu9kkRdshhNxAmBW1PvdjfBW2aeeMEyb/ehMnL3XFZC36a7rM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ftE0dr9S; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ftE0dr9S"
Received: by smtp.kernel.org (Postfix)
	id 08BE2C4CEF7; Mon, 15 Sep 2025 14:30:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E75DFC4CEF1;
	Mon, 15 Sep 2025 14:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757946612;
	bh=QuUnQ2YxKFYUsYfnLKUWhfqGr+eXJAhMTLSzCJ+a1eA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ftE0dr9SYZIdBH4lCFWAL+u4ou+7NwocFHnJ16+th481qEmVFQIL7JhZohbTNCf8w
	 oV+L26LxR75c7pGJPI8YMcN25HYXNrL8EIblw30puDIXGcVKNwEdDhwlHZj1JHvDA1
	 T2jHi+dFRNo1BWLRfKVXmjhuV97JMEp/605AiZxB9sNgrbwB1qiDQqQ+CT947Q0DN7
	 OnD4N4V4L/+gzY9h/y/QjQFvzJ/BryTslrfgAP+wpZ4980FLmNUdstEcqEf1VSuPhD
	 4dAbXN3m3PvV+EZmFqa9qI0hjdoHlvrea5kQCiRGMvO0BFp+IqXTU288y4OoEpEVEW
	 XB7CefPsT1JIg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADDAD39D0C18;
	Mon, 15 Sep 2025 14:30:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/4] Broadcom defconfig-arm64 changes for 6.18
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <175794661448.4799.7453886837080118492.git-patchwork-notify@kernel.org>
Date: Mon, 15 Sep 2025 14:30:14 +0000
References: <20250910171910.666401-1-florian.fainelli@broadcom.com>
In-Reply-To: <20250910171910.666401-1-florian.fainelli@broadcom.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 10 Sep 2025 10:19:07 -0700 you wrote:
> The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:
> 
>   Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)
> 
> are available in the Git repository at:
> 
>   https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.18/defconfig-arm64
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/4] Broadcom defconfig-arm64 changes for 6.18
    (no matching commit)
  - [GIT,PULL,2/4] Broadcom devicetree changes for 6.18
    (no matching commit)
  - [GIT,PULL,3/4] Broadcom devicetree-arm64 changes for 6.18
    (no matching commit)
  - [GIT,PULL,4/4] Broadcom drivers changes for 6.18
    https://git.kernel.org/soc/soc/c/b609d7421725

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


