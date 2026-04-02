Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BE37360722
	for <soc@lists.linux.dev>; Thu,  2 Apr 2026 21:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775165435; cv=none; b=mUe8PHj+uArcr3OdZ3yfJSzkHw1Mf1TgjPQUSLdom1S66qo4a2Mt/8pa++gfjpGTJWTMgavurjzQuEaTsISBXwQVbi/HILBtIcMRllgoRC8o00LCjyndjw6zypW3ZhtkO2WEs5Z4so6A/r/ZZCpj2WXd4QVYI1VpZlnaEqGW87U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775165435; c=relaxed/simple;
	bh=03HW6a3+lv3JaCMxvF/YulEAZZ7EN+oG0QYbh0PhjTA=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=nQqYVScgdqd8CECFiyme6ex8aiMswokSJQkyr6RYsdSOSHL+HdfjmjNLm13MO7RktYqpjHOp7yu9bnxT22SU/PRX2MHV2mgHpGa5kMY+xUctUUzWCuprOKWRBeHSO0M+KGEmZkLlTWVPtStI2IayIJamOLcazFXdRB+RdHwATOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QxxvXmpI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QxxvXmpI"
Received: by smtp.kernel.org (Postfix)
	id 2B4E6C2BCAF; Thu,  2 Apr 2026 21:30:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1590EC116C6;
	Thu,  2 Apr 2026 21:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775165435;
	bh=03HW6a3+lv3JaCMxvF/YulEAZZ7EN+oG0QYbh0PhjTA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=QxxvXmpIaMkaQ2Lh3atxCdY1738ccP/C7nUSY9oYAswKqpVaUBRRzKC2tznq31cMF
	 jKx8lc8KGEZ6HLNlmW0GgULjECsLDcs2yoWHg7kiWx3JN2wp4KA16gGrR1ci/AaP+v
	 tXT1l1bJ+BcURIBlhnpks7qhxPgg43wkyYpJP0nFk6DkUPEkM4k0d1t909gS6X3hN/
	 elpjo6UnH3Jkje8v00iPQBTQRVzLfNML1dToP6OHF9P9BXDjcRgSEZcUGl9Er3WFi0
	 CUAfp4jXJqKgdud1CH89ZpXsqpuU9/wZbr6tQkRdp/iRAFyCplcm6pw0fi3hYE9ELs
	 xLPZ7y5v7Pygg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7CE423809A09;
	Thu,  2 Apr 2026 21:30:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/7] dt-bindings: Changes for v7.1-rc1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <177516541703.623252.9236556262769387148.git-patchwork-notify@kernel.org>
Date: Thu, 02 Apr 2026 21:30:17 +0000
References: <20260329151045.1443133-1-thierry.reding@kernel.org>
In-Reply-To: <20260329151045.1443133-1-thierry.reding@kernel.org>
To: Thierry Reding <thierry.reding@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sun, 29 Mar 2026 17:10:38 +0200 you wrote:
> From: Thierry Reding <thierry.reding@gmail.com>
> 
> Hi ARM SoC maintainers,
> 
> The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:
> 
>   Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/7] dt-bindings: Changes for v7.1-rc1
    (no matching commit)
  - [GIT,PULL,2/7] soc/tegra: Changes for v7.1-rc1
    https://git.kernel.org/soc/soc/c/86f9823daf5f
  - [GIT,PULL,3/7] firmware: tegra: Changes for v7.1-rc1
    https://git.kernel.org/soc/soc/c/f1aa30a4b23d
  - [GIT,PULL,4/7] ARM: tegra: Device tree changes for v7.1-rc1
    (no matching commit)
  - [GIT,PULL,5/7] ARM: tegra: Default configuration changes for v7.1-rc1
    https://git.kernel.org/soc/soc/c/e2813075322f
  - [GIT,PULL,6/7] arm64: tegra: Device tree changes for v7.1-rc1
    (no matching commit)
  - [GIT,PULL,7/7] arm64: tegra: Default configuration changes for v7.1-rc1
    https://git.kernel.org/soc/soc/c/95c3f54db1e4

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


