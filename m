Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9565732A82A
	for <soc@lists.linux.dev>; Mon, 15 Sep 2025 14:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757946618; cv=none; b=Z9wreAOoRn6wL9jkxUr57E5ClgYEXDxiAm+qfKfmSJ4xJAllx2zFiyJx079RDdxpL3O5qCXkAErJ3sDaw6ti1RwFqwi/2McKrt2Bx82HRWDPW6k/4PT0VhEemyvbIALSQfAc1WxxunZkNgVSijfA0AkmVoo8QTZ9QvZDgy5rhhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757946618; c=relaxed/simple;
	bh=oxjg3GC294VZeAqQzOfJ4uuMETDKEDq6Ox7Y1cqeP78=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=K5WSYIclx0bNiEymfzsHu1i6lPAkLVR20Kq8h7icO3DD9EvZlUyCMdZN7ZZA1oxrRvVR5JIy7i5n5uqXUHVZAnMgc1rxieCLNydsYGWMLwS1rNnR+oRmCFUVH9VahfDs5LuclKnldM26aLDWWZTJKoEAjUyqum5koojgMadsS4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nzOA06FL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nzOA06FL"
Received: by smtp.kernel.org (Postfix)
	id 83C72C4CEF5; Mon, 15 Sep 2025 14:30:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E2B2C4CEF1;
	Mon, 15 Sep 2025 14:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757946618;
	bh=oxjg3GC294VZeAqQzOfJ4uuMETDKEDq6Ox7Y1cqeP78=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=nzOA06FL46c4C+KXCo5JRa/jLaXDT5l9G6k8TrpMMv82t4J57OdoOzh6IBrS2DFTB
	 kpekVSNMuk5SLPFQIKDXSYfxqQ4Lw61F6m1zRyFnGQ7EfI/DPTTYMGwKzQ/jiVGfRx
	 ds9xISH4w3teDuTjDU263913JVrpP5qiSkgo+mirrE6C/sep/jO0FVD++FrGKbszUx
	 YbzZC2i/DA+PQMSTQyNqu1dkl9UbytC3a2Hu0FaG3mdpyF92Iu1vRXU64ZWft9cDUs
	 ow5srSnmDocpwiyB2dorxP/HLAHxOJuDLXeg8lBjWDONspCDgJuas6GTSHPVB6AmiT
	 8nwlFskGRH9IA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33BF339D0C18;
	Mon, 15 Sep 2025 14:30:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/4] dt-bindings: Changes for v6.18-rc1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <175794661973.4799.1161342780687613433.git-patchwork-notify@kernel.org>
Date: Mon, 15 Sep 2025 14:30:19 +0000
References: <20250914063927.89981-1-thierry.reding@gmail.com>
In-Reply-To: <20250914063927.89981-1-thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sun, 14 Sep 2025 08:39:22 +0200 you wrote:
> Hi ARM SoC maintainers,
> 
> The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:
> 
>   Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/4] dt-bindings: Changes for v6.18-rc1
    (no matching commit)
  - [GIT,PULL,2/4] soc/tegra: Changes for v6.18-rc1
    https://git.kernel.org/soc/soc/c/b7c0fe165451
  - [GIT,PULL,3/4] ARM: tegra: Device tree changes for v6.18-rc1
    (no matching commit)
  - [GIT,PULL,4/4] arm64: tegra: Device tree changes for v6.18-rc1
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


