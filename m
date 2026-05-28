Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCB723672AB
	for <soc@lists.linux.dev>; Thu, 28 May 2026 22:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780006226; cv=none; b=KicMtHtTZgQooGsa37CivnNurTYP+rl0V7Wendq9vyerAt9YZ7miWwFQ+4AGGDVkb41Xmlmdtntyb937zjnxmBB9SemKPoTZQln86Ul/Y8WD/nWpx53Dzd/FcgDOlMUJjJezFh0skpTXgSkI4FPlv8m+oT7ArM/YVZotYWOmqiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780006226; c=relaxed/simple;
	bh=pJC67sxvXLcSNq8uKUCthElukCqdPDRBwi3RpEjop7w=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=uHSmB1PcUFYYvgW/SS973967XaG7BQ9fEzCCY/QAm4dFoADAIa18yKcwryDI9GhqzdGixr4W17h5bmyJFLiGJtVosXxOMWGmqcPHxWY3eadGBn2nNsXsQb6+mSYrtCsHZ24ton8lHGyv/XsJXtN40wmPv/3+iptZPdYpGJ+r8Ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KjUGxgdQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KjUGxgdQ"
Received: by smtp.kernel.org (Postfix)
	id B8FB81F00A3A; Thu, 28 May 2026 22:10:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A30DD1F000E9;
	Thu, 28 May 2026 22:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780006225;
	bh=3uFPxsBbZ9mcBUBE/UzKA7ccY/KMO5J3EF6ugSAKkvI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=KjUGxgdQIMCDhiXh1N5vkY2ygfzg4E6fJ7+7bZk2Y53+6BYXWEDwoM1jpB0XlhJoR
	 EsqNoLQDwGb4oVSKQBqdvhf6Euso0ZieJMdfoLP+THJTyxg6YMufIvI3RcTYhouC8c
	 XoIHf2QQjA8bXpgl3gBSHaQJHZcMfcbaAR4pkaMpmRxNANPQx9XvjBLexZYSiO2ZGr
	 NWVxtEryt8s0K07rGx4rpCXUweSsPZ3MsYs+gvfrul27t0eMoN9lsMsOUBulBbktBo
	 dazmDRnQV3RNJWXNmduHKz5kOwMG+aaB28LzPehVpYJcbJdyCsS3bnEBldARqwKLNQ
	 A9X/sF1RsAZwg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 199443811977;
	Thu, 28 May 2026 22:10:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] QCOMTEE fix for v7.1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178000622963.1533055.8648642240639870383.git-patchwork-notify@kernel.org>
Date: Thu, 28 May 2026 22:10:29 +0000
References: <20260521141522.GB1708231@rayden>
In-Reply-To: <20260521141522.GB1708231@rayden>
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 21 May 2026 16:15:22 +0200 you wrote:
> Hello soc maintainers,
> 
> Please pull this small fix for the QCOMTEE driver.
> 
> Thanks,
> Jens
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] QCOMTEE fix for v7.1
    https://git.kernel.org/soc/soc/c/c6066e3295fd

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


