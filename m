Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ACCB22258C
	for <soc@lists.linux.dev>; Fri, 14 Nov 2025 23:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763162570; cv=none; b=GaoYlYAcCvUzTmTc96VBUh6aDL6zQlwVCAuFgmzIo/hSq+gGqp4WceXytjgTHtrfQnQyD/hHUfbNvBYONy0GiIlGvvWvkG/fEtR1kY3BJdCywPj8iBeONtQ3ymDUQ85EKeuePcncaS+ukjVkDteyf/jCbZ8x9zlzqZfG+UylWug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763162570; c=relaxed/simple;
	bh=bWICk52PyavK09sxDwLdO4vNWBaOGwWGi5YcXzh+ho0=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=BxTlF9BFGus0kLyqSZqMlGpbrrXKdW2B5BF77ksNk8u0+LdNu4lz2GsHrjS0FBXijvvXxXYOVCTBB3lizOPZ2PnT6xry2IqxauD6+d0yb8WtYivTt5fY9g/IabiwkZpjRlwGA0fdUChUuYpuZ702lnuc1Q5cjt1Vyk0tJA0toxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=knhkr/MT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="knhkr/MT"
Received: by smtp.kernel.org (Postfix)
	id CF431C116D0; Fri, 14 Nov 2025 23:22:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B96B9C4CEF1;
	Fri, 14 Nov 2025 23:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763162569;
	bh=bWICk52PyavK09sxDwLdO4vNWBaOGwWGi5YcXzh+ho0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=knhkr/MTiFTp7hhthtfi+cCa/i4NAT01AAqfMPXyqBbixv8vqCErU6p7rHY43XhPY
	 lh17Pfnq/gkSmge0NRq5AgKMYFk9+Bx4GT6b+fqJFL+X3FCpFmTbDe5hSXSRTjQZBZ
	 PVKMHot9jA0RKJCNokBJrurCC5nlB1KOMi+MeVKOgUXoAozCbTV9J5IEnheE5u3IIm
	 ScXKZoMzd8dGJaUtZbxykrm/7+nJIDrFnjwKETz98fM97Ke8/KxyPJodtJP/IIlqIf
	 FTXgfSFTIX9edQEzheexGsXcn3nNphBFg4xHpOtjsLTKOCloE9Yn+lJY7FvAn8WBXJ
	 ChPAY4VJCWQHw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70CFE3A78A5F;
	Fri, 14 Nov 2025 23:22:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] arm64: tegra: Device tree fixes for v6.18
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <176316253824.1867843.1060537600872619306.git-patchwork-notify@kernel.org>
Date: Fri, 14 Nov 2025 23:22:18 +0000
References: <20251030192007.682116-1-thierry.reding@gmail.com>
In-Reply-To: <20251030192007.682116-1-thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 30 Oct 2025 20:20:02 +0100 you wrote:
> Hi ARM SoC maintainers,
> 
> The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:
> 
>   Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] arm64: tegra: Device tree fixes for v6.18
    https://git.kernel.org/soc/soc/c/3e40c919816d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


