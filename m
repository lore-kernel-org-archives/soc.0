Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26C4044C664
	for <soc@lists.linux.dev>; Mon, 12 Oct 2026 08:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791794411; cv=none; b=FXcKr3L2Hj54KjGgxWEAOIJp/OrFiAyurCoF6K5+t8WFzR7zA2odEHYC2aUAhh1rirWwFtlFlLUa5McfnFJpqmOIN2qxsF4cF8ocDAg8OdsTaAICy6Y5CCv/ERVVEP6xFSObxMSaTk8ZFVMfQC1YSTzwq66WdlIebTU6Xl4DNA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791794411; c=relaxed/simple;
	bh=tyHwLb5Jc/HqsOnQqbgaLQpZUrx6Fjgk/b1IdzY9hXc=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=CbIwGK3HQnjzjzvC6c2nvGGgdtXMP5wnqMNFTvx9sN4pz8UIHj9/ToPrJqt8P0v/RStefmUMa4r7ssrFqvZYHL3F6/bTcsUdZdCLjRtZjpmwnDJCYMu69ASVRmuz7KcVJnNmT39HCnhf+fLWa8eKCN02IzgrFzWqZGe5Yqc9ST4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nu0jITDs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nu0jITDs"
Received: by smtp.kernel.org (Postfix)
	id D44A41F0089C; Mon, 12 Oct 2026 08:40:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDE631F0089B;
	Mon, 12 Oct 2026 08:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791794409;
	bh=Q7U025eQbV0SEBbT5zwqUyZQpJPRuu8FR9jHEZoP5oA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=nu0jITDsyg0dkv52mwNGbWW17GEk80d3IjqfPIe1JKxo7CCAn1ObiZZ2yH2mMSpZm
	 LxPvHQ13CfO4kMoUFb48yh+Nxex8vLQINftCiOzK1YyMcAGbjrUFDXXMoBP7LIZQxy
	 zW5tUbh8hjay4OS//8ms3/fuh3MrlRl9AHg2Ztm3gYuTEOrMSIwKdIkLEFeFbqx3e2
	 JDSEGY5bGGgoINSf20jGY4qEGAhpjz/E8R+C5AeuxpXCjSP1AaTwKovwaG3OohzuO8
	 ul+KgSzGHHF2FxTZNDCapSV3LLnfJ8yr11/dByHUBCNc6J37LTtaYD0fv4ssNmng1S
	 2MEb+3B6FE3cA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B448B3811A4C;
	Mon, 12 Oct 2026 08:40:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/2] soc/tegra: Fixes for v7.3
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <179179440826.3278488.4873594498754125519.git-patchwork-notify@kernel.org>
Date: Mon, 12 Oct 2026 08:40:08 +0000
References: <20261003095505.1369507-1-thierry.reding@kernel.org>
In-Reply-To: <20261003095505.1369507-1-thierry.reding@kernel.org>
To: Thierry Reding <thierry.reding@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Sat,  3 Oct 2026 11:55:01 +0200 you wrote:
> From: Thierry Reding <thierry.reding@gmail.com>
> 
> Hi ARM SoC maintainers,
> 
> The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:
> 
>   Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/2] soc/tegra: Fixes for v7.3
    https://git.kernel.org/soc/soc/c/d610d871b18e
  - [GIT,PULL,2/2] arm64: tegra: Device tree fixes for v7.3
    https://git.kernel.org/soc/soc/c/558c56d4bf7e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


