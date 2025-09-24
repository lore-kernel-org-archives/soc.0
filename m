Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F94C263F3C
	for <soc@lists.linux.dev>; Wed, 24 Sep 2025 22:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758751816; cv=none; b=RPbQf+2jgC3Tu02eQiRKTOXFX6LDwSZF8EO10FI5e44uz13OWTkznrV/QYuyrdA0vzLqyAIY2ollkYjXYCjb5xmjXitKGWWiIY2JMWjtyUBwgb5iJmH/Gxl/FGGQc4LjQ+rQ2vjTlXEc94UoyR+mpYOYSBPMiIpCAWaq0+xh8ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758751816; c=relaxed/simple;
	bh=7gh3CCQA1w3VuG7vy/6fOzn/tR6ZRc2WzwD0+oy0x6o=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=OXN6bVTUAl5zV0UBl9yRVR7wtWcvXCQhgl0f6YqsqgfEzneKrL3ZfbcaJ8Tfc+Ed0ewS4RtH4hj+8AGgg2MtbyP6U6poIkORhyMYuXIzef51USHZgc5D0FI7eALQ15GUCQvflnCDuGw9H39FM1v4f/txLP+eA1snlNy6UmaMq0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kSg7ZiIv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kSg7ZiIv"
Received: by smtp.kernel.org (Postfix)
	id 4032BC4CEF8; Wed, 24 Sep 2025 22:10:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2536BC4CEE7;
	Wed, 24 Sep 2025 22:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758751816;
	bh=7gh3CCQA1w3VuG7vy/6fOzn/tR6ZRc2WzwD0+oy0x6o=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=kSg7ZiIv3CVkqsxCr6XzGBHnf9u5nPGShiw6N6MTcGnRnO+nICVrjUtkLgc2arahZ
	 ZABvAiwAkNmTE8xBpin40+Nz9qLa5Iyagl3qyiBOOL7iP3mzcLaMFLjvZzTH6ugMAm
	 /AjgRzILy9P7bTx1oqG/D7MvHz0pNLlU+1VtHBdXybUQtwsOnHBR/b/Hj5XjrutZTw
	 1+IeW6gsjFS5CMU7yAweUiKrJ+oyG7JOTWXY/SnD723VcF57IpYSEoDIf9MkXcO/+Z
	 grc95xhMD6Aq1b244JimTkduSRNNzcAZad9mUNrXlIIFFuWNqlfmCbU/WOYyPBwQhA
	 LJEj1wc4vkIrA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADD2439D0C20;
	Wed, 24 Sep 2025 22:10:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] SOC FSL for 6.18
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <175875181248.2716298.14760194038005459371.git-patchwork-notify@kernel.org>
Date: Wed, 24 Sep 2025 22:10:12 +0000
References: <26615a15-3494-435f-b0c1-861122b4b5e1@csgroup.eu>
In-Reply-To: <26615a15-3494-435f-b0c1-861122b4b5e1@csgroup.eu>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 24 Sep 2025 18:02:41 +0200 you wrote:
> Hi Arnd,
> 
> Please pull the following Freescale Soc Drivers changes for 6.18
> 
> The bus/fsl-mc changes outside soc/fsl tree are acked by maintainer of
> QORIQ DPAA2 FSL-MC BUS DRIVER.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] SOC FSL for 6.18
    https://git.kernel.org/soc/soc/c/a53811fb37d3

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


