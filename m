Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C04EF20899C
	for <soc@lists.linux.dev>; Wed, 19 Mar 2025 22:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742422313; cv=none; b=OeP9A2Fjp11k670PP1y0jY3+vn205PGRYju4ojXTwbvKKndjJXuSQMARXGfvYYpH5tgALC8OZOi+3S/9hwKm4wjqrORM8Hc+g6d1ZC1GHstoQO+XWlZhYhsvAeNbWRfKrJ/dI06a0vNfiSamRcDUk89eV1ZonGJu6uMEOdZkuc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742422313; c=relaxed/simple;
	bh=6YSBNjiTZ2g08T/pOBA4/tIxLrmvRLh4CUEgz6jovbw=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=bV40dGX/Ji2TZs423W6VDS8fdRqn9vXiRx5MwpX+U1Go0U1DeysaTyj4N6d0oHTg8UvuCzESWO2FUL6buGvhfJsLS+BT1Ph/fFJWaBZalO/UA50H3weFtuLQpX3BW58ViK86ujw2woJUOFwWuX9Gw2rfOsBE+7IytBoDtObqVig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PUJqqh8a; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PUJqqh8a"
Received: by smtp.kernel.org (Postfix)
	id 5B698C4CEEA; Wed, 19 Mar 2025 22:11:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46331C4CEE4;
	Wed, 19 Mar 2025 22:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742422313;
	bh=6YSBNjiTZ2g08T/pOBA4/tIxLrmvRLh4CUEgz6jovbw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=PUJqqh8aYhkVTXgYFbLCE92UAqdkZ7ScJWQ7QBBKOFytUowyq8sJQTuy7e1jMbaYH
	 VK0FwtcTGWTNINf6UEcl4SaZSJpjzpBoMug6bz4qVOoRY5PUIToob/59zcQNtrFiMP
	 ijSdAMejPs/WNXvEW+55LQU2IeNKE9FlEmdA8C4jgp+jEoUbXkBK5Wg/RVTQUwa+vT
	 h2f1DMHhnSllstUj24gU5vNod6LAfmL2pvynFE9x1Sajkr3qKUa6qFunnUNRgK0N6T
	 FL/0m/WZNPX/Pk4TIYkWseCNqSHwfjAQqDJWHmlVpSQDlxmjron0GBm/BU5taNlIua
	 J6/tH+fiHtT4A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33C6C3806654;
	Wed, 19 Mar 2025 22:12:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Third and final batch of Apple SoC DT updates for v6.15
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <174242234899.1211847.2916592442747511909.git-patchwork-notify@kernel.org>
Date: Wed, 19 Mar 2025 22:12:28 +0000
References: <20250309113212.48137-1-sven@svenpeter.dev>
In-Reply-To: <20250309113212.48137-1-sven@svenpeter.dev>
To: Sven Peter <sven@svenpeter.dev>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sun,  9 Mar 2025 12:32:12 +0100 you wrote:
> Hi,
> 
> This is our final pull request for Apple SoC device tree updates for v6.15
> based on the previous one [1].
> Drivers for the M1/M2 touchbar screen and pre-M1 (iPhone, etc.) backlight
> have been merged since then and this batch includes the required device tree
> nodes. Both drivers and these commits have been part of -next for at least a
> few days. The corresponding drivers are scheduled to be included in the 6.15
> merge window as well.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Third and final batch of Apple SoC DT updates for v6.15
    https://git.kernel.org/soc/soc/c/93aa01ba3200

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


