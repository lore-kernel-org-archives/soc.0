Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 365801E47B6
	for <soc@lists.linux.dev>; Fri, 13 Dec 2024 17:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734109216; cv=none; b=P2XomI1ycR7tnMBFWMTRpZh8mfJYg8DTmEWJ1WzOuBq36srVrbKuMrm+x01Yd64LMpQcY5oCY6aiGuEBYE595Bu8B07eBFQaHGAeBETkTqu5SFHgKfAj02E5rGOkJjul68M22MMecxMlOXg0LZ2gMlDQixT54lwUhQDW43pc59s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734109216; c=relaxed/simple;
	bh=Di7K2bqhqaTSFEFwFHp7Dhrxfa+fhZBRnWWnF67b4/Y=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=ZWGU9JIgRmX2fB4SfPJjBqcp7gFwHo6scNEY6jmaAv66z4X2YcGNv1jbA075TqoGe8aQmgDras40n+MuuXHnmwkvQC7sAUZw5XVxFax8iYXau9RMRfTDwECvkZ3LpEDuyoEPiwa6SIHGTJ3bq5m7bvHvLNvLTJcUPGiiWNZQZco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VLM53xNN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VLM53xNN"
Received: by smtp.kernel.org (Postfix)
	id DC187C4CED6; Fri, 13 Dec 2024 17:00:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C62F7C4CED0;
	Fri, 13 Dec 2024 17:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734109215;
	bh=Di7K2bqhqaTSFEFwFHp7Dhrxfa+fhZBRnWWnF67b4/Y=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=VLM53xNNiessYFhqFNKCtazDHDP7uqDxUuqLQb8FgfY1zVy2FKHoeef1y+WdlVqBZ
	 hJ8EqWAXOaDEfiDOL+rUZZHmrtQONAlJKzh0tjbQZTw9BmbuaVacMGkxCC9xaG12+Z
	 or98daxejbD5ch0k4Vo8QiXHvHTxfE3tZBxxZwMumX/sSM0PLoLw9c7aw4XKiyJYHG
	 KfyhN7FA8WjdvI4IB+MU0j/u4ZhpLG8EtNJ4Y4RdYAa/oietl8cDOYnX3Cm5v4v0Xr
	 yIU8mmud/dyS9kcmRRl0yfAi5V0uJCUCxA0+mg3bRCuz6We6TnfJjDopQhn7mQydr5
	 +NDsg1aJ9pkQQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70CA2380A959;
	Fri, 13 Dec 2024 17:00:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v5 0/6] Add support for Blaize BLZP1600 SoC
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <173410923224.3098520.11489875368543603546.git-patchwork-notify@kernel.org>
Date: Fri, 13 Dec 2024 17:00:32 +0000
References: <20241204-blaize-blzp1600_init_board_support-v5-0-b642bcc49307@blaize.com>
In-Reply-To: <20241204-blaize-blzp1600_init_board_support-v5-0-b642bcc49307@blaize.com>
To: Nikolaos Pasaloukos via B4 Relay
 <devnull+nikolaos.pasaloukos.blaize.com@kernel.org>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 04 Dec 2024 16:05:23 +0000 you wrote:
> Blaize, Inc. (www.blaize.com) is a SoC designer and manufacturer
> with integrated programmable Graph-Streaming-Processors for AI
> and ML. This series adds support for the Blaize BLZP1600 SoC.
> 
> The SoC can run as either a PCIe based accelerator in a host
> system, or as a stand alone SoC running Linux on its integrated
> dual core ARM Cortex A53 cluster.
> 
> [...]

Here is the summary with links:
  - [v5,1/6] dt-bindings: Add Blaize vendor prefix
    https://git.kernel.org/soc/soc/c/1fa9ce7e525d
  - [v5,2/6] dt-bindings: arm: blaize: Add Blaize BLZP1600 SoC
    https://git.kernel.org/soc/soc/c/f156403c2c8d
  - [v5,3/6] arm64: Add Blaize BLZP1600 SoC family
    https://git.kernel.org/soc/soc/c/c0b454a51755
  - [v5,4/6] arm64: dts: Add initial support for Blaize BLZP1600 CB2
    https://git.kernel.org/soc/soc/c/2e976f19d9c2
  - [v5,5/6] arm64: defconfig: Enable Blaize BLZP1600 platform
    https://git.kernel.org/soc/soc/c/b0837ce07980
  - [v5,6/6] MAINTAINER: Add entry for Blaize SoC
    https://git.kernel.org/soc/soc/c/d4c0d167b1f6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


