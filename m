Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 611843E49CB
	for <soc@lists.linux.dev>; Thu, 15 Oct 2026 03:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792033830; cv=none; b=l9u4D3Kqz31W4WnR71l4S91a2XXD63km1dW+IO15NnSDLlah3LZeEGyqUPBnc6n5SfuqGaFt9heRuC/8EvCyGIt10hgYVOBfaDhavJdq7lPyGzvYAB25IYFCZKymG3hMDwVV7Ho3NjBGGCDHWOhqLzZzochklF92JQ6fofHvp4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792033830; c=relaxed/simple;
	bh=Y97kPcEGvTl3yWjKO0b088aJIwCG+yc8R/fSUL38AM8=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=SxFJIEs6x1GzX4TYAwHCioYmCXvj4Q0jcy5QQv/z5LYDUwyIOVAO9UrlIRyX9ZJI/F7qXQ8a7K1ewJTm2Pq5FOascLYAdj1Bwwt0Gz/4g8BS/b2uJ5dKnd1cvXbOnHi0A9cho0CJh1suBmP/IGlcoW/nuaGF3sNuH/ddpLL7NMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fnj9kL7O; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fnj9kL7O"
Received: by smtp.kernel.org (Postfix)
	id 979441F000C5; Thu, 15 Oct 2026 03:10:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81D3B1F000C4;
	Thu, 15 Oct 2026 03:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792033825;
	bh=7rxMv7io7GIQOogWFe9PeoaDfY5qm5lkuAMWUhTB6IQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=Fnj9kL7OMG+c/qg+S6D+UTu9biEtuiwwCCNaeeFVUaehgq+UJlVsqL2h6VJWnbG2u
	 DbacN5kGT47i4WiqTurANSiVGUr65ru292TwuqXoMLeG9+sp/RoOio07yrEaJPFhYM
	 X585tbPDO+u/K/C4lj47b9oJG+Irv4LxFH8VG80N2SgdS6GOGuHnsAIGjeYD1SZ6LX
	 4duF6d9igbkpRbl/f0is/WOF1sjn6MUK6zhcD+dQLenWCRvhDZST/B0+hZMZCq4Co/
	 Aplnf0sQ/lKf630V0eS7WI1pCE9oxFEIyLT42gq3YpMWATYzu8H+/AJgf2uDrTb+YO
	 BBOUJ4dyS2JdQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7743C392E992;
	Thu, 15 Oct 2026 03:10:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Rockchip dts64 changes for 7.4 #2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <179203382401.3155468.16646868214242984802.git-patchwork-notify@kernel.org>
Date: Thu, 15 Oct 2026 03:10:24 +0000
References: <2088481.8hb0ThOEGa@phil>
In-Reply-To: <2088481.8hb0ThOEGa@phil>
To: Heiko Stuebner <heiko@sntech.de>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Alexandre Belloni <alexandre.belloni@bootlin.com>:

On Sun, 04 Oct 2026 23:46:55 +0200 you wrote:
> Hi soc maintainers,
> 
> please find below some more Rockchip dt changes for arm64
> for the next merge window.
> 
> Please pull
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Rockchip dts64 changes for 7.4 #2
    https://git.kernel.org/soc/soc/c/0d941f7b2a14

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


