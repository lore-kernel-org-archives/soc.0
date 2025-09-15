Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9983430B53C
	for <soc@lists.linux.dev>; Mon, 15 Sep 2025 14:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757946614; cv=none; b=MATO3jfTKHiN8l5qNYboTSdsatNJ9SEwu+Jsx0LVCwMDGldvhpW4asmZ1D3CAhrz+V22R6zgtNLbeBULl9N8qbCga2G2PMkYD2MNqdtfrHrTO5/VN/lR0gkwKEutwKHviCOQc1jqJjsvhJ8q9ew6OFO81O4RgW0/++EnmxhcSEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757946614; c=relaxed/simple;
	bh=S1/iImjUofhapEHNoYlgsdGdwhmsp3E0lPIx/voGU58=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=heffr7+6YC1AyIwN5mfk6dSHsdXBtxk+fuT/bjIvdH6coasA59dgwV0c6ZL1cOb0pFKnkT0EzWX9KzgOvgxyQD08bkRJyecdQkZsu0o/CBlM88pPVjzfR+5UdTTw+mBHXIenzXA5zi+kZ+3f2jN2CVTOiwgSR6Iq3DDOQL1b0NI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X5FOjzJt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X5FOjzJt"
Received: by smtp.kernel.org (Postfix)
	id 882B9C4CEF7; Mon, 15 Sep 2025 14:30:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72B13C4CEF1;
	Mon, 15 Sep 2025 14:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757946614;
	bh=S1/iImjUofhapEHNoYlgsdGdwhmsp3E0lPIx/voGU58=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=X5FOjzJte6GY8Vz5ZY1or+634yN0b5Qe41CISd339WiduOgV9qAcNpaF5qZU407qD
	 FhSzqB2NeEdlgP046MzH1thZlqqyM+zWKiuIgdqVBq04O+LWD6yOke6cfdZIXzbR7h
	 LP4KDeCJ0qU5SLBMSqSkc7bv9GlEP0iusB0xZo8UO4qI8go5a2UYH0RmGAPxXw43Nf
	 nTKlhUu9hlW4fSvDNze7XvQv+VIxkBqyS6p7TWDnaYUUJ0Ta9j1vrMpoXvkNsuKlg6
	 Aud+WqTCtwlM7TzXAXC9n2mN9pUPIyoHX30RijLy9SicQUPhWUJ7ACYO6v4ATlsXTY
	 em1pCV82IhTXQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33C8439D0C18;
	Mon, 15 Sep 2025 14:30:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: microchip: SoC updates for 6.18 #1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <175794661573.4799.14042448148719764966.git-patchwork-notify@kernel.org>
Date: Mon, 15 Sep 2025 14:30:15 +0000
References: <20250915123548.13722-1-nicolas.ferre@microchip.com>
In-Reply-To: <20250915123548.13722-1-nicolas.ferre@microchip.com>
To: Nicolas Ferre <nicolas.ferre@microchip.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 15 Sep 2025 14:35:47 +0200 you wrote:
> From: Nicolas Ferre <nicolas.ferre@microchip.com>
> 
> Dear arm-soc maintainers,
> 
> Here are the SoC changes for 6.18 which set the Kconfig infrastrucutre for
> addition of the Microchip LAN969x SoC.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: microchip: SoC updates for 6.18 #1
    https://git.kernel.org/soc/soc/c/dc16fd9dd0b1

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


