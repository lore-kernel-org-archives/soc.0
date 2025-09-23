Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A07B3263F38
	for <soc@lists.linux.dev>; Tue, 23 Sep 2025 21:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758662472; cv=none; b=MkuaJFJ8e3rHeuDtbmslfrUg4RtR1uepctIgyePyLhiV1TNZiY5Ex+Rh/mTdoHzwXXa8M7YA08BLZEfOR8E8e8yk7jNWzKlMfL6yfNEre9QILoqhiqIWE1kcVAB6T5NnrfcenUnvQ1Hpv0EieR3i0LMmBQJDAa/UsrsI12QOuuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758662472; c=relaxed/simple;
	bh=p49K18sJVcf4pyRhsIyV2MOcKlJsD7cyWt6zYb+OHrc=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=sx8wtkrU/K0+3vvHr2AYOxW6JxIxq/SC9PhuUjz9jmdOrRcrcQQKVMbw97Hx9x7mNZ6suZYc1TCHJMNFxLXEZ9Y0GSdyQsTU0Nb5eS7TB/jFMkyuqhd23zISbn7WiEkTTjy16DZyYDzrDfus/fopmCrPT0yum2oT7Xjww9PpJGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MWlmlJgU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MWlmlJgU"
Received: by smtp.kernel.org (Postfix)
	id 8C57DC113D0; Tue, 23 Sep 2025 21:21:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76E41C4CEF5;
	Tue, 23 Sep 2025 21:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758662472;
	bh=p49K18sJVcf4pyRhsIyV2MOcKlJsD7cyWt6zYb+OHrc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=MWlmlJgUfZuP/RRDfq54gf5TKNhslhDJ8ZXToSPUJnJc/512uK7xeh0uGfl0Z4rJ2
	 0GjrV8VEezyfYjkUEtawYoA1M7V/Q6wW8i+1GERmZsq3Mvl4y6meIY6iVRZrTe1VDH
	 GbCZk1Dvwr+e+ro36qHvWEOd1DzK3BHm6IIo9s8Pji4ItLvHX38UNLkcOs2jVCJqkk
	 R10sEkW57XG/XYCjIinDnxSqoSXPMV1TBQf+W3/0r6mIbG744qOwS82jTmptLF5qWj
	 6//xr/0TISox995udfqYE1WAUqIa2IaWfSD4uGT7MYSkpaTSJsI7SLhR6evKKGg4dE
	 Ay6ZWyMZvdDjA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADED739D0C20;
	Tue, 23 Sep 2025 21:21:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Allwinner Device Tree changes for 6.18
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <175866246948.1926563.13267491425952435899.git-patchwork-notify@kernel.org>
Date: Tue, 23 Sep 2025 21:21:09 +0000
References: <aMrtuZg8HlR--TAt@wens.tw>
In-Reply-To: <aMrtuZg8HlR--TAt@wens.tw>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 18 Sep 2025 01:19:53 +0800 you wrote:
> The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:
> 
>   Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunxi-dt-for-6.18
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Allwinner Device Tree changes for 6.18
    https://git.kernel.org/soc/soc/c/17752efeca09

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


