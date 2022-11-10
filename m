Return-Path: <SRS0=hcv+=3K=gmail.com=emil.renner.berthing@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E09CEC433FE
	for <soc@archiver.kernel.org>; Thu, 10 Nov 2022 08:48:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id AAC4FC433D7; Thu, 10 Nov 2022 08:48:49 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 678F0C433D6;
	Thu, 10 Nov 2022 08:48:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 678F0C433D6
Authentication-Results: smtp.kernel.org; dmarc=fail (p=reject dis=none) header.from=esmil.dk
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f52.google.com with SMTP id r61-20020a17090a43c300b00212f4e9cccdso4137512pjg.5;
        Thu, 10 Nov 2022 00:48:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nj08uoQ5xO490n/iqA+9r1f6MFaSsf/Keu+IuBN/mxc=;
        b=N52BaJ4EQgu2MtYvjVDxuNeM6DVYO6Reopfl0ffxvip/p5gqC3TdpUWd8Sx6S3d+kY
         Ct3jyvgGDZW1MUMDloWg1ZDss1CB9oLgYjs5FOKDbaPk1nyBr08HRoWn481s2MSMlGLZ
         sgZtxzATjn18YTUBy7VHcxH5FBwOwWLOhugCJUZD0uwNsGnSrVYzzKTuYuoyXqXHya6t
         grqzQbspkEi5kFuozhkQqMnOe3/uB9LW1e+a+TG2deIVFkqeynqjN8V8679KKR/9D6DO
         zHGHvuvhnaexrwlLE0jySck6wyMXjTpDiTc8j4HhSqiOsRFVdJqZgym0xlYLIXtyjXr2
         Rn9A==
X-Gm-Message-State: ACrzQf3LGaqnzVfJqUc6ZtI5Wr15KcdkHNAwIXEnUL8qaMBULzKnmP5Q
	jxAYVPqvp6qdsDzgNF8ftL+f3K0T9oA8XGZHv/oIRr8t
X-Google-Smtp-Source: AMsMyM4/rxvFp8pqfGwJZsdJimYqWfkYUSxbisV3VoouRxT16X9f1iy+9n4YEmJzxdp6jMr+BSNbJGOtj09Hk7fZsyc=
X-Received: by 2002:a17:90a:c917:b0:20a:a1a8:3719 with SMTP id
 v23-20020a17090ac91700b0020aa1a83719mr1301526pjt.225.1668070126727; Thu, 10
 Nov 2022 00:48:46 -0800 (PST)
MIME-Version: 1.0
References: <20221109212219.1598355-1-conor@kernel.org> <20221109212219.1598355-4-conor@kernel.org>
In-Reply-To: <20221109212219.1598355-4-conor@kernel.org>
From: Emil Renner Berthing <kernel@esmil.dk>
Date: Thu, 10 Nov 2022 09:48:35 +0100
Message-ID: <CANBLGcx6HM=G+PCth8Pg75zuHrQpF5M2HUNdr849ac4ZsbXu0A@mail.gmail.com>
Subject: Re: [PATCH v1 3/4] MAINTAINERS: add an entry for StarFive devicetrees
To: Conor Dooley <conor@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, soc@kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 9 Nov 2022 at 22:23, Conor Dooley <conor@kernel.org> wrote:
>
> From: Conor Dooley <conor.dooley@microchip.com>
>
> Emil looks after the downstream StarFive stuff, and agreed to look after
> the upstream ones too.
>
> CC: Emil Renner Berthing <kernel@esmil.dk>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Thanks!

Acked-by: Emil Renner Berthing <kernel@esmil.dk>

> ---
>  MAINTAINERS | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index a57c90be001f..040d49af9bdb 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -19622,6 +19622,11 @@ M:     Ion Badulescu <ionut@badula.org>
>  S:     Odd Fixes
>  F:     drivers/net/ethernet/adaptec/starfire*
>
> +STARFIVE DEVICETREES
> +M:     Emil Renner Berthing <kernel@esmil.dk>
> +S:     Maintained
> +F:     arch/riscv/boot/dts/starfive/
> +
>  STARFIVE JH7100 CLOCK DRIVERS
>  M:     Emil Renner Berthing <kernel@esmil.dk>
>  S:     Maintained
> --
> 2.37.2
>
