Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795043041;
	b=BGU6HHXYKdNJWOAx4KOd2udw0c+YOheFGaDgfAf/h2awEivZg6mzwCshy5J9PjcKoJIn
	 V0vg8LDgQECur4aM6cWSCKdPrrToWPvzNK6j+kGsJZECz4Iy5kx1KjvETgCqTNO1IejiK
	 HQ+uSpzkGn1tkAK6hr1PNHLjLd2QWlpJ4np57kT3DMA2j45wgjDedtjkbb6pU9dYbIoJC
	 JMhoBYIOqd/vB7LxUjWE1Jc1tvMAfx1L+RrTTyL24Nd6f4cS5AJw9ysHKQ0Jd7FaeGmyI
	 VeXzANe/x6pcgb8IDo+wO6FsKjN86aAif/9xaCBw+BR5lQTEu/gfdt4FFjDkHdTInqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795043041;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=i4iIo8Mq+sa6c0unlydNIobU5/d3a9Jv12oAlD0QbJE=;
	b=Olq5UnegyQKBXXqcmwzsd8dG28DxfvzjLxC+WLomdWvPL8ww3QrEFpa2bzYDz8dqehYb
	 fjyC6DpEV35xTJ/T8TpB7tyUkz3MYhJ4cdHN/ClGi0S4jnVNZEvkYgJ5xxWwHQdYKnJOR
	 Sc1abvNoWb2nBy9qNam7Kq1yNWeuKt2fdqm1/SSxbTX7BykOUYPFQgls9PhRFOYiQxRpp
	 s/yLrNb7/Fm1JtdRB6Xbgzym8epblvWGLTk4Bi8tNaTJ0KBOjcBVTvwbIJGz4eVqLR0L3
	 8TMmGJGaS5zSwWOoy1pacRAK78f9cciS09tI5DElz8vwuex3cXq34Q3OVYv+9g6OTwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gNtVm2Ic;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92A3160A2637
	for <soc@lists.linux.dev>; Wed, 18 Nov 2026 23:04:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92A3160A2637
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gNtVm2Ic
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4bb6adaf0f1so15093275e9.0
        for <soc@lists.linux.dev>; Wed, 18 Nov 2026 15:04:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795043039; x=1795647839; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=i4iIo8Mq+sa6c0unlydNIobU5/d3a9Jv12oAlD0QbJE=;
        b=gNtVm2IcfoSxoEi5sNQnp1ICLqXYPGRkcVtwETScjonTpqzmDjDq+C5qhJl5jrf+NE
         xeXU6ydW5eY/OVDkSiF9MGYfSGpGvQu3mDuvBidHX5zSlhcp1ch9bmfPVm41QBO+YI3M
         NgV3tC2FQJ0yD4V1pVDMH7369s5dDRLBTrjPb4gtAFbj4D2fJGWFxOIyIl3FDU4i0ihW
         /t41Uc4YsGoc2X7SwAGsVPvjnV8TxQo/tHURPN5XwcpZ5AmtVUgRFiDnC5gcRwsAlmt6
         j0ZlMKeM0di2k6/hlSiMPlhSg+wI9aVIzPDlRas1VGq0GMljzVyYXYJse0TfWj7VNg8S
         B85g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795043039; x=1795647839;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i4iIo8Mq+sa6c0unlydNIobU5/d3a9Jv12oAlD0QbJE=;
        b=zsNXLn6iwmhyxPxKJz8dOmuV/AvOH9uTP3azakfz+RaL4gL/zZNsevJVBStBpENN0N
         ZdlMzkFeQMOeF+OQsQJmV4Y43K1va1Moe43OcOhBps6up6DySyZ3PriO+5qu+gjpLFlB
         IoerophpEeRVIXpZOrmhOzYdg6k5mkZiHilh45qmjMywBXuPtp6liCaejuuYXDGsjtKD
         97L1b0jSy7wuky8QAIe8fJcOK/Rkue8wMPaRL+imRjOnwKZ/L+PceAFIILQYtQT0GlsX
         99DahBx6GfZp0fS1vDvUZ6wSvaajVO7L2uxF0wG0Sq26gsq5bPFOo57asbp+9D6G0HC0
         powg==
X-Gm-Message-State: APuU4Z84H6kwjM34fzOR28dBPi95BxzZUknc7P2jbyB8eDbCHtbxXoaX
	6lPW+9AXipak4Wor5tQrpI56yUGDps1AZPVQRUUO319CW+Erjplz9uZF
X-Gm-Gg: AYBFou14RVahp8P9l7BMbCbeBxcoN6jfECsox/lU5ZD5WIATugaXFWbQvPDvH1UHDWl
	2A6SAoxGAz6mwImME8S+VsDl0Na7vWEP9xXHFtMrd6Adc+97kvNRDXoGdwf3q4lRuEYyqTv9XcQ
	Wku/EzmtclP7UtfMSYHOP6P47vW9oBJgBP3yJEPpg+PlvnX7QVKJ4xJnz46pAhoSsb+IFRbVGll
	InMqOD/bA46snEb2pNo/HgxHCV5cCmLeuSNRI/kiie74c8MIKoLqBzcCrdrXcXMH47ZCmWeRl3C
	Hp0kJ67FV1b4YGFQ3T+UA47zLpbSeCZnIaZx9BsbIQHqugr2YVkIUIJBYBV+1oKYRjpn5OKqfZS
	UJyLOfMmR0JBbd/cBFEPxNxjLMB8kBIUtqbdBHuxKo5hMgj0P3lo5ujR/72qmoNieto7Hv32iVQ
	ye1vRvc32q2BFpnQ3KBwWqHmSy06Y2cySNy8AZkjcL2PGswVpwStk+zXrqtsdOagqNTlKQ2sqKf
	S41pCwIxU6jqrpIrVdTG2CjoMSr3wsQsKpDW/o3OAbM8X9e1pLEFqYCqu+5FAy8K+BPvDNPTKfO
	xKlAxoec+zcE/O47P9hDpyEJarspe3OP0eBN+regWRTA1yypVpz+DM9emHmpYM+OESJ+FjR3p9H
	fhrW9dic=
X-Received: by 2002:a05:600c:5491:b0:4bb:5e6b:49e with SMTP id 5b1f17b1804b1-4bb7d9fb0e0mr80338115e9.6.1795043038706;
        Wed, 18 Nov 2026 15:03:58 -0800 (PST)
Received: from localhost (brnt-04-b2-v4wan-170138-cust2432.vm7.cable.virginm.net. [94.175.9.129])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb842e93f6sm4886145e9.2.2026.11.18.15.03.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 15:03:56 -0800 (PST)
Date: Wed, 18 Nov 2026 23:03:55 +0000
From: Stafford Horne <shorne@gmail.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: soc@lists.linux.dev, Arnd Bergmann <arnd@arndb.de>,
	Jonas Bonn <jonas@southpole.se>,
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Simon Schuster <schuster.simon@siemens-energy.com>,
	Vineet Gupta <vgupta@kernel.org>, linux-openrisc@vger.kernel.org
Subject: Re: [PATCH] openrisc: stop using libgcc
Message-ID: <av4u27rT4UqtnXUM@antec>
References: <20261118160820.2994933-1-arnd@kernel.org>
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Post: <mailto:soc@lists.linux.dev>
List-Help: <mailto:soc+help@lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
List-Owner: <mailto:soc+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261118160820.2994933-1-arnd@kernel.org>

On Wed, Nov 18, 2026 at 05:08:20PM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Based on the work for nios2 and arc, remove the inclusion of libgcc
> and instead use the kernel's own copy of the required functions.
> 
> Cc: Jonas Bonn <jonas@southpole.se>
> Cc: Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>
> Cc: Stafford Horne <shorne@gmail.com>
> Cc: Dinh Nguyen <dinguyen@kernel.org>
> Cc: Simon Schuster <schuster.simon@siemens-energy.com>
> Cc: Vineet Gupta <vgupta@kernel.org>
> Cc: linux-openrisc@vger.kernel.org
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Stafford Horne <shorne@gmail.com>

> ---
> Hi Stafford,
> 
> I've based this on top of the branch at
> https://lore.kernel.org/all/20261118144652.3124085-1-dinguyen@kernel.org/
> which I've merged into the asm-generic tree. Vineet already
> has a similar patch for arch/arc, and I did the one for
> arch/openrisc after seeing that everything is there.
> 
> If this looks ok to you, please Ack so I can merge it in the 
> asm-generic tree as well.

Thanks,

This all looks good to me. Acked above.

-Stafford

> 
>  arch/openrisc/Kconfig             | 10 ++++++++++
>  arch/openrisc/Makefile            |  3 ---
>  arch/openrisc/kernel/or32_ksyms.c | 14 --------------
>  3 files changed, 10 insertions(+), 17 deletions(-)
> 
> diff --git a/arch/openrisc/Kconfig b/arch/openrisc/Kconfig
> index 6aaedc67a5e0..5be29befd86c 100644
> --- a/arch/openrisc/Kconfig
> +++ b/arch/openrisc/Kconfig
> @@ -22,6 +22,16 @@ config OPENRISC
>  	select GENERIC_IRQ_CHIP
>  	select GENERIC_IRQ_PROBE
>  	select GENERIC_IRQ_SHOW
> +	select GENERIC_LIB_LSHRDI3
> +	select GENERIC_LIB_ASHLDI3
> +	select GENERIC_LIB_ASHRDI3
> +	select GENERIC_LIB_MULDI3
> +	select GENERIC_LIB_UCMPDI2
> +	select GENERIC_LIB_DIVSI3
> +	select GENERIC_LIB_MODSI3
> +	select GENERIC_LIB_UDIVSI3
> +	select GENERIC_LIB_UMODSI3
> +	select GENERIC_LIB_MULSI3
>  	select GENERIC_PCI_IOMAP
>  	select GENERIC_IOREMAP
>  	select GENERIC_CPU_DEVICES
> diff --git a/arch/openrisc/Makefile b/arch/openrisc/Makefile
> index 68249521db5a..38dc87bc6a3a 100644
> --- a/arch/openrisc/Makefile
> +++ b/arch/openrisc/Makefile
> @@ -18,7 +18,6 @@
>  KBUILD_DEFCONFIG := or1ksim_defconfig
>  
>  OBJCOPYFLAGS    := -O binary -R .note -R .comment -S
> -LIBGCC 		:= $(shell $(CC) $(KBUILD_CFLAGS) -print-libgcc-file-name)
>  
>  KBUILD_CFLAGS	+= -pipe -ffixed-r10 -D__linux__
>  KBUILD_CFLAGS	+= -msfimm -mshftimm
> @@ -55,8 +54,6 @@ ifeq ($(CONFIG_OPENRISC_HAVE_INST_SEXT),y)
>  	KBUILD_CFLAGS += $(call cc-option,-msext)
>  endif
>  
> -libs-y		+= $(LIBGCC)
> -
>  PHONY += vmlinux.bin
>  
>  vmlinux.bin: vmlinux
> diff --git a/arch/openrisc/kernel/or32_ksyms.c b/arch/openrisc/kernel/or32_ksyms.c
> index 5aabef30ca09..7ae38030a9d4 100644
> --- a/arch/openrisc/kernel/or32_ksyms.c
> +++ b/arch/openrisc/kernel/or32_ksyms.c
> @@ -27,20 +27,6 @@
>  #include <asm/hardirq.h>
>  #include <asm/delay.h>
>  
> -#define DECLARE_EXPORT(name) extern void name(void); EXPORT_SYMBOL(name)
> -
> -/* compiler generated symbols */
> -DECLARE_EXPORT(__udivsi3);
> -DECLARE_EXPORT(__divsi3);
> -DECLARE_EXPORT(__umodsi3);
> -DECLARE_EXPORT(__modsi3);
> -DECLARE_EXPORT(__muldi3);
> -DECLARE_EXPORT(__mulsi3);
> -DECLARE_EXPORT(__ashrdi3);
> -DECLARE_EXPORT(__ashldi3);
> -DECLARE_EXPORT(__lshrdi3);
> -DECLARE_EXPORT(__ucmpdi2);
> -
>  EXPORT_SYMBOL(__copy_tofrom_user);
>  EXPORT_SYMBOL(__clear_user);
>  EXPORT_SYMBOL(memset);
> -- 
> 2.53.0
> 
