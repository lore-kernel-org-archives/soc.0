Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 321B72D6E55
	for <soc@lists.linux.dev>; Thu,  4 Dec 2025 16:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764865642; cv=none; b=j1CSCPMxVkdE61H0vqtuV4l4vvIH1QpmcVrSMpdQeZHqbLcTOsCPz3ETpoAaZ4rYwspehq3YC2rPqpoo4BnGWNrCPn/ZiaSLOM8nTvM1n3ZAYvj6cw7ujLFNmGYaaEk5KlskgGUqdBVZNTVi2qmCRG8wBLbJUZnf0xAu5d5hT8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764865642; c=relaxed/simple;
	bh=RQT8UavqXoESiRh8hNJhO8nqw/En3xmbwwQkL6imarE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=upzImNLKsOzRGF5u/nGY7svo3FsB4TusGiV2+hqc44b2XUC2Rv8hg6o8OahooxU8cukk15nGNqUczhkpX+zPNPrxWp/7KjSBn2gTQBRTVsAKSpheYoaWv9+mTcLOBo2UGCQJQBT7/50lZhQ31M2PlnLc0APqkoW4pQLQdTKYq2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QoXnPTPx; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QoXnPTPx"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-477ba2c1ca2so14214485e9.2
        for <soc@lists.linux.dev>; Thu, 04 Dec 2025 08:27:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764865638; x=1765470438; darn=lists.linux.dev;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=88tPUK02ZLrC9M/8Z+z/1Oq9I1aD8192v0FSJkrRNjw=;
        b=QoXnPTPxR3j04efkgB5RRHYE/mffDByKK/Y2spr1aDdOUo1qbdklULXclMPXD8t0db
         7BY4kurm5ly0Wc6wCp6XIwt2/o/2Z6ddQqs4rxVtVnFdhSHNE90oecQ5scELYZChwYDW
         sSmUA+Zjj6vkwYbhYiJ+KMhW/m/TH5WuoOTneJB6wa4JN7hGE5s0aOK1Yq7GXN/HI35X
         BajF73JpCpcF82N6P+gM+LsQy7onBEAjk62/f+rTP2h/4ujD6coL+drgmqCMpJSA0YvY
         rgI1E0VamkgWSiHq+HFULyf59HgOqsrFB1tUda3ZbycCo7tpgIkE4oFRKIAt0WfQtpBK
         vLHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764865638; x=1765470438;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=88tPUK02ZLrC9M/8Z+z/1Oq9I1aD8192v0FSJkrRNjw=;
        b=YU7DIwZ1+94MQrzWk1aK6Be/AckxKjnclFm0eiDBQdN+nAhpytwb608Mbm7uIYE2/j
         sQrUvDGucnhU8kHz1A/C3me36OV0M2/yuDb9cjnlWBYQMrrtea5eA+2A9stEc51adQQD
         eHVTXo+x28M8159fXM2tP9Ms4IGNu9zuqmYVq4JpwzfdqMj+Ci0ppHc5+TPWAdGpFlA6
         roHewl7JqxTdIQo0w8jEcNl6e8VunFQ4U/HS5ortfukEd3jAHTpK5vudImgbCT4UJGIP
         ytCcGw/F7ZK0mvhd5RqysBP1fOKvfvIyX/WKu+G3HlQnBy7MzlGSA+ACZrM3VooJ6Bd7
         J+2w==
X-Gm-Message-State: AOJu0Yzisf6X26g1ZfecO2L3h3/h0DKwy6KHPPtBQZeSCGyDfAc/8ddZ
	XTaYLK3ZBMvTaWjtRuDCiKtoWsX4jC8G8qjSGFI15I6VButZD6NyqChj1cI8LA==
X-Gm-Gg: ASbGncsHYrH0KzOAA2jvqV7jAAXNEuRxNLGT/nbDtQYSizOrSNHJylW7qrpYrbYAyLz
	4oNB20OKMzs9JlRCz9+eixoLw4T2/Qkqfjdo81jQnMhwn4LsK0+no4tUeW/I4W68f2G5rvApF6V
	xaiet/5D9+BPUNEJOQ1KKnBg+YoVZuOWMGxOeFvaqNv0n5+NYrHyy+c25o7FxDebptCEGCBHu//
	KIKYeqg8XkmQSwlgTh3ZMX9AVLncrEs221rpTdLQS9A4qH5rziPg0Hg36jwwv+4uvCJ5iVAerck
	MaHFBwufGkdtRHbn2Yj4uDGME+4kKRaHvTvGYfuhtRTjS79Ff//4SQ+PjiaS+xbosOocFuiggR5
	EIbpNIPn1m2NrXSKEbde8wwmVMubFN5y6L7RN+dhyU7xjP+51Opl4wsLVF//F9BzExJCC8BcuNM
	1bBI9+uTlT8d0JYPpdwJWX+VRDd1c+k2mwQuVHR8mo3UGE5n9lF+bw8fd6H7XBvo3VxkJdNmhNv
	L498/So3ZwMiUAP
X-Google-Smtp-Source: AGHT+IEeiFh5JMgnQ8pShAVUYlCPwfqLImrWniLzd/dBupEr9CI1rxYrCJtKX41c/om1WIELKCCDCw==
X-Received: by 2002:a05:600c:1f8e:b0:477:8985:4036 with SMTP id 5b1f17b1804b1-4792f23c727mr34378505e9.1.1764865638123;
        Thu, 04 Dec 2025 08:27:18 -0800 (PST)
Received: from dell.localnet (2a01-114f-4013-18c0-0000-0000-0000-0540.ea.ipv6.supernova.orange.pl. [2a01:114f:4013:18c0::540])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42f7d2226e7sm4044141f8f.27.2025.12.04.08.27.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 08:27:17 -0800 (PST)
From: Janusz Krzysztofik <jmkrzyszt@gmail.com>
To: soc@lists.linux.dev, Aaro Koskinen <aaro.koskinen@iki.fi>,
 Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Tony Lindgren <tony@atomide.com>,
 Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org,
 linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
 Janusz Krzysztofik <jmkrzyszt@gmail.com>
Subject: Re: [PATCH] ARM: omap1: avoid symbol clashes in fiq handler
Date: Thu, 04 Dec 2025 17:27:16 +0100
Message-ID: <6216166.lOV4Wx5bFT@dell>
In-Reply-To: <20251204095355.1032786-1-arnd@kernel.org>
References: <20251204095355.1032786-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart5058772.31r3eYUQgx";
 micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart5058772.31r3eYUQgx
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Janusz Krzysztofik <jmkrzyszt@gmail.com>
Subject: Re: [PATCH] ARM: omap1: avoid symbol clashes in fiq handler
Date: Thu, 04 Dec 2025 17:27:16 +0100
Message-ID: <6216166.lOV4Wx5bFT@dell>
In-Reply-To: <20251204095355.1032786-1-arnd@kernel.org>
References: <20251204095355.1032786-1-arnd@kernel.org>
MIME-Version: 1.0

On Thursday, 4 December 2025 10:53:47 CET Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The ams-delta-fiq-handler.S file has a number of symbols with fairly
> generic names, including one named 'exit' that causes a compiler warning
> in some configuration options:
> 
> vmlinux.o: error: exit() function name creates ambiguity with -ffunction-sections
> 
> Change all these symbols to use a .L prefix to make them local to
> the fiq handler.

Reviewed-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>

> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/arm/mach-omap1/ams-delta-fiq-handler.S | 38 ++++++++++-----------
>  1 file changed, 19 insertions(+), 19 deletions(-)
> 
> diff --git a/arch/arm/mach-omap1/ams-delta-fiq-handler.S b/arch/arm/mach-omap1/ams-delta-fiq-handler.S
> index 35c2f9574dbd..5cf6fcca602c 100644
> --- a/arch/arm/mach-omap1/ams-delta-fiq-handler.S
> +++ b/arch/arm/mach-omap1/ams-delta-fiq-handler.S
> @@ -97,7 +97,7 @@ ENTRY(qwerty_fiqin_start)
>  
>  	ldr r13, [r12, #IRQ_ITR_REG_OFFSET]	@ fetch interrupts status
>  	bics r13, r13, r11			@ clear masked - any left?
> -	beq exit				@ none - spurious FIQ? exit
> +	beq .Lexit				@ none - spurious FIQ? exit
>  
>  	ldr r10, [r12, #IRQ_SIR_FIQ_REG_OFFSET]	@ get requested interrupt number
>  
> @@ -105,25 +105,25 @@ ENTRY(qwerty_fiqin_start)
>  	str r8, [r12, #IRQ_CONTROL_REG_OFFSET]
>  
>  	cmp r10, #(INT_GPIO_BANK1 - NR_IRQS_LEGACY)	@ is it GPIO interrupt?
> -	beq gpio				@ yes - process it
> +	beq .Lgpio				@ yes - process it
>  
>  	mov r8, #1
>  	orr r8, r11, r8, lsl r10		@ mask spurious interrupt
>  	str r8, [r12, #IRQ_MIR_REG_OFFSET]
> -exit:
> +.Lexit:
>  	subs	pc, lr, #4			@ return from FIQ
>  	@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
>  
>  
>  	@@@@@@@@@@@@@@@@@@@@@@@@@@@
> -gpio:	@ GPIO bank interrupt handler
> +.Lgpio:	@ GPIO bank interrupt handler
>  	ldr r12, omap1510_gpio_base		@ set base pointer to GPIO bank
>  
>  	ldr r11, [r12, #OMAP1510_GPIO_INT_MASK]	@ fetch GPIO interrupts mask
> -restart:
> +.Lrestart:
>  	ldr r13, [r12, #OMAP1510_GPIO_INT_STATUS]	@ fetch status bits
>  	bics r13, r13, r11			@ clear masked - any left?
> -	beq exit				@ no - spurious interrupt? exit
> +	beq .Lexit				@ no - spurious interrupt? exit
>  
>  	orr r11, r11, r13			@ mask all requested interrupts
>  	str r11, [r12, #OMAP1510_GPIO_INT_MASK]
> @@ -131,7 +131,7 @@ restart:
>  	str r13, [r12, #OMAP1510_GPIO_INT_STATUS] @ ack all requested interrupts
>  
>  	ands r10, r13, #KEYBRD_CLK_MASK		@ extract keyboard status - set?
> -	beq hksw				@ no - try next source
> +	beq .Lhksw				@ no - try next source
>  
>  
>  	@@@@@@@@@@@@@@@@@@@@@@
> @@ -145,10 +145,10 @@ restart:
>  
>  	ldr r10, [r9, #BUF_STATE]		@ fetch kbd interface state
>  	cmp r10, #0				@ are we expecting start bit?
> -	bne data				@ no - go to data processing
> +	bne .Ldata				@ no - go to data processing
>  
>  	ands r8, r8, #KEYBRD_DATA_MASK		@ check start bit - detected?
> -	beq hksw				@ no - try next source
> +	beq .Lhksw				@ no - try next source
>  
>  	@ r8 contains KEYBRD_DATA_MASK, use it
>  	str r8, [r9, #BUF_STATE]		@ enter data processing state
> @@ -162,9 +162,9 @@ restart:
>  	mvn r11, #KEYBRD_CLK_MASK		@ prepare all except kbd mask
>  	str r11, [r12, #OMAP1510_GPIO_INT_MASK]	@ store into the mask register
>  
> -	b restart				@ restart
> +	b .Lrestart				@ restart
>  
> -data:	ldr r10, [r9, #BUF_MASK]		@ fetch current input bit mask
> +.Ldata:	ldr r10, [r9, #BUF_MASK]		@ fetch current input bit mask
>  
>  	@ r8 still contains GPIO input bits
>  	ands r8, r8, #KEYBRD_DATA_MASK		@ is keyboard data line low?
> @@ -175,7 +175,7 @@ data:	ldr r10, [r9, #BUF_MASK]		@ fetch current input bit mask
>  	mov r10, r10, lsl #1			@ shift mask left
>  	bics r10, r10, #0x800			@ have we got all the bits?
>  	strne r10, [r9, #BUF_MASK]		@ not yet - store the mask
> -	bne restart				@ and restart
> +	bne .Lrestart				@ and restart
>  
>  	@ r10 already contains 0, reuse it
>  	str r10, [r9, #BUF_STATE]		@ reset state to start
> @@ -189,7 +189,7 @@ data:	ldr r10, [r9, #BUF_MASK]		@ fetch current input bit mask
>  	ldr r10, [r9, #BUF_KEYS_CNT]		@ get saved keystrokes count
>  	ldr r8, [r9, #BUF_BUF_LEN]		@ get buffer size
>  	cmp r10, r8				@ is buffer full?
> -	beq hksw				@ yes - key lost, next source
> +	beq .Lhksw				@ yes - key lost, next source
>  
>  	add r10, r10, #1			@ incremet keystrokes counter
>  	str r10, [r9, #BUF_KEYS_CNT]
> @@ -213,9 +213,9 @@ data:	ldr r10, [r9, #BUF_MASK]		@ fetch current input bit mask
>  	@@@@@@@@@@@@@@@@@@@@@@@@
>  
>  
> -hksw:	@Is hook switch interrupt requested?
> +.Lhksw:	@Is hook switch interrupt requested?
>  	tst r13, #HOOK_SWITCH_MASK 		@ is hook switch status bit set?
> -	beq mdm					@ no - try next source
> +	beq .Lmdm				@ no - try next source
>  
>  
>  	@@@@@@@@@@@@@@@@@@@@@@@@
> @@ -230,9 +230,9 @@ hksw:	@Is hook switch interrupt requested?
>  	@@@@@@@@@@@@@@@@@@@@@@@@
>  
>  
> -mdm:	@Is it a modem interrupt?
> +.Lmdm:	@Is it a modem interrupt?
>  	tst r13, #MODEM_IRQ_MASK 		@ is modem status bit set?
> -	beq irq					@ no - check for next interrupt
> +	beq .Lirq				@ no - check for next interrupt
>  
>  
>  	@@@@@@@@@@@@@@@@@@@@@@@@
> @@ -245,13 +245,13 @@ mdm:	@Is it a modem interrupt?
>  	@@@@@@@@@@@@@@@@@@@@@@@@
>  
>  
> -irq:	@ Place deferred_fiq interrupt request
> +.Lirq:	@ Place deferred_fiq interrupt request
>  	ldr r12, deferred_fiq_ih_base		@ set pointer to IRQ handler
>  	mov r10, #DEFERRED_FIQ_MASK		@ set deferred_fiq bit
>  	str r10, [r12, #IRQ_ISR_REG_OFFSET] 	@ place it in the ISR register
>  
>  	ldr r12, omap1510_gpio_base		@ set pointer back to GPIO bank
> -	b restart				@ check for next GPIO interrupt
> +	b .Lrestart				@ check for next GPIO interrupt
>  	@@@@@@@@@@@@@@@@@@@@@@@@@@@
>  
>  
> 


--nextPart5058772.31r3eYUQgx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEnyr6IsGnTYAeAkHJ2WqSnltsjBoFAmkxtmQACgkQ2WqSnlts
jBrMsQgAnOqLcgqd4VMzVjjHNYxPJsmd+I7OzdOytaNRJ0eqRFAYC36GAVqlkuqB
Dwwv+bh+cCPlES3ozAUr0WJ9fCgfA2Zvi1EHNdIJlyDwZOkpHKMm7BGN9drPBFST
XjUsixxJWQKQBUVFK4aASFoZ3cbrQ2KtOOHjqBQ1coaPw6cWZa8fbwWRDxLXGcDC
ISeJBjlLxHH5BJrUhlJ7iGw9LN1kDGleu/wal2gJfnuGZ6WVApDLujyDWhUsAV0M
IMf7x7yfyyCA9YoSNpZus4+w716T0/fKkVflh7TvqeQGqA1+FH8HRYguVYeRQkUQ
rnnTEfB6obbtIPimzaw1lvcrV9OvLw==
=X4/I
-----END PGP SIGNATURE-----

--nextPart5058772.31r3eYUQgx--



