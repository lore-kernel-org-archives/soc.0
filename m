Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC1CB280318
	for <soc@lists.linux.dev>; Sat,  4 Apr 2026 15:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775316693; cv=none; b=rBO2+nTUJZwxAwNnfaIJMZ0CoAQt06b+SLeRIEjfAhh1QI0KIGjPVJSlfuC8wmW3Y6fu4T//2FPwlnD4tIz31uQvuSZHuyRQg1+xqcM3LxitPP4XOXQZbBnVOfIMRWLLn9PnfY9ijIUcc5BcPhPadOnx5bw0b7we2IlNAFGBS/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775316693; c=relaxed/simple;
	bh=Jj345pl+qal7aG0Q1tYZedCjsr+sVk8K+OmliaqF4sI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bVxrhAr/kHGotJLannP1jd4Gaw4hGaXfVzLalz81uLUYOHEwz366ZnF21hQgtb3ErLVAufE2i6pZgZltDamKH9gWIh6g84r/EZ0/9FkjtxRPNNC3HEqKb0MdVTTztGYNgcRkHp2nlXUBiOYVMTXkhLCD/2tNQ9Q9AriAaRH+kIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jyALPOMM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jyALPOMM"
Received: by smtp.kernel.org (Postfix)
	id C7D33C19424; Sat,  4 Apr 2026 15:31:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29066C19421;
	Sat,  4 Apr 2026 15:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775316693;
	bh=Jj345pl+qal7aG0Q1tYZedCjsr+sVk8K+OmliaqF4sI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jyALPOMMBXuS4jfm5YuWGWwXWTDZ+mPWNO6j+42krZLCWuex+1n7pFozJyM63Fo23
	 qaCV/wnj+GksER0nRdyNWnjPUz2LpRfqEkmFOYcVrTKctLh+BOa0DC2COATyeVM4Ht
	 h0BG6qBxEBHWT6EntTU8lk2uyiS2YsrdkbsJM7Jr7S5M0wVeFzVHmL6D/B+xLMaR6Q
	 Kj9pYqH6FwzJ6BPZ8xBdkXX5p1fMWt0Lgu1Dyr0pJqwqbUZGHPfgbuypFBwqGgFaC2
	 yKd3zEHP6LCFVzKAfnr354wcETmAPUhp1Sca7BlIyYUm8OXEANT/sBCDwPOpngotnl
	 /XevyBxnDHxBA==
Date: Sat, 4 Apr 2026 17:31:31 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: soc@kernel.org, arm@kernel.org, nicolas.ferre@microchip.com, 
	alexandre.belloni@bootlin.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] Microchip AT91 SoC updates for v7.1
Message-ID: <20260404-quick-quartz-mouse-ac84ef@quoll>
References: <20260403070344.2553018-1-claudiu.beznea@tuxon.dev>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260403070344.2553018-1-claudiu.beznea@tuxon.dev>

On Fri, Apr 03, 2026 at 10:03:44AM +0300, Claudiu Beznea wrote:
> The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:
> 
>   Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-soc-7.1
> 
> for you to fetch changes up to f3ae0049ff8a3d2cbd8c05857705744435629d0c:
> 
>   dt-bindings: arm: atmel,at91rm9200-sdramc: convert to DT schema (2026-03-07 16:41:03 +0200)
> 
> ----------------------------------------------------------------
> Microchip AT91 SoC updates for v7.1
> 
> This update includes:
> - device tree bindings conversion to DT schema for CHIPID, RAM
>   controller and PIT, PIT64b, ST timers
> 

Thanks, applied

Best regards,
Krzysztof

