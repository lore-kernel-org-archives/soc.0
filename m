Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 009F81D8A0D
	for <soc@lists.linux.dev>; Thu, 16 Jan 2025 16:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737043301; cv=none; b=ZR9tPoB1zvGm25bWeWRJ54k+nwuxv1ycFjOxIBDnYLS6t8Cl6RQYEZC3jVCZUoIxoBTC3tTTD8VZnWrI1zPikZ1C3Y0xPbDqDIcKWqZyLJ0UPMZS8SjJpZSsb0M7A1bmnsPxVMuOUY0XnyafV7N599H1JaYI4DUy3G9to0Ygj2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737043301; c=relaxed/simple;
	bh=ytKaRMK0xKujgaplnSAhSRCtcKiJzVQCd2gF+Id7MOE=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=l+FH0FblgpKllAqgUNPzs+Sp2TvW1v6meaLwC5+Jt3NwVA6hRBwUJHHhWR7VPobAjBto/3PId11oKBlKSr7M+EKg73W32Pfv5pYEUeqyPJxeQE1+i3DkQkDOFGsv5dcgkolqsZ2ZAmwsCIJa5sx9A8e06x/HWeG4MMWrcn894BU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LAwcjmJA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LAwcjmJA"
Received: by smtp.kernel.org (Postfix)
	id EB85AC4CEE2; Thu, 16 Jan 2025 16:01:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D272AC4CED6;
	Thu, 16 Jan 2025 16:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737043300;
	bh=ytKaRMK0xKujgaplnSAhSRCtcKiJzVQCd2gF+Id7MOE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=LAwcjmJA8N6tNHrLKe/Dr9fiU5rGnnmZ7G7yLQr1tFlDhf6Mu3Um44ecw40QiHW3v
	 to5pegXWTKAPi635m95yslIuPfVTmIPgRxlFgdLiyNihRAfZmtpgid/7APCsXorSGK
	 1ly0Il4Ep6Xp3jbifoysloM6TcxK2OlJvjetTIaPXLDpwy8SwxQ5kEnFPfZcNT9mTJ
	 Wy12YVyYuq4Z4c1b1uZ3Y8/zXxWUHbG/Zbc2q9q9nHcQTuhc4Uq7aswh/kcjsESZLq
	 CEy45WFeAOLtWmwD+M1ndVBVjF6J1jtC62vT/8mU+LuYb+QI2w821iiCr1C3fHPMAn
	 L0kK4mTQYi0bg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33F8D380AA63;
	Thu, 16 Jan 2025 16:02:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/4] soc: ti: Driver updates for v6.14
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <173704332398.1501791.8635604140780435065.git-patchwork-notify@kernel.org>
Date: Thu, 16 Jan 2025 16:02:03 +0000
References: <20250110210753.exsx5yxmxpcdn64y@amicably>
In-Reply-To: <20250110210753.exsx5yxmxpcdn64y@amicably>
To: Nishanth Menon <nm@ti.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 10 Jan 2025 15:07:53 -0600 you wrote:
> Hi SoC maintainers,
> 
> Please pull
> The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:
> 
>   Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/4] soc: ti: Driver updates for v6.14
    (no matching commit)
  - [GIT,PULL,2/4] arm64: defconfig: Driver updates for TI K3 platforms for v6.14
    (no matching commit)
  - [GIT,PULL,3/4] arm64: dts: ti: K3 devicetree updates for v6.14
    https://git.kernel.org/soc/soc/c/ce4805664b74
  - [GIT,PULL,4/4] MAINTAINERS: TI updates for v6.14
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


