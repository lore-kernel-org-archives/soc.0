Return-Path: <SRS0=5cVK=ID=gmail.com=f.fainelli@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A55EC47073
	for <soc@archiver.kernel.org>; Sun, 24 Dec 2023 10:13:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E2F76C433C9; Sun, 24 Dec 2023 10:12:59 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 108D8C433C8;
	Sun, 24 Dec 2023 10:12:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 108D8C433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-67f85fe5632so21370846d6.0;
        Sun, 24 Dec 2023 02:12:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703412778; x=1704017578; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=p48odNgqxhO6kdRRxgNqnTYSujAesBEGJvWcL4xhtP8=;
        b=RxiXMyh5T2uVrrr5W32Y7O+Uj68pHPoD3C1ZGZ/ULCBp911KFjGVro4Rqd5QPK8Idx
         vZoglGIimsJnQVFsgf2d+Qz43v7znV0PmqADMmchUUsV+Ek++FxQGY3UKDH+xGXO829R
         ZfYMl2OLLOGn9RFNubTp0gU5jhl8ShmWwdtuTbVTvgNQwer/0VxUHs4n2Bo9n+b9CIba
         U/ns8Lykv2lRobTe86cAtOh/GND/KPBkWU2XiJ4MceWlawPoslcDdTIRF39WfowIa9y3
         MtpfDx93Slknh21wRK1gcPZJ/vEuhlo8mwwaE28F2Hu2I6BX7PClJl51tAssePp/eRhV
         6B5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703412778; x=1704017578;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p48odNgqxhO6kdRRxgNqnTYSujAesBEGJvWcL4xhtP8=;
        b=BnnGEKB5NY3k6tEAfsTwVXiN920VjfRlIG3tHm34ICcQZFARxeipyQwOlBkgQHUrJv
         Ft473/8vh4PTAY1jT0Wx66DZUUnLXwsDLX7rYe8pNbABA/AZ3C/AhX+7279YBQjuumVR
         68bO5QbwP0Ahh3b3p4SQ23071mKIzbrJrPma+EVjxZQztSobaxw4wtFfOJyo+sSGQ12+
         sHHGQLCBpFnOFNTwHieMBtSuQDLTXPkoG9gzNioavVDZjwnRYwjOu/Xnm4uOAEcGlRdI
         LLvLDigh6vdYGODz80BxQVhJdE8gI/7Sr7IIqhU4tjai5pc9KKx6tAp0GeZixfEXPafc
         cTKg==
X-Gm-Message-State: AOJu0Yw7lnYU1M1ghCHP99wU+J8cYGyXYDQfohEuhhNDw2En0M6oAYy3
	kaFpM22uO8E+aS8nvLFAh+A=
X-Google-Smtp-Source: AGHT+IF7k7WCnMBfigiGRUbpB+zAh/2osshmmP++Zp+u6lrXyxhl5ika9ne77nKbBMvrRIaUOP5lsw==
X-Received: by 2002:ad4:5bcc:0:b0:67f:6310:bde6 with SMTP id t12-20020ad45bcc000000b0067f6310bde6mr5032064qvt.5.1703412777816;
        Sun, 24 Dec 2023 02:12:57 -0800 (PST)
Received: from [192.168.159.133] ([37.175.76.247])
        by smtp.gmail.com with ESMTPSA id q9-20020a05620a038900b00781133906f6sm2635665qkm.65.2023.12.24.02.12.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 24 Dec 2023 02:12:57 -0800 (PST)
Message-ID: <17bfb503-9e6a-40c7-b9fa-fc89c8a903c9@gmail.com>
Date: Sun, 24 Dec 2023 11:12:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: sun9i: smp: Fix array-index-out-of-bounds read in
 sunxi_mc_smp_init
Content-Language: en-US
To: Stefan Wahren <wahrenst@gmx.net>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>
List-Id: <soc.lore.kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>,
 =?UTF-8?Q?Myl=C3=A8ne_Josserand?= <mylene.josserand@bootlin.com>,
 linux-sunxi@lists.linux.dev, soc@kernel.org, Arnd Bergmann <arnd@arndb.de>,
 linux-arm-kernel@lists.infradead.org
References: <20231223123546.88125-1-wahrenst@gmx.net>
From: Florian Fainelli <f.fainelli@gmail.com>
Autocrypt: addr=f.fainelli@gmail.com; keydata=
 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
 HGuUuzv+GKZ6nsysJw==
In-Reply-To: <20231223123546.88125-1-wahrenst@gmx.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 12/23/2023 1:35 PM, Stefan Wahren wrote:
> Running a multi-arch kernel (multi_v7_defconfig) on a Raspberry Pi 3B+
> with enabled CONFIG_UBSAN triggers the following warning:
> 
>   UBSAN: array-index-out-of-bounds in arch/arm/mach-sunxi/mc_smp.c:810:29
>   index 2 is out of range for type 'sunxi_mc_smp_data [2]'
>   CPU: 0 PID: 1 Comm: swapper/0 Not tainted 6.7.0-rc6-00248-g5254c0cbc92d
>   Hardware name: BCM2835
>    unwind_backtrace from show_stack+0x10/0x14
>    show_stack from dump_stack_lvl+0x40/0x4c
>    dump_stack_lvl from ubsan_epilogue+0x8/0x34
>    ubsan_epilogue from __ubsan_handle_out_of_bounds+0x78/0x80
>    __ubsan_handle_out_of_bounds from sunxi_mc_smp_init+0xe4/0x4cc
>    sunxi_mc_smp_init from do_one_initcall+0xa0/0x2fc
>    do_one_initcall from kernel_init_freeable+0xf4/0x2f4
>    kernel_init_freeable from kernel_init+0x18/0x158
>    kernel_init from ret_from_fork+0x14/0x28
> 
> Since the enabled method couldn't match with any entry from
> sunxi_mc_smp_data, the value of the index shouldn't be used right after
> the loop. So move it after the check of ret in order to have a valid
> index.
> 
> Fixes: 1631090e34f5 ("ARM: sun9i: smp: Add is_a83t field")
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>

Previous attempts at fixing this:

https://lore.kernel.org/lkml/20230516-sunxi-v1-1-ac4b9651a8c1@google.com/T/

including a patch from William from nearly 18 months ago, which was not 
captured by lore however.

Is anyone collecting patches for that platform still?
-- 
Florian
