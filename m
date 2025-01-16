Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEFDD22B8DA
	for <soc@lists.linux.dev>; Thu, 16 Jan 2025 16:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737043302; cv=none; b=j5ScBCQb/04yvE1jxfxDP0h3asfumwmkIL5fLOR88TITB4sFSEFNLPdnHkuyVGZ2UoQz9MgbagD274zXdcbCdeiKl4kDZ4sQsmEnG7DauxEWtXhcawE2wmRrHVXL0LZ8WV7+cuGOkHmmqSEVgti+xvB7PkD1/lw5h5lnf+kcdls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737043302; c=relaxed/simple;
	bh=QObUCveI/3UyqhDGxfrJ5IRqCIcrrorUoCOf08wHOGE=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=sWn4mlzRLvCTgkG0AFZi8n+GsNJvRhQ93CO+3dx4DyRXqUp2PHEo2NJS6EBS9J9qaPb2SdNlyFJhxpZbwpocvwppLeeIKI1x0zbuOmdN28PtXKAfCaqXSz0YU9daIlJp0/7TTxzz1jHb+tYaVZNBzBy9WEjQXOHnGHq8/eVcFVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pOAmpslt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pOAmpslt"
Received: by smtp.kernel.org (Postfix)
	id 7208DC4CEE2; Thu, 16 Jan 2025 16:01:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A495C4CED6;
	Thu, 16 Jan 2025 16:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737043302;
	bh=QObUCveI/3UyqhDGxfrJ5IRqCIcrrorUoCOf08wHOGE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=pOAmpslttEHf6kQPxjSI8I9anC1ZqIKgjWX9b1fxw1jEXgaDdTtWa2Qh5NJIrCzIO
	 Vch4ejpn6b8AUNCYMRjgOhZXK6M4yGjcmk8HhrLgRSHHHNiYtzqcud/yvo5bLSJ/SF
	 NOivyOWNHUxoMwNF+Yj6pZZV32WLLK1/d3E2zG05LSGdLCyKj+CUeSGlZ9rocUJy8l
	 NJ3mF20lSZrB9dV4V96OYyxmQJ63pux9B0Yax15JC6Ohr5YH0KtxLvOyy7oaaKrmKt
	 Bnm7NHCAPdDgWryeRSY9b3yZ+sS/VJNWC9RGqMPiTycnEPKfMbxYodJXbxF6zbEdbP
	 i6+AVqPAykV/A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AEA98380AA63;
	Thu, 16 Jan 2025 16:02:06 +0000 (UTC)
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
 <173704332523.1501791.16439665329571426004.git-patchwork-notify@kernel.org>
Date: Thu, 16 Jan 2025 16:02:05 +0000
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
    https://git.kernel.org/soc/soc/c/5c9e59a05b09
  - [GIT,PULL,2/3] MediaTek driver updates for v6.14
    (no matching commit)
  - [GIT,PULL,3/3] MediaTek ARM64 defconfig updates for v6.14
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


