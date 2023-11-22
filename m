Return-Path: <SRS0=HlOH=HD=linaro.org=peter.griffin@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9FBBC072A2
	for <soc@archiver.kernel.org>; Wed, 22 Nov 2023 08:20:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6C0F2C43391; Wed, 22 Nov 2023 08:20:59 +0000 (UTC)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 494F6C433C7
	for <soc@kernel.org>; Wed, 22 Nov 2023 08:20:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 494F6C433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-45faf180a15so1795267137.3
        for <soc@kernel.org>; Wed, 22 Nov 2023 00:20:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700641257; x=1701246057; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4I8dRODFUwv8GNo/5lVqWf42DaYrEmmY1wMx98kbsuI=;
        b=rLIsNFxBf2XiOUmb56s3TvLTis6vmG9ftIkTNXftqllC5wmpTkKWQd/bho9HHup6PW
         N/jMH8ZbYx7VlyEZJeU0rxf5Z/FQXJvvAqSZA6YYuBGYZ3fy73Q8iWSvYpAZhK41CxNf
         rs8psgBRVBHW6CXBEULgT+4bvSmsIt1DgzG6squVw2itq0L46CJlhhj/U1g0Uf2jO8Uk
         SjFYjP64HQ74rOJGeuvqZGMOUkeCQTIOqxSjq3FJWHQOgjTl6deoada6kyux7+vPcLLT
         yADMbkh54dWSZPsT5aZPZWv2UWY+f6OB3JFsUYXKyUIDA8ozjflDmVoLV3dnOaOjStTO
         +vDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700641257; x=1701246057;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4I8dRODFUwv8GNo/5lVqWf42DaYrEmmY1wMx98kbsuI=;
        b=hurTFvbfWUHsPCFgIoBwFAPWGkQtZHOabQl1tCN0OJQghPuXxWMTJ+NUyCENjYMptF
         fQTNdY35fSFOLJTzDi5HdtWC4IkJ5AOpfwXHB7kurg8+HFxgsz4frTXHGTS2ysK5A3gS
         CovmXc6KUmipQSq+q+tmH+vvXtodk6OTGRyKk0dzqd9c/ZnXzF8cQjG97GwXCGpN0OZx
         csfgU3TKWCBzjq+fXY+k+HkxIKHGTjELqFNINeFqL+hfmnkON1+9TZV9mNCI7wuwpR+e
         Jn9PyDrMlX5FkpfuLKwP8YeakA/9B5z01er88jnf5NrQPMWERWtAuFPl8iQBKCW3ctdl
         8aLw==
X-Gm-Message-State: AOJu0YwNikDVKeLAJS6hudg1wqsVH1ROFcAz7N5JMdidmNa/9BQMik8N
	NqiWXsRa72vlXSx0XGnNYCGcpf0knILhVIVoq+AkMg==
X-Google-Smtp-Source: AGHT+IH6MXRD7recCukd9ZPlXrdn9+l+K/d0U/kF9HaOQ28/JOjYehYeGW3YeHAn90fSzCuc3t+BUm1b6U6nd0pNRfU=
X-Received: by 2002:a05:6102:108a:b0:462:7f9d:d263 with SMTP id
 s10-20020a056102108a00b004627f9dd263mr1596382vsr.8.1700641256954; Wed, 22 Nov
 2023 00:20:56 -0800 (PST)
MIME-Version: 1.0
References: <20231120212037.911774-1-peter.griffin@linaro.org>
 <20231120212037.911774-16-peter.griffin@linaro.org> <CAPLW+4m+vG62V++izkycRYEhcTpoT+G=g+3Y4j8vqEpeX2uEPw@mail.gmail.com>
 <8d838a0b-6a13-4538-8dd6-e044ebfabca7@roeck-us.net> <82df32ea-9ca9-44ac-b1ca-719f68d4f58b@linaro.org>
In-Reply-To: <82df32ea-9ca9-44ac-b1ca-719f68d4f58b@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 22 Nov 2023 08:20:43 +0000
Message-ID: <CADrjBPpjMtF36rA3_5NmKk8iw1vEoBZVCTw1auowWte8KGie8g@mail.gmail.com>
Subject: Re: [PATCH v4 15/19] watchdog: s3c2410_wdt: Add support for WTCON
 register DBGACK_MASK bit
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>, Sam Protsenko <semen.protsenko@linaro.org>, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com, 
	conor+dt@kernel.org, sboyd@kernel.org, tomasz.figa@gmail.com, 
	s.nawrocki@samsung.com, linus.walleij@linaro.org, wim@linux-watchdog.org, 
	catalin.marinas@arm.com, will@kernel.org, arnd@arndb.de, olof@lixom.net, 
	gregkh@linuxfoundation.org, jirislaby@kernel.org, cw00.choi@samsung.com, 
	alim.akhtar@samsung.com, tudor.ambarus@linaro.org, andre.draszik@linaro.org, 
	saravanak@google.com, willmcvicker@google.com, soc@kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org, 
	kernel-team@android.com, linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof / Guenter / Sam,

On Wed, 22 Nov 2023 at 07:53, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 21/11/2023 19:10, Guenter Roeck wrote:
>
> >>>   static const struct s3c2410_wdt_variant drv_data_gs101_cl1 = {
> >>> @@ -291,7 +296,7 @@ static const struct s3c2410_wdt_variant drv_data_gs101_cl1 = {
> >>>          .cnt_en_reg = GS_CLUSTER1_NONCPU_OUT,
> >>>          .cnt_en_bit = 7,
> >>>          .quirks = QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_MASK_RESET | QUIRK_HAS_PMU_CNT_EN |
> >>> -                 QUIRK_HAS_WTCLRINT_REG,
> >>> +                 QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_DBGACK_BIT,
> >>>   };
> >>>
> >>
> >> This patch states it's adding the feature, but in fact it's also
> >> enabling this feature for gs101. Suggest moving this patch before the
> >> one enabling gs101 wdt. This way, one patch will only add the feature,
> >> and another patch will enable gs101 entirely (with this feature used).
> >> At least it seems like more atomic approach to me.
> >>
> >
> > Both approaches have their merits and their downsides. I for my part am not
> > even sure if DBGACK_MASK should be enabled unconditionally if supported.
> > With your approach, it would be impossible (or at least more difficult) to
> > revert if it turns out to be broken and/or have unexpected side effects.
> > That seems less desirable to me than the current approach.
>
> Reversing the patches does not change this. It is enabled
> unconditionally in current order as well.
>
> Sam's idea is correct here - first you add support for new quirk, then
> you add new SoC which will use this quirk. Doing the other way - first
> SoC and then new quirk - looks like SoC was added incomplete.

Sure I can swap the order around if that's what you prefer.

I ordered it this way so it was clear who the user of the new debug feature was.

Peter
