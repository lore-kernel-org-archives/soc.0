Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E8151E3DC7
	for <soc@lists.linux.dev>; Fri, 11 Oct 2024 10:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728644357; cv=none; b=gm+uPdQuH2nFGTdFydtJqMCC/Lf5SpUoq13vvFxi1pOI9r+dsNYrLFhBnEhQpirmAEk44U8ngkRnDdjKKKUEYsZKKI2x+zqnHktSQoEIOXOpJ6xwKtEXL48+GjCucbHs6QAA5BlXo7+Plnxkk6qqpWt93BkDujYcsdXMW/iebrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728644357; c=relaxed/simple;
	bh=SSCCJL9K6guDsbbkWTW79XPprJk45yg7Nv0i1oq8K5I=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=OO73GOZv/jGJWRk0eVOtcrCdgbsxfX79aIKwldVCD4EWLUSdjftl4INCo0f8/hH9io8+3rQkjWEL49HjPu+vbFd7Fj32+1nAV3tUwOXZHkE0v2Lvs3B9vFY3vtp0Gpj/YftXT55L+gb2JkkPDAIXf6Hw3pbvhGQ6Qc8tzfAXHYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jo6fSmBV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jo6fSmBV"
Received: by smtp.kernel.org (Postfix)
	id 4AFCDC4CED0; Fri, 11 Oct 2024 10:59:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35B49C4CECD;
	Fri, 11 Oct 2024 10:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728644356;
	bh=SSCCJL9K6guDsbbkWTW79XPprJk45yg7Nv0i1oq8K5I=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Jo6fSmBVEU9RDpYAX4xzOaJCCavQ2+Wa4cI7zKdqFuCx88pHOavtWIOuzB11mQUIu
	 GFfm7yT3TXuFVdHwEvMEp49QmiqSQOyHnSq9UCKIgc99+qV7YtvMRsl7sMjGseg7gf
	 Sy0jm9kDY1A1qYJlh8OmOMME448YhxmHaEc1soygtwrYGSsyiznVhnlkWVeqUYtq+6
	 8dUQWcn8nTgLWzrkAJvSQYDmuXHBSkJ9HH7TgsMBuWsbEaEf5tVCuYu1vULS7GeP9Y
	 zI0gNmx/IB/hkA5SqtKYI6xg7FXbPdjzcrJ0zSDyH9ABCnUpx0oGOgLgpuWl0EB4sj
	 YanY/4pkWhO6Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB2063822E4C;
	Fri, 11 Oct 2024 10:59:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Microchip AT91 device tree updates for v6.12
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <172864436049.2676212.13567986328079894870.git-patchwork-notify@kernel.org>
Date: Fri, 11 Oct 2024 10:59:20 +0000
References: <20240901133110.2038675-2-claudiu.beznea@tuxon.dev>
In-Reply-To: <20240901133110.2038675-2-claudiu.beznea@tuxon.dev>
To: claudiu beznea <claudiu.beznea@tuxon.dev>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Sun,  1 Sep 2024 16:31:09 +0300 you wrote:
> The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b:
> 
>   Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-dt-6.12
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Microchip AT91 device tree updates for v6.12
    https://git.kernel.org/soc/soc/c/a86f3dc85fd5

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


