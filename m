Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F8D2C61D97
	for <soc@archiver.kernel.org>; Tue, 24 Jan 2023 21:31:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 45AEDC4339B; Tue, 24 Jan 2023 21:31:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2DCF4C433D2;
	Tue, 24 Jan 2023 21:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674595864;
	bh=+WWQibBkBQbXGd0vLDwfM7/cOXDo8QdS7IKQyHD22SQ=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=MzLSwJEnjNaaNRzJZoTWI9yXxcTHJQoT/ctcFiegNIv2rq7GOlaTZ6N4CaJIWPXKr
	 4arnilyFQ7X56o9hx5a9vRqWfUDxSasVxnFgxhvzqMcoJ7mCt41OpY3jQhwTbDqoGi
	 vmAfkRIL3Dnu71x9HbdXht82dRbYoaVq57j8JcDuMdAZ9vZQIHDAz8GshgTz71pfeX
	 DWt5ToUE5aK8CqJRIjsXVdi3S0Y5bZRoIev9CfgdZLJzBn0ChM2CTIdn91HDXRJCnH
	 1eyXDpFls7l/eLgW42fA9K5HAPljHtH/xyyZX9FGjHhKy98tUsKSAwauDuFmmTB4dw
	 EWSjMyad/YA+w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 134F2C04E33;
	Tue, 24 Jan 2023 21:31:04 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] ARM: dts: aspeed: Fix pca9849 compatible
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167459586407.12731.13760868967145222891.git-patchwork-notify@kernel.org>
Date: Tue, 24 Jan 2023 21:31:04 +0000
References: <20230118051736.246714-1-joel@jms.id.au>
In-Reply-To: <20230118051736.246714-1-joel@jms.id.au>
To: Joel Stanley <joel@jms.id.au>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 18 Jan 2023 15:47:36 +1030 you wrote:
> From: Eddie James <eajames@linux.ibm.com>
> 
> Missed a digit in the PCA9849 compatible string.
> 
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> Fixes: 65b697e5dec7 ("ARM: dts: aspeed: Add IBM Bonnell system BMC devicetree")
> Link: https://lore.kernel.org/r/20220826194457.164492-1-eajames@linux.ibm.com
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> 
> [...]

Here is the summary with links:
  - ARM: dts: aspeed: Fix pca9849 compatible
    https://git.kernel.org/soc/soc/c/d9b6c322fd33

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


