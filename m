Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793571427;
	b=JpY3XtYpBEDqj6xyzxJOvmaA93ZDQp7nXcKmVaVjoTMuiGsHs4YBwnAqCBm7iPpM+gdn
	 WD9oSLB+5pGGlvNY6X/0RaRuKP5VxyQptD86h6picWTGgRg4v3Wu7A8p96kUsXA8BcRy0
	 /+JrOd4Nob3rXELFOwETiqqtGVZEeULOV7Q+DCHt7L6UUF+1kIVnAR8GYF3rq+aHkXIUc
	 PmFfpYhQSV93sMQGHjZis+yksqVKux+aMycbY9udKYaodV7mgGz1FC+trXUJadlyFmFDJ
	 O2J0l23Sc085JakODTWjXZGf4+sO6zxwD9hoCTDq5RoLXu2arePN09wf20zWAUwBisA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793571427;
	h=Received:Delivered-To:Received:DKIM-Signature:Received:Content-Type:
	 MIME-Version:Content-Transfer-Encoding:Subject:From:Message-Id:Date:
	 References:In-Reply-To:To:Cc;
	bh=pABWBHR6n+up2I9bsewaTlF6DKSaIiqbqtQFSLN20TA=;
	b=ns7Xmx7zIWUuLFx7MiKlceqkl6TU8DSSSi31NWGE99nIgTHVVboWnMufV9gzhEsYlmbg
	 XlOEkUIB7cJQT1BNB0nzk1KjJfhjXnW77r1lNI7XM4WozvCqZEkw787w8lopSoPrDmQ0S
	 NOjZGg2mOm/q3GoCNUdqzgytDXjKzTqmy2RMe7FuKaR29CxQwKBtIgE83vPm23U32PECC
	 cZh7x2D3UGBWkqY/tztMY1RvsSGZZZJkaeYNWy/wTKxU4bDoZZmDYyER2Y3SCk2l+jeNN
	 hWlUT5y5uttZNl0GKWOm6jzYPgS2PJx7RMjoSlR432EZ5kHDyYc0QSPy1xZIPkktmDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="E4IJhKC/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAA3F607413B
	for <soc@lists.linux.dev>; Sun,  1 Nov 2026 22:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E4IJhKC/
Received: by smtp.kernel.org (Postfix)
	id DCCB51F00A1C; Sun,  1 Nov 2026 22:17:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C44141F000C1;
	Sun,  1 Nov 2026 22:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793571426;
	bh=pABWBHR6n+up2I9bsewaTlF6DKSaIiqbqtQFSLN20TA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=E4IJhKC/2Gm5SNOrDSZdjkrzCnmP6i9DgWi4yHtr2px/rWfBfrXoPUU0oWHORzvxH
	 bj8BYLoxYLEfRTMGEpwOkkO9EkcyIPRheuyqq7wJqeLRHh6W7MAxwCc+XAet85nVaX
	 YEqRtXYorAv045u6KSbq7DQTS1IdaSXIJ3LZi7lRfL9u4QKI9QDkezu5qfJIQYSJEi
	 b3ydJC9uRHOyhfNMqECILA0kUohpVp8rP2Nt3rTzunadNlsE1wdDarp4lAaggxVnTP
	 K2HUyDWJWOHqi2QJSUki5PcRfk1Rtva7PEWGuJcXcrYGG5GNxSnbpBQ8JwCNvqHnhX
	 F++ZNWC8c9P+g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id BA14B38003B8;
	Sun,  1 Nov 2026 22:17:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Post: <mailto:soc@lists.linux.dev>
List-Help: <mailto:soc+help@lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
List-Owner: <mailto:soc+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] RISC-V Sophgo Devicetrees for v7.4
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <179357142529.2624073.15824616848622379697.git-patchwork-notify@kernel.org>
Date: Sun, 01 Nov 2026 22:17:05 +0000
References: <aff6ff25-8969-4a35-9543-9113afb2e003@linux.dev>
In-Reply-To: <aff6ff25-8969-4a35-9543-9113afb2e003@linux.dev>
To: Chen Wang <chen.wang@linux.dev>
Cc: linux-riscv@lists.infradead.org, soc@kernel.org, arnd@arndb.de,
 conor+dt@kernel.org, inochiama@gmail.com, sophgo@lists.linux.dev,
 gaohan@iscas.ac.cn, lihangfan@iscas.ac.cn, chenyou910331@gmail.com,
 andrey.lalaev@gmail.com

Hello:

This pull request was applied to riscv/linux.git (fixes)
by Alexandre Belloni <alexandre.belloni@bootlin.com>:

On Fri, 9 Oct 2026 17:23:58 +0800 you wrote:
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
  - [GIT,PULL] RISC-V Sophgo Devicetrees for v7.4
    https://git.kernel.org/riscv/c/5d299ec9395e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


