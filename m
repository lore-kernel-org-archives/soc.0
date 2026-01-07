Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 707C2341AC6
	for <soc@lists.linux.dev>; Wed,  7 Jan 2026 17:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767805415; cv=none; b=NTTsPoTXfghomag9Zogedb3+EVAY0S2P2MUkdb7EABa0RHGEe2QM+fx2xAARqFLpm4Ni6nLhy12rvj35BQz8fC87o/6J/7vFCWWaP+Hh57Cv/7hg0OElS8O8LiC5uqt3i1TD6ssBAEvfzmKWj2kUaKtX6Ng7CcRUPOZ77O/X1ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767805415; c=relaxed/simple;
	bh=LaRtlykgTLWOFtJ5k4B5SeA7N1VwGZJlqY1ZQziGEEM=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=OuYuvxNgHy/AVIeI4rqaHG3BL8xIOfAcLqWivKGzoq4HaUFwSW9NZTIq8J841EBeLdlh5CjXMO3rDf77D1XsZ7vQmolVfcQ7BJp5bwb1iM+nR5ENxhta+ma1DZOakrHFpsCGHbHJTm6o8E9raYi1nv1mmteun8/k1d3bip64KoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qoiMmyal; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qoiMmyal"
Received: by smtp.kernel.org (Postfix)
	id 0F47CC19423; Wed,  7 Jan 2026 17:03:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7B63C4CEF1;
	Wed,  7 Jan 2026 17:03:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767805415;
	bh=LaRtlykgTLWOFtJ5k4B5SeA7N1VwGZJlqY1ZQziGEEM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=qoiMmyalj/8mgG9thZl1FRfnyIm/qdqBgEbdmPyeEETwuC2Xy7c3i8jbCymLvo13O
	 6Cz6TY0RPyj7hpOqW+y053Bg9KLpW3G5lS7o/0sm8wAjn+qhqEefljME5eh1PBSU+Q
	 LiPq/UCeYmNNBwpH6TarR9w+u8YRYQSjQhhsXzHszcOVdzKNz9LQc6yjlO7WBiPYEi
	 z2kd2HoBAAz8jK/ViwP1Ea4cvr7klFxb7dELdqW6X1At8Du7nJz1qwXy3AkHXqxF3H
	 OC+QyGRiHtauLlb+6a8eR4ZbQQOehSWjuL1g3HjfOfoP7zMvrrxtU+mPL66Y9UIQlw
	 XFcXbSVUnafjw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3BA9C3A40FD1;
	Wed,  7 Jan 2026 17:00:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/1] Broadcom devicetree-arm64 fixes for 6.19
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <176780521177.2859028.18401607628484713700.git-patchwork-notify@kernel.org>
Date: Wed, 07 Jan 2026 17:00:11 +0000
References: <20251219204603.1016528-1-florian.fainelli@broadcom.com>
In-Reply-To: <20251219204603.1016528-1-florian.fainelli@broadcom.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 19 Dec 2025 12:46:03 -0800 you wrote:
> The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:
> 
>   Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)
> 
> are available in the Git repository at:
> 
>   https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.19/devicetree-arm64-fixes
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/1] Broadcom devicetree-arm64 fixes for 6.19
    https://git.kernel.org/soc/soc/c/902300d332a9

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


