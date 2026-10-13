Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ED0A51B174
	for <soc@lists.linux.dev>; Tue, 13 Oct 2026 16:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791907846; cv=none; b=NxL89D+yoy/TnzrCeqN0g/l1bXvK8kNYsEn+ABNCEYtEnjcxTGFtAWrOHW4SHiGuUmxC3lpXkCAxaaxP4Cdpbj3SDlhg4bXE3dwqWEmn4eVzCYTFtx8XkTjEVbztFpxpdBluY71pwsDGjfT9KousQukveGdUSGqaQKnsUYRyWEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791907846; c=relaxed/simple;
	bh=twnpT+U9o23BJVwRHOvDFdRNyH6Psko8DgOKU0JFbTQ=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=uIUvkaw6JShj1d9UL5vdHf4sRxe50TYoLvnPKHsl5Malr+qn8WUEJmPu3pGM8GiE+oiLYnJAufbjAKjSoKT4guZmkZ0Z3N/pvoT/8E+Qn6uKtYt6Ca7WSxbRkA+kFWkSGLA2fAmIiQJcizwBb2W/4LGUXTgfRWAqtGsuILrOGps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FODk8WpZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FODk8WpZ"
Received: by smtp.kernel.org (Postfix)
	id 5A0CE1F00899; Tue, 13 Oct 2026 16:10:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 439201F00898;
	Tue, 13 Oct 2026 16:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791907845;
	bh=+RnM/Ln5e+0peVHc7nlzBfYP6VMtZ81b7aKGT1tOm6Q=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=FODk8WpZjNGwG6WkZoZBxhwp6yAa4KfJBtmdMRTw2OYy5icTU7obztRRk0zYa2ker
	 HkHQn+VsJMODPpIlvusgU5VtpAUNFgaojRpvoBAzk5+zKtGpt5m1FLYAtdZvdeuIZ4
	 qt5WCbhmulLGcFTJGYAF/5PT1DvP/vJXoN84ff0fFPvBH9yqjXXlGplPfwchoBskkJ
	 dAek6gxZuVR32RLfp5VOf0iTnotr742CMU75uAv5CGlAyOkb3V6u10I2uf6J7EoX++
	 7ublRssbzJ8/Xis8bCOVqgLjpjk89DGrlzfBD6JN1/76hqkRVjZchIUotN5EvfdZsL
	 VlQXPHDfAuGKQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3A29339D5FD8;
	Tue, 13 Oct 2026 16:10:45 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/7] Device tree bindings changes for v7.4-rc1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <179190784376.417156.11183312983794596980.git-patchwork-notify@kernel.org>
Date: Tue, 13 Oct 2026 16:10:43 +0000
References: <20261003095924.1370238-1-thierry.reding@kernel.org>
In-Reply-To: <20261003095924.1370238-1-thierry.reding@kernel.org>
To: Thierry Reding <thierry.reding@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sat,  3 Oct 2026 11:59:16 +0200 you wrote:
> From: Thierry Reding <thierry.reding@gmail.com>
> 
> Hi ARM SoC maintainers,
> 
> The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:
> 
>   Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/7] Device tree bindings changes for v7.4-rc1
    (no matching commit)
  - [GIT,PULL,2/7] ARM: Core changes for v7.4-rc1
    https://git.kernel.org/soc/soc/c/017f5744ffd8
  - [GIT,PULL,3/7] soc/tegra: Changes for v7.4-rc1
    https://git.kernel.org/soc/soc/c/eaeb993aa8f3
  - [GIT,PULL,4/7] firmware/tegra: Changes for v7.4-rc1
    (no matching commit)
  - [GIT,PULL,5/7] ARM: tegra: Changes for v7.4-rc1
    (no matching commit)
  - [GIT,PULL,6/7] arm64: tegra: Changes for v7.4-rc1
    (no matching commit)
  - [GIT,PULL,7/7] arm64: tegra: Default configuration changes for v7.4-rc1
    https://git.kernel.org/soc/soc/c/be8c7a788adb

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


