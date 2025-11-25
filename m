Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30E5B33EC
	for <soc@lists.linux.dev>; Tue, 25 Nov 2025 15:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764085849; cv=none; b=kawQQ0EnZQ5c013FjU8t8LKiOckWYVL4SIoVyvuwQ7fFsZj498wD1i2f2ruYrDjV79fMMCMbtCsxUfMKuiWTFaY0TnX10jhcEz3rSz3sFJw4ExYOnaBewSk3abIguVLlP3O5cKqxlj+2thLF1U2C19S/vDD/Sd4il7bsc3P/7zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764085849; c=relaxed/simple;
	bh=KzyLXB6b+m0HN30PZbyJD6KdGm1/GHax6M7t8ZLvYWU=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=bTuwcmw67/EKigWxxwBr6YZexImaB/m5snXxl7r7XoKh9hR0BKqzaFB/ZMOSV0KeNuNHNaRtgqg7nI+/xJsfCv05E4ErO7Vb6nzuSRYkPpSOMlKFbX3G5WBHjfTsKt1TFltlLoIv04LRT4vFm/Z+3/fn9Dhy3lS9Q5Id96Fdqmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=juG47z72; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="juG47z72"
Received: by smtp.kernel.org (Postfix)
	id D562CC116C6; Tue, 25 Nov 2025 15:50:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFD03C4CEF1;
	Tue, 25 Nov 2025 15:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764085848;
	bh=KzyLXB6b+m0HN30PZbyJD6KdGm1/GHax6M7t8ZLvYWU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=juG47z72sXI7kGswjarCNGz90e6ixucMp2bdOkYnnau9/UEzW3KNsKI2tkyhL1Seh
	 hVSQJiRaHhBZpbFP5nqnDCQI/lqJhfTqLBWihVb5x73+6FwLh67X0LRSPvw66tbBD7
	 +WsubNSn8mI126ImJG2o0MFGhwmVAaUD4Gch1MHy5aP2xWpuhaJz9YGlApTeYZTthw
	 X5OebKwqPsFsLvGeR6b579LSY/71tVALKsL281HhRG+vTMD/qkV7idyLjxnFKMLj4X
	 RG04yvkR8uOZgTejRsdSebErDok0tTW+KQegl8HnA47eO5QVKw9638hbuY+3vK6wjq
	 rwQ5SQ28olnQw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70F19380A944;
	Tue, 25 Nov 2025 15:50:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT,PULL,1/5] MediaTek ARM32 mach updates for v6.19
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <176408581110.815192.12994730755101621754.git-patchwork-notify@kernel.org>
Date: Tue, 25 Nov 2025 15:50:11 +0000
References: <20251111095542.13958-1-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20251111095542.13958-1-angelogioacchino.delregno@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 11 Nov 2025 10:55:36 +0100 you wrote:
> The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:
> 
>   Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git tags/mtk-arm32-for-v6.19
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/5] MediaTek ARM32 mach updates for v6.19
    (no matching commit)
  - [GIT,PULL,2/5] MediaTek ARM32 DTS updates for v6.19
    (no matching commit)
  - [GIT,PULL,3/5] MediaTek ARM64 DTS updates for v6.19
    (no matching commit)
  - [GIT,PULL,4/5] MediaTek driver updates for v6.19
    https://git.kernel.org/soc/soc/c/4b1e81570144
  - [GIT,PULL,5/5] MediaTek defconfig updates for v6.19
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


