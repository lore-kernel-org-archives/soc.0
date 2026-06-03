Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD13F3ABD82
	for <soc@lists.linux.dev>; Wed,  3 Jun 2026 12:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780489808; cv=none; b=XuYZZeLJWkw+hdUCMZ+JAk1Gh5FCg34gOMN1DoICBkJDCEC0X3NUIG0k/Nehsgg7K2lHheCNp2o3GPgRXEl4uordXus8qN335rEDSrwQFJUR+uS5tstXhpP5Y1xmWTcg9t1PZial0vRdU3vDESTIq6RG1Z0mbAazZDvKbf9+2lY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780489808; c=relaxed/simple;
	bh=go1BEtIsct9JKU5erto2nF/P1lbiqt04SDbfe5QC8Sw=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=ElNRv8LEfDidkTVXQQZIUopEGNJrfxXWeUD10VrGwAK/H10bplE1qoBgu4zoYidy9NQeH6S6Zc6PKIPbLHJS7J1Fk8HrRj1saaTCiLUMGolor/di/1K6w1rJ/nuWkmhpsvvGbC/yML+fahi1S3sG0tFOy0klqy/LPRzh1pgoZYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RqVjhxh/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RqVjhxh/"
Received: by smtp.kernel.org (Postfix)
	id 7B08E1F00898; Wed,  3 Jun 2026 12:30:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63B681F00893;
	Wed,  3 Jun 2026 12:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780489807;
	bh=eUcU5IU4HkTibcHpGEsUTzL4gGqP0zvmmiG1yfx5GE8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=RqVjhxh/xb8TPayN35DgZydvZEk0cJtO9dewFwlIakgwmzy51EQrDgabpQQ8RZa+L
	 pdvsXMXcBxYAJpxufNTzq4sPODUUD/cj0sNX/DPsqAFK4c1KyZZg+ad7CPDriWMkVH
	 DyKq0z2qfTK5iZd3pINXnZDRrXHN7gRvwMITvyyXcYTUHWGr0DZQ9hOTL4WjSBCa7k
	 YHLsIYhm9vHHubmroRPD2l9Oej1DNWOPkV162ojZNDmuVkiyZ52qKUNh3RSL7gO8zK
	 SO8P0CoHdRa8Pl2LyeAyG9Z0F1VQtI2jzcpaus4j96n2b08eusAuai8fVvZAcNgN94
	 /7NKI0bpa5Q+Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 1983E39307B6;
	Wed,  3 Jun 2026 12:30:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/6] dt-bindings: Changes for v7.2-rc1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178048980876.1389067.10743188101731155658.git-patchwork-notify@kernel.org>
Date: Wed, 03 Jun 2026 12:30:08 +0000
References: <20260531060825.1855391-1-thierry.reding@kernel.org>
In-Reply-To: <20260531060825.1855391-1-thierry.reding@kernel.org>
To: Thierry Reding <thierry.reding@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Linus Walleij <linusw@kernel.org>:

On Sun, 31 May 2026 08:08:18 +0200 you wrote:
> From: Thierry Reding <thierry.reding@gmail.com>
> 
> Hi ARM SoC maintainers,
> 
> The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:
> 
>   Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/6] dt-bindings: Changes for v7.2-rc1
    https://git.kernel.org/soc/soc/c/3554fcbb4ea3
  - [GIT,PULL,2/6] soc/tegra: Changes for v7.2-rc1
    (no matching commit)
  - [GIT,PULL,3/6] soc/tegra: pmc: Changes for v7.2-rc1
    (no matching commit)
  - [GIT,PULL,4/6] firmware: tegra: Changes for v7.2-rc1
    (no matching commit)
  - [GIT,PULL,5/6] ARM: tegra: Device tree changes for v7.2-rc1
    https://git.kernel.org/soc/soc/c/57ffabf5a152
  - [GIT,PULL,6/6] arm64: tegra: Changes for v7.2-rc1
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


