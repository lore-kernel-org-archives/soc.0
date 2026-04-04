Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 701A7C8E6
	for <soc@lists.linux.dev>; Sat,  4 Apr 2026 15:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775316310; cv=none; b=JHnW/KoeWlssRIgdWhUb8TWnlmbE2ySeVS4Co1b+q5BHsBGpJzkY9+54Hxhr4YAhGxHwf5VcRFAJJ4HQ+vfUzOAPQt26A5lVKdfFx+br/jo4yx8jAoECC09s2BbSfKeKcU8Rwdcnydv23gDeB99DPwpHD5ju2WSIl+Hhiiq1wg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775316310; c=relaxed/simple;
	bh=APOJ9yjOq4YrGjELxjclABUprH8J0TZfU15XjIenl1E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WlOdCMbr9U4wwky9QhgmoETtaZNfQWr9FByCSKz3xLBfsFrK6hMNo8RkbA9A3iZmbB9RgcwWOZJnMHF6nEnvHMboDFrMJjYW/zb4qolCANALExIa2D8NSlhtXh9dFARG10UljlfFqNAjb/t73+wSQ9uh68Gh2zO0otQduVhbu8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mXSZz5qn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mXSZz5qn"
Received: by smtp.kernel.org (Postfix)
	id 57B04C4AF09; Sat,  4 Apr 2026 15:25:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D56EFC19421;
	Sat,  4 Apr 2026 15:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775316310;
	bh=APOJ9yjOq4YrGjELxjclABUprH8J0TZfU15XjIenl1E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mXSZz5qndEjJF29Ycd1JYhl6ImQxdiG12iUWL6bG9+iCRZ71YWoe0R71opMbCBsrN
	 +r8SNp7IkGuwTTKzoEZtJG5FGL7ta5oI0C0MUPp20eQC4KEK++jLmbGrBifZ7n2IkT
	 qZKOYzrq8F8XuK6W/HKtx+8a0RnZ04zSbhuBYC90RLU/ywXTnhgNuEOrdZuY1MwoXZ
	 +DJm4gDZ1nL/wE2CaoS+GSgJVy1zTvDnqmshElpvmeOUvlT3YL0zo9GSv2sqIynP90
	 y+bHA9FVnVpRRet7/7tP/75JK3nmtcq5Z//5hoYADdqxfmzxV+7xrr/rWrr+T2kFn5
	 eAqnLCpRzn6Ow==
Date: Sat, 4 Apr 2026 17:25:07 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: soc@kernel.org, arm@kernel.org, nicolas.ferre@microchip.com, 
	alexandre.belloni@bootlin.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] Microchip AT91 defconfig updates for v7.1
Message-ID: <20260404-versed-squid-of-upgrade-03aafa@quoll>
References: <20260403070259.2552626-1-claudiu.beznea@tuxon.dev>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260403070259.2552626-1-claudiu.beznea@tuxon.dev>

On Fri, Apr 03, 2026 at 10:02:59AM +0300, Claudiu Beznea wrote:
> The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:
> 
>   Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-defconfig-7.1
> 
> for you to fetch changes up to 1f17fce8bf19a48e5e5610c6da8f806eab81878a:
> 
>   ARM: configs: at91: sama7: enable LVDS serializer support (2026-02-28 16:04:03 +0200)
> 
> ----------------------------------------------------------------
> Microchip AT91 defconfig updates for v7.1
> 
> This update includes:
> - LCD controller, LVDS controller, backlight, simple pannel, touchscreen
>   configuration flags required by SAMA7D65 SoC

Thanks, applied

Best regards,
Krzysztof

