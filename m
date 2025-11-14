Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32C9822258C
	for <soc@lists.linux.dev>; Fri, 14 Nov 2025 23:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763162561; cv=none; b=pCeByyolHiVkSZeellyltgM72vE787zQNaWKaHSZMswR1o/MtrR66OsMhIN9iP1MWabeNwW6Uc0DRXjVuKgQSXayA23BA9BB4ICZFlxPqKglUtuea/cH4DoBTnEhe+cn3ddVlVPlx7PZ1AEDKlMBh6LAp+TAZUxy/mJw1NsQYb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763162561; c=relaxed/simple;
	bh=LXxfDOilbZpyn56POwyp4Nat/kGtkSaHT3TkOy7DZx4=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=jExHKoyMMi5knWmfZOoPTHvnQSPvF7o4wlPgliNU470hgWVFp/FXgTL4lB0eqeexNnQdjFOs+vgTtd4vW2+opUeggkd9UW6P9/zO3JOMgbB3QyhPJj0/eUPKlg6YZT1Kb13laaYniFlZcli/oFY8OWbFe+08ov2Bdarw1LZlm2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m9D3Jz3E; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m9D3Jz3E"
Received: by smtp.kernel.org (Postfix)
	id 22CC5C4CEF8; Fri, 14 Nov 2025 23:22:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D8DDC4CEF1;
	Fri, 14 Nov 2025 23:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763162561;
	bh=LXxfDOilbZpyn56POwyp4Nat/kGtkSaHT3TkOy7DZx4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=m9D3Jz3EvBsRtGvkLrOmkue5ez0aiHBZJYkuwPY1sx6HMuEZEeozhEYr7+GkJ9oap
	 s3nRtu52zUX9hdOGMPsFeedL4cF3HEa7gBAeZlwePTB2PAGa2g373Qy7oltjPYaItf
	 aFItozPLp9XZX6gdI/bYLDbqk7VFOXGcEg3uIZzruWW5Q5Y/sS4zVhQOkRJdfxrIzt
	 3C3i3ZkGsrPgQL9/7KxzLr6AaQ38HH5/8wIHW1QVcILHu8nq7wvkOrGAFaFTRVOhGb
	 T3Q+yJACnr6d420/VwpKdgBgzwmW1f8FxgcHtV8KjSkinsSAtkSykg/5zxup2d6DCN
	 x9fa7r8NLmwMQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADE0C3A78A5F;
	Fri, 14 Nov 2025 23:22:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] i.MX fixes for 6.18
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <176316252949.1867843.6390009464770238754.git-patchwork-notify@kernel.org>
Date: Fri, 14 Nov 2025 23:22:09 +0000
References: <aQawyJZbMn52EKk_@dragon>
In-Reply-To: <aQawyJZbMn52EKk_@dragon>
To: Shawn Guo <shawnguo2@yeah.net>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Sun, 2 Nov 2025 09:15:52 +0800 you wrote:
> The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:
> 
>   Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-fixes-6.18
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] i.MX fixes for 6.18
    https://git.kernel.org/soc/soc/c/f4f012b0ee1d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


