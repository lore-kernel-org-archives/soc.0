Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53C5A2EB86C
	for <soc@lists.linux.dev>; Fri, 21 Nov 2025 21:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763758953; cv=none; b=J5IZuPIaiR++Y/NqN+PqyLhQtS1sqLbgPsjj3PtBi8WnyTr7nfBNB5BBJPY6hKkI/Fp+4WsB/g9a6ezQwtadxqlMtWSmeTAAu+uo6kX+gldo5YNVtCspT2kV1MnZslzE8vaWI7d7UyUgpvh/Yn7h7MnLftXwOPP5+GaIMWZ0RH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763758953; c=relaxed/simple;
	bh=o7geRVW2T0ibNyKgtm2iGlFVXswzyoQYH9WE6fEJbFc=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=s+1029bknubSwxIYxn718pPVqeh9p/iWCrqA5nrSeDeW+9LKc0v+bSNtC8ulWyA2jzSRIs/iGcCkC/VIQqopKDRSCnjKMd3y+HxEoElA7BdZvdVta+/xlQZP6VphnMu/bLX/5Jhvu/Tp/WpqA6DzW8I2gT6YTWlY0Id5YRpZGpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nIbtqeWq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nIbtqeWq"
Received: by smtp.kernel.org (Postfix)
	id EBC3DC113D0; Fri, 21 Nov 2025 21:02:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5C46C4CEF1;
	Fri, 21 Nov 2025 21:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763758952;
	bh=o7geRVW2T0ibNyKgtm2iGlFVXswzyoQYH9WE6fEJbFc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=nIbtqeWqPl/TluK3hcFlyFq7ZyEDMxJTo26f05w7lShEWvZ19CYr2Z7IGXe5g9+ae
	 WUAzuo8SrWygumMeqUDrSPUhPF03v0A+5Z/qbydmezgPs0usELZybjVVDibKys+UD4
	 GfKZ8FzFhFFo5H/bpxegowv7TRryx/9u3D2HzHOSxzXWUndZwQ518Qr2WYiGWxx9Wh
	 aa1Q1yc6EajKT4fVCv7eu7iq6bjd3Y+5EpqzlY6p4x4xYbXz1oYxHVgL1E77imcHw6
	 cSsrTVbdgWSNClpXr16cKqB9C6rKnoboMo8w9LSEu4s1BEOTbbp/Xi09cESPjOekP9
	 58aiKY+QKmeqg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADE703A78A69;
	Fri, 21 Nov 2025 21:01:58 +0000 (UTC)
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
 <176375891749.2583629.16226842647526169419.git-patchwork-notify@kernel.org>
Date: Fri, 21 Nov 2025 21:01:57 +0000
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
    https://git.kernel.org/soc/soc/c/9572838be3f5
  - [GIT,PULL,2/5] MediaTek ARM32 DTS updates for v6.19
    (no matching commit)
  - [GIT,PULL,3/5] MediaTek ARM64 DTS updates for v6.19
    (no matching commit)
  - [GIT,PULL,4/5] MediaTek driver updates for v6.19
    (no matching commit)
  - [GIT,PULL,5/5] MediaTek defconfig updates for v6.19
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


