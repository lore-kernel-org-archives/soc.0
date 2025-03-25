Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39010A93D
	for <soc@lists.linux.dev>; Tue, 25 Mar 2025 06:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742884798; cv=none; b=S9dT8Q86QhyaOeg9RvSYMZJX85WLvojT29frVGeLDe0TU9PXsyLbIY5s5V25CQj2x9kIml905NjVe242ay6azbzD6QcV02SR1MQzrnbwaUbcykl3cwXgODV/FOsx7hArfsm6wykv08bqq9+IZ/cGgBvosOqfvCaFTDOWTcTl12Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742884798; c=relaxed/simple;
	bh=Bc8CRbIbQLE1lG+MUbsOgj/sCTJzDozvAlJLpVj5gAk=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=uYDRPoLImu9hEEsZQrBB7ejC9h/4SmgD2ExkasjRuR1dJmvcJ5i+QPj/kePjWB8F1iHH6HO4oddapvBdoWxY3EQF1f5bbFid8fG2IMKIyIC78B9CNpAH3O9RH150SbE1tgDWaKEIVFbwjGZDx/z0QEf5U9Sw8naCcscoXqgNSdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q9wviOnW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q9wviOnW"
Received: by smtp.kernel.org (Postfix)
	id D0A40C4CEED; Tue, 25 Mar 2025 06:39:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B948FC4CEE8;
	Tue, 25 Mar 2025 06:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742884797;
	bh=Bc8CRbIbQLE1lG+MUbsOgj/sCTJzDozvAlJLpVj5gAk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Q9wviOnWIX5zksHIbW1UUnq0ei4DQU09+g0ht+P4nxW3MZ6mf4mWQJdjZ8Zxmsp92
	 KP751dbOvi1rDJGJkJWXUIYWUgML8JcloB2622KG9W6Ws/p+Jyl9z66SmjXgHGJKt+
	 j95iBkqS8RmR21K5rP1iksfKYxwjCpEbGSCLZY9BkP2Z+kl6lJVyKKMI+tXGBxlVwN
	 3rxWIlpdfDW2nyjPcMhignJmO3Mo52oAO4ErZ8BS9InYw6tSne3u9fHRRyP06ZbWN8
	 rIvbIFwlI3WxUUshq3IW8aXnqlgqJRa0fhd+oC2kTh0by2jEvyw40eug9zvatXOJ28
	 3BSJW1q1VgjGw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33E0B380DBCD;
	Tue, 25 Mar 2025 06:40:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] SOC FSL for 6.15
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <174288483403.118982.6032800020167945000.git-patchwork-notify@kernel.org>
Date: Tue, 25 Mar 2025 06:40:34 +0000
References: <2dea9d3d-ef48-4799-b3cb-df4658ae6e29@csgroup.eu>
In-Reply-To: <2dea9d3d-ef48-4799-b3cb-df4658ae6e29@csgroup.eu>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 21 Mar 2025 12:11:01 +0100 you wrote:
> Hi Arnd,
> 
> Please pull the following Freescale Soc Drivers changes for 6.15
> 
> Thanks
> Christophe
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] SOC FSL for 6.15
    https://git.kernel.org/soc/soc/c/cf2ae5e5b68b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


