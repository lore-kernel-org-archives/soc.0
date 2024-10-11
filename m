Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A12719F110
	for <soc@lists.linux.dev>; Fri, 11 Oct 2024 10:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728644347; cv=none; b=TALGUDptYbOxHBh9D/0m1dc5ND/a0aaydvd0zrgCnyfGGltieIWFJb56QswYXkuhD+mF5y9NIpYUG3tXl22mt5tGSOVXI+I2rxmGv+5KKsPXcINgIGup6DF2h6TEyX6S59BdoANt+TQNhpaTnGk+9IkitTesexpRLIShfNFMCUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728644347; c=relaxed/simple;
	bh=SKk/s7c0lgH9zBZrCaxi3q1fnO1EHp8HLhxBqKY1iHo=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=LXqvWZCfXluAML5s0cMJAAmXw+qL8Gg5+TzlsDTrcwzDpUYXf6VHL+DFP6QTFFl1eYmJsl0Q+HNUXs34RvT24f9m5VerN7FTIU8zfute0qDXxW/JzLGPV6IsXTHqaNH0Mioy5J9txum8K0AndmOaqLiFk/yZao25FMmykyQhuno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UsvnTOC3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UsvnTOC3"
Received: by smtp.kernel.org (Postfix)
	id 451B2C4CECC; Fri, 11 Oct 2024 10:59:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FF08C4CEC3;
	Fri, 11 Oct 2024 10:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728644347;
	bh=SKk/s7c0lgH9zBZrCaxi3q1fnO1EHp8HLhxBqKY1iHo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=UsvnTOC31WYGTm0GNFdTyZvk5B0EZTU/xQRpK582FQXZvAhgQ80jumkBJTpy7Tczg
	 2PRM12gnaWI1gBpu81vYgLhuE4BLc+vfNLLZHfU5SoJOMnkhRUpM4E9mwWZKKquKja
	 BU1AKT8pPB4RZMgvRHac0HaIVqX9FEWGI/bo5pCbHCJA5vcZ46C5gM/G8FIWHCZLTj
	 7ZJnqhiemRZJ0aU3btZJP7vWrxsPLCELP7tEG/DB2YwWH7COKW1eJvf65WkcipgziN
	 gLWWLBVZ5BREcOFgkljl3GGkiks8afh+MQwoJ87u12hP/uGGskPQ2Dn6C0UpD2OmG4
	 puK6IPWVF7GCw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAEDA3822E4C;
	Fri, 11 Oct 2024 10:59:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] soc: ep93xx: drop reference to removed EP93XX_SOC_COMMON
 config
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <172864435148.2676212.8223982374844882665.git-patchwork-notify@kernel.org>
Date: Fri, 11 Oct 2024 10:59:11 +0000
References: <20240924092423.50734-1-lukas.bulwahn@redhat.com>
In-Reply-To: <20240924092423.50734-1-lukas.bulwahn@redhat.com>
To: Lukas Bulwahn <lbulwahn@redhat.com>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 24 Sep 2024 11:24:23 +0200 you wrote:
> From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
> 
> Commit 6eab0ce6e1c6 ("soc: Add SoC driver for Cirrus ep93xx") adds the
> config EP93XX_SOC referring to the config EP93XX_SOC_COMMON.
> 
> Within the same patch series of the commit above, the commit 046322f1e1d9
> ("ARM: ep93xx: DT for the Cirrus ep93xx SoC platforms") then removes the
> config EP93XX_SOC_COMMON. With that the reference to this config is
> obsolete.
> 
> [...]

Here is the summary with links:
  - soc: ep93xx: drop reference to removed EP93XX_SOC_COMMON config
    https://git.kernel.org/soc/soc/c/84db6f27b26b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


