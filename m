Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EBED38B7BA
	for <soc@lists.linux.dev>; Wed,  1 Apr 2026 21:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775080224; cv=none; b=IsGjMESmYRnBhQvlq8DOyDGUjenJA9ZsPHQy7lw/vybn2iwsxGVj4IH3vuSjPrFH6gihb3kSyV0nFIV4D7Q9V2kJMxPMljaPDU8WedApHRSX4wHPt1bVbYOkgTbDsQpv4N6kha8UnlbXYJ4wuQVzkTsuALLZ05kPKcAHCA74T+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775080224; c=relaxed/simple;
	bh=D6riTARym5ZDDcH9hk5VYLCnimMC25B7NJ/ihI4uwKY=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=b6qxHjmPqYoQn4YxWGgCtvoSuQTmn97HQiahCWxqYjfkUpBU6UN+S/8OatdYbz0kYtUuSkFqZoQcSix+6qgbPW00pkrOaU/sjgqdivVmOwmzf3bQNGcRE64Aqk0GV8VwwHZYb1v6UX70Oy38qGTOxWy7WDXI7+vUbR91A9pa0a0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qpdz4MDH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qpdz4MDH"
Received: by smtp.kernel.org (Postfix)
	id 55A1FC116C6; Wed,  1 Apr 2026 21:50:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39B69C4CEF7;
	Wed,  1 Apr 2026 21:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775080224;
	bh=D6riTARym5ZDDcH9hk5VYLCnimMC25B7NJ/ihI4uwKY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Qpdz4MDH9WAVvOKexCtwlcy1ougio3RapLy48ovOQ3puRqSnKmc4XIKf1hK9v+Vw5
	 WLCDk1wHUbXA84lBabvEAd3QSVn57tbRHEL5My4NO4gFRGbh6sCe94jltZo1YgnjDG
	 3IzbImktdy7KH4iqMbEgwuZcdbwlNOZhpfcfjfxaPbCQwRqAsL5A4i21cSEoBXzgHn
	 9gB8/5ztiWsXaJDmU2lPU/5100mxxhmPL0+6lpVwYfTNImhBhUToTnTATYVHpLDdsX
	 diBDdGW5u0xeoj7/QUB3rfk+aU7xBbI6jLrIOjDSWrVbhgf6tALtoZMNal3nZF9iI6
	 bdJVAal1fZwwA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3FF8C3808203;
	Wed,  1 Apr 2026 21:50:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Renesas SoC fixes for v7.0 (take two)
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <177508020703.3876275.11112352801858439941.git-patchwork-notify@kernel.org>
Date: Wed, 01 Apr 2026 21:50:07 +0000
References: <cover.1774606482.git.geert+renesas@glider.be>
In-Reply-To: <cover.1774606482.git.geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Sat, 28 Mar 2026 13:10:48 +0100 you wrote:
> Hi SoC folks,
> 
> The following changes since commit 85c2601e2c2feb60980c7ca23de28c49472f61f1:
> 
>   arm64: dts: renesas: r8a78000: Fix out-of-range SPI interrupt numbers (2026-03-06 13:15:21 +0100)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Renesas SoC fixes for v7.0 (take two)
    https://git.kernel.org/soc/soc/c/b09719b9b067

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


