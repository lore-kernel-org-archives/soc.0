Return-Path: <SRS0=/kUF=HW=linaro.org=peter.griffin@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A671C4167B
	for <soc@archiver.kernel.org>; Mon, 11 Dec 2023 10:23:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C9E00C433C8; Mon, 11 Dec 2023 10:23:04 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 67FB7C433CC
	for <soc@kernel.org>; Mon, 11 Dec 2023 10:23:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 67FB7C433CC
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-67ab19339b4so29756476d6.0
        for <soc@kernel.org>; Mon, 11 Dec 2023 02:23:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702290182; x=1702894982; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8uwL1lLxX1dFaUiWFiQrXZhQs3hhD/dlzqmlkyytJpw=;
        b=MvfmiNoiHqmIUn3XZ6ENSuP0TzPlHPAgQuAAHWckddgHw/dCKdjyWQZuG5KCeCoAec
         qq9u1eAOci4WBZYSFl06iIoX6S9SBhgR/s4Nm5EW4u7eYkTHYJfmMqpByaW8119zC5YW
         Ix6uYFNnaAFsmB8nKNuXXWS4pFqAyUICTxkcrEO7qeTQLbAXUbLqS9KDi5IaXDh6UI8i
         Bh1Drc6Joh+OtdhIbp+LatKvn3QqtMkCvGolNAMZID6mD0EfWT9lrw46hARhJuq+lr9S
         jetjrv9IFPYhpInpByWc4sOnpyotZjUEnOUCuTPtN4nXK7iEQJQlx/D4xknhS+mgByLt
         9KLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702290182; x=1702894982;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8uwL1lLxX1dFaUiWFiQrXZhQs3hhD/dlzqmlkyytJpw=;
        b=hg9HfxZJ+AkLLHxi4r0YAMLl5tAceWYgD1syO5pqYKKa3HzrMz4hhX/B0USx89vWVA
         scoudLHN00wPX5sYJ/LqmPFjOefKLtmevSTkT2y2/mCQWoRc/lA3c6f6C/rJwn9CJWRX
         CF7OV8X2BsrRkACmG7SyQPC7xvD2rE5SKKnqDSwHHYGZoQxjhbI8CSniO2p21+pZVC2G
         0+Kt/8HVD4+MNHYMwKc1LQkA15u1QiHyMmmR2EEF194iEpPPE6+DDk7NKnFvSIMrdOpQ
         v8OFNNWaFvCu7ji9CxcEIzSg5vZuWM0qsI45yxICWjareIN0CF4KgZJBU9RW1baNNGvl
         k3yg==
X-Gm-Message-State: AOJu0YwyxVTB7jVniiHV6iFjqT22bN/qC/WeaIZpHkpyiRplZICFoNq6
	lVcgasJnCTK0VUv62dYep/Fhz1ymcqBGWqZhQW1M9Q==
X-Google-Smtp-Source: AGHT+IHqP/co+Erp1KyVxk9Vrb7BjW2fZ076cQiX9m6z1AAqfzfzOVELbNhXJDqCOlCh75GXJdg46xQJtROICe7jQ3I=
X-Received: by 2002:ad4:50c3:0:b0:67a:c8e4:e692 with SMTP id
 e3-20020ad450c3000000b0067ac8e4e692mr5048288qvq.100.1702290182193; Mon, 11
 Dec 2023 02:23:02 -0800 (PST)
MIME-Version: 1.0
References: <20231209233106.147416-1-peter.griffin@linaro.org>
 <20231209233106.147416-15-peter.griffin@linaro.org> <9ffd229e-cf1b-4508-ba74-d5a000c54582@linaro.org>
In-Reply-To: <9ffd229e-cf1b-4508-ba74-d5a000c54582@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 11 Dec 2023 10:22:51 +0000
Message-ID: <CADrjBPrWQ9EUDDqZ6Nxr-z93rzZf0sJVVFVZk58s1ErmkUJpMw@mail.gmail.com>
Subject: Re: [PATCH v6 14/20] watchdog: s3c2410_wdt: Add support for WTCON
 register DBGACK_MASK bit
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org, 
	tomasz.figa@gmail.com, s.nawrocki@samsung.com, linus.walleij@linaro.org, 
	wim@linux-watchdog.org, linux@roeck-us.net, catalin.marinas@arm.com, 
	will@kernel.org, arnd@arndb.de, olof@lixom.net, gregkh@linuxfoundation.org, 
	jirislaby@kernel.org, cw00.choi@samsung.com, alim.akhtar@samsung.com, 
	tudor.ambarus@linaro.org, andre.draszik@linaro.org, 
	semen.protsenko@linaro.org, saravanak@google.com, willmcvicker@google.com, 
	soc@kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, kernel-team@android.com, 
	linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi folks,

On Sun, 10 Dec 2023 at 14:24, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 10/12/2023 00:31, Peter Griffin wrote:
> > The WDT uses the CPU core signal DBGACK to determine whether the SoC
> > is running in debug mode or not. If the DBGACK signal is asserted and
> > DBGACK_MASK bit is enabled, then WDT output and interrupt is masked
> > (disabled).
> >
> > Presence of the DBGACK_MASK bit is determined by adding a new
> > QUIRK_HAS_DBGACK_BIT quirk. Also update to use BIT macro to avoid
> > checkpatch --strict warnings.
> >
> > Tested-by: Will McVicker <willmcvicker@google.com>
> > Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
> > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
>
> Guenter, Wim,
>
> The watchdog patches are kind of independent, except that bindings has
> conflicting re-organization which I took via my Samsung SoC tree. If it
> is fine with you, please provide acks or review and I will take the
> watchdog changes.
>

Just to add, without the Watchdog gs101 changes the system will reset
after ~60 seconds, as the bootloader is left running by the
bootloader. So it would be nice to get patches in as well if possible.

regards,

Peter.
