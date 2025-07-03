Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F051A2F0C58
	for <soc@lists.linux.dev>; Thu,  3 Jul 2025 15:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751558390; cv=none; b=ZSUknpXlzJ5/Nz5qxHnkxKjB9LTA12kq3kmUaf3H14LAP5lOLT1Oa95u+KnZFVb2ln+L2sV13xCdteWHqL2MCNNfjm6jT0iqTmUqoF3+PWf8z7B5wlOPGvn9ezz1PAZzzr4NN1+JsYJPx+DzRWVnkKD5eP0QW1ye42lPttq1q7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751558390; c=relaxed/simple;
	bh=hoGsQ29xQ4a7cOUhv2vyKzaZNvR/nRGILxEeH04t+8k=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=uspEFMNnCODzCdOYB3h2d7fhmanJMy5Sw1ElAhPvl8lZdnoGh9m+6TEY8qZQWhipMQpozaBWIv6KhC+CObrNXka0O2udoreLu3/+mgVIQxB2wLVZF9wcCn7iEc838k+ddHrpUOd0Veq4Ok72pGiSM9CPXCxIkGIbUTD8XKnAwl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WZ3UuPvJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WZ3UuPvJ"
Received: by smtp.kernel.org (Postfix)
	id 90992C4CEEE; Thu,  3 Jul 2025 15:59:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76230C4CEE3;
	Thu,  3 Jul 2025 15:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751558389;
	bh=hoGsQ29xQ4a7cOUhv2vyKzaZNvR/nRGILxEeH04t+8k=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=WZ3UuPvJ3Pw4QOE43hTQQ4ZtLL5gunhMr4xrq5efGq2yJJ0C21jJNxfZmV5tupNdz
	 8J4T9sqBsEnH7Md2H8SS8ezbDAFTZc0inHhDUwtaWqdeL/JzCYbjYp+7YjxpblWPRz
	 5m/468FibuapTOHW4FkC05RboMO5v1L9eivZVgAX+pUlyp9Q+S5p4bjAgaLn2xEmRr
	 5qd0JkkRRDN1O/ufdW0FeZzXNB/sgwMTOHekKJccPGjzrvFKJDyGx7MZxfOT7iofXX
	 YUfqfB7HwyS8Ki/qVIS8c5hx5iOxbzct4vi7H4Rz63SUA42NwOJr1tWQF6/mT2qk9z
	 kxQNwYAtI5c5Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB231383B274;
	Thu,  3 Jul 2025 16:00:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] MAINTAINERS: Switch ASPEED tree to shared BMC repository
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <175155841356.1537604.18411181185850265749.git-patchwork-notify@kernel.org>
Date: Thu, 03 Jul 2025 16:00:13 +0000
References: <20250702-bmc-tree-update-v1-1-c270cd8af0ab@codeconstruct.com.au>
In-Reply-To: <20250702-bmc-tree-update-v1-1-c270cd8af0ab@codeconstruct.com.au>
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 02 Jul 2025 10:53:54 +0930 you wrote:
> We now have a shared repo with write access provided to M:s for the
> ASPEED SoCs.
> 
> Cc: Joel Stanley <joel@jms.id.au>
> Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
> ---
> Hello SoC maintainers,
> 
> [...]

Here is the summary with links:
  - MAINTAINERS: Switch ASPEED tree to shared BMC repository
    https://git.kernel.org/soc/soc/c/df5e674c7a99

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


