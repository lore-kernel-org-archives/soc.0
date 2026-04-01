Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92F1F3218B3
	for <soc@lists.linux.dev>; Wed,  1 Apr 2026 21:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775080243; cv=none; b=ED4DWyg7jR4Hf6bSkew93jTNBfAqO7V6OqOuZjnfSNSsMkcy5S6rn4OygUSxIHS9a1/EGi2FW+/zt/yIn8AxsZ2pL7X8WiTMnfJk7pYQUBHPj9dyix4Fg4GQGFCkx4GEIZoGvf82neikar0GdOGpLt8nWR0fHiLQUObaWCxTii4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775080243; c=relaxed/simple;
	bh=Bkix5IDiD1hnHBmhr3+xCzbhgzmuvBQ7X4Gm2inpd8A=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=QyFcaMGbTIyhjtW4+0oyJdhaQUBcBpHtFE+PkQy0DF0thebeY8fmgfZCJRY2jmhTSVj7S1M/Tt/NzUgK3icuZYTnZHQoGIIdOJwkNm4GlBEoCbzu83L5ew98Tg7bvPcto+DFwfiwBEyzXYfUy4zOgi51ehaVH3lx9WhySyo/LfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S0MatiKq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S0MatiKq"
Received: by smtp.kernel.org (Postfix)
	id 50E1AC2BC9E; Wed,  1 Apr 2026 21:50:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B01CC4CEF7;
	Wed,  1 Apr 2026 21:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775080243;
	bh=Bkix5IDiD1hnHBmhr3+xCzbhgzmuvBQ7X4Gm2inpd8A=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=S0MatiKqdWuDI/EaTvSWzdUpllnQLhVqVKZw97PPpVj0C0brMw+Lig9b6OcHy8au8
	 RKZgnwKqspr1WLyshe9b6KKpGYkJOLrw2d3dNMfDAR6gufgaostozsZMIe0r19owEw
	 ZhI3MinW4TBe3A4W36Fu35Lg9xN4LfnwhzMbYY/+/88SyZoZ09t9VBuC6vdO2YIg8q
	 dIPN1suEhfy2d0nVs/HI6cOZPWs7R+GkbNFNgARzQ6b+KiF0WGB08ttho+No957Ow/
	 FwAEDGcl1Et0pNHYwpfQgd0oXAdl6npqj+iGG1+4j8hBMwdV7jxdRQJX0S6mWW+Tbo
	 71TnDW/edVQIw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3FEA73808203;
	Wed,  1 Apr 2026 21:50:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] arm64: dts: socfpga: updates for v7.1, version 2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <177508022578.3876275.17298411061134943388.git-patchwork-notify@kernel.org>
Date: Wed, 01 Apr 2026 21:50:25 +0000
References: <20260331023618.258887-1-dinguyen@kernel.org>
In-Reply-To: <20260331023618.258887-1-dinguyen@kernel.org>
To: Dinh Nguyen <dinguyen@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 30 Mar 2026 21:36:18 -0500 you wrote:
> Change from v1:
> - Correct the commit message in commit "dt-bindings: intel: Add Agilex5
> SoCFPGA modular board"
> - Used b4 to apply patch
> 
> Thanks,
> Dinh
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] arm64: dts: socfpga: updates for v7.1, version 2
    https://git.kernel.org/soc/soc/c/6935cce658e0

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


