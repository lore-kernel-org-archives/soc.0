Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C95E331A56D
	for <soc@lists.linux.dev>; Wed,  1 Apr 2026 22:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775081438; cv=none; b=AwoKnHXhVa4PqIpCAXHJHhU3uGGRfBbvNIWwc/r6j6kzCR5sw0kFt2229qkPNt0MNKOHp9YmubBLVnesOAO3qTfEg0siJP0fLLd2BYiEXlDkaV+8l6T+JhpuhEhEvexSe0rGQYjxLfKa8YBp2mFmcgBvJXAiNEnWkGdAf8xqelY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775081438; c=relaxed/simple;
	bh=CIfeyZ1c83zp7lfYW0M9cbZ+sLWC281LeVcsOTe0fCQ=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=UYZb2MgkeM10tPVHlCcb//Dul4r0kpv4eOY6HjYOX4Tbdn3763wS1Hcpo/Q6J/hjWYZqvY6rVBLGqcddz10vNA0McFQyG2ix8/C50PZ/gg6Wflw9u9d8AwOAQZ9YEWztbLbQKz4fp5bJv801BNTWO9uejA9r+E049aFBbAu/MkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XPeXKjGy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XPeXKjGy"
Received: by smtp.kernel.org (Postfix)
	id C37BCC2BC9E; Wed,  1 Apr 2026 22:10:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD992C4CEF7;
	Wed,  1 Apr 2026 22:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775081438;
	bh=CIfeyZ1c83zp7lfYW0M9cbZ+sLWC281LeVcsOTe0fCQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=XPeXKjGycbuRnjN7PV2qY2dyxXM0RxslRdzeuYocIWPJgbw/AwGS0DR/+DgEbzZW8
	 tbVZ3hCF1JpszNS6VeCc1aZxx3L9PJzU6+UnQDVkXUWZe3qNzVZnnMf/MGPipG6/YN
	 MZQVngNhuECxPIei2csnlo+K7YJQP1nXp+3mNBkXFcC24tio0Xe49sxVNSaiOtT6JX
	 tIv0K5SDeFp54siX5WPJ2qxmhPw/98gH/W1rQBT++8FR45bmGZCLcyLPRXCiI0X00c
	 e0U1hYfa2W0oTF6MjtBGRAhWvOKzX/BHU055dL8J8UQAYRTPupPDYCDGcXUofxxLC2
	 FDjQq6on9wQYQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B9FD03808203;
	Wed,  1 Apr 2026 22:10:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] clk: spear: fix resource leak in clk_register_vco_pll()
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <177508142128.3882930.13942065530049625857.git-patchwork-notify@kernel.org>
Date: Wed, 01 Apr 2026 22:10:21 +0000
References: <20260325062204.169648-1-lihaoxiang@isrc.iscas.ac.cn>
In-Reply-To: <20260325062204.169648-1-lihaoxiang@isrc.iscas.ac.cn>
To: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 25 Mar 2026 14:22:04 +0800 you wrote:
> Add a goto label in clk_register_vco_pll(), unregister vco_clk
> if tpll_clk is failed to be registered.
> 
> Signed-off-by: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
> ---
>  drivers/clk/spear/clk-vco-pll.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Here is the summary with links:
  - clk: spear: fix resource leak in clk_register_vco_pll()
    https://git.kernel.org/soc/soc/c/a0ac82cbed10

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


