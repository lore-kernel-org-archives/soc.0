Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F9701514F8
	for <soc@lists.linux.dev>; Sat, 11 Apr 2026 09:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775900028; cv=none; b=hJ9lrcrOAGT48cq+Z8tWyka7CYfo/EI/B8vkkIQgV7zgi3ApNq0W5b4/cWAcM+NwjfVOljb0ild4yhsNp9rYGSTsY0E+3dJrzK8dQjFmDnEbv3f1r1+vxRN9yv8wXa7/Paw0Tj7G6u34lUICcfgmViUca8ILQylSGEgrpiOFPo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775900028; c=relaxed/simple;
	bh=ZAsojg+L38qGOt1S6SMxGe0ku389Cu0RAoTT2bB7dAM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nfwk00K+frVdInhbgIEYySq+6LEljrWIp5A5Y7jeKZ/CKY1H0EDSMN7+Fp4P1BIo5KfNXLMvCT4FIXQuVEWifEEFlWNPDhCtcoh+bTHVuoaomGPuZD9jH/+bkMtrhsWp/MjDgtqZ2EwW9qgruMRRFkIkcv5y1DvBA6w7vUkBwSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xem/Eip/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xem/Eip/"
Received: by smtp.kernel.org (Postfix)
	id D4C5BC4AF09; Sat, 11 Apr 2026 09:33:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33C75C4CEF7;
	Sat, 11 Apr 2026 09:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775900027;
	bh=ZAsojg+L38qGOt1S6SMxGe0ku389Cu0RAoTT2bB7dAM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Xem/Eip/2oX2CimChE7En/sKX6lP8T6ARSJ2/0J+IpSaqldSb+UEMQCCqH5TWBzNu
	 dLlEWBdN+HdOQhyWfcV6xHZ70NofxBNJRvC7MfrgwLgicB4hKmmjejr0XC0Kt0ENLx
	 hhm3Qe2eyQzfecSGHzlh0DhZSb+kmokRh4amqHMfWK0AQjrCT3iyD4iBXfLJvXK5t+
	 Jep+ZLKvX9ZvU3eUX85V3xmjcuTzIrYs/jcy2RUA9ruzVLm5AkDR/6qsiAIEUSBBt+
	 ld4CSvrZzvli2Ki0hkVweixgxKPdxnsAv86xqzLM7+dOPJCUuujuXQAAQIHJ0fqv9y
	 39LU5RM5x7OkA==
Date: Sat, 11 Apr 2026 11:33:45 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Gregory CLEMENT <gregory.clement@bootlin.com>
Cc: Arnd Bergmann <arnd@arndb.de>, arm@kernel.org, soc@kernel.org, 
	Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] ARM: mvebu: dt64 for v7.1 (#1)
Message-ID: <20260411-brave-armadillo-from-eldorado-3b00c6@quoll>
References: <87cy072bho.fsf@BLaptop.bootlin.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87cy072bho.fsf@BLaptop.bootlin.com>

On Fri, Apr 10, 2026 at 03:25:39PM +0200, Gregory CLEMENT wrote:
> Hi,
> 
> Here is the first pull request for dt64 for mvebu for v7.1.
> 
> Gregory
> 
> The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:
> 
>   Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu.git tags/mvebu-dt64-7.1-1
> 
> for you to fetch changes up to 00e6d608fe80b0f68c325cb46862f78e9a8ec768:
> 
>   arm64: dts: marvell: armada-37xx: swap PHYs' order in USB3 controller node (2026-04-09 10:14:40 +0200)
> 
> ----------------------------------------------------------------
> mvebu dt64 for 7.1 (part 1)
> 
> - Armada 37xx/3720 device tree fixes:
>    - Reorder USB PHYs, standardize names, drop undocumented
>      properties, fix schema alignment
> 
> - Add Marvell 7k COMe board bindings and uDPU ethernet aliases
> 
> - Cleanup: drop unused .dtsi files
> 

Days in linux-next:
----------------------------------------
 1 | ++ (2)
 ...

So a few things were just applied, unless this was rebased?

I will wait with this. It might miss the merge window if v7.0 is
released this weekend.

Best regards,
Krzysztof

