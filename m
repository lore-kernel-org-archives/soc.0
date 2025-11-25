Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E08ACA5A
	for <soc@lists.linux.dev>; Tue, 25 Nov 2025 13:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764078646; cv=none; b=qjsVILoOTllExZjDFWnsG/DbOx/G0DjSMrrAtYVOx/faFyNiu3ZQpfMzus1r84IHJlkLqlPROXbfDB99iv4fHyDHexQjmnkRZMDlJpxFu6k20FGm1QxpzURGruCtHbz4lFhrsRVFB5NtduOywlA4319K1GqtTsQDpXr5t6jAikk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764078646; c=relaxed/simple;
	bh=15ZyKjRBYKovBwuo07/yIzeLfFX3GY0EIJcGd4xfeMU=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=rXd/YvRU+7Uq5Tel5FZJbpj46YMTAcSmpf84jpdbzDP5c8PsmQfxRxSYk0BGb9Vcba3f81J6G3DeCPFDrwN75q5ehvOrhEeu1dQsVCr1UGAnRuTJU8WD5df0zNiyz+BOJ1MrmaSVnapS70uyY4mumMylkL3dqjh5S3N6DZKg2Po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d84pvYrT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d84pvYrT"
Received: by smtp.kernel.org (Postfix)
	id C917EC19421; Tue, 25 Nov 2025 13:50:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE8F5C116B1;
	Tue, 25 Nov 2025 13:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764078645;
	bh=15ZyKjRBYKovBwuo07/yIzeLfFX3GY0EIJcGd4xfeMU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=d84pvYrT3OMoSiljyw8fzir3UcDYSOaO1aueTjp9hNLWt+0U/KKOdG44L+maOSVx6
	 1yWiKSbcbHpF7yw11KtXTEx0RLDGDM4eVx1M1iT59RecA3Jqv5mzb2K3BaDPNotuAM
	 Xg0hG7hKC9VOCkusOBoPKVOA1Tyhun4Q3ti3qUuc3mSRoE3I712Y34xh72QUp57OS0
	 OM7VBvpwIqoYq9vixbQDM8W8pFfDQEJ6jYUtuZj1BqyqsESw+cF2pLXa827lEyI5CK
	 crNK0XDFiiDBoCupKyDPZBEzAY1Ug0GiRvfoxqs966mmHlXOsYd0SMUKDZFlbh10z9
	 74+yVHAq28+Ig==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70C483A8D153;
	Tue, 25 Nov 2025 13:50:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] soc/maintainers: OMAP updates for v6.19
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <176407860826.736376.15156140555310710124.git-patchwork-notify@kernel.org>
Date: Tue, 25 Nov 2025 13:50:08 +0000
References: <7hqztwk1n5.fsf@baylibre.com>
In-Reply-To: <7hqztwk1n5.fsf@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 17 Nov 2025 09:30:22 -0800 you wrote:
> The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:
> 
>   Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap.git tags/omap-for-v6.19/maintainers-signed
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] soc/maintainers: OMAP updates for v6.19
    https://git.kernel.org/soc/soc/c/fe57a0a548c1

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


