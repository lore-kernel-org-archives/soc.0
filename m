Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83EFC1D8A0D
	for <soc@lists.linux.dev>; Thu, 16 Jan 2025 16:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737043313; cv=none; b=E20z4zCB6HqKJXBEud0LdB642vWoE+jo2LvsUYBPWwZ0ZcoT8ZUPLEsfBEHpjvfPlUclfLDxpXEZDCVBnt4EKDOnLg+kKmCowJPhYkCBzM8FzNERBhjINzjkOncm7RGt9cDa9KZeHroyIPqiP33PVnleov6lFzJEiDSSdja2U4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737043313; c=relaxed/simple;
	bh=37ei/b1kL0FJKXQYhKVvryUGzOEocsTIkNBZVV8tqg0=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=kbsLBH/UPzdBoLFgRctXkSvT7vwgLucqfVazoQ497SYHP/NOI74UbmGZhnCMPlGFKOuu9luEzExMFAte336EKEkg/d/9KkVKaME94wVRXNMIN6pk9hpJ9TLpaNdmHLR7JTRSm5dhLnPtPP6LkSyrkoNBNE3G+KVtghs8yMHVaAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SdZQApbc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SdZQApbc"
Received: by smtp.kernel.org (Postfix)
	id 6E82AC4CEE2; Thu, 16 Jan 2025 16:01:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58A58C4CED6;
	Thu, 16 Jan 2025 16:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737043313;
	bh=37ei/b1kL0FJKXQYhKVvryUGzOEocsTIkNBZVV8tqg0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=SdZQApbc3Rfy/GiVNttELdngEGWKr9fA9Er7Z1SJWG9PO17fP43R/nOmtkoIB5U3B
	 eW2t9YkqYISH7MIhDQ+pa/UVgbntJJGkkd6JGOTpab6EhEd0xkeKoYMtHkUxdXdNcy
	 so2uCctZwMW8Iv4hI1ypIZdOM7PaMqzwS6tqFu6ZHg0n9mKdOAwWqhU4YTXO9hJ41j
	 fADOm7djRLYkky3f6tLb9oc7MCxpoNitxBxGtmk3CKFGOSiXbHtl/8wNupoGsawQOD
	 t+sjKQGaHNmx11udRyOZ8xfjFE+CftqVeofGXQePb3OvyQ4+v3xKY7DunVLsUOptnY
	 nblkJBEmAkssw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADFA0380AA63;
	Thu, 16 Jan 2025 16:02:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] amlogic ARM64 DT updates for v6.14
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <173704333631.1501791.1409387294752746320.git-patchwork-notify@kernel.org>
Date: Thu, 16 Jan 2025 16:02:16 +0000
References: <72d71d3f-99c3-4767-8c80-8fa7a865c846@linaro.org>
In-Reply-To: <72d71d3f-99c3-4767-8c80-8fa7a865c846@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 6 Jan 2025 15:23:10 +0100 you wrote:
> Hi,
> 
> Here's a single change for Amlogic ARM64 DT, removing the broadcom wifi
> compatible from the SDIO subnode because the Amlogic GX reference
> board can be shipped with different brands of pin compatible SDIO
> chips.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] amlogic ARM64 DT updates for v6.14
    https://git.kernel.org/soc/soc/c/608e9fe27fa3

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


