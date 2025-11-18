Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06C353702EE
	for <soc@lists.linux.dev>; Tue, 18 Nov 2025 21:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763502642; cv=none; b=rK8wvk/l81Z9rynfslSZ286rSxxd3TZXwoEDwIut6snF1nWvn/xR0WHg7IkS0mA8g1HXYSqHazszqQe5SL7EoB6SyCQ9gM/jZWm2LOaS0JUBNZlldmF1IT8prOIIr3Y4Ce3ELsaOBfSV80c0kRkYi4vJvJIR/UCde1510sSfu4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763502642; c=relaxed/simple;
	bh=pvwY9FZJ9EfUE3NaIqqJsS2VShZC2xVW1ghnzcZvhvY=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=ox/W4pXuIU0EU6IVgVVpLUwqJCDkXjGVzYMGpPTjJ306Jjjp70eIP0NUgC9UCOVtYIm0rVbj3qCUeEodqSH0lR7KbF51E3W0MTJ8pDv5yKLABnjHR2eNkHoLCXf8z2IaDD9d+FpxkhYYBlT6Nb0VENBWQpeUl42SBIHF0SrN5dA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vMbIBevo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vMbIBevo"
Received: by smtp.kernel.org (Postfix)
	id 9BF56C2BCB0; Tue, 18 Nov 2025 21:50:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74E15C2BC86;
	Tue, 18 Nov 2025 21:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763502641;
	bh=pvwY9FZJ9EfUE3NaIqqJsS2VShZC2xVW1ghnzcZvhvY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=vMbIBevoCvDiR1j60aIJTAjlS3hVz80MN8nOEeBOKH/3DmjP7aZ+dL2L3Vy7/oP0Y
	 O+/075BeNuRmUCIbTeEf3wxpUj/sAJEc55ALkgvVxL5w5xf0NkShuwRi0KhQscN8+f
	 JIj76VoBEAMsCrTZ0xw8vpbCiZogR5zXUvafczR9MqhTjni1VX2aAL2khm3hJ+dYYd
	 P2Gj/+oqEBFbn+1sIJxuey+E0B+WqxLAysEaRtaRcFA8ox+lNwWgG/nDcYTxp/J3Mu
	 /7lrsxbYNIYASCX7CkTnLKFDlUkVPLRmrXcBGh9A4oaKeNUky18yuaYq7QbcOkZuMx
	 ZP+7lkN61Rq+g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70C0C380A949;
	Tue, 18 Nov 2025 21:50:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Rockchip dts fixes for 6.18 #1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <176350260726.116847.13791349161958969470.git-patchwork-notify@kernel.org>
Date: Tue, 18 Nov 2025 21:50:07 +0000
References: <1901272.VLH7GnMWUR@phil>
In-Reply-To: <1901272.VLH7GnMWUR@phil>
To: Heiko Stuebner <heiko@sntech.de>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 17 Nov 2025 23:18:32 +0100 you wrote:
> Hi SoC maintainers,
> 
> please find a below some Rockchip fixes for the current 6.18 release-cycle.
> 
> Please pull
> 
> Thanks
> Heiko
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Rockchip dts fixes for 6.18 #1
    https://git.kernel.org/soc/soc/c/c10519c8c886

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


