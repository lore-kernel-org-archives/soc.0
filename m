Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8EB6238C23
	for <soc@lists.linux.dev>; Tue, 25 Nov 2025 13:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764078680; cv=none; b=LRPNrpdM4Gc4z6oxuKGFUpzUTw6bAYsPOwtubvOTEX6WqOPIyjE90S7ov0QwibnkUi/Svo5qTEz7nm6kuGUOKLWmd2y7nvxqIbKYpU7D/CbCbsf6c4iFZ2cocpQWp5vgDyVYRR+ShtQ9pfsRP7zvRtuU2kqirI0NEal17i2RoHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764078680; c=relaxed/simple;
	bh=Sc+H4R90LhKaSw8Lla0DYuieZbjyfN6Qnws8kDzYdaA=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=KW6d8ucPi1qnuUC2Arml7B499X+IXYsBXDoYRR5HN4wtTIyXR1jgu8BLNBoNEHL+TubB5RTffCDGNSAr0v9t0SUTRnYa5usRi7Nhj8ZrkpxFm1m1VjMvvsOo+N3pudeRB2WABR4ekjHGQFeYW97cnOxojB5hvqBK7/qCaQxd/bU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OLD+6iAA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OLD+6iAA"
Received: by smtp.kernel.org (Postfix)
	id BA9E8C116C6; Tue, 25 Nov 2025 13:51:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A571CC4CEF1;
	Tue, 25 Nov 2025 13:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764078680;
	bh=Sc+H4R90LhKaSw8Lla0DYuieZbjyfN6Qnws8kDzYdaA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=OLD+6iAAqBwqY9Je7YCpjrsUKbD/w0bn9SmB4Oif+ffrlsTIEcv6Q7dJGRDXmR5i5
	 K7mT7B+y6YmxnzESOeQN+MAZWmJDDAxQ4KYgKDoN7z2WnYzWGI9lCgxMDokdSL1AUq
	 e+lQmTRxF+iCGh/R0LSQJxS5O7dIoD7N7q8OJh0u+hdqKTJhW+zNbTOfxlsP/V9kCM
	 i3FMNORUbvMezVMipbJ4VLAKTN1RMouZpFlxCG/qvXIMKChetOymNQNT6dv/ser7vO
	 FvChmPjoTKulJlhDkR+R3qjGVJQk2KOc4Z14LjzIRqQPGn/5IzPbxHqdK/TF4wJQZ1
	 4yCPjJ0GDzJvQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70D673A8D153;
	Tue, 25 Nov 2025 13:50:44 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/5] i.MX drivers update for 6.19
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <176407864299.736376.16668373046890767536.git-patchwork-notify@kernel.org>
Date: Tue, 25 Nov 2025 13:50:42 +0000
References: <20251117123358.2009662-1-shawnguo2@yeah.net>
In-Reply-To: <20251117123358.2009662-1-shawnguo2@yeah.net>
To: Shawn Guo <shawnguo2@yeah.net>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 17 Nov 2025 20:33:47 +0800 you wrote:
> From: Shawn Guo <shawnguo@kernel.org>
> 
> The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:
> 
>   Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/5] i.MX drivers update for 6.19
    https://git.kernel.org/soc/soc/c/16e8af6c037e
  - [GIT,PULL,2/5] i.MX dt-bindings update for 6.19
    (no matching commit)
  - [GIT,PULL,3/5] i.MX ARM device tree changes for 6.19
    (no matching commit)
  - [GIT,PULL,4/5] i.MX arm64 device tree changes for 6.19
    (no matching commit)
  - [GIT,PULL,5/5] i.MX defconfig changes for 6.19
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


