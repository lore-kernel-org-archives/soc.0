Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFFDA51A128
	for <soc@lists.linux.dev>; Tue, 13 Oct 2026 16:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791907845; cv=none; b=oqESqZ8IcZzlrfGIx1FIVSV7v/2vTI9HNxbBkRQqeVGgNxjAy42wy1rtiW31GR6+ty5A/5Ze8JFlbFrUvmdOOR8YB6iyKnwQccggYSwaeMXzcM4t4JKyQUAIz3fAlb1FhA7YjELXwHseuUnXDHYvTJ0kYnB39ZtvxkFbUR7/wX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791907845; c=relaxed/simple;
	bh=KOpbQfdOkwr3I/AAz0Qq2OaqArTKCOWRgIcmeodYZyc=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=UI1A5Fp0bSdhAjTPzp2hv/bVMNDcKYc//bQT/qXcCchajm9D8iIReedDQu1wGfh1otr1dvwXq8Re4kaA7rIWbz8ORwT+yv3VuR9IBZ9fMrVZivMKNrjBDfLQvb6UX/X/E1LhetoR/2oVrhTXGrFapeCkqu/vf3bLouXvzauoQWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dr7xsoYy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dr7xsoYy"
Received: by smtp.kernel.org (Postfix)
	id D2FC01F00893; Tue, 13 Oct 2026 16:10:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC7481F00898;
	Tue, 13 Oct 2026 16:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791907843;
	bh=WQUfiwj0tIhbtk51qvYzOtK3/CtdWVW+okbhKoAWAOo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=dr7xsoYyT1stnrDeJ6k+Vo5eY+7daALarNzuhXaeIee9hJtSv4L1In1SYQcbvooo0
	 YdcL9B3079+00PdEn/YH9SaHZcJETibZcS3cvQa7uhGJWQab6mSmRkngQDh6oYx13+
	 bTB9lj4787SunMxnVHMB4aThjsHT94oSY3kvP2xt9lPEWoHGV/e4pKxTSfdSePCLXg
	 oLAeN3dNjRYRy11cf0LIZolzv46ri50uhbZuTKooIHkP+YUgvJVWYGFefen49ebtpt
	 ftYWN9QTReLNzJq7dQ755E+CFb7npkPuVfWhBoEg53029ywx5slScEyO5Rysh+9TEX
	 BpAuoptsS8B5g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B43A539D5FD8;
	Tue, 13 Oct 2026 16:10:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] SOC FSL for 7.4
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <179190784226.417156.11860596228221213126.git-patchwork-notify@kernel.org>
Date: Tue, 13 Oct 2026 16:10:42 +0000
References: <53a2dd80-3d3e-4b6f-9419-c71434c41a82@kernel.org>
In-Reply-To: <53a2dd80-3d3e-4b6f-9419-c71434c41a82@kernel.org>
To: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 12 Oct 2026 10:15:02 +0200 you wrote:
> Hi Arnd,
> 
> Please pull the following Freescale Soc Drivers changes for 7.4
> 
> Changes to fsl-mc bus are reviewed or acked by Ioana
> Changes to usb drivers are acked by greg
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] SOC FSL for 7.4
    https://git.kernel.org/soc/soc/c/3e71e9806863

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


