Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C97C7396B7D
	for <soc@lists.linux.dev>; Thu, 15 Jan 2026 17:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768496763; cv=none; b=Ghb+AvYretuuVjk5tSivP2de7XmzsDILneQH3ldY0yBUAyIkuITGRNMPQcuR0iFRrT+2/z/vplmEXyHmmJP/u6ziyp1flJBD0oUnrk/sH0chbouYUAluKBFvRqE7OODU0WVo7QbHU+2h2Q8Uvp4UBLHnPiBQdhtBtuN2f+oZtZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768496763; c=relaxed/simple;
	bh=IMQ16Rvf9IUFNImGP5dXATs3bj7KFmSFJOkPbsVzUf0=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=WCCFnXCe2FUY7Vm6d7N9pWWw+mW/BolzhNLaYVQRpGIbsIXsu/5iOSuQ45RTCw3aOSxXv/wXgYeiTJXqxogbLB8xClusnpN9sxYDsUrMdeoYhNq9Gzf6s2tKa8RfbAO4qeVxDAc9f2zFEpMfcnO6e1y/mo0xwSvveF0JqTiuHhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TsQi32Nw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TsQi32Nw"
Received: by smtp.kernel.org (Postfix)
	id B46D1C19422; Thu, 15 Jan 2026 17:06:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F253C116D0;
	Thu, 15 Jan 2026 17:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768496763;
	bh=IMQ16Rvf9IUFNImGP5dXATs3bj7KFmSFJOkPbsVzUf0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=TsQi32Nw1ATF/Dyx3OfBZKtMHo2GtdaJWT8HN3/dSjyF8G0L81iiqZ3cpJ57e8H//
	 dZvWIJEkf5yuQQ4nKuB/VdHb/CDUgB94VB//aSfEj34pFVyHSd3X5T/YiKsQFBv2LD
	 goGCjoZYXeYnqnZP7FR5NjmyI5v0GHcmXUVObxYO+2Ql//+4s60miqCAkeYwPfxc2X
	 JzbNU7Otbbm5BJaTmRr0zJBwkPrWIhbTa5jHAiZc53siUdDl5yHMgXEuxk659LduO2
	 qymQvu6StihImxQq2nmyxdfE5SZfJqgavSyI6w35VonCds50Tl817SSdI3u0yaF1p5
	 kTRHzsTtN1kHw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F2A0D380A966;
	Thu, 15 Jan 2026 17:02:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Microchip AT91 fixes for v6.19
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <176849655552.4073327.6302058439702251360.git-patchwork-notify@kernel.org>
Date: Thu, 15 Jan 2026 17:02:35 +0000
References: <20260114104207.2033174-1-claudiu.beznea@tuxon.dev>
In-Reply-To: <20260114104207.2033174-1-claudiu.beznea@tuxon.dev>
To: claudiu beznea <claudiu.beznea@tuxon.dev>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 14 Jan 2026 12:42:07 +0200 you wrote:
> The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:
> 
>   Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-fixes-6.19
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Microchip AT91 fixes for v6.19
    https://git.kernel.org/soc/soc/c/1902e2eae5ce

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


