Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D8081E47B6
	for <soc@lists.linux.dev>; Fri, 13 Dec 2024 17:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734109219; cv=none; b=O9so/u1FbiPOe+fFnRuCzKQ1w1qBaGUjTwOe5jnJi+Cu8oySkWnPdrVby9KAG8ESrzwl5iOK53ATjUeyDS+2uyW5j0dxUkF1n/ioW9bHr724unda4/sQ4XuYgmiIiVZcaB+J7nsblRkeDY5TkKtNPAMxI40akmo1C+KhzmKEeKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734109219; c=relaxed/simple;
	bh=Ge+JiMUmVT6qFxiP7mO2v2+7cxFReMP1ThWxAFAyTSM=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=Zy2j8p/QHBGnY/+l7vwlffrrYSomNrrsjrDVkgXT06aKwzTSyTzGDMJzOeNRLKlMMYdE4LZGpXKkYwA7x7c7OayXGdYsO+wd3Adae7ZS11UZsItAKQ5fkKH8wkHnvfpGMXDxJ2zP8rH3j/y3G+wTZHTd8fbB/HRM3wVyZZEi8P0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aukloEpo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aukloEpo"
Received: by smtp.kernel.org (Postfix)
	id DBFACC4CED7; Fri, 13 Dec 2024 17:00:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6108C4CED1;
	Fri, 13 Dec 2024 17:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734109218;
	bh=Ge+JiMUmVT6qFxiP7mO2v2+7cxFReMP1ThWxAFAyTSM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=aukloEpoYDCxzABpcHBdVcsasLxcprEzsYcUlFfIHlNR7SyliuUXt6gYWMshkrPWE
	 7YS1HAAiqnk7kGegdlhiqXGYiYaY+0g/iKLIE7yY3s0PIog7usoMXd52nxAVO+7Lui
	 CJ9/0BU1DRZTsw9AhJg+xwAPT6c3jYVMoBQXN3K1X8h1JG7qdDx3eSUtvtiSCgcVpD
	 ODE91sn0V3PCBo7hfgGDQz4zzobS1EYzhA2T2IYrKzoKKOWb+Jcn/6VGkop6XHkoHy
	 jf5wwUB43jLmN3OR93nouRaeE59PokmyG3f6suInQhy1fLr+cvcJJx+ryjHPkr+ttg
	 BNelU38NHI3zA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70D2B380A959;
	Fri, 13 Dec 2024 17:00:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] ARM: dts: nuvoton: Fix at24 EEPROM node names
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <173410923498.3098520.10287857101437072457.git-patchwork-notify@kernel.org>
Date: Fri, 13 Dec 2024 17:00:34 +0000
References: <20241112002557.26284-1-andrew@codeconstruct.com.au>
In-Reply-To: <20241112002557.26284-1-andrew@codeconstruct.com.au>
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 12 Nov 2024 10:55:57 +1030 you wrote:
> From: "Rob Herring (Arm)" <robh@kernel.org>
> 
> at24.yaml defines the node name for at24 EEPROMs as 'eeprom'.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> Link: https://patch.msgid.link/20240910215905.823337-1-robh@kernel.org
> Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
> 
> [...]

Here is the summary with links:
  - ARM: dts: nuvoton: Fix at24 EEPROM node names
    https://git.kernel.org/soc/soc/c/b589fbc3f413

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


