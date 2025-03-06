Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A5E721505F
	for <soc@lists.linux.dev>; Thu,  6 Mar 2025 16:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741278704; cv=none; b=hRBw2miLq9THOK17ObXUD+wOOJydnDba9xbFzcEQPewsKgmg1mujMImpydkYCgpw1JemwCEf/ByRSLJLz/MJvCkw9Y4Ld2T7YZHGU6Ih4IAbECuOcQFSNYp/H+z80U77dtNClJLtl8uVOlybU9RpqWm0MXcdaAdEyK+nFaqey6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741278704; c=relaxed/simple;
	bh=ZqI9EQNgOJckrR2o/QIuRhjkg7RNl509gXHNGSXwves=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=h8zyC6bN+ueb7X8gL39Mp11mBkVYFfXulozOA0/K0u4echMPq4lxFPfkXFmDuHuhBmBl/8t+IUtCMLpM3+o/2KW9r9S30lmNKdsyim+KKznSn2wnQwwXPusKOtU9dhziAz1v+EZxUzVxO3pzXp8xFky0gC4YYOQnvhSko9UR80A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Syuk1s3d; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Syuk1s3d"
Received: by smtp.kernel.org (Postfix)
	id B76C4C4CEE8; Thu,  6 Mar 2025 16:31:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CA09C4CEE0;
	Thu,  6 Mar 2025 16:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741278703;
	bh=ZqI9EQNgOJckrR2o/QIuRhjkg7RNl509gXHNGSXwves=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Syuk1s3dumPoRgliRxxRApQ4ZtxtCKGIy/sOwI2hD/acZhN+Cxja3NqI1hW6Cw0XO
	 0maSjkc6A8SILTufNFV4z1BvdVV0ilmJqqjoiD941n1xRsy1iPSoKbtDUCIZypsema
	 vPPZ+EIjpWEzLnpNuMjhkq9qSiGd03cKFOxMnMc9rvH6VBw6TexQVMAObLiWKmaE4p
	 9kyclHIRe3YOlorBidxqdqjZwNuvkbHLxajpnstLA14OOlojwiIoYZR4BO4YWs51OT
	 WvtoJAyij4mftQEJJ/d3ApfuOctWRV0jNfx/hbu9zSGxl9UEw6OONvCv1pVJuap5lP
	 L7jPMwU7APlNA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3403C380CEE6;
	Thu,  6 Mar 2025 16:32:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT,PULL,1/2] MediaTek ARM64 DTS updates for v6.15
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <174127873698.1655995.3421256901410879001.git-patchwork-notify@kernel.org>
Date: Thu, 06 Mar 2025 16:32:16 +0000
References: <20250306113540.148342-1-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250306113540.148342-1-angelogioacchino.delregno@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu,  6 Mar 2025 12:34:52 +0100 you wrote:
> The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:
> 
>   Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git tags/mtk-dts64-for-v6.15
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/2] MediaTek ARM64 DTS updates for v6.15
    https://git.kernel.org/soc/soc/c/c4991aabc1f9
  - [GIT,PULL,2/2] MediaTek driver updates for v6.15
    https://git.kernel.org/soc/soc/c/7d5a549a08de

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


