Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52DFB25F972
	for <soc@lists.linux.dev>; Fri,  9 May 2025 21:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746826223; cv=none; b=Y2w0UEW8+D4kNE382oqX0XWEBKMPbDgIjz9W3Sikztvie3cfmsl6WTSTWtATFUYvg1khIrjRZbvwNqDjq+muEL7eNV97iG4twMFpWt/Eg2h4NHo9sxT8m7SAnPbPBgOOC+PJxPMykMYMVoIJh+Mck0xQzuS/P6IVA+BihfNWU7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746826223; c=relaxed/simple;
	bh=LRq/k/hJeOnjx2Bna59wMobgCszpc3Z/aRWLmRuODkg=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=LUujjxvLFJ/c9nr6q19/Wci2qsB4u5Ft5XLUprQSdywD0dtmt0D5YOpqZhRqejBdqlmKIi3cP0Tfpkp1+bO03i9bZ0OE8sPQ0d8jxeiiRcwLeNvfrVmAkORdEx85t2ypKKMxcUwxFfy0+XIwrl2idvf+mPON7yp246NEep2YeEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f3fdkykZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f3fdkykZ"
Received: by smtp.kernel.org (Postfix)
	id E0E53C4CEEB; Fri,  9 May 2025 21:30:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C65A8C4CEE4;
	Fri,  9 May 2025 21:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746826222;
	bh=LRq/k/hJeOnjx2Bna59wMobgCszpc3Z/aRWLmRuODkg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=f3fdkykZCREQCGOnllFgml/AB++gY6525UVbDB5GfgMyU5U0C6Z5I+b3LDxZWTLCv
	 GYM3zs2JVrnXyEyj95pVgcnGDMManNuTGf2DQznAWsVCUsp/mYWwM4+ZxZDbERbJRW
	 jpfDJ59XXswfB4asfjnW8D1Y8UijcvS8E1Ekt+NlHbRT+c5rJbNTJPXMrXbTyw9yAN
	 go6gJr2I8d8/3w7DFvbjyrBiIRGaS05E5OwFCltn2AZyqlUnIoArmBl9qN+gW0GnHG
	 JywbFOqdgRwSXxMyGP19xsXC8JCHDanqF6HeDCUzJitFt+rg9atAUIT5Eo021k1Dv5
	 dFJapYLmaxetA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70BBB39D61FF;
	Fri,  9 May 2025 21:31:02 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT,PULL,1/2] MediaTek ARM64 DTS updates for v6.16
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <174682626099.3817276.1593326700572929746.git-patchwork-notify@kernel.org>
Date: Fri, 09 May 2025 21:31:00 +0000
References: <20250506091736.125733-1-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250506091736.125733-1-angelogioacchino.delregno@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue,  6 May 2025 11:17:32 +0200 you wrote:
> The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:
> 
>   Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git tags/mtk-dts64-for-v6.16
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/2] MediaTek ARM64 DTS updates for v6.16
    (no matching commit)
  - [GIT,PULL,2/2] MediaTek driver updates for v6.16
    https://git.kernel.org/soc/soc/c/5dcee6dd09ab

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


