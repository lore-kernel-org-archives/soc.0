Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FFE0272E6E
	for <soc@lists.linux.dev>; Fri, 21 Nov 2025 20:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763756555; cv=none; b=SlIU4RoO4eb/xM8BBqJRNSR40dCMVaKLGxxzOJVqoVshafn8qshZ4xWd/fXiHPtE4Uvno7aWQ0gLjutevLH590jXK9yosvRhtCIGfUBjwp3/AQsK7rSaCR9LL9K28K6sEILQ2Pmpt/UYttH7ITtqnbqPuI4rbbkf4wIgPWwSfKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763756555; c=relaxed/simple;
	bh=VcZKagZgGoSiuH/W+KbZEyJA18+T7QCftHlH0j85X+Q=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=hyObnyfRLEbdczaAnYgiB2/GmwP1zjtniuOuB40TjRMPToRLz79Oen8HPCBOSgROaqwj6l8LPJ3ZAmLYAkf130ZgSuFYRe/gsZAgdaFgjpVU5G9YrgBfkvXKy+pjmA/cHSbbyX7i9e7HaN3Y+jhFGv7upBs+1r82eVaWQqpqr3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P6Vjo152; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P6Vjo152"
Received: by smtp.kernel.org (Postfix)
	id AE6F3C113D0; Fri, 21 Nov 2025 20:22:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 991FDC4CEF1;
	Fri, 21 Nov 2025 20:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763756554;
	bh=VcZKagZgGoSiuH/W+KbZEyJA18+T7QCftHlH0j85X+Q=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=P6Vjo152wdrqwaqIyJFQSbyNkQ91loSwowAM+nYXOAtK/CkHIu9Xfv09bNeN79k9J
	 //U6ce9Gg1kwUhwRxzoPJ5omhHtA5nyLXtwxTaPO6blJF5EV5ggmS8UFhn8oIPh11s
	 IgkIM4xNWh0T0kbZUkhbx686KFgHt4BoyTcN4FywE1r0NFXFWb3R5RmKFM12EHibhh
	 aTTcxk93EFFVT+NsIQyl8N0Doaj7dmxT8A9ZTIZleAIUBPg3y27B+oePBmAc1xM6g/
	 0Wfto7eHTUIMAxafe25R3AaNsRZ4JWBRUwxbaGNuFy+Bpl+5MDRUNJGsCrZBw8Hxtq
	 0pEBDSKy0iFZQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70DA53A78A68;
	Fri, 21 Nov 2025 20:22:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] CIX dts changes for v6.19-rc1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <176375651899.2571237.3609817377336708743.git-patchwork-notify@kernel.org>
Date: Fri, 21 Nov 2025 20:21:58 +0000
References: <aR1jBv4cL0P5u8Pp@nchen-desktop>
In-Reply-To: <aR1jBv4cL0P5u8Pp@nchen-desktop>
To: Peter Chen <peter.chen@cixtech.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 19 Nov 2025 14:26:14 +0800 you wrote:
> The following changes since commit 211ddde0823f1442e4ad052a2f30f050145ccada:
> 
>   Linux 6.18-rc2 (2025-10-19 15:19:16 -1000)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/peter.chen/cix.git/ tags/cix-dt-v6.19-rc1
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] CIX dts changes for v6.19-rc1
    https://git.kernel.org/soc/soc/c/f0218293eef7

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


