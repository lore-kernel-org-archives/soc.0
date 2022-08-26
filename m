Return-Path: <SRS0=OFv+=Y6=dabbelt.com=palmer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 166D8ECAAA2
	for <soc@archiver.kernel.org>; Fri, 26 Aug 2022 00:15:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D26E5C43142; Fri, 26 Aug 2022 00:15:39 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6F2BAC43143
	for <soc@kernel.org>; Fri, 26 Aug 2022 00:15:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6F2BAC43143
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=dabbelt.com
Received: by mail-pj1-f44.google.com with SMTP id h11-20020a17090a470b00b001fbc5ba5224so1917pjg.2
        for <soc@kernel.org>; Thu, 25 Aug 2022 17:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:to:from:cc:in-reply-to:subject:date:from:to:cc;
        bh=A0gsvt1poQ+VylNfnig8Ot0cE//z5t+eeDWuqhE1fpQ=;
        b=excq8S0Pt6bKvgJnrWBZCNZ9Yh3t/50NeXMnSOTwuOBCtZsNIQdwl9ASMdPHIGNAaQ
         sOB/cpwuDO94Cyskva/FtB2eKHqYi4Po0TWlmF086nL4G6Fu35SwQTGmhJRMbeOzIW6h
         iT3icaST3kuPPU/vPzer0orCVtMNa0UtMmzL4lazp1JxEislW3UyGHcaQ6zIivhU7zTF
         Bg78IHc1JyerrGDMS07VytlhlOmtIdXJDTqcgQ6lhUJfiZpHZWwwSeaMCxDnoWMeO2Ek
         c6alIJXM6k5bHjt49FkTTO1dWD1YXpEVz8xCewz/Ox9A9T9LU4hrymagamHTUM0dTvjl
         PiIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:to:from:cc:in-reply-to:subject:date:x-gm-message-state
         :from:to:cc;
        bh=A0gsvt1poQ+VylNfnig8Ot0cE//z5t+eeDWuqhE1fpQ=;
        b=49rE36zimXYbX+jo5E3SbRwoY5ivOOsVhUJ21Kag/BvlwsEMFRNKf4/oOHUKZ1oZu9
         SxkQPkSDO6DK/pMv56BU4dY71r9wAxNxP6mYR57R00JGNHkHscmItAiygkongk+VDQ2r
         IuAFchxh/lSnCYLap+Zw1gkGz/iXxnx1WdlmYOzN4Qv/Lnq8gDm3m/QlLKCAVgeqPMLj
         +TDDxiBAMQBEPdkHx+VrRg1BrtEBMEEFhnFz6BeeQ3DgKnZGLyWv2d1UL8ImT7kLMMrI
         CAYAZQr1KYYkWRaTQCHdDYWQsMj6ZPer7W6mHTBzxxTxndo/k+MY2ajzhXNDX8JXbSjU
         rbjA==
X-Gm-Message-State: ACgBeo2Evyws23tmxHQGLlPg8IpADk8OZGjLlaXE2Lnk1gfnTO1KdCb+
	HjOu1Ro/YPJKJGTW78TlJawkLbvcqYfy9w==
X-Google-Smtp-Source: AA6agR7avLLMBjCkQ+XBTGDBoNHD8IObfC9EMTEilFGiA40oEt07P4n5+N3r+nAhZXHYuS+LR+T0+A==
X-Received: by 2002:a17:90a:c02:b0:1fb:b69d:140f with SMTP id 2-20020a17090a0c0200b001fbb69d140fmr1520190pjs.139.1661472937514;
        Thu, 25 Aug 2022 17:15:37 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net. [76.210.143.223])
        by smtp.gmail.com with ESMTPSA id e3-20020a17090301c300b00172cb8b97a8sm170479plh.5.2022.08.25.17.15.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Aug 2022 17:15:37 -0700 (PDT)
Date: Thu, 25 Aug 2022 17:15:37 -0700 (PDT)
X-Google-Original-Date: Thu, 25 Aug 2022 16:49:08 PDT (-0700)
Subject:     Re: [RESEND/PULL PATCH 0/2] MAINTAINERS updates for PolarFire SoC
In-Reply-To: <20220810140243.2685416-1-conor.dooley@microchip.com>
List-Id: <soc.lore.kernel.org>
CC: soc@kernel.org, daire.mcnamara@microchip.com, broonie@kernel.org, wsa@kernel.org,
  thierry.reding@gmail.com, u.kleine-koenig@pengutronix.de, jassisinghbrar@gmail.com,
  linus.walleij@linaro.org, brgl@bgdev.pl, Greg KH <gregkh@linuxfoundation.org>,
  Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, mturquette@baylibre.com, sboyd@kernel.org,
  devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, conor.dooley@microchip.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: conor.dooley@microchip.com
Message-ID: <mhng-9fab66cf-3d6c-417b-9233-8030c256aea9@palmer-mbp2014>

On Wed, 10 Aug 2022 07:02:42 PDT (-0700), conor.dooley@microchip.com wrote:
> Hey Arnd,
>
> Could you please take the following two patches via the soc tree when
> you get a chance?
>
> The first is adding coverage for "my" dt-bindings as suggested by Mark.
> I CCed all the subsystem maintainers on a V1 a week ago & I've added
> them explicity to the patch text this time as CCs. Correct me if I am
> wrong, but I am operating on the assumption that their Acks are not
> required here. Hopefully increasing the binding coverage is non
> controversial!
>
> The second patch is a resend of a patch that was deferred to later in
> the merge window avoid messing about with a 4th conflict in the entry.
>
> Thanks,
> Conor.
>
> Conor Dooley (2):
>   MAINTAINERS: add PolarFire SoC dt bindings
>   MAINTAINERS: add the Polarfire SoC's i2c driver
>
>  MAINTAINERS | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
>
> base-commit: 4e23eeebb2e57f5a28b36221aa776b5a1122dde5

Thanks, these are on fixes.
