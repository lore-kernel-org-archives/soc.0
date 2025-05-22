Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03D4B236453
	for <soc@lists.linux.dev>; Thu, 22 May 2025 11:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747912798; cv=none; b=hL/j7fgJY+WKG4ERTjGcyLyJu8xbYWZcEPYyGkUT7j7TzRANE1R5Ch1RoespXI9XFEkOvKjw4Bq0iqOGQG/0YLCAgyVYQKijIO613niCFg5t8IHphdVjiD5yN/rF6smiCEiTzGSSdBS/Myad0eyoAXdik73ke8+aeUBXAVkSsro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747912798; c=relaxed/simple;
	bh=PVtlDtc2E45N7FVstpyYJlPnjnir1ArfcH2zd6JlaDI=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=OwOVGMigwrxytmwm1RmlUhGAjrd02MbetonRm0pW1yfSiWUzPvMDqxAjzKMiw8X0CaRg/g0Pk+10yS37o+UrFDJKNLOL1tQRQK2kH7eq+Dz5UmFeT5rItV+a7/2q8/eCrn/fseZ+rsukQx1y/VsukA6DVsAszr+rCC9Mu0LoAcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GPJvf78s; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GPJvf78s"
Received: by smtp.kernel.org (Postfix)
	id 89589C4CEF1; Thu, 22 May 2025 11:19:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 738DEC4CEE4;
	Thu, 22 May 2025 11:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747912797;
	bh=PVtlDtc2E45N7FVstpyYJlPnjnir1ArfcH2zd6JlaDI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=GPJvf78sUz4frfAIqzXejCOFDGB77KdSW4XFyR7UlnhJXmp0HEcJvVIPL/aZU1r+p
	 XxvZRy8G+JsNAVovK4b34mCMrMV8gioIMO47yPNwQKgRGFmjGKIU9aJj1jZG7yZXLX
	 PBic4EycF+R8UVrEkjPfA/2GwBUJz5/waROhy8/LVh9RDW8zUnr/9yNyv/0xxYOXd/
	 EOMLYVrZr/jLejmT3aXB3fjd+yfrwhLFNZT2pPTIbNtcUXZUPIjKplRmCHdQyMJrui
	 2VfokAKyK+8VKjooQE5NidNiQ1UIxNdL0uNA2kGpH44aibXDFAGwMlSUkaSwHJxca5
	 moC624UY+yF3A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33CCD3805D89;
	Thu, 22 May 2025 11:20:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] One more Qualcomm Arm64 defconfig update for v6.16
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <174791283274.2837630.7567033360389068121.git-patchwork-notify@kernel.org>
Date: Thu, 22 May 2025 11:20:32 +0000
References: <20250520025119.40021-1-andersson@kernel.org>
In-Reply-To: <20250520025119.40021-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 19 May 2025 21:51:18 -0500 you wrote:
> The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:
> 
>   Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git qcom-arm64-defconfig-for-6.16-2
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] One more Qualcomm Arm64 defconfig update for v6.16
    https://git.kernel.org/soc/soc/c/a34a3ddc6b32

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


