Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ED70201113
	for <soc@lists.linux.dev>; Mon, 15 Sep 2025 13:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757944252; cv=none; b=TTy/SjcS2//VlfnwxOn1fS3FawzM8Z8s3bSfSBj8j3qY/R3ebY7cSVvR5gQeM78J/hYr1jeCk7jnTlTc7J4O9T+sO+3LsKit1YAwbcqiy/dntqV/AU6nR9fQP8meErG3yAt8h6WNExXksWGfl1w0uzb66rH8/288jjT1vaj8ZxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757944252; c=relaxed/simple;
	bh=L/w7upAo4siT3gV8fZPLEFIwF0TClyMZJx24/L+Mdjc=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=bQccdsEiMNNG18kn3t9zx6lc/sSKAfzzmUAFMU7hpkKJInBASZxR97AAmZ3sQ3KpXX7yMoi9e1tF2AU6YxJ/eM10C0T8lNJubz1tAGPKN8G1EkkkjwI20lypNmuB0ZwAtp+v7KYxScCLIRwfxoVQr+l+KdA0qz+FHyGZz6N15zM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nSCXjzCh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nSCXjzCh"
Received: by smtp.kernel.org (Postfix)
	id 44DD4C4CEF7; Mon, 15 Sep 2025 13:50:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F784C4CEF1;
	Mon, 15 Sep 2025 13:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757944252;
	bh=L/w7upAo4siT3gV8fZPLEFIwF0TClyMZJx24/L+Mdjc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=nSCXjzChUP17BTKBID4SvNfsWWAAeiPoEr3ghXx8tPxRee53NgHAazP2tYzYqSuYE
	 n7U1E7bCAoG3vq3wHYUy4GqCp1apg5NgGgXRfv4+PJplY0pdoPwGQW6LrcDcSyEbYt
	 PV8RQN9NJVgZv5HLpr5XAKuCafoc7grDbja8Alxik3PVM7pqeqlva7x9xRe/uR+WLI
	 2eusGhlDACPmxhVT6sbGBOvjQz0+mkili2EIlkh+DSyEVeKOVKR+yZVTPtJ8QWL2D9
	 eiX3aEznm20r7IUdt5dexifuJWyR/M50TL5VPl5tRjZYyaDCs4V0ysIzZ6kr+O4YK2
	 RiX9g94P2a85g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAEAE39D0C18;
	Mon, 15 Sep 2025 13:50:54 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 0/3] Renesas SoC updates for v6.18 (take two)
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <175794425373.4179625.7499117428838118026.git-patchwork-notify@kernel.org>
Date: Mon, 15 Sep 2025 13:50:53 +0000
References: <cover.1757669912.git.geert+renesas@glider.be>
In-Reply-To: <cover.1757669912.git.geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 12 Sep 2025 13:13:50 +0200 you wrote:
> Hi SoC folks,
> 
> This is my second pull request for the inclusion of Renesas SoC updates
> for v6.18.
> 
> It consists of 3 parts:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/3] Renesas driver updates for v6.18 (take two)
    (no matching commit)
  - [GIT,PULL,2/3] Renesas DT binding updates for v6.18
    https://git.kernel.org/soc/soc/c/499a04f3283f
  - [GIT,PULL,3/3] Renesas DTS updates for v6.18 (take two)
    https://git.kernel.org/soc/soc/c/55f624c71d01

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


