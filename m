Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88C8820FA99
	for <soc@lists.linux.dev>; Fri, 11 Oct 2024 10:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728644375; cv=none; b=sCtYi5XZKP0XRC/BRijYgGHJsm/FFO3zLuP8Akp5UKDZM6a3MBHcN8s87x0fGIZf1HELkUESmWIA7clViMgiuU+Wv7db9kt+erGB+qXRKIVMm7UlfOaLjnw3FdPgPnsJ+hd5VnutKb6LPgAvzj8oJhvjA1SyCIvLydaxasReH4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728644375; c=relaxed/simple;
	bh=av8bEjrXXRS5pKn3LsPGgurTIoZmVDJ0yAqW4jZvems=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=hIKO1UtKlgr9oAfzLqwASNbk7FObS/ZFG7LKlyzKI68lMmmcv/E9R+2R7z16icuB9lkUNQt74fySDIX1f+3IHJxUpHXswGn4yIvGK2JUl58qUnwIzcA6BHdSZ4inu6ockO6vW/1JjH/uNB1fxnUw0tQLrokLLB78sm3kvUEVVPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bSYbpXHf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bSYbpXHf"
Received: by smtp.kernel.org (Postfix)
	id 7DF17C4CECD; Fri, 11 Oct 2024 10:59:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 687FFC4CEC3;
	Fri, 11 Oct 2024 10:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728644375;
	bh=av8bEjrXXRS5pKn3LsPGgurTIoZmVDJ0yAqW4jZvems=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=bSYbpXHfmPgFIBoQEjsP/rV+tC+6pjPd2I4Q/6jqr4FQadcyv+UpouibW9nx+TI50
	 r2m4kqkUzZVghbeaP4M52x5iKprW2ITbRKxqXwlFZM6KyOQuD91khRoDdSMgS3Osv+
	 hIR6UmZ37+tMPo+/IQwbPIX3PgKPfKiSbKPX64RleqbngdgvzqQoqxToUXRnnwOeGu
	 dJXnymzqxLPJ8l+Qow1EnWM0lyzAsfzpoHJTOH6mcIKn4bo9qXGlPG/WXT0Sv1GsyU
	 7jtlIV0HUwlqkrouUjeikiFeIf4iP/VaMze1GmMV0l+8VulSAzhC/4lCs3sCarwW1o
	 YhnTEJDAevM4A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33E773822E4C;
	Fri, 11 Oct 2024 10:59:41 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] Documentation/process: maintainer-soc: clarify submitting
 patches
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <172864437998.2676212.18406877190424948513.git-patchwork-notify@kernel.org>
Date: Fri, 11 Oct 2024 10:59:39 +0000
References: <20240925095635.30452-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240925095635.30452-1-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 25 Sep 2024 11:56:35 +0200 you wrote:
> Patches for SoCs are expected to be picked up by SoC submaintainers.
> The main SoC maintainers should be addressed only in few cases.
> 
> Rewrite the section about maintainer handling to document above
> expectation.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Kevin Hilman <khilman@baylibre.com>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Conor Dooley <conor@kernel.org>
> Cc: Heiko Stübner <heiko@sntech.de>
> 
> [...]

Here is the summary with links:
  - [v2] Documentation/process: maintainer-soc: clarify submitting patches
    https://git.kernel.org/soc/soc/c/29ce0bca6d5f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


