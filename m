Return-Path: <SRS0=OFv+=Y6=dabbelt.com=palmer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41851ECAAA3
	for <soc@archiver.kernel.org>; Fri, 26 Aug 2022 00:15:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id F21DAC433B5; Fri, 26 Aug 2022 00:15:39 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 07680C433D7
	for <soc@kernel.org>; Fri, 26 Aug 2022 00:15:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 07680C433D7
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=dabbelt.com
Received: by mail-pl1-f181.google.com with SMTP id w2so247665pld.0
        for <soc@kernel.org>; Thu, 25 Aug 2022 17:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:to:from:cc:in-reply-to:subject:date:from:to:cc;
        bh=nC2tg0emIzyQ6j7+Pili4KJidqGPH8PH55AhgBkY/FA=;
        b=M+CckdCklD6yjY0v7efK+WsWpGf9w/E/Q5cg7pw0xwEU/hCwcWtKeNb5OS2y9JM/Jl
         RSRS6Wh6W1BYofO43BbuBBqnZqCmyjx740wWDvfArbBM9VaI0X9w1T44rrX1LokKQviF
         c8XvlFXfnf7KxBbhy3Bql+ojwci6kFMMv3Yc9NwgpVgOlxT3+Pti+kRO9npKJRdnsKUs
         B8KtQ54rYbS6Oxif4vj5sL0bl/d1puynyKcWPcJJvTCUhIMsD8ft7hPS6Kj+3FnySFhF
         aLlORF9pdVPeVZK1FOjGiWhDZvQQfaMR98tajHTXjTYcDmwdhJGueQCgLlfue53AoHhb
         /YYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:to:from:cc:in-reply-to:subject:date:x-gm-message-state
         :from:to:cc;
        bh=nC2tg0emIzyQ6j7+Pili4KJidqGPH8PH55AhgBkY/FA=;
        b=mEczODxiYFtdGfQ1E89Yq+JbnzVlHE+Ygflphb6vwU7EXwF7Zq1y083IuRbIIkrzb5
         4Tfq/zKeZVNx7dZBOS0RC8J2A9FBZA7vJNK5wV1bqLZojjVmTj75X01dbsLO8y4yevtl
         1wyA6/n1SoxYnR6KSdtMsTMY4R63OU7O3VH637fqWHn3S95X/iwQlT/h5duMLhhd21hP
         Kn03fPA3sKQ+MTG8Q9pB2/0cw1fN9d9JOewLQTsYnqjxluYbdRbKRYieofkLJo8+NzAe
         PqKeC2CdJmW5lnTxJUFDYFo8EgKqqgvtN8tgQ/CbWkTV2iimBlIVDFafoNTGP9aSXgKn
         iLJw==
X-Gm-Message-State: ACgBeo0RHihP0GMbZa6G1FqLan77P93fxdZiaaYrs/7Ooh5KVkhfJdCN
	IsaWzWhb7vjnjkUkGmy2lCYmKw==
X-Google-Smtp-Source: AA6agR5DmVcNrt1Ba1Wa44I7a7PSdKiS4h2VM9U5UvcW94BYWPNSRTvF3TTwSht20a22gL3iZRxeYQ==
X-Received: by 2002:a17:90b:4d12:b0:1f5:59e1:994f with SMTP id mw18-20020a17090b4d1200b001f559e1994fmr1496973pjb.217.1661472936347;
        Thu, 25 Aug 2022 17:15:36 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net. [76.210.143.223])
        by smtp.gmail.com with ESMTPSA id d2-20020a170902654200b001725d542190sm141317pln.181.2022.08.25.17.15.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Aug 2022 17:15:35 -0700 (PDT)
Date: Thu, 25 Aug 2022 17:15:35 -0700 (PDT)
X-Google-Original-Date: Thu, 25 Aug 2022 16:48:09 PDT (-0700)
Subject:     Re: [RESEND PATCH 1/2] MAINTAINERS: add PolarFire SoC dt bindings
In-Reply-To: <20220810171124.74ew3yz5dtkz6v2s@pengutronix.de>
List-Id: <soc.lore.kernel.org>
CC: conor.dooley@microchip.com, soc@kernel.org, daire.mcnamara@microchip.com,
  broonie@kernel.org, wsa@kernel.org, thierry.reding@gmail.com, jassisinghbrar@gmail.com,
  linus.walleij@linaro.org, brgl@bgdev.pl, Greg KH <gregkh@linuxfoundation.org>,
  Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, mturquette@baylibre.com, sboyd@kernel.org,
  devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, mkl@pengutronix.de
From: Palmer Dabbelt <palmer@dabbelt.com>
To: u.kleine-koenig@pengutronix.de
Message-ID: <mhng-7c3ab2fe-b9da-47ce-8a00-4eb0979183c8@palmer-mbp2014>

On Wed, 10 Aug 2022 10:11:24 PDT (-0700), u.kleine-koenig@pengutronix.de wrote:
> On Wed, Aug 10, 2022 at 03:02:43PM +0100, Conor Dooley wrote:
>> So far when I added bindings for the platform I never added them to
>> our MAINTAINERS entry. No time like the present to improve the coverage.
>> 
>> CC: Mark Brown <broonie@kernel.org>
>> CC: Wolfram Sang <wsa@kernel.org>
>> CC: Thierry Reding <thierry.reding@gmail.com>
>> CC: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
>
> Acked-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Looks like git-am isn't handling the UTF here, not sure what's up but 
it's probably just something broken with my email setup.  I fixed it up 
manually, but apologies if I've missed one in the past.

>> CC: Jassi Brar <jassisinghbrar@gmail.com>
>> CC: Linus Walleij <linus.walleij@linaro.org>
>> CC: Bartosz Golaszewski <brgl@bgdev.pl>
>> CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>> CC: Arnd Bergmann <arnd@arndb.de>
>> CC: Olof Johansson <olof@lixom.net>
>> CC: Michael Turquette <mturquette@baylibre.com>
>> CC: Stephen Boyd <sboyd@kernel.org>
>> Suggested-by: Mark Brown <broonie@kernel.org>
>> Acked-by: Marc Kleine-Budde <mkl@pengutronix.de> # for can
>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>> ---
>>  MAINTAINERS | 9 +++++++++
>>  1 file changed, 9 insertions(+)
>> 
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 868bbf31603d..fd0f10a110e7 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -17512,6 +17512,15 @@ M:	Conor Dooley <conor.dooley@microchip.com>
>>  M:	Daire McNamara <daire.mcnamara@microchip.com>
>>  L:	linux-riscv@lists.infradead.org
>>  S:	Supported
>> +F:	Documentation/devicetree/bindings/clock/microchip,mpfs.yaml
>> +F:	Documentation/devicetree/bindings/gpio/microchip,mpfs-gpio.yaml
>> +F:	Documentation/devicetree/bindings/i2c/microchip,corei2c.yaml
>> +F:	Documentation/devicetree/bindings/mailbox/microchip,mpfs-mailbox.yaml
>> +F:	Documentation/devicetree/bindings/net/can/microchip,mpfs-can.yaml
>> +F:	Documentation/devicetree/bindings/pwm/microchip,corepwm.yaml
>> +F:	Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-sys-controller.yaml
>> +F:	Documentation/devicetree/bindings/spi/microchip,mpfs-spi.yaml
>> +F:	Documentation/devicetree/bindings/usb/microchip,mpfs-musb.yaml
>>  F:	arch/riscv/boot/dts/microchip/
>>  F:	drivers/char/hw_random/mpfs-rng.c
>>  F:	drivers/clk/microchip/clk-mpfs.c
>> -- 
>> 2.36.1
>> 
>> 
>
> -- 
> Pengutronix e.K.                           | Uwe Kleine-König            |
> Industrial Linux Solutions                 | https://www.pengutronix.de/ |
