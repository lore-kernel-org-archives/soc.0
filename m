Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6573B363C6F
	for <soc@lists.linux.dev>; Thu, 28 May 2026 22:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780006225; cv=none; b=YyreGMEdEOMySOZLQwyihgiJGP60GziP1QG53P/5dkWn4/7BzWW85bcx9cEqLhnGFP0J9HV1zFUXy4sr0jtUQpSMoKZZlyhdQBf9XwM0/nAzpAQcv9cPMk4ouHHaLLcY2eLVq+SaE/JfZx89dUaw68pWrNTl3QoTCKmTLKqUT98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780006225; c=relaxed/simple;
	bh=Nf7pbnyJog8Tb6DuRgEVHSXNajr5qKTQLmf6/inkdL4=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=gXOHmgcXH/ms1uD0X+yP7mXn/7BDEt8/iWS+yF+w12FVGd9qzQLCCtGf9tZVnVLXP6ksIV3NgGK1FIP0Be/WcpKgp/CwqBocuilnZOCN9LOAF2uEIqT0Fm6frH2CYR5t/QOxtWkNBrOtdrq0+ZcdHBAcPXEJydpL+Hj2R4uaOnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SW/dP4Xe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SW/dP4Xe"
Received: by smtp.kernel.org (Postfix)
	id 3DEA91F00A3C; Thu, 28 May 2026 22:10:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 284801F00A3A;
	Thu, 28 May 2026 22:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780006224;
	bh=Zf2znILnmbMDOmAzA4KEdIDh8lOOpNmQga31y70Ux8A=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=SW/dP4XeXCq6CG06in2CKNKky8QHraPWue4MQQvoJhz+MMB6//mqB8nH2mywN4pSs
	 LoIzfKUZG6yYPuXN/2OuzIrPwlq+ORgmqrIWttawYaoGBZ/UeNvv+utF1l+6RcPInH
	 ++YhVAb69icFsLG6G81jmNabMvmxiqc+0T1s9J0oKtETzvpCOeL3OOwAsppqSmwrOZ
	 7TOJb4W9i3d3iggpcM99ElPXQsYgUqpyMYTelYFC8gN8AYRqgl0mykQYdeiIr9ioLf
	 SwgaeCyBf+MQEAUv19wKqc9SlGD6h1p+d2GyCPvOH3ZHNHw5YGGJafT/t6GnELmr2q
	 CYf+FsklwT9vQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 939613811977;
	Thu, 28 May 2026 22:10:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] i.MX Soc fixes for v7.1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178000622814.1533055.2622590485264456383.git-patchwork-notify@kernel.org>
Date: Thu, 28 May 2026 22:10:28 +0000
References: <20260528190555.3779280-1-Frank.Li@oss.nxp.com>
In-Reply-To: <20260528190555.3779280-1-Frank.Li@oss.nxp.com>
To: None <Frank.Li@oss.nxp.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 28 May 2026 15:05:50 -0400 you wrote:
> From: Frank.Li@nxp.com
> 
> The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:
> 
>   Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] i.MX Soc fixes for v7.1
    https://git.kernel.org/soc/soc/c/04e12996daf1

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


