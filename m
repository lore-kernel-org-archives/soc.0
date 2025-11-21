Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C020E4315A
	for <soc@lists.linux.dev>; Fri, 21 Nov 2025 20:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763758248; cv=none; b=rqreXwSEhuGFPWBeXcSf2yUyGkcd9AkHBJO/wi5U9m3Tz3XSR+pi+m9t9PzbfXBGqLV1yVDFRQq8eoEnNoN6vsd4gSY+IjA08s0kB4wFYoyoACRf9jv1Bg11WTUX751XWz43PBSXdLmmRMCieVc0q14lfpGx0AVBXaq9blIccEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763758248; c=relaxed/simple;
	bh=0BybdK5NDZc4oQ1Lr5ZtXXFa4KH7agySs5PiTGtgGlc=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=rvAh3Sg5XgBfdOahAdWDKhx50YYtIqA9/hGVZMm3Q3EOSJDz1hsk6CXsggrFddR9mg76g94+d+aNfjYI9LhYHo1pB/RiWrlcj0ZvL+/n1YXDvUXc4FKvllA4728t9a4/2V9c+NbNLBmamDH8jnv4GV0hTXrPHEfNl+orPYk02Go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u6v6N3MF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u6v6N3MF"
Received: by smtp.kernel.org (Postfix)
	id 80546C113D0; Fri, 21 Nov 2025 20:50:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6662EC4CEF1;
	Fri, 21 Nov 2025 20:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763758247;
	bh=0BybdK5NDZc4oQ1Lr5ZtXXFa4KH7agySs5PiTGtgGlc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=u6v6N3MFyIWk3DgWDSwQuu6kfOz7+CG408y8Fr8L//hWPbTieK134txPGJj0XRshx
	 UwV1nMj4R8E2U6hsANqAm6/bVZavqUBoQ8/85v6XhCGOYEIvk++Y073OmWvNM0T+tF
	 J9kc8SJSxbLxeqhTrfvlvalnn7KijE/ZlrWfWUpXZBy9o2lG4RNrDF4Q4qYzcBUJhZ
	 9vkPXukWwRIajaMd16z+VYjSuzCSOU4FqZjrit66dm/0CmUO14ei3xkE9b+HWRpApI
	 8BD4Q+QFX3p87Aah3yHmE366w0paC+KviNIaTtCp+v2sw+iclnY31lSkvG0qBxYR9J
	 VK3PC74rt6gOQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33DC43A78A68;
	Fri, 21 Nov 2025 20:50:13 +0000 (UTC)
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
 <176375821174.2580769.8511562692814900789.git-patchwork-notify@kernel.org>
Date: Fri, 21 Nov 2025 20:50:11 +0000
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
    (no matching commit)
  - [GIT,PULL,5/5] MediaTek defconfig updates for v6.19
    https://git.kernel.org/soc/soc/c/0719a58aac9e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


