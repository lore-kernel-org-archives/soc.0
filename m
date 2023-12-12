Return-Path: <SRS0=u7GA=HX=linaro.org=peter.griffin@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67D8AC4332F
	for <soc@archiver.kernel.org>; Tue, 12 Dec 2023 19:44:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 53EF0C433CC; Tue, 12 Dec 2023 19:44:05 +0000 (UTC)
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 65D1BC433C8
	for <soc@kernel.org>; Tue, 12 Dec 2023 19:44:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 65D1BC433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-1fb33059466so4211606fac.2
        for <soc@kernel.org>; Tue, 12 Dec 2023 11:44:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702410243; x=1703015043; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5BQMFtAFEVshsml7NDivd/paYwikSCal1XjNLmVRnaY=;
        b=OYR+9ySUfKLcEaVAvD6pfHW3S53Phf8sdQ/zplNvUAIoSs8BJxES8sllOkKpGDC0Kr
         BrAoc0uYbklVipmy1Y/Dw5rOSRh9fvZQz4P/2fKHiwlvPWtgdHtt8zgTKutRI4aDpSv0
         eGClaIUdkaEgVY5MAJz/5rdwq1UJ5LlokR/3mc49Gszj20q32kpfTSks71pzunwkRUOz
         NdRtiteo8DydF+Y6FdkxowGY+tMwO/afBQNCIIU6e0b79T3xGSGzENB/O9J01NOJtaVQ
         +2YZiirQGieSUTarM6D52ew83BMlL2quKFHBjoKtylS4vIR/JUCHpsHTYRsUT0uVmttY
         0Qqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702410243; x=1703015043;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5BQMFtAFEVshsml7NDivd/paYwikSCal1XjNLmVRnaY=;
        b=F+B5t4sPKrCa6r7lsO+YGD3KR01FueCNYvnM8bUv0Gm2f3L0ZsUUfvjvv1pYoYa7fz
         7xtb/QTUPWfcHkL+Rd0nRY4B/FWCv1HS2GwMNHg8IN3EIDHoS+UuwtGbbu7OINZgF7kB
         Wi51Gz3I+EnmTMTWpBSqluA2F8Ee+3Qp7ysvasCJnRh9WEVznsv4Z29uv8Kvce+1lcpS
         GkL3HfZ1dQAIp5WIXQ4/cHOSBLlkAbfM5He7fp6Mo8utIm12EIueXrItFZooclhT1gMe
         El9n968ddCoAh2GDWi8rQ1a9N6SGa72nNQF6efo3uuFz/KOApQUVKLuIgMdWiqP6u44L
         /0zg==
X-Gm-Message-State: AOJu0YxsE8uhtHr6pP7MRIFU4PhLEWdkV0rCzqyuhuwtEbLJejmN58Ru
	VvbwqbGfm5h5FR7MhYMIhHXDKyu08SckkOMQBJWWtg==
X-Google-Smtp-Source: AGHT+IEpRUag5rB1tDDpj1KnSRL4BnsZpmVdNbHOzdHEtq0m5gt0oCTzHiRTdbC5zgVahAhKY6c+9bAJrFEY8lC9oNc=
X-Received: by 2002:a05:6870:7817:b0:1fb:75a:6d15 with SMTP id
 hb23-20020a056870781700b001fb075a6d15mr8510488oab.60.1702410243522; Tue, 12
 Dec 2023 11:44:03 -0800 (PST)
MIME-Version: 1.0
References: <20231211162331.435900-1-peter.griffin@linaro.org>
 <20231211162331.435900-9-peter.griffin@linaro.org> <CAL_JsqJ_NUajmQs8ZYiE2GpvNxBwtkLRE2jvWDU3hKtztt92Ug@mail.gmail.com>
 <CADrjBPrkso2cM8zKq-WU8WC3P3A9YoS6nqX-f6XvSNS-EofK9g@mail.gmail.com> <d23cc32c-8a5b-48aa-be4d-608fbbb9ac3a@linaro.org>
In-Reply-To: <d23cc32c-8a5b-48aa-be4d-608fbbb9ac3a@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 12 Dec 2023 19:43:51 +0000
Message-ID: <CADrjBPoireQMauac4D4d0Ry+PBBUUF=s0Lozp50KLz2y6ZLHKw@mail.gmail.com>
Subject: Re: [PATCH v7 08/16] clk: samsung: clk-gs101: Add cmu_top, cmu_misc
 and cmu_apm support
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, krzysztof.kozlowski+dt@linaro.org, 
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

On Tue, 12 Dec 2023 at 19:38, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 11/12/2023 20:46, Peter Griffin wrote:
> >>> +#include <linux/platform_device.h>
> >
> > You are correct, this header isn't required. If a new series is
> > required I will remove it.
>
> I dropped it while applying.

Thanks Krzysztof :)
