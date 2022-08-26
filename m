Return-Path: <SRS0=OFv+=Y6=dabbelt.com=palmer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED96FECAAD4
	for <soc@archiver.kernel.org>; Fri, 26 Aug 2022 14:33:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B9650C433D7; Fri, 26 Aug 2022 14:33:10 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7832EC433C1
	for <soc@kernel.org>; Fri, 26 Aug 2022 14:33:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7832EC433C1
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=dabbelt.com
Received: by mail-pl1-f181.google.com with SMTP id x23so1727279pll.7
        for <soc@kernel.org>; Fri, 26 Aug 2022 07:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc;
        bh=MoYO0aV4Sdt+1lFREzXlZRwm/vMSBTGBOAkrIfrb15g=;
        b=CT/xwp8bf+4WnGL54CNyZVkKySUwDtUNmpjzpWsUyLOkBg8sDDdOeo80hAORi+whLq
         sMEt6SfNb8fzZ/lW58Zxz7NMrPe/IxhVPmObYrXUNgSerKsYN4hGPzf/JSZ7hI3w1m7I
         av7swLyoioe1Kc08F6JDrl/BvN2m6DS8uNXjLQvTyXSLVG5pOAAXF6X2LRIHR2vJxTrH
         DtLAB/OLA+v+FlOftUF45005OE7IQES8bTIxlWWNe9+r3PDCjF5OGUmEsUCapuAgMK0S
         jTV1SRf3gAkWtYXgEVs+sIuSK6tELwPF/xoeTn+V0fKMvXaSdzvi49AlF3HNzBLvregm
         utcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc;
        bh=MoYO0aV4Sdt+1lFREzXlZRwm/vMSBTGBOAkrIfrb15g=;
        b=yEn3WFrXfr7oZ6YJnJuP2goHVT+GYk6RtbLYRCqjDUIjLemsEMEehlYoWYYI11KvlD
         Z3z1k3YpbeZ/BevK5Wh286V/YE6a9Q8+eT+pQ3mG+CVn5Afw2+JyRbRkc6zcmbYu1zod
         ng3M8F3eqhKeJxQfKe4iskwEHTCRt7QtTSfN49bsCxUgTLzAW1tev34DCpW0YEBY8T2r
         jdm15iVUV2Y+Ga7yBkLU+4jax9rsIHAo/JMbGSwqDzBQlbH9jnpKDS5MhEzrQY274f4k
         bD6afriB3vGOCey77nataGPO2geY4fOpRzqiPd7ghbuWpDms80oHmC4SjvyV56qBp10B
         orUg==
X-Gm-Message-State: ACgBeo1Zrt+R0Qf+8ss9ijgqf1T3Rlv9iOGsITFamqX4ZUZYPQQWSaUR
	socPiO4PiLA9JOoXxzBsPediMg==
X-Google-Smtp-Source: AA6agR7zB0GXZEcvFu4C6QCUUhy/MR+Rz11NBBQC8ja8lj3FFezrrr0OxS3nFw6wcE24xBi7lBRTxA==
X-Received: by 2002:a17:902:f542:b0:173:4136:83cb with SMTP id h2-20020a170902f54200b00173413683cbmr3905017plf.4.1661524387807;
        Fri, 26 Aug 2022 07:33:07 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net. [76.210.143.223])
        by smtp.gmail.com with ESMTPSA id i72-20020a62874b000000b0052e987c64efsm1871933pfe.174.2022.08.26.07.33.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Aug 2022 07:33:07 -0700 (PDT)
Date: Fri, 26 Aug 2022 07:33:07 -0700 (PDT)
X-Google-Original-Date: Fri, 26 Aug 2022 07:33:05 PDT (-0700)
Subject:     Re: [RESEND/PULL PATCH 0/2] MAINTAINERS updates for PolarFire SoC
In-Reply-To: <196dcae3-542a-2cf3-ebee-e7ecc4a8a330@microchip.com>
List-Id: <soc.lore.kernel.org>
CC: Arnd Bergmann <arnd@arndb.de>, soc@kernel.org, Daire.McNamara@microchip.com,
  broonie@kernel.org, wsa@kernel.org, thierry.reding@gmail.com, u.kleine-koenig@pengutronix.de,
  jassisinghbrar@gmail.com, linus.walleij@linaro.org, brgl@bgdev.pl, Greg KH <gregkh@linuxfoundation.org>,
  Olof Johansson <olof@lixom.net>, mturquette@baylibre.com, sboyd@kernel.org, devicetree@vger.kernel.org,
  linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Conor.Dooley@microchip.com
Message-ID: <mhng-5a6ac7a8-1caa-433b-909b-438a1c05f320@palmer-mbp2014>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On Thu, 25 Aug 2022 23:22:07 PDT (-0700), Conor.Dooley@microchip.com wrote:
> On 26/08/2022 01:15, Palmer Dabbelt wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>> 
>> On Wed, 10 Aug 2022 07:02:42 PDT (-0700), conor.dooley@microchip.com wrote:
>>> Hey Arnd,
>>>
>>> Could you please take the following two patches via the soc tree when
>>> you get a chance?
> 
>> Thanks, these are on fixes.
> 
> I think these already were applied by Arnd. I guess the soc patchwork
> bot does not CC the people on the original mail, only the author.

Ok, I've dropped them.  Thanks!
