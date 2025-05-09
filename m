Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96CD9239E74
	for <soc@lists.linux.dev>; Fri,  9 May 2025 16:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746806999; cv=none; b=Pb/n08mG72maQiAuMyfhqxBuRg/U3lZJ1hl/CXHVZRrT3sFOLT0C98vl15iBiAOEpz4GdBPZWFtQi3X0kC6ZqId7VqH15lDRwV/GgVmmcRP2Z0YXfiaI2CaL4ZjJgmdMUAKmSqwpCZHYDZs2BYAlpAbD9E4V0162e3s3DJPb+J8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746806999; c=relaxed/simple;
	bh=gdK/4dJvl6Eq3YBxxY/kFALaRdRtDUVCBD8vmqRd6v8=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=UJodtWpdxpmFMoXxXIr/hJ3tx0Rs9G7dTTEmp10hdwoPkMpkvdcijYGxCkE6l815yo1/l/rh4Va59mlOj6vcoYL6kTnj2p4urlBNCHTZH6GJKYvnIgy5RODF38mui0iMj7XVEb5ZPkpcS/Pu8t4IpehofY19a3mEu/D60OI4UqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TcpwYOVh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TcpwYOVh"
Received: by smtp.kernel.org (Postfix)
	id 1892EC4CEEE; Fri,  9 May 2025 16:09:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03318C4CEE4;
	Fri,  9 May 2025 16:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746806999;
	bh=gdK/4dJvl6Eq3YBxxY/kFALaRdRtDUVCBD8vmqRd6v8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=TcpwYOVhN9uVTLllmyTFMZDdnvXkA0iBbMz/1r7kgtlSQYwRZDzRenUuKhOT4LPsA
	 bFx6LLSoqtVSlH5ydtgKWFt9HOZrJYLtoJuC3+prY8/2Y9cJHvSjcUuQZW1Xo4QHtF
	 H+ZIxfH1zcuaIJIbdxUdNBmYd6zssBmR3velKZpt6mVVxZr6i8o8EpaXV/P21D4TaR
	 5fFdSMKll/desfPD1czy7zC9ZDb3avWOWNt9pc0jr1NzBvwaTl8PLVPf3Hnyl4Oj5x
	 sAy8Iv87wm0KpnByqPLXju5bqmed2Ex3zxd39VA7NCmJ8pFf7BwK+d3+udjCuJaB/Y
	 FGmoiGCPO5WGg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADDD4380CFFB;
	Fri,  9 May 2025 16:10:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] RISC-V Sophgo Devicetrees fixes for v6.15-rc1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <174680703718.3673480.14977600965554828034.git-patchwork-notify@kernel.org>
Date: Fri, 09 May 2025 16:10:37 +0000
References: <MA0P287MB2262454C19B8899BC1694D04FE832@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
In-Reply-To: <MA0P287MB2262454C19B8899BC1694D04FE832@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
To: Chen Wang <unicorn_wang@outlook.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 30 Apr 2025 15:29:00 +0800 you wrote:
> Hey Arnd,
> 
> Please pull dt fixes for RISC-V/Sophgo.
> 
> Thanks,
> Chen.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] RISC-V Sophgo Devicetrees fixes for v6.15-rc1
    https://git.kernel.org/soc/soc/c/6053915252d7

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


