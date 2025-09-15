Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5821A32ED41
	for <soc@lists.linux.dev>; Mon, 15 Sep 2025 14:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757946617; cv=none; b=hxeJoVPGJYzyqBBtXCp8dgEftJMJ7ZUE7+2v+Mz9BIcoVhBcJGs/A7aDxCXkUxurwDBA06Ir94gMToroEG/0muSJQ4CvJJ2OBRQNI4Ua727/It6zrIn/rJOOG/4Dh6jQwvd1nqWnYcCZTomoKLd3C9pUPmfYEpjMYQ1ogp6PNmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757946617; c=relaxed/simple;
	bh=HoWs0lN9BJus+dOgxEx0a5eWFE5eM8c8nzV17mV/4Ww=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=hptHrbuDJJAFBrRgFeBtRj1GSrBgsGx6PX32OhVkj344UOWsgYp3JTeGovWL7RUw9uSTMF+K0SyC4ZzhmTDDzRx1vNQtycEf9ZPLCsfMDWGc62Sq+6DNERbaMUJ3sE2807BBrm+NbGiBGodEjPi/R9on9zbeZxuz60PPV8nB2cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FF80S5U4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FF80S5U4"
Received: by smtp.kernel.org (Postfix)
	id 090E2C4CEF5; Mon, 15 Sep 2025 14:30:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7B16C4CEF1;
	Mon, 15 Sep 2025 14:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757946616;
	bh=HoWs0lN9BJus+dOgxEx0a5eWFE5eM8c8nzV17mV/4Ww=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=FF80S5U4fMCINRk++0CodnSrjZo+l/AsMyBVZO1cpOzkDd2yp7+UvQJHGZCm1XKtT
	 Ongvjh/rAVokGH2V4YZxMFjJslTH4be7CcaOqSDSfpuPRhMR/ovbLKWhjggumFqTlE
	 nS4H8pFPESTgP1wNf0Kb7V+h0SlaGZkjlEL/ZJmySet0jN80TAkawLi3dR8ibqiSEp
	 XK9bGuukgoaKVVkWB6cO5ZdyK3bFCyP8ACf5IGNljdqOTFqG+y0UwP6oAq4RM7fy8S
	 jUHDopMQd60fbKAxS+UtGIqkUveDg/lpcapOlX73h9gpNwlMVXYOVLNdfBHPpKhavz
	 ZmOS54ACY7ikA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADD8A39D0C18;
	Mon, 15 Sep 2025 14:30:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Reset controller updates for v6.18
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <175794661848.4799.10467772043768205296.git-patchwork-notify@kernel.org>
Date: Mon, 15 Sep 2025 14:30:18 +0000
References: <20250904154135.2385905-1-p.zabel@pengutronix.de>
In-Reply-To: <20250904154135.2385905-1-p.zabel@pengutronix.de>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu,  4 Sep 2025 17:41:35 +0200 you wrote:
> Dear arm-soc maintainers,
> 
> The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:
> 
>   Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Reset controller updates for v6.18
    https://git.kernel.org/soc/soc/c/a4bd33f4a3d9

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


