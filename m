Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28F8C7262D
	for <soc@lists.linux.dev>; Wed, 30 Jul 2025 06:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753858640; cv=none; b=Q4DzSUWkWtdFZbnuj6Ym1sqmYpcQGTu4ORbDpPI82/q0qSr4R6rqzSGZdnCs4y0d2eHa6om0UWzowKTJo2QvpZu745MSdnuTLYyaIaPJE3eLo7VzFrt39ys1ZxC6BIzEHfWYlY8VL+wJlimK5f6ZMSrJOVWOps+yjNXvpYADAmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753858640; c=relaxed/simple;
	bh=A9Xx4HcdOv5L6WOek+tjRO9k58cftcS41//QFQ8wGGo=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=pX1DxPA3nJZIROwprP28nAIbL7NdeGOifeszNatGiSQQT0TgqTQgxEU0egGDSKE5oqwguPIHEc1WL/5QswBLS39CC/dgYgKEoZGSS6KdOJr+sfDNO3pN9RLVbG3X9QMeRyul53lLn20J6KO3n/L/QfXIkukym0wgGKREhXKuqbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JbujeLjb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JbujeLjb"
Received: by smtp.kernel.org (Postfix)
	id A912CC4CEF6; Wed, 30 Jul 2025 06:57:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 939BDC4CEF9;
	Wed, 30 Jul 2025 06:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753858637;
	bh=A9Xx4HcdOv5L6WOek+tjRO9k58cftcS41//QFQ8wGGo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=JbujeLjbzohYToL5Z0oRHlv/Xc4ocaVNboaC6bkbLePhYrk4Yjf/X/1r1I7RXmA4w
	 7DEnHiK+baRg88Ii3Z4S2+q2tXJPlhBrK3f1ILGiuY0fAmcfKAXSS6uHq1oQ4kIAxR
	 //PwfnPYXM8gNOxZlgDCIIHsPvlw5X8ywIVyUAKyZ4I+iJeH1mch7/KOudzPlIdVHM
	 ogh7TbWJ9FzpVkVS4eog8tS7STL88rc/TGGGGlKy10Q4o1Cux56QDfe7H+jQKEf4Ln
	 cOO6aAN5f/V3d4Jho4OaHmE+kuOppbK46myhi07ZwED7j0KHNf0iZjUL2Ed7Kq4dRk
	 xEJbEZPogCYLw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAC3A383BF5F;
	Wed, 30 Jul 2025 06:57:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Qualcomm Arm32 DeviceTree updates for v6.17
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <175385865374.1808741.7519201648744265202.git-patchwork-notify@kernel.org>
Date: Wed, 30 Jul 2025 06:57:33 +0000
References: <20250715021838.14751-1-andersson@kernel.org>
In-Reply-To: <20250715021838.14751-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 14 Jul 2025 21:18:37 -0500 you wrote:
> The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:
> 
>   Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm32-for-6.17
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Qualcomm Arm32 DeviceTree updates for v6.17
    https://git.kernel.org/soc/soc/c/7824d9e7f9bc

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


