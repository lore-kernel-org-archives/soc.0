Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 792AB22A4D5
	for <soc@lists.linux.dev>; Fri, 12 Sep 2025 16:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757693415; cv=none; b=dmt5qlykVlJkrR+BO+3ImFxQRi0t1ZpleTRu7OAuKW8RuByOiyppc0lJNuo7uP4Zy1xdCEM+x69lurBaJSkJfeusBs5IKoSoLUGTO1qfreNGHGeUwn+g7q/yChSGCyJGxPw7ilUq5+8uQzOpR9FcotyRSrzSY93Awbq+nsufaAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757693415; c=relaxed/simple;
	bh=rX+P2K85cphh3nVSNzNSYLAGp70Axmdc7dDytfkBTh0=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=P5a98DaQLOaXYMPus1EjvAiqDVufTY58KFKjGShAqGd3KzQ2kzd5aOvw3WO6S+fZqCUR5VAVS6K3birR7+O+Zyy+fMYrDexXSL4aWl0f8/HgBoY2ukKg46HelxdL+LKX/bAZ3HWQyOufJuLuUJc7kU6pB5C54Qz0KcxiQ6cPe14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mmzBrAe9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mmzBrAe9"
Received: by smtp.kernel.org (Postfix)
	id 29336C4CEF4; Fri, 12 Sep 2025 16:10:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1430CC4CEF1;
	Fri, 12 Sep 2025 16:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757693415;
	bh=rX+P2K85cphh3nVSNzNSYLAGp70Axmdc7dDytfkBTh0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=mmzBrAe9YzealJnWME4ZWJgEYtECKuHu7eGoMpeulsH3/22KUa3xaBS4MGdFrSzJY
	 OvnmsaxpaBGI1CzPxGhPj8oN3Dseb9BHDvy3P+9KDfMJ8rwW3rlVfrPGCGV6B7leRe
	 oCoeGZhrSSkq6a879IRfxMadejlU7tPRKXc5WQRKv9kv1Mq2aGJKm5+oX1TrIG1QPO
	 9NtDpXfhjxnC5m9w7C9SNEV6kwwiJfx/5a2guDAPrRut6mCuX0RznhDVBu3fkLKQ2S
	 TRH0elDhiqrh53NpWVsl3HCTON1Pb4il9QirpesxYJNdhhUpuL9jmPvILzrKWgWkg0
	 Vgl9rqgHO3ZFQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE21B383BF4E;
	Fri, 12 Sep 2025 16:10:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: at91: fixes for 6.17
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <175769341724.2998972.12224883812706453099.git-patchwork-notify@kernel.org>
Date: Fri, 12 Sep 2025 16:10:17 +0000
References: <20250903173403.113604-1-nicolas.ferre@microchip.com>
In-Reply-To: <20250903173403.113604-1-nicolas.ferre@microchip.com>
To: Nicolas Ferre <nicolas.ferre@microchip.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 3 Sep 2025 19:33:55 +0200 you wrote:
> From: Nicolas Ferre <nicolas.ferre@microchip.com>
> 
> Dear arm-soc maintainers,
> 
> Here are the fixes for 6.17. The addition of the Kconfig symbol is taken from a
> bigger series by Robert here:
> https://lore.kernel.org/linux-arm-kernel/20250813174720.540015-1-robert.marko@sartura.hr/
> It is needed because one patch of this series was taken before that symbols were
> defined properly (queued for 6.18). You can read the discussion here:
> https://lore.kernel.org/all/bac5390f-725a-43db-a2b6-17a68d0d733c@tuxon.dev/
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: at91: fixes for 6.17
    https://git.kernel.org/soc/soc/c/875691ceb8bd

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


