Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF70C42A141
	for <soc@lists.linux.dev>; Fri, 17 Jul 2026 14:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784298038; cv=none; b=Wvoipsfr97GhN0oBIP/73y+jhrZAZy0N1qC4e1sPl/fL/e2vbdsbu7QeId2iTUv5VNGz0zH7mu9yPSnT7wYshUCZw6snQRzCiZjTSfItfyglZ5Tb4WB17Wd8vvPwjjlZZpWjo/3JVEOnb+vxkVIANeDWzVpjU4g0bNWw5bL14Gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784298038; c=relaxed/simple;
	bh=bjEU8CJeOP1hFt1IOiry+nB1DdRQBVfVq95wkbWnA7g=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=ReIVJkbuWmX2l46bHpgqX5kwnWQYjoq0jtvS2Tc21l6bOBXxDCTaT68jphOSq9xVlE+PtiheGoDiLbKQfRkTy93oP52BAEtZ6z7vHW3pVG2qo5PwQ9Soccm1Yc2OktlHYL0YUUSRRWj8kMk2QqvjHvU9Wxtk0bRuQp9G2MLtWpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XuGvJAcQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XuGvJAcQ"
Received: by smtp.kernel.org (Postfix)
	id BD8C91F00A3A; Fri, 17 Jul 2026 14:20:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A78411F00A3E;
	Fri, 17 Jul 2026 14:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784298036;
	bh=j9jT4I3TILK6l2alk9tSMifywAJtDg3cABvwL8+/fmk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=XuGvJAcQV/A3p7yWZTopzEjwne/wH9foZ2eHZXjm5GgHGIsXAr9BXlf6mxTTqnyOS
	 6ztpU3NWAiqvuFlTezubQwYSJ2HpR3XM6YxdyKc6OP7ItRfMU5+JjUG7WzYVdTQwYo
	 VtQ4Z0tiQsYBdpggBGndZSrxdBsGTPxXpCP4u7LoiDAOvP62PsT1L0POCD2reQKHE4
	 uVJa8/Imjm3PretHtyNkDG5KVQEVuB31cB1V1+y+jDs6/GiY7g0u87h1ITSH/0v02u
	 HCOsljSYEtLYUVj9Mhu1Jszuu9lMSezTC1foMpKdYsCdWTyV9dIcBGX1+/xz/9m/GP
	 rKhW96LJuJhLQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 56853380CEE7;
	Fri, 17 Jul 2026 14:20:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 01/10] ARM: replace linux/gpio.h inclusions
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178429800914.1738088.1189526302894912086.git-patchwork-notify@kernel.org>
Date: Fri, 17 Jul 2026 14:20:09 +0000
References: <20260710211954.1373336-2-arnd@kernel.org>
In-Reply-To: <20260710211954.1373336-2-arnd@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 10 Jul 2026 23:19:46 +0200 you wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> linux/gpio.h should no longer be used, convert these instead to
> either linux/gpio/consumer.h or linux/gpio/legacy.h as needed.
> 
> Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Cc: soc@lists.linux.dev
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> 
> [...]

Here is the summary with links:
  - [v2,01/10] ARM: replace linux/gpio.h inclusions
    https://git.kernel.org/soc/soc/c/8c44b5f068a3

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


