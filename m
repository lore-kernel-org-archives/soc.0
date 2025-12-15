Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F382E327206
	for <soc@lists.linux.dev>; Mon, 15 Dec 2025 20:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765831535; cv=none; b=NJqNVKADW2bZ6EBajxbncD+h836FUW/d13TLX2zamX2+ROoOHiZVR3bsH0p6mWA9KSKXIfcF2RtxTUc1N2sRVjRr5TzGMWEtMI645Xr+b24M+HP4wuCicx5414O9xVhucupEtPBjcfx7zF5nP80wPTzgPuqIElS48NRV/CYqT68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765831535; c=relaxed/simple;
	bh=81694V6q5hynuKLm6mBUEPRTUdoT/rs2crEr9qIx9Y0=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=TBd9YE+KCYxmYyGT6Br28vn+1RuWlKfECabRVCQMWttPCoIxjnp7USN0owKUUMNx8bbSW7PWfbegAhLlOUDDRrgRxdB8WaX/4pUQ/auA4PGxaAImbKl+AY9jpKSRTVqDSUAKAaO67KZbcHXcaI8fB5s1iTaFNY+9R5b2yYMuSHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BIBw/5D+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BIBw/5D+"
Received: by smtp.kernel.org (Postfix)
	id A4B88C116B1; Mon, 15 Dec 2025 20:45:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E9FFC4CEF5;
	Mon, 15 Dec 2025 20:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765831534;
	bh=81694V6q5hynuKLm6mBUEPRTUdoT/rs2crEr9qIx9Y0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=BIBw/5D+0BkMGoLxzi3+/5MWRgeYvL4rI9peRjNbvQ52Lf7A+uiT5oaBF5Qu3FuQA
	 WiEBc5VaHXnuVTRAzXb0823ZdMdWidGJkBjenG3SRL9oqexqFYL9d3MmVv40PL0YgP
	 oWdYR36/rC5FhFv5G3N/b5zqZsRVa4W0poyCLI75XR5sRYQVoKVuhvJSptJfen7gVH
	 C+jfYdK0lm9RlThvVbi2kid4Wr/QT8A53YZS7QwBcVx83jU3DXeBksvjZPpXUHOVML
	 Op+0rqLoB1dPrlGXCKXW/+xzcv4/BrN7UKkU4if8XCDN9EdRavkc0AQtFfvBYsGr6I
	 Q9+DgbOyTHzew==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F28E1380AAEC;
	Mon, 15 Dec 2025 20:42:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] ARM: omap1: avoid symbol clashes in fiq handler
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <176583134552.289481.16653572825737154822.git-patchwork-notify@kernel.org>
Date: Mon, 15 Dec 2025 20:42:25 +0000
References: <20251204095355.1032786-1-arnd@kernel.org>
In-Reply-To: <20251204095355.1032786-1-arnd@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Thu,  4 Dec 2025 10:53:47 +0100 you wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The ams-delta-fiq-handler.S file has a number of symbols with fairly
> generic names, including one named 'exit' that causes a compiler warning
> in some configuration options:
> 
> vmlinux.o: error: exit() function name creates ambiguity with -ffunction-sections
> 
> [...]

Here is the summary with links:
  - ARM: omap1: avoid symbol clashes in fiq handler
    https://git.kernel.org/soc/soc/c/3ce8f4a501f6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


