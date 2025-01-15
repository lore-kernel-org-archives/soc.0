Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C82C1553BB
	for <soc@lists.linux.dev>; Wed, 15 Jan 2025 17:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736961199; cv=none; b=URfTJQ2iuYmBzosmWuxe8I3tXKLMkJN7Ep24smi/DG797dzl8oLjdpkEm/LbqGj6OKIWE06cwnIJQqgWE/9mGz913HMAOxiDlZ28ZvfBRIb0PCQIbFRrkumm81pCdQBJNkM2YKy5SKtDjf9O4VFcFE84DjRy11DKZNiO9cTVpcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736961199; c=relaxed/simple;
	bh=Zc7oSzyMmG0N2xrHKrJOL22z3xNJA8PJZtNiHszXahM=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=lePVdgoreO132R+rhmet5YoAI7ga+9klcECpGl78nr+r2pxKiV9hge0E82woufA27BLOzkIwuiZtI0sWJTY7YL1bU5zjsccZ+wNue0b+WYX2X2PlB0tIT71+nmlG5RzXkXSJH3MW9Uu7iQBbLgNoo92CrNkZSAo9oygN0RwfFq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YKir8E3h; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YKir8E3h"
Received: by smtp.kernel.org (Postfix)
	id 600B0C4CEE1; Wed, 15 Jan 2025 17:13:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A577C4CEE0;
	Wed, 15 Jan 2025 17:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736961199;
	bh=Zc7oSzyMmG0N2xrHKrJOL22z3xNJA8PJZtNiHszXahM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=YKir8E3hc/rxe4lIRbShTsih8GX97pFGu0vYpG4I793TtA3GBeLaTVp/7+CtsvPGp
	 0XP43jA8gpCKTC40SSLhoI8fySBC5ZzCJn2qvrDNj7KARv/O3Y4JUTog/rKfohgJWu
	 8PkDkckVXJW+Wyuc4pBuoBle2jKrS6J5a2gldkA/7nHlUEmrVVYxZERNDlIk1oQMxc
	 sw4SR743bLPm37mCHvbuUvEmGfxkNIVkcjKShFLmyqPEvLiB7gtGskKNbWmxdaIX0R
	 3n/LuAxiKYTqiX9lAZ31ILzNe83bQnyEDGaeOW7Rtqp0tFAk8e2ck9/NS7Cnesu8xk
	 JSEhoY3Tr/esA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70D42380AA5F;
	Wed, 15 Jan 2025 17:13:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT,PULL,1/3] MediaTek ARM64 DTS updates for v6.14
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <173696122198.809051.15679716302445520462.git-patchwork-notify@kernel.org>
Date: Wed, 15 Jan 2025 17:13:41 +0000
References: <20250108100826.32458-1-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250108100826.32458-1-angelogioacchino.delregno@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed,  8 Jan 2025 11:08:22 +0100 you wrote:
> The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:
> 
>   Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git tags/mtk-dts64-for-v6.14
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/3] MediaTek ARM64 DTS updates for v6.14
    (no matching commit)
  - [GIT,PULL,2/3] MediaTek driver updates for v6.14
    https://git.kernel.org/soc/soc/c/f783d74ca6aa
  - [GIT,PULL,3/3] MediaTek ARM64 defconfig updates for v6.14
    https://git.kernel.org/soc/soc/c/499a3dda0b17

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


