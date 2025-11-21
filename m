Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8283D272E6E
	for <soc@lists.linux.dev>; Fri, 21 Nov 2025 20:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763756559; cv=none; b=myGwfQyC9lz0nTKnx02nsmjPIsn+oPnmbXZhRoVpu3HPMp2ITMYZazrY36Bx+iZiSJNW+KBM+S5yylIXrZMl2ohWQCtDTL2hbjHIoyXFhI5wlCQYV8sdjHLSC0Imd+OSs7xNc34Fhqb5rfzX0xgW3rQ+3cWBDGskJyZZABFDMHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763756559; c=relaxed/simple;
	bh=Y8qKRBfgoEIubrOwar+zwB1wC/iBwKTUO0zUA9S1QnI=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=QvL6PsbEkawPV0Zj/7kuSFqICJSzu0NYxTa9y1BsDShjCGQrn+lGMraqfm+S4vCDHs5zf3EHMyQB3GRz5bjGGzyAW4r5fug9amwOWZuFHEMvpapprfDDVVenZ+dcoxWaG5E1WH766HKlr5pP31ykAz/L5F6W9WkogfWktzONJDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RE8y9Idh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RE8y9Idh"
Received: by smtp.kernel.org (Postfix)
	id 32E93C116C6; Fri, 21 Nov 2025 20:22:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D758C4CEF1;
	Fri, 21 Nov 2025 20:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763756559;
	bh=Y8qKRBfgoEIubrOwar+zwB1wC/iBwKTUO0zUA9S1QnI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=RE8y9IdhaEwkcVpm4WOn3ij/s0xDk+U97UfINNE+OWUA5BOKnI4Yu4s3RJCeDlR1/
	 Irh72EJgzGVTDvwSqk/A+UKIT9Ds05CSycfsxW4TwRg++PrA26ql3ISmqqOjbe8X1k
	 3M53QumrXRWSIWwmBr4XDv+Io8RBMH1s5OtfHjyk4+J3uw/GP6DPT1qQDlmlw+Km+H
	 y1Zu16Zvtg6F0mPit5Nevio+WhbZrj1LJe8I+lPQOsRp4LSJegi5YfGbZW/vMrUGND
	 W2HL7X82SuqExqCYxMQ0h6UplbTlETXcXu5N5WQNmf+C/6JbR+JnrF1aNKZ2kQ59E9
	 9+PdP4ILb85Pg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAF0F3A78A68;
	Fri, 21 Nov 2025 20:22:04 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] arm/arm64: dts: socfpga: updates for v6.19
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <176375652349.2571237.11111699321086470194.git-patchwork-notify@kernel.org>
Date: Fri, 21 Nov 2025 20:22:03 +0000
References: <20251117125331.381114-1-dinguyen@kernel.org>
In-Reply-To: <20251117125331.381114-1-dinguyen@kernel.org>
To: Dinh Nguyen <dinguyen@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 17 Nov 2025 06:53:31 -0600 you wrote:
> The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:
> 
>   Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git tags/socfpga_dts_updates_for_v6.19
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] arm/arm64: dts: socfpga: updates for v6.19
    https://git.kernel.org/soc/soc/c/c7cdc91603ee

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


