Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 126502D77EA
	for <soc@lists.linux.dev>; Fri, 21 Nov 2025 20:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763758253; cv=none; b=hM58MA4wEsCCTAkq+L64tgIcR016+1fy9PEWYic+jdwB2VwWQFDB5xeYOl9cyv3dBaEGBrsafbo8BNcmgoGqipsOlRULHsfcpF14rOb8kf5t4yFyeXou6NPW78pk45CA63D8i+Zef4myycW70pJ0wE95y7adh6lL3QAY+GdpPj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763758253; c=relaxed/simple;
	bh=jD/Gm4rXNhx3MVMU2rlGHcS3ICAsc+PHTeRQTvUsFtM=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=FQcE/gCQMPNfeLxsa8UrFfp1oW+k0DcAm8B818ydCOtl5Mw4XK+yMPzY+XxZJEKQl5Afemsma21TSzHUbiGUDxKC1c1Z7KHU0r2n9B74FN7VajVF0/TwD1eiD3cvGsAptZjjkbbY5P7FXpxKfl3DeHwykxXeRdgcsLzSR4Gb1bQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cJAosXC0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cJAosXC0"
Received: by smtp.kernel.org (Postfix)
	id 074F1C113D0; Fri, 21 Nov 2025 20:50:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF88DC4CEF1;
	Fri, 21 Nov 2025 20:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763758252;
	bh=jD/Gm4rXNhx3MVMU2rlGHcS3ICAsc+PHTeRQTvUsFtM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=cJAosXC0VHhcVh1Catoi2FqcZAz/smCqM0j8FJOwe3j1mFMH+a589gGMx5GcWcIOV
	 W+y/huFofTL0iude3Ru/os1Z0iYjgykNqbuPQ/xnFCn//caNS3xndR6KEpVOtHCEWQ
	 +vm1RvF1GZN0WdcW1CB/gkkJvG1/snlOwOKLnc8heaMZMVvYl2CTvYzZGwBiVTdC2R
	 J2O1XLwleOkEOomZC2ihef+TMVbR9qJBWWd4LpWHdzgFVUb2KX5NpCevGrkFV8ZVIc
	 wJ4sXrrbNssVfhFF7bf4/RRxHEiBZW3qCRcFJd87I5P1BpjzCuh/Cszneo0OhgKtBV
	 sxDdQg9U7yXMw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADED13A78A68;
	Fri, 21 Nov 2025 20:50:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/8] syscore: Changes for v6.19-rc1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <176375821724.2580769.224015127123698288.git-patchwork-notify@kernel.org>
Date: Fri, 21 Nov 2025 20:50:17 +0000
References: <20251115090044.3140331-1-thierry.reding@gmail.com>
In-Reply-To: <20251115090044.3140331-1-thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sat, 15 Nov 2025 10:00:36 +0100 you wrote:
> Hi ARM SoC maintainers,
> 
> The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:
> 
>   Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/8] syscore: Changes for v6.19-rc1
    (no matching commit)
  - [GIT,PULL,2/8] dt-bindings: Changes for v6.19-rc1
    (no matching commit)
  - [GIT,PULL,3/8] amba: Fixes for v6.19-rc1
    (no matching commit)
  - [GIT,PULL,4/8] soc/tegra: Changes for v6.19-rc1
    (no matching commit)
  - [GIT,PULL,5/8] ARM: tegra: Device tree changes for v6.19-rc1
    (no matching commit)
  - [GIT,PULL,6/8] ARM: tegra: Default configuration changes for v6.19-rc1
    https://git.kernel.org/soc/soc/c/909d8d395f70
  - [GIT,PULL,7/8] arm64: tegra: Device tree changes for v6.19-rc1
    (no matching commit)
  - [GIT,PULL,8/8] arm64: tegra: Default configuration changes for v6.19-rc1
    https://git.kernel.org/soc/soc/c/74620292be23

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


