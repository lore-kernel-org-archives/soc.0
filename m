Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8803E283683
	for <soc@lists.linux.dev>; Fri, 21 Nov 2025 20:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763756550; cv=none; b=pT8m8fi5NmITDdfIE9jyQbyJ2HKKhFKN3CsDtXTPJ2AwdgWmrUvSBiM5UUPi1RkJkm/GiechDuYKw20aL2KDi6NYKgcZ1rGgZJiT/j9jFoJ2q0uSxxYNSw2AOfScDPuK8LAtZgj14v+m815iLfeKewT7Bsx+Wkjmv8AaUjYb0ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763756550; c=relaxed/simple;
	bh=C4Svv/Pawy5M/tajpvG9Z3ALFwc0qRaraiPOB27mBO4=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=qfa+Y4PW+P/Ahh0g1QGipo88wNNsVuEtD9tLw2zgiAf63OAfETEr1C8ekOToxr9BCt3sigMd8Jpo0w09/Xd6gBspcsZEZcXYDIFHY3Pul2Bv9ZedpVMA/YXMtGjAwJ26W5IsvW/ggQ4lnWOcAkOwAKk7SQLjQjY30WQDR2+k/BI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t/Z37bFT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t/Z37bFT"
Received: by smtp.kernel.org (Postfix)
	id 2E24FC113D0; Fri, 21 Nov 2025 20:22:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18AF6C4CEF1;
	Fri, 21 Nov 2025 20:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763756550;
	bh=C4Svv/Pawy5M/tajpvG9Z3ALFwc0qRaraiPOB27mBO4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=t/Z37bFTMGFLg3CWZkkv39ybxTl/XO+lI6+O0RTecMq7KLYiIxuBryiu974AO5VE2
	 FV8SVlEIwRlqFh2L9ANmvCcYoy8rIo57ckE+oepTiKnhtZCQbjfhCbGDk0jzfqQ2Kj
	 XSinmImVcmQcIj9M86Ltm3IrRl92lt0KFzuocoj/g32iweaE7L43F4OIgHuLJUW0Sa
	 KL0FlcEUlpyf1K3lyOI4oXG1spsosuxYOcpFgjaNXk0Q7ES0xFfG3HFj/6MjHVSyOf
	 cI+/OScga+K6DRXtod9g3ZFjAza2wGBooerLpt90sraleivGLinWnX/fGJrMe/LB0z
	 kF924RfjEPDpw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB0153A78A68;
	Fri, 21 Nov 2025 20:21:55 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] RISC-V Sophgo Devicetrees for v6.19
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <176375651474.2571237.12900239081500714192.git-patchwork-notify@kernel.org>
Date: Fri, 21 Nov 2025 20:21:54 +0000
References: 
 <PN6PR01MB1171757716F06749DD0AED288FED7A@PN6PR01MB11717.INDPRD01.PROD.OUTLOOK.COM>
In-Reply-To: 
 <PN6PR01MB1171757716F06749DD0AED288FED7A@PN6PR01MB11717.INDPRD01.PROD.OUTLOOK.COM>
To: Chen Wang <unicorn_wang@outlook.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 19 Nov 2025 15:24:20 +0800 you wrote:
> Hey Arnd,
> 
> Please pull this dt changes for RISC-V/Sophgo.
> 
> Thanks,
> 
> Chen
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] RISC-V Sophgo Devicetrees for v6.19
    https://git.kernel.org/soc/soc/c/314bfe59ec2a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


