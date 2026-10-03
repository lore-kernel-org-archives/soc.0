Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68B073537E8
	for <soc@lists.linux.dev>; Sat,  3 Oct 2026 21:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791064211; cv=none; b=ShURs9JQ65dWfE0zEcBGzqdOiRi7vMP27gjeYYspRw00Z+O+3GNjOROmtjScCh2xayd/jvRsAED/CMc4F9DgazP/TnwCntVQEsjtIsyLWdqbfQubcGGbQhFI9JW0Eh3e1nlkcojKP5TmJFpxBFpz5v7b66ec6/UfsfwjSP1G0xI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791064211; c=relaxed/simple;
	bh=D30NQsZOXhNEjg0/dzPcc/DTt3mFQ/IJqMr518mNeX4=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=Nm6y0ve60NIODtFx+yRnSn3fjNJqVZXQFmQyo/hJDIVXUeZ835PTmbG++MGqkyoShpia/P2tCjRurHp1aNTWSbPLL8mTLtn2h2Qnp1PUWuAO95Mrsc+5gMJ61K6DXC+xSA9ORuoYIwQN0HH+saMC9zoHkEnoULxoclD6CVvIBok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g5BzV4HO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g5BzV4HO"
Received: by smtp.kernel.org (Postfix)
	id 1D9471F0089C; Sat,  3 Oct 2026 21:50:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07A3D1F0089B;
	Sat,  3 Oct 2026 21:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791064210;
	bh=+iyzhhzggSOxTKPf5dyE1KO8QL6C7MafZQfjKqQ+j9Q=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=g5BzV4HO2K/sxIJb6BtWsmPf1sASyxTozXWC2kVwWqY5okIUqbhxCPDpZVIu7wf84
	 li3PMIgUjn5RlAD3aFbGMYRBD1fZr6vXDB55PUwKN0ktrAPRBMMTijyeZLrt5qpjaf
	 rk+H1SqtSoqFjcTIa17/1J2awfkcfgp7ZUO+CtNbMV5LhgQ/YfaJ2Sz3ndAGf+gJG8
	 AXUsoVOIU/HIljrzrffHALsrjXMzEC3LthWURjPCJ8ap8FRFp69b4t4QIUQv4/4CAX
	 fTJxZ/HxTEiJcEnLGBbRvLbL+M3IWwyg/ir429bL0hlCkhErareQ7hOrM7vAQhnhZj
	 0ehnXWwKRTBYg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F139E3924A65;
	Sat,  3 Oct 2026 21:50:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] TEE QTEE fix for v7.3
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <179106420852.228056.9044480438498040583.git-patchwork-notify@kernel.org>
Date: Sat, 03 Oct 2026 21:50:08 +0000
References: <20261003143338.GA928803@rayden>
In-Reply-To: <20261003143338.GA928803@rayden>
To: Jens Wiklander <jens.wiklander@oss.qualcomm.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sat, 3 Oct 2026 16:33:38 +0200 you wrote:
> Hello soc maintainers,
> 
> Please pull this small kernel-doc fix for the QTEE driver in the TEE
> subsystem.
> 
> Thanks,
> Jens
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] TEE QTEE fix for v7.3
    https://git.kernel.org/soc/soc/c/67c050583f8b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


