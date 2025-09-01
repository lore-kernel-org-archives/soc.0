Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5AA7EAC7
	for <soc@lists.linux.dev>; Mon,  1 Sep 2025 10:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756724361; cv=none; b=MFtizypLYyN11gytTCIeNP/mZWx5BPl7HgAnoYqXL7doi3v87zJvlfCCLlYEAtoWVr2ndbqlggPnvbdk/LsT9zYbawyhsWfBYPpImwDvLOyYvQrgcRHqm/WYiBit0JZu5F+YeGZTqBOlxEG+2vbGm0xoba9CsKBNxuDZ6OZ35SI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756724361; c=relaxed/simple;
	bh=Z3+thT/fS3S+zEiFJTzwyhSd6VLc/ynnNGsa2Ae6/ao=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=fbM9TiYGGB3p+8QVokbqvG4oFGzsGj4e54ufZdd0AhwX+PtqLWRlGHZsbA3gUfPloJ5gFYoCtW2BDOl4S2+j4m3qllbIJElw/+eBXJ0NPym4B8qtYCk+ZglAY86TczFXQ/jGfElyUlyPdVz1Fw9602n/TANJ7WQ4JxEWoHJlzlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=khskYBH8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="khskYBH8"
Received: by smtp.kernel.org (Postfix)
	id B1DEBC4CEF7; Mon,  1 Sep 2025 10:59:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C4DCC4CEF0;
	Mon,  1 Sep 2025 10:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756724361;
	bh=Z3+thT/fS3S+zEiFJTzwyhSd6VLc/ynnNGsa2Ae6/ao=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=khskYBH8d+Lc3k58n5boYULddk2yR6PGdjwSywUbwOJzxIU7dM10JkvkvaR1LDeGh
	 xj61okTBK4RGUdtjH+5gLDKoq52aRXJrZs/GqexryYD+QWrGG4CILvanbXYFN6BznT
	 vJBAH7ny/TfDw+dSZ7K42aevJnhhSKCpN97CNTfYrsr5JGa56hlBJyYLAbyZpKk8g3
	 FDMjiQZusyBuWNnqxl+6m3OA+J8r+4qQ2HRkkQMHTUEF2hHn3RaVR0AtE0ON2lMVkP
	 /HGQ9vt/T9qP1zR5+HHH/Y8bWgd6/gMNXhc86BNWxIWikM00gmxrIIJJSPPo5jI45a
	 qeJbN2fHtCLog==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADDF4383BF4E;
	Mon,  1 Sep 2025 10:59:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] Documentation/process: maintainer-soc: Use "DTS" instead
 of
 "devicetree"
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <175672436723.3681523.14125197832443397204.git-patchwork-notify@kernel.org>
Date: Mon, 01 Sep 2025 10:59:27 +0000
References: <20250812104154.42289-2-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250812104154.42289-2-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 12 Aug 2025 12:41:55 +0200 you wrote:
> Devicetree is a data structure and it is a bit generic term, because
> some treat Devicetree bindings as Devicetree.  What the SoC maintainers
> profile is mentioning in ABI stability are the Devicetree sources, so
> DTS files.  It is also more common during reviews to refer to these as
> per "DTS" instead "devicetree".
> 
> Clarify that by using "DTS" name in few more places.
> 
> [...]

Here is the summary with links:
  - Documentation/process: maintainer-soc: Use "DTS" instead of "devicetree"
    https://git.kernel.org/soc/soc/c/d407ad36dd34

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


