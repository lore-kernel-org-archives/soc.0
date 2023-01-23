Return-Path: <SRS0=SeoW=5U=gmail.com=geert.uytterhoeven@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30E58C05027
	for <soc@archiver.kernel.org>; Mon, 23 Jan 2023 10:43:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 01599C4339C; Mon, 23 Jan 2023 10:43:21 +0000 (UTC)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 64055C433EF;
	Mon, 23 Jan 2023 10:43:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 64055C433EF
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f182.google.com with SMTP id g16so7246114qtu.2;
        Mon, 23 Jan 2023 02:43:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0Nz7epYXM0pVoAXm+SmhP1LKWnLLacoKbNMTlqFkP4Y=;
        b=EohcWuW54yKlHDWpAAaxjWxh6cpGiM1KRP7nP5IOfdwZy5xyRVRO8+fq7crCp4KeHY
         C0bqeZdd+idaGldyswbkniO00RQ3uUeihepmxv172DUYPpI1UG34/B7lnJcLkrUw7g8T
         hT0GYClgEr7CHSOjt/pQFpJ9kKiwYf3LfLYE36h5VKjwpG5G2ARHivt03+FanfgF2Aws
         1RfDVr2yyT690bjEuMUu8DDxW6FBRE66WXs8QRpLhAM8dpN4uoBlHgFG9BsYrzzqNxsZ
         cRDD4vFe/17N1IflQIGRaqUgA716vUQRrRCCs/CK0aAqc7kZerqsZxZGsWl5PyQmU8lF
         Ntpg==
X-Gm-Message-State: AFqh2kosdYnyJxIzgDjPjNUMIpV7ouEM0QKtMDJad5FFUXqyGcWt/j9O
	cUAX33/AaQ1xNEoIJW/tDElrk4Twx92ESA==
X-Google-Smtp-Source: AMrXdXuZ5wcXOUoj8zu3+h0IoEoYW9RzxOJc034j56xOu9cOlE8YAvzGEbqQAxhgV+p78LFBoRAjeA==
X-Received: by 2002:ac8:4914:0:b0:3b1:ad76:eefe with SMTP id e20-20020ac84914000000b003b1ad76eefemr36721290qtq.10.1674470597985;
        Mon, 23 Jan 2023 02:43:17 -0800 (PST)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com. [209.85.128.174])
        by smtp.gmail.com with ESMTPSA id h9-20020a05620a244900b00705cef9b84asm14188516qkn.131.2023.01.23.02.43.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jan 2023 02:43:17 -0800 (PST)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-4a263c4ddbaso166348157b3.0;
        Mon, 23 Jan 2023 02:43:17 -0800 (PST)
X-Received: by 2002:a05:690c:851:b0:480:fa10:459e with SMTP id
 bz17-20020a05690c085100b00480fa10459emr1894031ywb.283.1674470596924; Mon, 23
 Jan 2023 02:43:16 -0800 (PST)
MIME-Version: 1.0
References: <20230122121129.28699-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230122121129.28699-1-krzysztof.kozlowski@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 23 Jan 2023 11:43:04 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXdZbJDTOzQG4=pRpR1OCU0=RTDZDH0MnPW8Ea2LJKs6A@mail.gmail.com>
Message-ID: <CAMuHMdXdZbJDTOzQG4=pRpR1OCU0=RTDZDH0MnPW8Ea2LJKs6A@mail.gmail.com>
Subject: Re: [GIT PULL] memory: drivers for v6.3
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, arm@kernel.org, soc@kernel.org, 
	linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
	JaimeLiao <jaimeliao.tw@gmail.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

On Sun, Jan 22, 2023 at 1:14 PM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
> The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:
>
>   Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)
>
> are available in the Git repository at:
>
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl.git tags/memory-controller-drv-6.3
>
> for you to fetch changes up to 4fd1a0e496cb81e939c55143fc81c2be130099c4:
>
>   Merge branch 'for-v6.3/renesas-rpc-if' into mem-ctrl-next (2023-01-22 13:05:21 +0100)
>
> ----------------------------------------------------------------
> Memory controller drivers for v6.3
>
> 1. TI Emif: simplify device_get_match_data().
> 2. Renesas RPC IF: Few fixes (missing address set in manual mode;
>    decouple driver's private data structure from other drivers; unbind
>    and rebind due to triggering managed resources allocation from other
>    drivers) and bigger rework around improved runtime Power Management.
>
> ----------------------------------------------------------------
> Geert Uytterhoeven (6):
>       memory: renesas-rpc-if: Split-off private data from struct rpcif
>       memory: renesas-rpc-if: Move resource acquisition to .probe()
>       memory: renesas-rpc-if: Always use dev in rpcif_probe()
>       memory: renesas-rpc-if: Improve Runtime PM handling
>       memory: renesas-rpc-if: Pass device instead of rpcif to rpcif_*()
>       memory: renesas-rpc-if: Remove Runtime PM wrappers
>
> JaimeLiao (1):
>       memory: renesas-rpc-if: Fix missing setting address

This is commit 21a1234f82cbf425
("memory: renesas-rpc-if: Fix missing setting address").

The same patch, sent by someone else, was sort of nack'ed in
https://lore.kernel.org/all/CAMuHMdWpvuC2Cm41jCQm+rT8MZB5GN+Z0bPz941QzsHX17Ux-g@mail.gmail.com

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
