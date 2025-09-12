Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA6F93074A2
	for <soc@lists.linux.dev>; Fri, 12 Sep 2025 16:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757693405; cv=none; b=QW/yIEEdXziW0ZZYHR+mrHg1uAuvQvSzL0gI3jRxWlWU8YecnpJafgMXkc0O8kv46DlSwctw0lHk+bhJSNJEGORouOZselmoKAzosw83+y5rOD4ioBD5W+jM/Cp/h7TErLG7YWh1CEcXJAc3r6Orb4ZX9dsW9m6bWDtiqacyIiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757693405; c=relaxed/simple;
	bh=eW2tWYkkBbS545h3jw71InE7klMShsRWbybOMrP0XdI=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=VKPju9F/mEiMrIJeXBGiXC9LPu0gQr8EY8BS+sbTBf7DjiMLkQl5+fFYaggb2H3ZnJ5rUqLLfAeA4+zL72mrxl/ZtsEFl7zTXM15k7+GxT+R2m9nYjHIfbxrfE6mNyKhTCO0iFKFm0nG1tWqdn4HXRp2aFsSIAqbV8xyTkpNfA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gC+fTdwF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gC+fTdwF"
Received: by smtp.kernel.org (Postfix)
	id 8503EC4CEF8; Fri, 12 Sep 2025 16:10:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C6BDC4CEF1;
	Fri, 12 Sep 2025 16:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757693405;
	bh=eW2tWYkkBbS545h3jw71InE7klMShsRWbybOMrP0XdI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=gC+fTdwFQZDRvUf+zB0+8Jv8IsLL9TnqKgRjXRvQKY5MfViNx0SV6deJAv3xQB5DA
	 dJx2JAPHKQTMuMIf+4CjWdH65WtTXWGt9XTqFa9GQTxlbx1CCw114oTeCtve/EJBfZ
	 PnwcHy7CnT4qixaJ2FMlp3jyK7pxULbmQ56MmtvksADv/c0aaaMSnSeUpGOpmwaZF1
	 /exgqY5UJsV0/fkrqBypL31SDvTqXYeZd8nCe9jzm3m8YHmy3Cc0ZA1VParIBj6Zmb
	 IGa7hHSBLYuRIPc/+NSwz148JV3c5KL08yGnqU397mCczTCcB+8G5xUihJrLRMAeQJ
	 q+G+OIAa18gdg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB48E383BF4E;
	Fri, 12 Sep 2025 16:10:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: at91: fixes for 6.17
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <175769340776.2998972.4751698429548702841.git-patchwork-notify@kernel.org>
Date: Fri, 12 Sep 2025 16:10:07 +0000
References: <20250903173403.113604-1-nicolas.ferre@microchip.com>
In-Reply-To: <20250903173403.113604-1-nicolas.ferre@microchip.com>
To: Nicolas Ferre <nicolas.ferre@microchip.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 3 Sep 2025 19:33:55 +0200 you wrote:
> From: Nicolas Ferre <nicolas.ferre@microchip.com>
> 
> Dear arm-soc maintainers,
> 
> Here are the fixes for 6.17. The addition of the Kconfig symbol is taken from a
> bigger series by Robert here:
> https://lore.kernel.org/linux-arm-kernel/20250813174720.540015-1-robert.marko@sartura.hr/
> It is needed because one patch of this series was taken before that symbols were
> defined properly (queued for 6.18). You can read the discussion here:
> https://lore.kernel.org/all/bac5390f-725a-43db-a2b6-17a68d0d733c@tuxon.dev/
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: at91: fixes for 6.17
    https://git.kernel.org/soc/soc/c/875691ceb8bd

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


