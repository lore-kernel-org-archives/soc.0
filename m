Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8034248AE0E
	for <soc@lists.linux.dev>; Tue,  5 May 2026 21:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778015683; cv=none; b=iAo58tP/YUAK62gaA6N1oMg7pTFM7LosVntwPMVLkb5ygg21WSmBnNhwSi27buZ4UPuvVKfa1Tz68mjMGnZCPEm+q65FdCdvXtI5PUOhSFagMz6zx2VFds4qU6oXDzB00vtYpH61CX01h9Q9Ma6z16u1geh3ZXyeNO7RXifU5XY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778015683; c=relaxed/simple;
	bh=y2utraBRYOklN4l3m4hNkW4f7Udc0NCyFMyQyLnYl6M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PAvAb6kHwRB+XdfACQNFv3jP2VMpBPnVrowy6jDFlUfKYvy7ssO3/VlLOAxwTO+4WKq1SpuYgSEFkkqPinMg/XlaSPC3Q6B2QjZJLbFrA4xfsMwVfPPtyhg7/l8JHlsOEUzvLZBq+d2r24Om6qcVCOGGFLA3pFkn9aDvdk6Upj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UeAY9Apu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UeAY9Apu"
Received: by smtp.kernel.org (Postfix)
	id 29B12C2BCB9; Tue,  5 May 2026 21:14:43 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 212A4C2BCB4
	for <soc@kernel.org>; Tue,  5 May 2026 21:14:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 212A4C2BCB4
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c80167f56cdso1282148a12.3
        for <soc@kernel.org>; Tue, 05 May 2026 14:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778015680; x=1778620480; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=r2E1ZA+JT1zATLXU3871R3Np/zDJ4I4k+ZTjgi78jyM=;
        b=UeAY9Apuc8e4t7CwODuF7aWkFcDfczUVo/pXbEphlnNbRCilVaiE2ZfZg7WdEM7IkK
         MVJy3nEIeE3G2uxpy+NCyp+AJlITHNHSofmpMmpcwpxoEqSxPIF2xE2SKyRr52USSAMg
         Wj7P7oMQU4ULRJNly35ELSPN/Q1UsTPNgKB94nCjlotMQAlr1WzSuWt+OuMsCLX+zrVI
         eiOnogx0tt8TC+mudaNazPtvw5xyHB09RZK7hb5YM4Qw9skKeM7GJQCyiKXYBP0MRw4c
         4liojdK1c1RFmy9v/okflH1nf40JwjTv40+q7uuL9Wt5dvzBgb/vcJbZGQB1eGcW0R90
         hyRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778015680; x=1778620480;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r2E1ZA+JT1zATLXU3871R3Np/zDJ4I4k+ZTjgi78jyM=;
        b=p88J+MSqCDbBbiAdEo0UByHlqSOtaSd4vsSIBW/pqYNGfFT5n378c39NpNts1gyuj4
         8sCIm9x9oWVsJfZnymtifBTWDZssVPnVkld7eh9Uv1UbbCaEQp/aB4wRlHpaWNIqdwlm
         lX33sRJRbduSbxa2bIAF42gM6QGrJ/Xb5GMx0p94q7Ke/AnYnfTklfIEFcNKuFmLf3xv
         DUqcH+MXqSs0cnY4Aj7sQoZyXKFLloEHwwAf/UmHvj+v40H2GEDNFTW0SN0ejJOxAsyV
         UH07VrwTkI9v8ZLjBehO5/GjYWHmYIWM6/Porxya+NGOyGSBpdA/uvSXxXh+LJf3K6kt
         dxOg==
X-Forwarded-Encrypted: i=1; AFNElJ8OC2w6n7/LhhvGHqEzhRZarHHwbxYgk6G08UZEEDiYk6677LhcT2IR45FdCAo4zfm4AAU=@kernel.org
X-Gm-Message-State: AOJu0Yy2jDv6w1i8Ap/9411dqNccs0EUO/swHfnZv8lmgcv3kUCXINna
	o/a49Sqdg6MBBft2G2EdaqS3FsM5BpoCcFD+7Vy/Wbhjf2KS81OBC6V9
X-Gm-Gg: AeBDiessVdQ1gdijhjdCYRn1oRZkhVZdrCMOW4zJ4b6aDxTGsesEZcL+5e4L35qf/IF
	lFz+smZ45avclq5ud+Uea28LnEUKGZqHCbs7bWqYveP46Pz+4bJPPhSzzblJhFaziSRzejDkukI
	0/OdnFvPj4x8u1paoT8Y2TzTl4NFwYygPzWXtDOtve8c4hNXei3UEgZ3UdNPj4ysM5oSj7D/lEs
	UzXieQmSPs8zw0tVw1YY2M6KDrDC5lnFE27n0fJ6I6HXmrvZ7nQPU6PPr4jzYlGl03qblUTrnkE
	IGiL2sDXaUv447sX9YK1ik26Fx11+F9H4HlLDq4AoeRDTysE0Yo2DJVQm+fp4okgP1JJ3j34kfT
	aHvDCDGaS1BqTPK6iO5N2yCgxDqd6GqVDQ1oR7hUGnWXMoO9wCbRpY/OyhF/H+bwru2FDLo0gYi
	/7/7srEKSBEmUktDLtE2s4tbThpD+m0eOT+81IeTfnLFU+yIQXpfzC1Bk+FPELo8Kq003XXdsgm
	K57j/TIEDQ=
X-Received: by 2002:a05:6a20:a11d:b0:398:78c0:6dca with SMTP id adf61e73a8af0-3aa5a9545f3mr517767637.15.1778015680235;
        Tue, 05 May 2026 14:14:40 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8242bb871dsm135724a12.28.2026.05.05.14.14.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2026 14:14:39 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <02b810ab-12b8-4d44-91c2-ce6bf8ad894f@roeck-us.net>
Date: Tue, 5 May 2026 14:14:37 -0700
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: integrator: Fix early initialization
To: Linus Walleij <linusw@kernel.org>, soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org
References: <20260505-integrator-fixes-v1-1-56ab9aac59db@kernel.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260505-integrator-fixes-v1-1-56ab9aac59db@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/5/26 12:15, Linus Walleij wrote:
> From: Guenter Roeck <linux@roeck-us.net>
> 
> Starting with commit bdb249fce9ad4 ("ARM: integrator: read counter using
> syscon/regmap"), intcp_init_early calls syscon_regmap_lookup_by_compatible
> which in turn calls of_syscon_register. This function allocates memory.
> Since the memory management code has not been initialized at that time,
> the call always fails. It either returns -ENOMEM or crashes as follows.
> 
> Unable to handle kernel NULL pointer dereference at virtual address 0000000c when read
> [0000000c] *pgd=00000000
> Internal error: Oops: 5 [#1] ARM
> Modules linked in:
> CPU: 0 UID: 0 PID: 0 Comm: swapper Not tainted 6.15.0-rc5-00026-g5fcc9bf84ee5 #1 PREEMPT
> Hardware name: ARM Integrator/CP (Device Tree)
> PC is at __kmalloc_cache_noprof+0xec/0x39c
> LR is at __kmalloc_cache_noprof+0x34/0x39c
> ...
> Call trace:
>   __kmalloc_cache_noprof from of_syscon_register+0x7c/0x310
>   of_syscon_register from device_node_get_regmap+0xa4/0xb0
>   device_node_get_regmap from intcp_init_early+0xc/0x40
>   intcp_init_early from start_kernel+0x60/0x688
>   start_kernel from 0x0
> 
> The crash is seen due to a dereferenced pointer which is not supposed to be
> NULL but is NULL if the memory management subsystem has not been
> initialized. The crash is not seen with all versions of gcc. Some versions
> such as gcc 9.x apparently do not dereference the pointer, presumably if
> tracing is disabled. The problem has been reproduced with gcc 10.x, 11.x,
> and 13.x. Either case, if the crash is not seen, the call to
> syscon_regmap_lookup_by_compatible returns -ENOMEM, and
> sched_clock_register is never called.
> 
> Fix the problem by moving the early initialization code into the standard
> machine initialization code.
> 
> Fixes: bdb249fce9ad4 ("ARM: integrator: read counter using syscon/regmap")
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> Link: https://lore.kernel.org/20250518164118.3859567-1-linux@roeck-us.net
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> Hi SoC folks, please apply this directly for fixes.
> Got stuck on a sideways branch for way too long.

I actually stopped testing the integratorcp qemu emulation
because it no longer works reliably, not even with gcc 9.x,
since the timer-sp804 patches were applied.

Given that apparently no one but me ever hit that problem,
I wonder if it is time to remove support for that machine entirely.

Guenter

