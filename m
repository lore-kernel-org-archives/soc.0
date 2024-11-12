Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFB5A481AF
	for <soc@lists.linux.dev>; Tue, 12 Nov 2024 22:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731450718; cv=none; b=Kkzt0Q8im4v56UwlxDxBiYFCh/u92fMih4j1zS4U9leNBhFG6njZywPeMBNj2rkm41+WLH61gAN+8CXEWpVRTZbCplthlmFnxDQVy0bXrB9bbaZCxZvQGCHGjx2b5XYjr4GipHN9j9CRQS6SEsuTV5dP9Yz/w9yLR/T1waDBv0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731450718; c=relaxed/simple;
	bh=eEzME1Wt046mOoMVyRLDynArswZCDuUiHeyzLjQk46U=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=BrjQmQ7bCcUnBcxGlIygyVm0jV5ajSjPdZelYfubw1Yxy7zfloaKYNCKD9M7OoMv823o/ggqe+si9iZD1Qh1O1zfHfYUWqLPVxXaFyRwMTncGQWYJb6bw/U7/jKM5VbfVaRhJ/4zIovtvHHF0z/dnosDP2ljSDUBs3K1KGw9E4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fUDOR6EH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fUDOR6EH"
Received: by smtp.kernel.org (Postfix)
	id C794CC4CED6; Tue, 12 Nov 2024 22:31:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1CB7C4CECD;
	Tue, 12 Nov 2024 22:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731450718;
	bh=eEzME1Wt046mOoMVyRLDynArswZCDuUiHeyzLjQk46U=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=fUDOR6EH52Tfvm3+ubZnz4diSzDWcYUxZNpdbfjhiJJoXLaDWSW6cG8IVuy3pzogb
	 Yh8ExnRq/dco95+rdPyYTtLxfxNji6eYBAbABYMUcYHW4eU2E+cwdITvZ0GojrRizr
	 aI2/Hlrj3IkJM+uKophJyC0ruOYYSMiyaMN6UIqCLHbVpjkrOdL49d31CLUQ0UHzxR
	 eqfF2fTiT9q4cKjlfdwIrYMQN+n4KU/CMYCKJotWCNK+AFa+tDZ+e9MnrLrbgRhhT4
	 Bp7hVGXo4yxW5s46UBGwWXHUo9ZJmnaZqo3KhdRU3B0svzxfkDVJdDnax5/a9YaNGV
	 rjWdqMgRdcZww==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33C603809A80;
	Tue, 12 Nov 2024 22:32:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Apple SoC DT updates for v6.13
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <173145072880.694695.15268209331358757642.git-patchwork-notify@kernel.org>
Date: Tue, 12 Nov 2024 22:32:08 +0000
References: <a8a19596-5d46-4562-9555-3b3ae7a5a3e5@marcan.st>
In-Reply-To: <a8a19596-5d46-4562-9555-3b3ae7a5a3e5@marcan.st>
To: Hector Martin <marcan@marcan.st>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 11 Nov 2024 23:18:52 +0900 you wrote:
> Hi SoC folks,
> 
> Please merge these DT changes for v6.13.
> 
> This batch adds a bunch of pre-M1 Apple iDevice SoC and board device
> trees. These are bare-bones right now, just basic bring-up.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Apple SoC DT updates for v6.13
    https://git.kernel.org/soc/soc/c/94dd51c3bc80

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


