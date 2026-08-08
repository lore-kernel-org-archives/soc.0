Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5907B3164B4
	for <soc@lists.linux.dev>; Sat,  8 Aug 2026 20:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786220510; cv=none; b=i1Bc1oN57TqYUJtw6VLFiAOZVTj4kKqbPQph00jnsFoo11mAHAfC+NUELysK7U40PDz+Saz8zZNYhO5KnlZ1Ds9Lcs7Q6uegF1DCmkdKmUnZ6uu56jhXpOjpuzMLBZtEqDf1aUr+BymQLgxXa0ZbIdehJEm78L4Vfw91f/dVhLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786220510; c=relaxed/simple;
	bh=dWUmU4foOVls23Tl2APxtJFiomfMW3ejC4ifg1kOyMM=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=PQMPDiJfy+Oc6zhHuc5PTZqZSJJP4x7fYBUbuce8GLIE6nkGW6rBP080k0XMR4FpPg7v33WeaM/SVEKerdIxxQtuvVq4FFmZphBDTF4ngnalnzeQ30ME2KDvJA/VB/8J8qxhkeKl3OtOv//1XEIZBmBDhbTQ6OjS+gzBQuYrezI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GZrBUzaz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GZrBUzaz"
Received: by smtp.kernel.org (Postfix)
	id 0D0781F00A3A; Sat,  8 Aug 2026 20:21:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB0401F000E9;
	Sat,  8 Aug 2026 20:21:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786220509;
	bh=EcsZ++0R4C7uREQTRPOCZk9dH/YnAhBQlx9+I59oXV8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=GZrBUzazEznmqIHpW8cn6BGoFQUg52djj438bYTPtFLcKUt+kC8HbNEDS662tFFSl
	 b1KzdcopXlL5dl3x4fWTq57NKf4tMj0Y6ZiKKTX+MbeLhYtv1t1Aye7DVQpfP6sgch
	 C43iD2XeibXDfGz4wK0lONjPeXmra8hkD7mc3gpcYyE6pGEMJoapYIKPRB2FopR2Vs
	 CUpzeqBTEtB3LujMni52jVCfHhu3vsqzIeIuRvodz4Y9YGsRkpjFQi4n3TGQZmq8mN
	 VcgMomoVCRkHwZfopvNMAUv44/wHuJGbWBIg4iY+J/NSMmobV+Ef7PBMM4sGl2Q8Ff
	 wZ000dhpdcI1g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 19857380CFFA;
	Sat,  8 Aug 2026 20:21:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Allwinner DT Changes for 7.3
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178622046663.2748994.7034257544736119166.git-patchwork-notify@kernel.org>
Date: Sat, 08 Aug 2026 20:21:06 +0000
References: <anC-91INc6lOHrg1@home.wens.tw>
In-Reply-To: <anC-91INc6lOHrg1@home.wens.tw>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Alexandre Belloni <alexandre.belloni@bootlin.com>:

On Tue, 4 Aug 2026 00:16:55 +0800 you wrote:
> The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:
> 
>   Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunxi-dt-for-7.3
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Allwinner DT Changes for 7.3
    https://git.kernel.org/soc/soc/c/ff1d40db2116

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


