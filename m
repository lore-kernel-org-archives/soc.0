Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3997B225A31
	for <soc@lists.linux.dev>; Tue, 22 Jul 2025 20:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753217429; cv=none; b=UR1/C0lniGF8rdg9f9FmTbIItR5+YDyBiLaQyS5gkYLcVPhOkQYJ1aiLGQiZx9+LHG+QWkdTO4caG8A0fE+GNaj86OHRXn7EjtWyqZR2UZPOLe3ZuT31W8jvWNIG6sO2YvwIRNa1p3cFOMEgPxXaHbdNcvhrhlFbVpbU97utPts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753217429; c=relaxed/simple;
	bh=DqessUVeA8wYFP1OZ7m3gQugxK8RYXA3QZoWNr6kI+U=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=DgemBptVX0SRAA3qjVoLQSQHqGd7+cfqEdoTTWHKeCixgxQ/Z2y+YwqsDamtpIz4/sIdLAaOd6VRHDhkCwgyQxSjs4wopofjkwkFmYTdQkFGcRfB3BHbJ6iHdlWxWHGTkxVIRUAFE1A18W1z72eb5D8hhRTMvU7m1NGCQV0ALaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WirLv11k; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WirLv11k"
Received: by smtp.kernel.org (Postfix)
	id D05CEC4CEF4; Tue, 22 Jul 2025 20:50:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAC26C4CEEB;
	Tue, 22 Jul 2025 20:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753217428;
	bh=DqessUVeA8wYFP1OZ7m3gQugxK8RYXA3QZoWNr6kI+U=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=WirLv11kUdETNd5tDnBaa11ENSsnrxLSjbcjJrSwqgy3vqRt9vhhLC1127O8kDZOo
	 Spf9rdm+ajuC+wd5BNhjlHRGEPZ8NJv8K33FzeOKNFzfouwnWsBNszWxNj5TQC7/Gl
	 nkzCKT9EoiRM6qUpibX5SAOYt4Oa9VsOVzgUk7UV/HM86zOoZUbJOh4ki0QiGxzwXu
	 zGc2yRLFfE2syW3xtZuvzNtsEUc/M/D7irVutoPILYCXja7wp52CEv+25myO36fdUC
	 Jf7fsR42PWfI/jjQO34g4sEDMNcqZuofYeFenlunfm7cbuPKXXhrBShbZpHUvspIZE
	 T17S6zUabMkiQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70D44383BF5D;
	Tue, 22 Jul 2025 20:50:48 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Allwinner device tree changes for 6.17
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <175321744724.949540.137801409661082086.git-patchwork-notify@kernel.org>
Date: Tue, 22 Jul 2025 20:50:47 +0000
References: <aHaQFe3Lr8Qzyb1M@wens.tw>
In-Reply-To: <aHaQFe3Lr8Qzyb1M@wens.tw>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 16 Jul 2025 01:29:57 +0800 you wrote:
> The following changes since commit e04c78d86a9699d136910cfc0bdcf01087e3267e:
> 
>   Linux 6.16-rc2 (2025-06-15 13:49:41 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunxi-dt-for-6.17
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Allwinner device tree changes for 6.17
    https://git.kernel.org/soc/soc/c/1037b300df2a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


