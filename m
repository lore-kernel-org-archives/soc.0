Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DA232C21CD
	for <soc@lists.linux.dev>; Fri, 14 Nov 2025 23:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763162642; cv=none; b=N3ByRs2zkwhuFJipK/b++wMb/c7FxtQIN3wCtrTMuUQPF+cGn7wuKkBSryGnrICCAHVtw0IbXGXyqbHm0xL6OIRaMP2BiLPrekcOlsNrvhkk4Uy7MLYD11ZWZ8RvjyEtQRVFm0IJ5ZVsbYaydjEo2d9+mqBmByhF3fwqB9S2zFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763162642; c=relaxed/simple;
	bh=GgzZ+LSvS3eJGY/p8cjSuQglohGZZdXEzk8a9y5XCXs=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=HCu8ST6cq0SkmDoqm2cdErDn/Nkn7SFlviJzmJltAGKfOrC0YKgJy+h0uJrcO9www6oXUFt44IvDticUbN8CW/MDt6qn8WwggocDeGxZXtO/KFbd7VI2VBSCZSy35RbXDZZCS1BsjmAwD45bMY53jONbxzf1VXTFh1mex3Bm2sY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CkKNh/Qd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CkKNh/Qd"
Received: by smtp.kernel.org (Postfix)
	id 45FD0C19424; Fri, 14 Nov 2025 23:24:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 291AFC19422;
	Fri, 14 Nov 2025 23:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763162642;
	bh=GgzZ+LSvS3eJGY/p8cjSuQglohGZZdXEzk8a9y5XCXs=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=CkKNh/QdgqQDtzqVqwR1TEBjS/j5QmpW+enKcXGe3aEahTdUAp8KNVvE/GbMdCo9i
	 ljGc/T7CWJqoDRt9Wva16FdnGYu7T9pnXpReySef0AcElLGpUtxS++yl/jZLu7aOKS
	 /EP9B18+kln46pZH8TQpOu6SFdglsFSLqaLiwk706RGngpcuh2LImLq5NjO+aCUWe2
	 TV0RHgDsnunn4dtMYWqy8dRPH7EWzENxilsatqLfAk1ta6+oj2mQMvNrbXOa+UKjD0
	 IdckLkG8SwLuGmydCRsV/fszcVdJRN1qaXpH9zJlobJAnmSf4dRDw0c7RwIjOiIPIe
	 uuBvLM/Of9lCA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADE413A78A5F;
	Fri, 14 Nov 2025 23:23:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/2] Broadcom defconfig-arm64 fixes for 6.18
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <176316261024.1867843.13298580849785771700.git-patchwork-notify@kernel.org>
Date: Fri, 14 Nov 2025 23:23:30 +0000
References: <20251104222811.3874608-1-florian.fainelli@broadcom.com>
In-Reply-To: <20251104222811.3874608-1-florian.fainelli@broadcom.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue,  4 Nov 2025 14:28:10 -0800 you wrote:
> The following changes since commit 6146a0f1dfae5d37442a9ddcba012add260bceb0:
> 
>   Linux 6.18-rc4 (2025-11-02 11:28:02 -0800)
> 
> are available in the Git repository at:
> 
>   https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.18/defconfig-arm64-fixes
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/2] Broadcom defconfig-arm64 fixes for 6.18
    https://git.kernel.org/soc/soc/c/020e792ca39b
  - [GIT,PULL,2/2] Broadcom devicetree fixes for 6.18
    https://git.kernel.org/soc/soc/c/7b52117eea0c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


