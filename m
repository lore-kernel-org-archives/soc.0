Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E474C2F261B
	for <soc@lists.linux.dev>; Wed,  8 Oct 2025 10:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759921073; cv=none; b=g5MWKwrTjklafuNmU38XrYuQVdKJOUG4jYKN5NRNlLZOzQDCEG25mXmrGiWGJq0b0LhvdoiDhu4EngGQy7LMRroBQjIn9hm0X3bgCDBmzKjUFbc8VqCGMRaKgkUWNoJNqdtTG2//qH739+oPK1xWSTvhLYCs6rvvJGHJHzFgjuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759921073; c=relaxed/simple;
	bh=9jfErV5OXB7MAM4JKfzS4NjtSOVQ243Q3WkZ40gM0Dc=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=ipDb3DzdLqDE/6q0zHibdfj3sh2TyVlPElgMyZ7q8F8P4O6ed33hEAwWTTiV9+MCZha5BijomfwbSZ8MapIKKsPmZ0dBg1CMNPNxB77/Ohl4ZhGa+kkuMhgKcWozFnhpWDUoQFr4Dg0m3fFOej9n7NhnJMovwXUERVW9ENY8u7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Up9AT+b9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Up9AT+b9"
Received: by smtp.kernel.org (Postfix)
	id 8BDD2C4CEFE; Wed,  8 Oct 2025 10:57:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76251C4CEF4;
	Wed,  8 Oct 2025 10:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759921072;
	bh=9jfErV5OXB7MAM4JKfzS4NjtSOVQ243Q3WkZ40gM0Dc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Up9AT+b9t/ETlz/Jta7jzeFWS+cSjNXSU1X8wZ712IhS7pOPoCQP+y30yAdJN8seZ
	 GGSEHUgiU4egZUyyU5hsPiSAewzLgPyRhNliaY5XnPPLLT2jyzlJhyNEve6Ea1ozCh
	 aC86crMwsKRMv9AXsJm5EGPQsE5Jqaj7ME3to6bb8xrcuR8A9HByDNNvvzYlgObuEl
	 om3wGO85/yjVwrmP/0qOJ9mtChYtcOQgO64jb5iReV5j7YDEsdh971eD0SaubKXqNg
	 /UimJz0vPFhMoeunAxbMPgmXoPUH2xWDiCggDO+S3eIpTC9OPIlRYy7s9us7qCZx8B
	 GLBLAgv4ZM2VA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70CF73A40FEE;
	Wed,  8 Oct 2025 10:57:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] ARM: configs: u8500: Set NFC_SHDLC as built-in
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <175992106107.3011254.17405840695081472521.git-patchwork-notify@kernel.org>
Date: Wed, 08 Oct 2025 10:57:41 +0000
References: <20250930122709.28987-1-linus.walleij@linaro.org>
In-Reply-To: <20250930122709.28987-1-linus.walleij@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 30 Sep 2025 14:27:09 +0200 you wrote:
> From: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
> 
> The CONFIG_NFC_SHDLC=m setting in u8500_defconfig causes a Kconfig
> warning because the NFC_SHDLC symbol does not support being built
> as a module.
> 
> Change the selection from 'm' to 'y' to build the driver in-kernel.
> 
> [...]

Here is the summary with links:
  - ARM: configs: u8500: Set NFC_SHDLC as built-in
    https://git.kernel.org/soc/soc/c/1f76c941c29b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


