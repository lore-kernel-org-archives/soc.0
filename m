Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC7713612F1
	for <soc@lists.linux.dev>; Thu,  2 Apr 2026 22:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775169057; cv=none; b=Vs8HEVPCmjruVTFhxtNaRFgVtO9eOmWY7b3HurycqnPY04vD4Zd8hjQylHheCnsW2R3bwkzov1nmsec4x0AxRZa+hoDdVqiu7xRLVOjELfRs0tpUpvkBQimYbs/ef0BtvWUmpIlL6FW+OteiwyWNfEIuNvghgC2nvCuRvFKQL+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775169057; c=relaxed/simple;
	bh=/7h5PhZdUZ+Us5vfdl2iRIfGz5fPgSFy4HIiZM9MUes=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=N6yJhsirj1Gombu9bgrLu5OF9QsmcIEZjoWqgyEguUk7vJK9F/dEbRXnC1lxv6v6SeqAOM995vqDDNTNofiThJr74OyqvxwT4AHwRBtBrisOSxjtukoGN6ycyHBO5wuum9ZyN9Vm5neOfGbGVojH+ibdX7G/wagmvnQMwF5eo2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iy6miQIZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iy6miQIZ"
Received: by smtp.kernel.org (Postfix)
	id 7A922C2BCAF; Thu,  2 Apr 2026 22:30:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65497C116C6;
	Thu,  2 Apr 2026 22:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775169057;
	bh=/7h5PhZdUZ+Us5vfdl2iRIfGz5fPgSFy4HIiZM9MUes=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=iy6miQIZFmLoP1dqPFqQtxjkmLAR8WnbvPUuNt27ugFyOsyrTNyqVEXiryyq8GlSx
	 iGCuT0bCScS45jQU/KRs8/WAmyiCGHBI8TgGHsuN7h2gSfZVvmEn2AI0hxWDMoIoFy
	 VN+4/dY1ggdQppvsgscyaCYPkzGiD8TiRuIm1QXjYTOcm2K5riWR3m0rAndd4Uvn8S
	 ZS+LBNzzRYMyLfQMxA4bChvoWZNMGNBNhFuxBN3g+nYukhm3sg6M1iiu7uRoIMJOE7
	 zrfWHBWiVm+yw+Yk7ojDqTSPfrYStx7Ku5zp5ViDRGh4HWM7idyZ78B7W4Tl4Ripl8
	 wkRwwcBeUz3Cw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id BA1423809A09;
	Thu,  2 Apr 2026 22:30:40 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/2] arm64: dts: ti: K3 updates for v7.1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <177516903953.642994.1821619939245194336.git-patchwork-notify@kernel.org>
Date: Thu, 02 Apr 2026 22:30:39 +0000
References: <e724f95d-09d0-4ede-9ed4-0ce782d81058@ti.com>
In-Reply-To: <e724f95d-09d0-4ede-9ed4-0ce782d81058@ti.com>
To: Vignesh Raghavendra <vigneshr@ti.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 1 Apr 2026 22:44:03 +0530 you wrote:
> Hi ARM SoC maintainers
> 
> Please pull DT updates for K3 Platforms for v7.1.
> Note there is a patch touching embedded-controller/kontron,sl28cpld.yaml as it is part of
> series that removes of Kontron SMARC-sAM67 board support.
> 
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/2] arm64: dts: ti: K3 updates for v7.1
    https://git.kernel.org/soc/soc/c/44b5179e0924
  - [GIT,PULL,2/2] arm64: defconfig: TI K3 updates for v7.1
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


