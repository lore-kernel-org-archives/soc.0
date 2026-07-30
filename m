Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3CC53FFAA4
	for <soc@lists.linux.dev>; Thu, 30 Jul 2026 09:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785405055; cv=none; b=n6hMdWxj8x1cjP7MWFm3MntqTzAUa8SALl1BTxL5SZH95kb+kvfD7JezzkH6sXqgErmxL4nBVD1m7nG00MEKmI4FXNeRD2/w/fYzSHAYtGZdF+9wVmY8oucXnK98eImtrgbF35Td7U93t4kUpcM3QYW6OH8y+OPphjAjk/MhXgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785405055; c=relaxed/simple;
	bh=UOF31y1v/Zo7W2FFk/mqGWC4Nac+6rDzaLVMHenwgm8=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=NnJpJieWN5jbuocNxhqKYn7YvKEf5HrzC0wfs9+UKXbbOcnDmZzeOmKxlWs9UP8dq4JaKRjB/v7GcTB345jrnMfDrzygxWP1K1CFIHXI1DacGAymW/2g1OZA3XIt7r/dacEaypSrayTvdGp97DvBqJ153Io+6LJFv1PTbKRA1Xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FKpKm8Sz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FKpKm8Sz"
Received: by smtp.kernel.org (Postfix)
	id BAA921F00A3D; Thu, 30 Jul 2026 09:50:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4A041F00A3A;
	Thu, 30 Jul 2026 09:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785405053;
	bh=SS22ztVpIGXnN3NkrvPWTZKvY9zSRd++c07irSxHZH0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=FKpKm8Szmk8VNoXEvi3GaqwR0XzrGbMkTJ0W1Lgb1FL6yb9lD3Ft4FatXd9qn81Mo
	 trbv7RRr+a/+JuPsZBhIC0pNCEgHaZiUzuVM8Nf6xId2urwYGXMVZNPaFsUW7xmP+B
	 0yFoi5ZOmFvMuutjrzrQW3lRsuHsaVEv1Sp7Vg7JLPYzJaP7V5tQOa5cJSz4CxFrK7
	 s2zRxt2ExTO/gZ7JQJJFDgyTKjoriT/Ybz2qrueiKmyX9n3DUgqhPYrxT4MgFs8pcI
	 +/erh89EeNePsjSPaP7PkbLwSMTUbqfIrYwXYdLD7iyN9rvruAHDpg4t4NeZ/60mY/
	 Jp2sWyPDstIPg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 9395C381195C;
	Thu, 30 Jul 2026 09:50:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Qualcomm Arm64 DeviceTree fixes for 7.2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178540501739.3469699.16429987712227145475.git-patchwork-notify@kernel.org>
Date: Thu, 30 Jul 2026 09:50:17 +0000
References: <20260730020642.68595-1-andersson@kernel.org>
In-Reply-To: <20260730020642.68595-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 29 Jul 2026 21:06:42 -0500 you wrote:
> The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:
> 
>   Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-fixes-for-7.2
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Qualcomm Arm64 DeviceTree fixes for 7.2
    https://git.kernel.org/soc/soc/c/111b787c9e31

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


