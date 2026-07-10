Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CC5D263F5E
	for <soc@lists.linux.dev>; Fri, 10 Jul 2026 16:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783701028; cv=none; b=sw3nzFqMOzw4xSVGv/0Ggi2/fge9wP7JBcx+lvaC1uJSFi/9VErszoeuigd/IerSI6paYi+NeVx3sIFYbOAc20eywPwYjErVyBLNcUOwA2PkoEY43v0vMeBIQjJIZjQJKnxjb9mz48C8XuYQTZgj1Kmg/IJ0/cHgrKfmmwhcsJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783701028; c=relaxed/simple;
	bh=6PV0PrJ5dPxP4W5o1jQMvC8sIFkCRiOsY/MbMxFQljQ=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=L3d/caPVtkIQo63b4CsM6uSnyyWXzHf8Wn+dSmoKSYlYrQmd+rsl1StfZ74PpXzVld/c6tvUppDNzjZ9xWqnP0N7iTa5ThVUpi22FBeKit7MZZESw5ErUzh3tMmno/GicjG41TOZJCEuvv+ieBjapvrO1qPuKDFRnoj6+/TPfvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TEn7et5P; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TEn7et5P"
Received: by smtp.kernel.org (Postfix)
	id EDB301F00A3A; Fri, 10 Jul 2026 16:30:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D816C1F000E9;
	Fri, 10 Jul 2026 16:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783701026;
	bh=DeaofFUrL6UTIljjqYLESRtCsM4PjFfQkriRcQK/qTM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=TEn7et5PQpRydZQVpnoC2parDlffF9AnJ8hXDaCR8DZp/Nt68SZMSNZie3TgQ8aqn
	 RPS26ne55HzKvtWC004DY9aDFon9kZAE6Uw4HZwILInj/gCfXDWv+i7KyedLZOYK8K
	 8GpczOWLLRtgFMDVBMXkzqJ/60bvgpRYNqfRg1kPfZqCrKlYpOY+LT8pL8SDST0nM6
	 mfoeUWi9CujViAkYdhWlvbnlqJwN6D9Coz9ylw4fcYsadtx0KaItKv+6/WG45v8dXf
	 r/pxhhdNLZI8n3TXy3C7ckXdFn1iLDBHDgyhLyty9PDW2Oya5l1pwJ5JcfcXh2ogwi
	 wSLHbqevMCkTQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D0B883924FA4;
	Fri, 10 Jul 2026 16:30:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] ARM: dts: st: spear13xx: Drop unused/incorrect usbh0_id
 and
 usbh1_id
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178370100440.758747.7538757226294789794.git-patchwork-notify@kernel.org>
Date: Fri, 10 Jul 2026 16:30:04 +0000
References: <20260625091355.107054-2-krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260625091355.107054-2-krzysztof.kozlowski@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 25 Jun 2026 11:13:56 +0200 you wrote:
> "usbh0_id" and "usbh1_id" properties were never documented and never
> used by Linux drivers, thus should be safe to drop to fix dtbs_check
> warnings like:
> 
>   st/spear1310-evb.dtb: usb@e4800000 (st,spear600-ehci): Unevaluated properties are not allowed ('usbh0_id' was unexpected)
>   st/spear1310-evb.dtb: usb@e5800000 (st,spear600-ehci): Unevaluated properties are not allowed ('usbh1_id' was unexpected)
> 
> [...]

Here is the summary with links:
  - ARM: dts: st: spear13xx: Drop unused/incorrect usbh0_id and usbh1_id
    https://git.kernel.org/soc/soc/c/03f906d8f554

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


