Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6212919B5A7
	for <soc@lists.linux.dev>; Fri, 21 Nov 2025 20:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763756540; cv=none; b=JFtqddjQoYJgjRVEOwVZycEugc+JdE/xUywElX25ss+arK+ODa2q0I6LWANH6LhSc0MriosjBtNALTolVcxtc8Vc65Ulr0PXXWWJ+8u1zxPu+g3z+D0BjOVNFyrXVQ97q4ngTCXtmlSWxXQm3nVnz3i1O70KRN5hzBatAG1YXek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763756540; c=relaxed/simple;
	bh=rYifa/dsQv7b6vEssm5BpcTmkSNK1wgYjgbQ/AUgheM=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=ohRuF+/tn9XbXWry8BLjKxXSlepH48yAFZqwoFDS+wPmw3yMWFl4jeNARXAdWcsWs/8NBu4TOmmAFNXcdG1YGQJoosdo9QzuM/kltDwnSCtOoYqL5spp7wp8Fmz0u3rMh//kr3doIHuPJu3fvBY1kztIOQsaZDjNcLr27mUHTJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gVaacyz0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gVaacyz0"
Received: by smtp.kernel.org (Postfix)
	id E9F42C113D0; Fri, 21 Nov 2025 20:22:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D489FC4CEF1;
	Fri, 21 Nov 2025 20:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763756539;
	bh=rYifa/dsQv7b6vEssm5BpcTmkSNK1wgYjgbQ/AUgheM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=gVaacyz0XM5JyB0ysCrMAEs/bsS9b42RU3Hmhgg2GCtCUdvCWQcvZaJvlBQ82g0zB
	 OPNwo1PuJz3Nn9FZ31zGBa81IXiTUEJDkdab/P799q/ujG1I0nk9Sozj09tgAtPvle
	 iP5I/zI7y5pEJ+pZnNcdoLewWFuKPGnvOZk801bwWNLltiWSk+poTcdOZ6b221fE2f
	 KGpUmfs+m87Zg6zcb/24gMFcil8ZTEUG2QhU9mWOM/LEXTJxzJjXKBjddaMGSKVEfL
	 skR+v7g9FKs63/ULh7Bh1FPzqyTObmqvs2PJ+dRFTa7igwc2OXU8h6OsJVUP61PxkV
	 CDXHHkBICPG0g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADD9D3A78A68;
	Fri, 21 Nov 2025 20:21:45 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/5] i.MX drivers update for 6.19
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <176375650415.2571237.7681001270899067010.git-patchwork-notify@kernel.org>
Date: Fri, 21 Nov 2025 20:21:44 +0000
References: <20251117123358.2009662-1-shawnguo2@yeah.net>
In-Reply-To: <20251117123358.2009662-1-shawnguo2@yeah.net>
To: Shawn Guo <shawnguo2@yeah.net>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 17 Nov 2025 20:33:47 +0800 you wrote:
> From: Shawn Guo <shawnguo@kernel.org>
> 
> The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:
> 
>   Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/5] i.MX drivers update for 6.19
    (no matching commit)
  - [GIT,PULL,2/5] i.MX dt-bindings update for 6.19
    (no matching commit)
  - [GIT,PULL,3/5] i.MX ARM device tree changes for 6.19
    https://git.kernel.org/soc/soc/c/e5060380e063
  - [GIT,PULL,4/5] i.MX arm64 device tree changes for 6.19
    https://git.kernel.org/soc/soc/c/976e33268c41
  - [GIT,PULL,5/5] i.MX defconfig changes for 6.19
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


