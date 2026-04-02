Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECCBA3612F8
	for <soc@lists.linux.dev>; Thu,  2 Apr 2026 21:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775165438; cv=none; b=Ggqzp0TMCUXeTdA8dMi0PixHdcC4XwEUiWteuVhHr6Q7Np8MIimty6hwA4Mcmq0dFEcpb2AfjnZNgpL7zzdAJkPtBkwXy9fAPQ6rEpGuy91i0f3Xr/Zo4Pu+908C3gQKx79hl081kM+kvILbXAFW4+cV9xcnZkoN+bL3x9bERdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775165438; c=relaxed/simple;
	bh=GtQj0gY0gjdzJhZWTkVs44WonFagPprDwzUVKhD6s78=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=peKCR9YdU2OUI/bqK+Bq4J5+Y5upjb/aek2C0wTM4wF73Ke88euoJiBrV5DUa3llKBY1EoJ5mvsnd4vEqnj12UeozdR5hmsFyEf2tKeky6POUnAe21eD3NVb25pw8u4Y+n2HeYLlo3SdO4zLpvfDO+WbcawZX3zBCQPzY8pOu/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BTVNHBJZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BTVNHBJZ"
Received: by smtp.kernel.org (Postfix)
	id E3182C2BCAF; Thu,  2 Apr 2026 21:30:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD6DDC116C6;
	Thu,  2 Apr 2026 21:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775165437;
	bh=GtQj0gY0gjdzJhZWTkVs44WonFagPprDwzUVKhD6s78=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=BTVNHBJZtbH0JS6CbkHVLocQH29aeGUEUhddW0woeRWH809MX5gC1kc5obtZ1Rg0U
	 quOp3GXLAw0u+i2pWFn5vxnfSdoe35NRGdQFgYsCpD6lKJa0CNfITv8PDrt1mY6X7D
	 1Y/Gt6j6ciRwdtUTu3oMG0Tr+Qw9aD0rLEjdUXCGzDfoLKW+WCLyR4h17cObop2Mij
	 /KFNxmyGo+kZmz3keqNu+MbZzPVkYnEVm+SE5btvV32eifoWNPvX7A7RDlLZis5qZm
	 00xhgArM16KcBxLyBsfnondloRN5rqB5NMU5BmnKDw2pTCitdk9lCyt9MHZq9PvPlA
	 X+oIqvFxRidQg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3FE013809A09;
	Thu,  2 Apr 2026 21:30:21 +0000 (UTC)
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
 <177516541978.623252.15846803399656430611.git-patchwork-notify@kernel.org>
Date: Thu, 02 Apr 2026 21:30:19 +0000
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
    (no matching commit)
  - [GIT,PULL,2/2] arm64: defconfig: TI K3 updates for v7.1
    https://git.kernel.org/soc/soc/c/1c4c5c50ec58

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


