Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75375263F38
	for <soc@lists.linux.dev>; Tue, 23 Sep 2025 21:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758662457; cv=none; b=ucrpFTqtWM7HQoEy/Kthzxp9y225elEkbEE3Bx3Wj2VEJWekEGbfg2/ouUjSFLb1re8dTfA71NyhqXeALzfEtQeSthD+xombrxSnKBDLycw2jaJbuyGAhoLetpnhNCGNlyl8cp9ksKc7XUKs/zbUccM3SLihER0ZJtae9XBYxQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758662457; c=relaxed/simple;
	bh=9zFuGON58i+bYqEfRg0n8A1MCJnO7kwukFPe8y5FsNs=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=upz1aFA/XXknF8SBGLO1pn1167GgfJRXc3k5YNpJ8ln6THtWEj73KY3TwgNCxjxZL30Jd5f3GAOz5K98wCX2c91Is9ntGDdx0YnprWekvcHqKQFQf/52iP01Sivpj96qwyX9OJUeiclaDOfOlw2HNAUoHFeJdydPzX/5NFNKT24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=anMILHsm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="anMILHsm"
Received: by smtp.kernel.org (Postfix)
	id 1A543C4CEF7; Tue, 23 Sep 2025 21:20:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0513AC4CEF5;
	Tue, 23 Sep 2025 21:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758662457;
	bh=9zFuGON58i+bYqEfRg0n8A1MCJnO7kwukFPe8y5FsNs=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=anMILHsmNhdBFpRRCTBp5jvdAR4Lyu3qGa/5DcUiRwwUnKbq7QkvIIfpPPVMaQufD
	 lcgWlzknPQDAnXlvyThsLPe0l9n/sUhd//L2x+cz+Z8NFFzg3spTmSXRA+yAR6DZcb
	 JGx1eAObftXSyScLV/Naj9gd8g+w4LGCjdb15EqXon1TpzAdyKHEqiuix6UR1OX46p
	 v89lZs/JM5NEUmmv6PO/Z+71ZYa27m0hvZVNU3y3enzpqG4R3iYbZuRbuKm6YhrWnO
	 YvXCK5Q/NavvIkBGwEIziUteq2O2zdeximNDMRyEt5GfC3cuHZv7w6w1NsHVaN9cv2
	 RCvjw14279mJA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33D4739D0C20;
	Tue, 23 Sep 2025 21:20:55 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: microchip/at91: dt for 6.18 #1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <175866245398.1926563.16257613136684235868.git-patchwork-notify@kernel.org>
Date: Tue, 23 Sep 2025 21:20:53 +0000
References: <20250922170346.40876-1-nicolas.ferre@microchip.com>
In-Reply-To: <20250922170346.40876-1-nicolas.ferre@microchip.com>
To: Nicolas Ferre <nicolas.ferre@microchip.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 22 Sep 2025 19:03:45 +0200 you wrote:
> From: Nicolas Ferre <nicolas.ferre@microchip.com>
> 
> Dear arm-soc maintainers,
> 
> Here are the first dt changes for 6.18 which contain some little node additions.
> The QSPI node has its bindings accepted and going with the SPI tree:
> https://lore.kernel.org/lkml/20250908-microchip-qspi-v2-0-8f3d69fdd5c9@microchip.com/
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: microchip/at91: dt for 6.18 #1
    https://git.kernel.org/soc/soc/c/07d0eca07896

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


