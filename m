Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 110F019F110
	for <soc@lists.linux.dev>; Fri, 11 Oct 2024 10:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728644373; cv=none; b=ZfLE2ikM2w0WguoO2ymQREclXpaMDngKvBn7VpL1fGAWDTd+opCjWOWnYO2JDJqAXaCPv7MxwzLiO+JLSkEYhtn7lwiFiwSvGlJTBafn+XyVJ6LF10q4vRTUrorJsIkLr0v3j3c2ctAxu9olv0KVuQOVXN3EBnkayjk1QZowUSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728644373; c=relaxed/simple;
	bh=PxhA63y/01Mj9FDMFrCrBlBf0jTw+OcbiYpYmcYAa3o=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=E8uUvQ6h70DgOOuYaSaGvGJuGTz6BqbbefajxYkFf691Gm/9GZtJpwMYc1EvpYsBwJVnGfJjfj2FyDLYKpJtdCF6tGpCg7dBzujjlYNzQp3yXZM73eo4AgjM9GKHx/i00EP+2xlbiAZYaLzvlKL9SWSHu1jRM8jE0cTjyduliAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=diWZNOhi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="diWZNOhi"
Received: by smtp.kernel.org (Postfix)
	id 07541C4CECC; Fri, 11 Oct 2024 10:59:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6302C4CEC3;
	Fri, 11 Oct 2024 10:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728644372;
	bh=PxhA63y/01Mj9FDMFrCrBlBf0jTw+OcbiYpYmcYAa3o=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=diWZNOhiSIdZSqVVWNLHpXUQdx/MV9UhfSXW5Vno4VW1DaSrGshNDHZwihoGGVeeS
	 4Nd3/Uudmc/4EStI9bn3Y5fcaHfIFyEfE0bo+gU2bNlqpm6RCk7I4MEBBosgFhcHah
	 D/pWdLxKzg9nNYQqoa0aOQdQ3EjXo3BCAr6kYS+Os9jlmhHE39y081J034noJJ3XBm
	 I+Yyp27j1oyLhaLCpkMU+BG2Ip5jENhMtVmycGJn2ww0/3y1QyiabtxBvuS8f/ogED
	 s2sFailbn6b4e6tD+6aOfFmwCPfhOplEGZCCdALNWe8mXwa5Xjb5S+M6h3qm02EU5z
	 JkTb3t9E+xNig==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE00F3822E4C;
	Fri, 11 Oct 2024 10:59:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Microchip AT91 defconfig updates for v6.12
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <172864437725.2676212.15256511668888591295.git-patchwork-notify@kernel.org>
Date: Fri, 11 Oct 2024 10:59:37 +0000
References: <20240901133110.2038675-1-claudiu.beznea@tuxon.dev>
In-Reply-To: <20240901133110.2038675-1-claudiu.beznea@tuxon.dev>
To: claudiu beznea <claudiu.beznea@tuxon.dev>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Sun,  1 Sep 2024 16:31:08 +0300 you wrote:
> The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b:
> 
>   Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-defconfig-6.12
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Microchip AT91 defconfig updates for v6.12
    https://git.kernel.org/soc/soc/c/636348dd90e4

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


