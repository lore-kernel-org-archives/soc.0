Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B0AE1853
	for <soc@lists.linux.dev>; Fri, 20 Dec 2024 17:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734714628; cv=none; b=DqCR+TFTOpJLDy+50lx3Ch9/frAzGVV2y0DLWxPJxn8/XJqhMgv9JApyvm0J12lJHdCU/h5BFxGx8XUyRTyYZrzAn9dcV94i/Wddy1rnRYf+Q3td2zvZzpqpwK/P9PaL1WOdzzLVgUwzmcy4uR8t7ungPSCoFpt8gyJE3jEtunQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734714628; c=relaxed/simple;
	bh=uStn8Ol6IEwg2VdZPlfqW4Z7qV7D7NxEn4SALBdLWeE=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=G7CL/ldUnLhPrH3KjP/qH+auXAQS2V6pMYU79o0Kt47FtmYUvPhpG81hgvxwqEyLBgdCSdvkmdGKsEmX+WbngV/eSmQpNweh9EfVhUV/EjjHGjI6PVQj05qYJ14cZ6r4OpIbeT8zbJWpnJ06i3I2FCsm/shkZ70QtLV7YlNl9F4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KefWKx6L; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KefWKx6L"
Received: by smtp.kernel.org (Postfix)
	id 37300C4CED3; Fri, 20 Dec 2024 17:10:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 213B5C4CECD;
	Fri, 20 Dec 2024 17:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734714628;
	bh=uStn8Ol6IEwg2VdZPlfqW4Z7qV7D7NxEn4SALBdLWeE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=KefWKx6L4HKpogDD7yhtM/lFMKrI/4B9AyhUpGfAv+crdYUodbZTgsG15h3/ogf+l
	 iLOStQl6xapCSxPPsDvLE7tv6TxtAGXf+KY+tC+2e3ekEnwCtoJ6IWn9nO96xofx7Y
	 Z+mWSDTU86E6l6dsy9kx43C3sJSWFNLgZQOPGAMIHZlzqmmwUx0Yd9AT2haAbImyZ3
	 Y6uG1HCXZ4ORMkEt3cXGKKkcFCdJ9h/xNVi6xGMSEyNHh4Fv8Rky1ZreYmTFCkmUbA
	 XDWVAWu5uwmAHWhlIHALzPluvBWblbcvXpa2dOC3bHkiyGBdEG+6X8tfxXSBt6EdCf
	 bzVi97KQQaqnw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33DBA3806656;
	Fri, 20 Dec 2024 17:10:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/1] Broadcom devicetree-arm64 fixes for 6.13
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <173471464574.2963436.4454985250742598231.git-patchwork-notify@kernel.org>
Date: Fri, 20 Dec 2024 17:10:45 +0000
References: <20241217190547.868744-1-florian.fainelli@broadcom.com>
In-Reply-To: <20241217190547.868744-1-florian.fainelli@broadcom.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 17 Dec 2024 11:05:47 -0800 you wrote:
> The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:
> 
>   Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)
> 
> are available in the Git repository at:
> 
>   https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.13/devicetree-arm64-fixes
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/1] Broadcom devicetree-arm64 fixes for 6.13
    https://git.kernel.org/soc/soc/c/a31ffd6ed5ee

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


