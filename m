Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6721A2BD58E
	for <soc@lists.linux.dev>; Wed, 21 May 2025 21:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747863013; cv=none; b=hJn6BcNRvzmuZmamRNxgmST+3cl7+pyNzrMCz1HmcnXJH9GmTfdo83fBfkHK3jCygdxWVTgZ8jlcTTMsZVVMP+rwA5f/N3YZm8z8aSubl1pORisrdOP8mcDt3n+PqDRFszYyWQl6XB5CaarOEVlNVX/lmR7ij5m1/Or9BY4nflo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747863013; c=relaxed/simple;
	bh=05bu86KcZUAUDqS14aiODLQA851NX5HZEDcdJE3rMow=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=XH3NbblQrirJNPCytAMUWZ3DfNyz792pkNdxO/SDqPF7XO5G7qLXe96kRbymMVkPeKI5LJqqDsErdXFbHb7Hht09+75zSiuQGx1tz4vSkelxCeYlh99MeMvsJ9qAbFzg+OgVPQkK4De5Q5QasjmZ6F/+VCthDp6oAfcwXSIfsSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hG/s48HO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hG/s48HO"
Received: by smtp.kernel.org (Postfix)
	id ED434C4CEEB; Wed, 21 May 2025 21:30:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF64CC4CEE4;
	Wed, 21 May 2025 21:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747863012;
	bh=05bu86KcZUAUDqS14aiODLQA851NX5HZEDcdJE3rMow=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=hG/s48HOwmOOw8zReXO+7tuMOoLF6z/vYMb3OTKOMr/WJY70cGfh2LtshTLCnJ3Cz
	 TXoRLDbVd99SEQFgZg7ghOSCyBYJwd/Fo3lj6cqelqiTTflPDx5XOc5LbkAfkYEomZ
	 dhca1FGPP1LVmNaS2+e0MEedxlO2KkZTPWR5ltM3dLzTxI90zEtzwnSJcWmw8oqh4u
	 fIEpZdLp3SZjPzM0h2PtSFKciet2DX07A69JLju7MjrpGAQEf3xrlpQLpQgXuasV6r
	 Mhf9qyYp/PfZZd+iR83qyuZYv9ixEtjvTVMd5g6xnWek6sJ8fLnixQMxlsuFoPsWlE
	 nXbbAvEm+bMMw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE5F3380CEEF;
	Wed, 21 May 2025 21:30:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 0/3] soc: aspeed: Minor fixes for v6.16
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <174786304849.2284637.13890263784112089280.git-patchwork-notify@kernel.org>
Date: Wed, 21 May 2025 21:30:48 +0000
References: <20250515-aspeed-drivers-6-16-v1-0-eb467f6b7a7c@codeconstruct.com.au>
In-Reply-To: <20250515-aspeed-drivers-6-16-v1-0-eb467f6b7a7c@codeconstruct.com.au>
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 15 May 2025 16:00:41 +0930 you wrote:
> Hello SoC maintainers,
> 
> This is a small series of small ASPEED SoC driver fixes for v6.16 that I
> didn't think warranted a PR, however let us know if you'd rather a PR
> instead.
> 
> They've had exposure in next via Joel's for-next branch and have
> otherwise been around for some time.
> 
> [...]

Here is the summary with links:
  - [1/3] ARM: aspeed: Don't select SRAM
    https://git.kernel.org/soc/soc/c/e4f59f873c3f
  - [2/3] soc: aspeed: lpc: Fix impossible judgment condition
    https://git.kernel.org/soc/soc/c/d9f0a97e859b
  - [3/3] soc: aspeed: Add NULL check in aspeed_lpc_enable_snoop()
    https://git.kernel.org/soc/soc/c/f1706e0e1a74

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


