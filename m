Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 509FF1F3D56
	for <soc@lists.linux.dev>; Mon, 15 Sep 2025 13:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757944271; cv=none; b=CO3Yz+QRD3gH1ilNN976E6CXt5Q/tJzLiS7uXk0KNYJBbu/71IOMcMyQdasMpKWTFFNYyb29LjcJFuJLHsfrzx5kNXbkN30j79HN4Sz9xaNxc1ampxdnhJyLQm5XcLLsCPf5OM3xBidkvPhpmhdJ3tfyBigWCgoA3w//tsNnhr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757944271; c=relaxed/simple;
	bh=TmgIB+luBtZ4ics8fK4OxypR8DOBSzVPb+H/VmeFe10=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=ff5AlEEbiopdK2f+B6BjanrnsKOYVBPb4KbhHiZed+UrpWkIHM4YaN2Xq6MJlcsBOIl/e85dlLHcEl8omJJF1RtMy0mJ+WffodQIH/0L7xs98KXMAAIpvwuvDwaQQ1tXeK6W1s3wBz9NDPpCDoJEGWZze55FNWOCYPqEFZI4oEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iRk8h3Vo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iRk8h3Vo"
Received: by smtp.kernel.org (Postfix)
	id EA98AC4CEF7; Mon, 15 Sep 2025 13:51:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D52AFC4CEF1;
	Mon, 15 Sep 2025 13:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757944270;
	bh=TmgIB+luBtZ4ics8fK4OxypR8DOBSzVPb+H/VmeFe10=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=iRk8h3Voy0bhOGjoT702PpUAyAkkGUwUEPVgoHY6ZuAkghtgO2LHle5et0gUJHUuZ
	 O4E9w5LbqU53xaUHLbLms8PpkYCmguerBUvdV/NZM4EUiuY8idKmompOAGneFMhGaw
	 ETsUGqGkabiMosDRZF963SQhj906nqo/VgjHE9D+l2WIrHfJ6ldtGfc/jmlPA0BWcR
	 aNg4oUlmDrjZwxVThyS/ZnxI4WwY6snlP7H7suBOiWuypBllvmPmdcI+VD29KdgVB2
	 KZ8ceOZsiI/Nps/GkPDxgT9ySWGEKpTStDKGdVKZbs4viMnVXgMNJiZ7V42iW3B+OS
	 drOwgNIo77GcA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 9E8E839D0C18;
	Mon, 15 Sep 2025 13:51:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/2] arm/arm64: defconfig for v6.18
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <175794427259.4179625.9839366868113405698.git-patchwork-notify@kernel.org>
Date: Mon, 15 Sep 2025 13:51:12 +0000
References: <20250909180127.99783-3-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250909180127.99783-3-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue,  9 Sep 2025 20:01:26 +0200 you wrote:
> The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:
> 
>   Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-defconfig-6.18
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/2] arm/arm64: defconfig for v6.18
    (no matching commit)
  - [GIT,PULL,2/2] arm64: dts: samsung: dts for v6.18
    https://git.kernel.org/soc/soc/c/54a5a6041bfc

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


