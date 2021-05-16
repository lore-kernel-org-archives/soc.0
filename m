Return-Path: <SRS0=fkm5=KL=googlemail.com=martin.blumenstingl@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46D96C433ED
	for <soc@archiver.kernel.org>; Sun, 16 May 2021 16:56:51 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id DED2861073; Sun, 16 May 2021 16:56:50 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AAFEF60233
	for <soc@kernel.org>; Sun, 16 May 2021 16:56:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AAFEF60233
Authentication-Results: mail.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=martin.blumenstingl@googlemail.com
Received: by mail-ej1-f45.google.com with SMTP id c20so5728833ejm.3
        for <soc@kernel.org>; Sun, 16 May 2021 09:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KXfPWqkBpp539m/dUT5eP3L2ZdWd5jXj1ZEc3b/o1Vs=;
        b=P3YmCa/Sb01lTppd7f0Sb7fuidhircakszYHYjhrJtAHZBHwg8aB/zX3sMH3zjdSPM
         +Db5N7dbepitFXSQdr6ucA/MSYIr/e5yOGnEYKip7iEms/grB1taKYYJvne8R1Lnvk4k
         27yEJVf8s1M2IU56yrBQwoXFMT8cZz20DVAIaIU/vabuuQ3JaQRIuDxGCSkztBNSKJUx
         IknJz5HeGHENTDHVp8HytRo3SazyynuDx3Jzgn98izFef62ZR6xbq65zF6fztOLUlmjZ
         eBuKhY1qFaGyFbVRNBk64k93zyOt1Yko34cA2dWiQx3ZHF/DjbZivoTTDmN6sO0m/ZBo
         mhrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KXfPWqkBpp539m/dUT5eP3L2ZdWd5jXj1ZEc3b/o1Vs=;
        b=EF+THjWH/85n0i0/Sd8JyNqGPOUCVmBkyXQ5a1cGchvTGWW6VYs/8GRqjSXwJ4nPAA
         Hed/z7ZrrfFQIHndVyX5/O2qkhbs7nlwzjEOZnnpgbX7dvFV0JRqkoP2R9rL9yysvWoC
         OUWPQRdKwWm0bStaiOMIyVBWIlaAHy8DT7mzmu3ZkVcn7SVb75D62Oj2jug+uD3/foYB
         GQ2pt4iOROAMu5X1zJ7gxjiqmb//8lw7nALZaR+YuhAPmJk76gQT9jM5vf2mhbktxg67
         X5OuT6juCDF6pY2sTy8abnu+8uOh8FPDmEmi4KxowG5t0X0zpRKDW8inU01MsnozncEM
         r23A==
X-Gm-Message-State: AOAM533ilp0TAZZVDKFHx+pa9sC/IYr1TwDaiK3EBs8iAcSIDoQoCqgG
	MhQoJ15bJ0IE2p6271/cA/3eKToTeK6AwWNMzMY=
X-Google-Smtp-Source: ABdhPJwc41Kg2PCVAk+BV4t6/mT7qgy9bZ0g/8+LHR9oFdkh04GMWq15AhUV0qiUw+4YKrsy9vuUpMTLwDfrnBjDwOE=
X-Received: by 2002:a17:906:374b:: with SMTP id e11mr58369970ejc.328.1621184209341;
 Sun, 16 May 2021 09:56:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210511190054.26300-1-khilman@baylibre.com>
In-Reply-To: <20210511190054.26300-1-khilman@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 16 May 2021 18:56:38 +0200
Message-ID: <CAFBinCCTQMF8MAcffR30o5K06EKV==C-5EJ4_aEvZWWqSJ+eaQ@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: ARM/Amlogic SoCs: add Neil as primary maintainer
To: Kevin Hilman <khilman@baylibre.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, Neil Armstrong <narmstrong@baylibre.com>, 
	linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, May 11, 2021 at 9:01 PM Kevin Hilman <khilman@baylibre.com> wrote:
>
> Add Neil as primary maintainer for the Amlogic family of Arm SoCs.  I
> will now act as co-maintainer.
Thanks for your work since May 2016 Kevin!

> Neil is already doing lots of the reviewing, testing and behind the
> scenes support for users of the upstream kernel on these SoCs, so this
> is just to formalize the current state of affairs.
>
> Thanks Neil for all of your efforts, and keep up the great work!
Indeed, and also "welcome" to your new position Neil

> Signed-off-by: Kevin Hilman <khilman@baylibre.com>
Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>


Best regards,
Martin
