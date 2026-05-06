Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E82DA4963D4
	for <soc@lists.linux.dev>; Wed,  6 May 2026 18:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778091255; cv=none; b=iyTU1Wd+y8XzBG1IbFIB9tmmE1ZKmF05iLXkA9cIPrEosqa65ReEVbrVZP7LubwyTOx7atTfurU+SybX6P+Q+MYMWn+jqlSkMGErb2YDpNn357DbhBpNEeKLaQuIg8KIqgMhlaQBa+jQKfulqqKOCyJmTrn9PMnx9X+1fnYMkDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778091255; c=relaxed/simple;
	bh=SyQtb7rjHAiN8Cc+TmajwPeTSsgNGypyU3wAOMmFXfE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UarLc3u9Hw6xMTM/rHinpdwkY7BOR7VIcdxsxtSNWtCZDZbTOnwekvQoXfcnOXzGut8Yv9xiRHUa5ny2uC44HKPfzN0+XAWyb+J3jlvUyX1aY05O7Vdf4TVf5DuxFpWYYIHVPVGZjKwJSgvRCjujr117gQJw5ruVtRoQl8xsjHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=yWWNLpp+; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="yWWNLpp+"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 51C361A3552;
	Wed,  6 May 2026 18:14:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1DEC56053C;
	Wed,  6 May 2026 18:14:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 91C3A107F1C0C;
	Wed,  6 May 2026 20:14:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778091249; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=UE+2Zam3ay8MYkBMhcoLDn4N5xRtFcmwEwLGUcw133s=;
	b=yWWNLpp+I5ZQobJ7kMrpz4OZD9zuMuFX+sZwPoC7yDqJlr7RixirIvsR0qNoS8jO2gjTmi
	5/fR8GJ8C3feLBwSwRkOxHfYbuEDIacO1YMvE7XVj1kGx55hr/uVMmew2JBzXqaiAntz+P
	P6ax1r0bk/J8BF6oTYPGUqKSGPd29AHDBnZguwoqr1zi3uJ1mtuGx7Gr/o2xFyzNC7Jun0
	M1MxNEm3LtVMARzfXOIqw1VXuyDvMiOcTFUIOqE3BYRFqH1UkWFaLYb4/DcsKM3AjyW22b
	d8DFUDYuabv/zNuRz44nFrzQHyoTn4GhEAyBc0npTnBQrWBcbDoFSm0EETgs0g==
Date: Wed, 6 May 2026 20:14:05 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Linus Walleij <linusw@kernel.org>,
	Drew Fustini <fustini@kernel.org>, soc@lists.linux.dev
Subject: Re: [PATCH v2 0/5] arm64: defconfig: Cleanup and change Ethernet
 drivers
Message-ID: <20260506181405ca12f502@mail.local>
References: <20260429-defconfig-v2-0-e4ed4186028b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260429-defconfig-v2-0-e4ed4186028b@oss.qualcomm.com>
X-Last-TLS-Session-Version: TLSv1.3

On 29/04/2026 20:50:21+0200, Krzysztof Kozlowski wrote:
> Changes in v2:
> - Drop patch #5 "arm64: defconfig: Drop AMD XGBE Ethernet driver",
>   because the XGBE driver is used by enabled ARCH_SEATTLE
> - Last patch (switch to modules): switch also IGB, because it can be a
>   module, since I2C will be built-in. Switch XGBE to module (it is not
>   removed now).
> - Add tags.
> - Link to v1: https://patch.msgid.link/20260412-defconfig-v1-0-a46918286451@oss.qualcomm.com
> 
> Several first commits have no functional impact.  The last one has.
> 
> Best regards,
> Krzysztof
> 
> ---
> Krzysztof Kozlowski (5):
>       arm64: defconfig: Move entries to match savedefconfig
>       arm64: defconfig: Drop unused legacy netfilter options
>       arm64: defconfig: Drop default or selected drivers
>       arm64: defconfig: Drop unused Ethernet vendors
>       arm64: defconfig: Switch Ethernet drivers to modules
> 

Reviewed-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

>  arch/arm64/configs/defconfig | 374 +++++++++++++++++++++++--------------------
>  1 file changed, 197 insertions(+), 177 deletions(-)
> ---
> base-commit: 9974969c14031a097d6b45bcb7a06bb4aa525c40
> change-id: 20260412-defconfig-b57e7f9b5394
> 
> Best regards,
> --  
> Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
