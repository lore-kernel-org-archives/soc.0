Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AAD53537FF
	for <soc@lists.linux.dev>; Fri,  2 Oct 2026 21:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790977819; cv=none; b=fwA/5hkjxDxZlNCw38QfAHD7hKEOXrZFlMHjIu6txmwAiBCfLczY3WS2dYOUih5BBaJNBAiDhv3+v8vTjIpetnNY4Z5h9t0EVp6BmdFdwDqCkBNjBJEu93J6Qp76tbTKHqsSA3ty8NnPBNuOPof7qo+gLY9xGpI93PTG8Un6lQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790977819; c=relaxed/simple;
	bh=mq8zfHsw4S6TqFFaemI/4UsVhTS4TaGFdJPPTm85WTU=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=Gsanq/+IA99ZK+7/XVrTTTGv6MH+6E11Q/8Zx1lPtYNeRUHCW0luaPSW7Q0caqzpOHqknbbuN9/5rJWjv5Ahg8iNm3rqg9+CzIbko/z/YhWUafpOrFbhphEITsTFjnlHrnHxAYe7fUGKkOE8SE4jVTxotnlHUxksVT7DQsvcfxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zq1csXoo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zq1csXoo"
Received: by smtp.kernel.org (Postfix)
	id 1CD1C1F0089A; Fri,  2 Oct 2026 21:50:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06BB01F00898;
	Fri,  2 Oct 2026 21:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790977818;
	bh=m6NZEV7RlVlameAEDvu3nNTDJJv/UfvfXuju8mpSjnQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=Zq1csXooEP2EL1ucgAlmdqqaHqHkW72Bf7VSRrs0epgJ/hD22BHEXFoVxg+ANupEb
	 Qp0vy+UbOMsVWjcYw8dKGRYCR8Ld0P1+tYVfk5jgPZQ9LtqUegy0dtCX598qZ8GdWs
	 SperyzePkWoTHqZFYFZ7fJBydjoA15lJF+tmS6a1Vnmh4nRQPeHQGC6KOhB5hX8eUE
	 MxLVJjh3LnYNBoliyPvO8vjA4PjmtwyV0hpIZfau0s9rY/MaBL7cSkezRbk+5aIgyj
	 konayrFCbVXcQxN0fehje0yhnzCjTxatrlOvH0TgeRHgDTJk5DiZSu78a5asIWr1yI
	 qpDhrlIu0OcrA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F13E53811A72;
	Fri,  2 Oct 2026 21:50:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] OP-TEE fixes for v7.3
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <179097781652.3602058.7462240270061367659.git-patchwork-notify@kernel.org>
Date: Fri, 02 Oct 2026 21:50:16 +0000
References: <20261002142443.GA778834@rayden>
In-Reply-To: <20261002142443.GA778834@rayden>
To: Jens Wiklander <jens.wiklander@oss.qualcomm.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 2 Oct 2026 16:24:43 +0200 you wrote:
> Hello soc maintainers,
> 
> Please pull these fixes for the OP-TEE driver in the TEE subsystem.
> 
> Thanks,
> Jens
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] OP-TEE fixes for v7.3
    https://git.kernel.org/soc/soc/c/e984d7bf4689

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


