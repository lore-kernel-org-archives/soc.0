Return-Path: <SRS0=ttVA=IY=gmail.com=pku.leo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86F86C433C1
	for <soc@archiver.kernel.org>; Fri, 26 Mar 2021 02:17:47 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 2C8E661A41; Fri, 26 Mar 2021 02:17:47 +0000 (UTC)
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DFF9861A21;
	Fri, 26 Mar 2021 02:17:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DFF9861A21
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=pku.leo@gmail.com
Received: by mail-ot1-f43.google.com with SMTP id l12-20020a9d6a8c0000b0290238e0f9f0d8so3918962otq.8;
        Thu, 25 Mar 2021 19:17:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pN6nWQzQZ6AQx0kJQTtGWLMXZDRLpSHjIhqC/t+YFhY=;
        b=UVaZxaJtCy6nEB654zqW4lC/eAiVriVxkHl68FivYrSIM8PDvaRfaEMQYlwtPbkoQI
         GhpX7UE2t3SznjAnth6kHYhC14NAuKrRg8CNw1Y53YgFFnNoYhEJLW8YU0XciPOY6bvE
         q7n6AGbeK+VIQN79JTVGwpZs8DQQb2VzGftLTprMd+luKxT+836Qi0SNwuJSgiYM80XF
         V+fJbvcPo1JufuKokO8sTAg47euvyORTn+MdYb5ylJMiJqgl/HiBrgZpeqjut2mJlJQR
         7FH9Y+gnARsoeERKhFhjhfj+klOCAChfGgZdpLUrRJwje9hn6y6yhbaZr1awE2moscd6
         Yo7Q==
X-Gm-Message-State: AOAM53106T4iigO9rzRjT9YHV/rWCbXKRq9EgPCfgAXuxZ01BKBTY4qz
	+8WOwogM/bxu9clr/tbp3XnArS/ozkY=
X-Google-Smtp-Source: ABdhPJwUJTvM+rwPy41zsLq3fjoJAsDvg5FyHkDywph65NJH60U1Td0rNga182QRqo0eUyZcSD7Swg==
X-Received: by 2002:a9d:62d9:: with SMTP id z25mr10087273otk.194.1616725065841;
        Thu, 25 Mar 2021 19:17:45 -0700 (PDT)
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com. [209.85.210.45])
        by smtp.gmail.com with ESMTPSA id j10sm1690973oos.27.2021.03.25.19.17.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Mar 2021 19:17:45 -0700 (PDT)
Received: by mail-ot1-f45.google.com with SMTP id s11-20020a056830124bb029021bb3524ebeso3981379otp.0;
        Thu, 25 Mar 2021 19:17:44 -0700 (PDT)
X-Received: by 2002:a05:6830:20da:: with SMTP id z26mr10108692otq.74.1616725064425;
 Thu, 25 Mar 2021 19:17:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210323131530.2619900-1-arnd@kernel.org>
In-Reply-To: <20210323131530.2619900-1-arnd@kernel.org>
From: Li Yang <leoyang.li@nxp.com>
Date: Thu, 25 Mar 2021 21:17:33 -0500
X-Gmail-Original-Message-ID: <CADRPPNQJfJ=KmRGkX5Uo6VfWDsihrMUKV7OkQ7jtb3+Byb0RLQ@mail.gmail.com>
Message-ID: <CADRPPNQJfJ=KmRGkX5Uo6VfWDsihrMUKV7OkQ7jtb3+Byb0RLQ@mail.gmail.com>
Subject: Re: [PATCH] soc/fsl: qbman: fix conflicting alignment attributes
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Roy Pledge <roy.pledge@nxp.com>, Claudiu Manoil <claudiu.manoil@nxp.com>, 
	Scott Wood <oss@buserror.net>, Arnd Bergmann <arnd@arndb.de>, 
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, YueHaibing <yuehaibing@huawei.com>, 
	lkml <linux-kernel@vger.kernel.org>, soc@kernel.org, 
	Jakub Kicinski <kuba@kernel.org>, Lee Jones <lee.jones@linaro.org>, 
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	Madalin-cristian Bucur <madalin.bucur@nxp.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, Mar 23, 2021 at 8:17 AM Arnd Bergmann <arnd@kernel.org> wrote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> When building with W=1, gcc points out that the __packed attribute
> on struct qm_eqcr_entry conflicts with the 8-byte alignment
> attribute on struct qm_fd inside it:
>
> drivers/soc/fsl/qbman/qman.c:189:1: error: alignment 1 of 'struct qm_eqcr_entry' is less than 8 [-Werror=packed-not-aligned]
>
> I assume that the alignment attribute is the correct one, and
> that qm_eqcr_entry cannot actually be unaligned in memory,
> so add the same alignment on the outer struct.
>
> Fixes: c535e923bb97 ("soc/fsl: Introduce DPAA 1.x QMan device driver")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/soc/fsl/qbman/qman.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/soc/fsl/qbman/qman.c b/drivers/soc/fsl/qbman/qman.c
> index a1b9be1d105a..fde4edd83c14 100644
> --- a/drivers/soc/fsl/qbman/qman.c
> +++ b/drivers/soc/fsl/qbman/qman.c
> @@ -186,7 +186,7 @@ struct qm_eqcr_entry {
>         __be32 tag;
>         struct qm_fd fd;
>         u8 __reserved3[32];
> -} __packed;
> +} __packed __aligned(8);

The EQCR structure is actually aligned on 64-byte from the manual.
But probably 8 is enough to let the compiler not complain.

>  #define QM_EQCR_VERB_VBIT              0x80
>  #define QM_EQCR_VERB_CMD_MASK          0x61    /* but only one value; */
>  #define QM_EQCR_VERB_CMD_ENQUEUE       0x01
> --
> 2.29.2
>
