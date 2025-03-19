Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44FF420899C
	for <soc@lists.linux.dev>; Wed, 19 Mar 2025 22:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742422302; cv=none; b=b7i+IIRCyfHiBhA7j5Qm/ysjZTYWXHLcBk/mlH3VCv0MQ+11Y43ApR6sFUKYq5hMCihG6xwa+BD6s24x26xj85muGLSQfiW9qN5uMNUVpjo1yhCjN0WyoRul7mMdbywa2Saln0f8wdbg+be82kKVtJxNJsnGgWWL1TIG2wf4KS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742422302; c=relaxed/simple;
	bh=XLEfdcfetBQHMxzuk/faKBPmdi/PXM5FtlnTg/VyZNY=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=l8FFj+X8l1Hz0pxMasfFbj0p2E7N0sSlPSfD4eNLQ38aDZhFsYp17jpLLqyu11ZqJ9LlS3EoPbJx7793EGOKbRI9nYNczpy6apvTVkzMBaDnJVyXLRKtd3eON0RdZbggrrWgkH/UXfoTULIrLTqrNZULj6YW7UvWilTdYbedfFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U61Wglt9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U61Wglt9"
Received: by smtp.kernel.org (Postfix)
	id CDEFAC4CEEA; Wed, 19 Mar 2025 22:11:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8556C4CEE4;
	Wed, 19 Mar 2025 22:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742422301;
	bh=XLEfdcfetBQHMxzuk/faKBPmdi/PXM5FtlnTg/VyZNY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=U61Wglt9pC+5vTSmilIFiC3sFb+Q6Th58ozVODVDeG3BvtWSJfk+CPG7IrqNRO8TH
	 uh1nxGTsKCjuJKOYnVBEKsMQFUm+VssuNHMxijEH1Hho/tThPnWNYJdZc66Z7T5pln
	 g5M7rxjEZRRlzT9vNQZkjCDpvyGheF3JFpqJhJ8jHLrxxgP77oRO7DKfup9jWatk9O
	 v7NdG7RfcnzEUkIC3gGe2C0c5T9mMTuSvAOr9pzhXBTOf7rskBDGrle/1bmt2s3iQZ
	 DW+XRPvwtFjJ2WXqtBENijccwokT94b4r95xd9ybPp7n+4hspGyUxs6sCkheqQ+wZ6
	 TgUvjyFtXd9yQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE4283806654;
	Wed, 19 Mar 2025 22:12:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Microchip AT91 DT updates for v6.15
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <174242233750.1211847.14070760519468700159.git-patchwork-notify@kernel.org>
Date: Wed, 19 Mar 2025 22:12:17 +0000
References: <20250312173755.975074-1-claudiu.beznea@tuxon.dev>
In-Reply-To: <20250312173755.975074-1-claudiu.beznea@tuxon.dev>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 12 Mar 2025 19:37:54 +0200 you wrote:
> The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:
> 
>   Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-dt-6.15
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Microchip AT91 DT updates for v6.15
    https://git.kernel.org/soc/soc/c/3ef47a043621

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


