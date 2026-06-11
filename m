Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C90A32863D
	for <soc@lists.linux.dev>; Thu, 11 Jun 2026 21:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781213412; cv=none; b=VFQv3z+nNre91XGFD4OXDgfWxkERoCH2PMGCd5TqeQl09eDYqkuhZM3oIG8k3V9Cn6ae87T2R/x9cAUZ213oA8yW2GP0Z6Rl5/eDnlskrMKBV0XW2f0MtfH7qVJOVfsdPZrSx0kn3VRd/8utPFwQOo+cnDECO+00sZoYfHmWYtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781213412; c=relaxed/simple;
	bh=zbdwZL2vRDQ5jtA+BAAxXOCiwuZnla3y0RVIZ7znDD4=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=l0qlxhirTJt7IsM/0WC+NM2xFjTNWaBsJJQAr8dba+INxibtLfx7oVYxW3qeH1Mi1kHIlISPabBoyErBoZciCWliBksNH4t+jJy3aCV0CqVO5/NgCcgyREva7TdCM1/laAFXD/ruRTpnztfPMnQgGh3yU8tcSTV9QO/cigLUP1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BUhVIG6z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BUhVIG6z"
Received: by smtp.kernel.org (Postfix)
	id B965F1F00A3A; Thu, 11 Jun 2026 21:30:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A240C1F000E9;
	Thu, 11 Jun 2026 21:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781213411;
	bh=gJIo4SYJ6H/FySUeC8PI4F9WxI+BJeKZ7eAMfdPxkjk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=BUhVIG6zJO40roiMZXb865ePf6q9ulXQnBcWsUoJU/GupNcffUjLqMNvd6VNg+IRf
	 3yc5FSS8oeLS52zwwK0dO+nkIcftCHM1d9I5Bs4YoOcGMemJo/3msX7m1wOO+IOtaf
	 23aqnHWrycuhMQv8beoqwoAydnMWq9U1+GW5RfhKGuHJIfMZ9Dxsx1ueiMruSD9ony
	 FK97K615jsX5KnBh3/gNL+xZwSUlbdlzq8OIrwvvMISG7uKNQef1IoFCNCPsNKr24K
	 tguqzbk5ff52Lcc/CCtyOHHKhBo9fMWpAdpaca5WSgQt+vqjuSV4DQiUYdlaXnae3W
	 ViJ/0NBNwVWbw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 199DF3930FAB;
	Thu, 11 Jun 2026 21:30:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Allwinner DT Changes for 7.2 - take 2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178121340863.373642.17105927846731364325.git-patchwork-notify@kernel.org>
Date: Thu, 11 Jun 2026 21:30:08 +0000
References: <airAH8n0YEtB3i2a@home.wens.tw>
In-Reply-To: <airAH8n0YEtB3i2a@home.wens.tw>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 11 Jun 2026 22:03:11 +0800 you wrote:
> The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:
> 
>   Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunxi-dt-for-7.2-2
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Allwinner DT Changes for 7.2 - take 2
    https://git.kernel.org/soc/soc/c/564edaca1486

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


