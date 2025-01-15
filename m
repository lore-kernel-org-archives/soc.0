Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D54B912B169
	for <soc@lists.linux.dev>; Wed, 15 Jan 2025 17:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736961069; cv=none; b=bFzr0fWAhw0YT3BIOqXUk/Aayd4gns1bgicQNxkPLepAI2tGoEga9coEcgenMfZw3hw/3QiKPThVA5v+cN/YmLzXbaF1BVlTJdQkwVVIM0/VRMeS60nYIgO3gBa7CA9r2lKTWkz5l4h+4P2iYaG2UjG6Iq0d5B/GhmxepySt2Qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736961069; c=relaxed/simple;
	bh=I6lyTnUuM9xVyBc2Du74BMS4pKSush0+pcDRw7UOm94=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=WwZjNf1RtkOHICc4VS2FD5iRWmvxkaD+dTKyzM+vFT+J/Dzqo8Q89hDIsF8O99sq9PDhOaNkH3ZMJZavGsKW+BklBA0ri+qE+8VhBg1h3KfjGBlRW8LSJ+y1t0muKrihIveGFOBHEpFeWwHZ3q4bOIOgkoe1D0W5/BxEZdmIwJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vQ4N+EBP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vQ4N+EBP"
Received: by smtp.kernel.org (Postfix)
	id 67F89C4CEDF; Wed, 15 Jan 2025 17:11:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51D70C4CED1;
	Wed, 15 Jan 2025 17:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736961068;
	bh=I6lyTnUuM9xVyBc2Du74BMS4pKSush0+pcDRw7UOm94=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=vQ4N+EBPH24xfjYABJ5/VmaRLMP9RVgZRsFzpT1XdzYrwyQsBlLLi/+O3LT4E8M5n
	 HRW/AGzJo/24Mr4T7NJq161F+I6nMvjT0lMOTUjTQv5p4w9t7jYB2qZZ0p8o5wD3s6
	 xH+iwXozR+t5icGYmzm03RuR3YnGYGsu7e/RTP66En8WHSqtCnz8vng/JEHhcZt8uL
	 +XbpcPRaXAK8Ml3BX61AUKBgq7MJ8+I9afgzcRLFim0uG68lqJl1AaDsIEpICquRGk
	 8BzIMoxfhzvSEU/Kk4WC2VF3ygAaUhD8OgrwpI8SysLXKZaH4Dhqz2l7R0cvIfDvGk
	 MZC1s8JE0AZkg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70C63380AA5F;
	Wed, 15 Jan 2025 17:11:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Reset controller fixes for v6.13
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <173696109100.809051.18287241482811013027.git-patchwork-notify@kernel.org>
Date: Wed, 15 Jan 2025 17:11:31 +0000
References: <20250115165404.1269500-1-p.zabel@pengutronix.de>
In-Reply-To: <20250115165404.1269500-1-p.zabel@pengutronix.de>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 15 Jan 2025 17:54:04 +0100 you wrote:
> Dear arm-soc maintainers,
> 
> The following changes since commit 5ae1a43486fb3febd5ce78da13eb354f16d049e0:
> 
>   clk: amlogic: axg-audio: revert reset implementation (2024-12-02 17:21:03 -0800)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Reset controller fixes for v6.13
    https://git.kernel.org/soc/soc/c/bc6a958d76f2

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


