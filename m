Return-Path: <SRS0=Twdr=IM=gmail.com=wens213@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98FFAC46CD2
	for <soc@archiver.kernel.org>; Tue,  2 Jan 2024 14:58:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6D6E7C433C8; Tue,  2 Jan 2024 14:58:58 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 23D10C433C7;
	Tue,  2 Jan 2024 14:58:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 23D10C433C7
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1d426ad4433so34897625ad.0;
        Tue, 02 Jan 2024 06:58:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704207536; x=1704812336;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lMxLV+7V7txh9J8jpGsGRud70MRiYdXrF/1UrZfF11A=;
        b=r9TDc/5Nm+nsEBSWuBwZgy5IpFxWBjcuJAyQ2+Z0FT5P8lDL045RpgqhgwmTkhBv4M
         r3IZtfmYQhY06wwYwSUuh6VpjXsjpGYYe75iKfxsi4ztwC1IqM+2mOEbLXJ7kth6mRqN
         +b0NnoPhHVIy9syZkltuaph5cbkzvS4dLySrcaklWgfdJwYc7g/C47B0QBEfzUL9ASfJ
         kOAqIpQ3v13YFlGoyzvWTlWL3JGOg1sETROhXd8MEX2a6RYs4J+RFcxSg1V3YD87D6VB
         yogXVgXC9aWlB9jjyGUBeIz29ZL9lDNCwldv/IB68RG8J76AaXjcKzWHRZBcfyP2Lgr2
         ZzAQ==
X-Gm-Message-State: AOJu0Yyoi+dL/vJALdikgd37ZaNBox5R07msM81+VgJBHkcNzXKAA7V5
	OryTlOy8qR8irfMeGnr+3Q2G6Mud/m3bOg==
X-Google-Smtp-Source: AGHT+IF26L02Lm1wYPicqjOF1HcdOazrIWyjjJRFqdHg90Ioul2SC5ejgO1XQBVwS6YBBKlBoAMyAg==
X-Received: by 2002:a17:902:74cb:b0:1d3:d0da:2551 with SMTP id f11-20020a17090274cb00b001d3d0da2551mr8068268plt.90.1704207536168;
        Tue, 02 Jan 2024 06:58:56 -0800 (PST)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com. [209.85.216.45])
        by smtp.gmail.com with ESMTPSA id n20-20020a170902969400b001d4974385d4sm8477142plp.250.2024.01.02.06.58.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jan 2024 06:58:56 -0800 (PST)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-28b82dc11e6so3538918a91.1;
        Tue, 02 Jan 2024 06:58:56 -0800 (PST)
X-Received: by 2002:a17:90a:b117:b0:28c:a632:1f87 with SMTP id
 z23-20020a17090ab11700b0028ca6321f87mr2315903pjq.34.1704207535662; Tue, 02
 Jan 2024 06:58:55 -0800 (PST)
MIME-Version: 1.0
References: <20231228193903.9078-1-wahrenst@gmx.net>
In-Reply-To: <20231228193903.9078-1-wahrenst@gmx.net>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Tue, 2 Jan 2024 22:58:43 +0800
X-Gmail-Original-Message-ID: <CAGb2v64ezBtmZBDGoiD5VfT6mWa0yJMssVn-ZnUhdbr+wYBx8A@mail.gmail.com>
Message-ID: <CAGb2v64ezBtmZBDGoiD5VfT6mWa0yJMssVn-ZnUhdbr+wYBx8A@mail.gmail.com>
Subject: Re: [PATCH V2 1/2] ARM: sun9i: smp: Fix array-index-out-of-bounds
 read in sunxi_mc_smp_init
To: Stefan Wahren <wahrenst@gmx.net>
List-Id: <soc.lore.kernel.org>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Maxime Ripard <mripard@kernel.org>, =?UTF-8?Q?Myl=C3=A8ne_Josserand?= <mylene.josserand@bootlin.com>, 
	linux-sunxi@lists.linux.dev, soc@kernel.org, 
	Florian Fainelli <f.fainelli@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 29, 2023 at 3:39=E2=80=AFAM Stefan Wahren <wahrenst@gmx.net> wr=
ote:
>
> Running a multi-arch kernel (multi_v7_defconfig) on a Raspberry Pi 3B+
> with enabled CONFIG_UBSAN triggers the following warning:
>
>  UBSAN: array-index-out-of-bounds in arch/arm/mach-sunxi/mc_smp.c:810:29
>  index 2 is out of range for type 'sunxi_mc_smp_data [2]'
>  CPU: 0 PID: 1 Comm: swapper/0 Not tainted 6.7.0-rc6-00248-g5254c0cbc92d
>  Hardware name: BCM2835
>   unwind_backtrace from show_stack+0x10/0x14
>   show_stack from dump_stack_lvl+0x40/0x4c
>   dump_stack_lvl from ubsan_epilogue+0x8/0x34
>   ubsan_epilogue from __ubsan_handle_out_of_bounds+0x78/0x80
>   __ubsan_handle_out_of_bounds from sunxi_mc_smp_init+0xe4/0x4cc
>   sunxi_mc_smp_init from do_one_initcall+0xa0/0x2fc
>   do_one_initcall from kernel_init_freeable+0xf4/0x2f4
>   kernel_init_freeable from kernel_init+0x18/0x158
>   kernel_init from ret_from_fork+0x14/0x28
>
> Since the enabled method couldn't match with any entry from
> sunxi_mc_smp_data, the value of the index shouldn't be used right after
> the loop. So move it after the check of ret in order to have a valid
> index.
>
> Fixes: 1631090e34f5 ("ARM: sun9i: smp: Add is_a83t field")
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>

Reviewed-by: Chen-Yu Tsai <wens@csie.org>

> ---
> Changes in V2:
> - append another patch to fix return code check
>
>  arch/arm/mach-sunxi/mc_smp.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm/mach-sunxi/mc_smp.c b/arch/arm/mach-sunxi/mc_smp.c
> index cb63921232a6..6ec3445f3c72 100644
> --- a/arch/arm/mach-sunxi/mc_smp.c
> +++ b/arch/arm/mach-sunxi/mc_smp.c
> @@ -807,12 +807,12 @@ static int __init sunxi_mc_smp_init(void)
>                         break;
>         }
>
> -       is_a83t =3D sunxi_mc_smp_data[i].is_a83t;
> -
>         of_node_put(node);
>         if (ret)
>                 return -ENODEV;
>
> +       is_a83t =3D sunxi_mc_smp_data[i].is_a83t;
> +
>         if (!sunxi_mc_smp_cpu_table_init())
>                 return -EINVAL;
>
> --
> 2.34.1
>
