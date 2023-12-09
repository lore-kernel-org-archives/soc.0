Return-Path: <SRS0=QSjn=HU=linaro.org=peter.griffin@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EB02C4167B
	for <soc@archiver.kernel.org>; Sat,  9 Dec 2023 00:10:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 63BD2C43395; Sat,  9 Dec 2023 00:10:24 +0000 (UTC)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BD1BFC433CA
	for <soc@kernel.org>; Sat,  9 Dec 2023 00:10:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org BD1BFC433CA
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-3b83fc26e4cso1715385b6e.2
        for <soc@kernel.org>; Fri, 08 Dec 2023 16:10:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702080621; x=1702685421; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=azix/yRrG4Km4lzOJULD3ZaeZVJ1BPo9SUg9XKCQAZ8=;
        b=KFJjiIA4Gm4e1laZHzndaQ1RCLSM5q8TxRIgVHwh4ahf5fsLU9dhnC8b06fcWH32RJ
         fEN3Kuhwbj8mNhsgDM+7xRtYL+C/GD6OmOSx3365FvGq1cpgzOrrkAWkvVKkdcJooYFt
         3Z95KO2DE1gEMsB3Ur0xMbS873Oi/ilLo7v9WpSIzztkzmDENjPCxY95WxFhicgzWrIL
         8UyzwT2abyTP5JAFtRcZObvVeWu1Yk29sQC2w6XlO0YXQODA94RpSuyTZVStSw8uJmQY
         PTQbRXjkhQBOXIRhSPOD8Iq5BTJnwEuwEyeKKwgtDhyiBPdB1Pl5Cj5EraljijmOTBTz
         z0zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702080621; x=1702685421;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=azix/yRrG4Km4lzOJULD3ZaeZVJ1BPo9SUg9XKCQAZ8=;
        b=G1OZ1KTrg5PRHWsBxFgj/gEBXyAZlKNUIpmf4fXLaDvXHbYGsR/SdDkgusjnAvBcsv
         h1xV+O2pN88lsWKJ777r6XI3r45H9WNqqw4+pnqb4YvO3K5p9Ojw+t79jsVImwSwJxOz
         gl6WYAFPUXdm5GkwJe6coYMan1BLI84z5rR1S0dJSfBqVaA0w8AiKCxJsvsakKCNNWUZ
         R8FWC3KnJjaxaviX8RwrwSebO9KFyc0mVxl+K6XqGc4fW8nXJHVHeFUlnNu3NrOHSTKe
         xYowfXYwcJo2EMbkmKZSuc7zxrySmJDC+rh7kSqRa8uWoI3jQPrSWi/c4OeegMfa7G/C
         isqw==
X-Gm-Message-State: AOJu0YxziuptF/AMRP7lPPmc7U7amj6Y/BDyEqQPlnLDRf5a8LSugFfj
	QlLQzxR+d7izoCrHZAWxtfpfyo0yXip/6Fg4PN/RjA==
X-Google-Smtp-Source: AGHT+IHz7/iskB7s5RD0vmm831Z1V5eHiAlf4apNR66Oq422LsMXkYYMGiWwLPJO+HLNaKpMMTj16w2DrWT9VIou5yI=
X-Received: by 2002:a05:6808:6549:b0:3b9:dd3b:464c with SMTP id
 fn9-20020a056808654900b003b9dd3b464cmr742599oib.103.1702080621671; Fri, 08
 Dec 2023 16:10:21 -0800 (PST)
MIME-Version: 1.0
References: <20231201160925.3136868-1-peter.griffin@linaro.org>
 <20231201160925.3136868-3-peter.griffin@linaro.org> <6e595a110444033de6ecd35bedc6e84ea1c43fdc.camel@linaro.org>
In-Reply-To: <6e595a110444033de6ecd35bedc6e84ea1c43fdc.camel@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Sat, 9 Dec 2023 00:10:10 +0000
Message-ID: <CADrjBPq+jvULhG4vezCCt4xXsQrybTsOuiCBB3LZZq32OrJjoA@mail.gmail.com>
Subject: Re: [PATCH v5 02/20] dt-bindings: clock: Add Google gs101 clock
 management unit bindings
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org, 
	tomasz.figa@gmail.com, s.nawrocki@samsung.com, linus.walleij@linaro.org, 
	wim@linux-watchdog.org, linux@roeck-us.net, catalin.marinas@arm.com, 
	will@kernel.org, arnd@arndb.de, olof@lixom.net, gregkh@linuxfoundation.org, 
	jirislaby@kernel.org, cw00.choi@samsung.com, alim.akhtar@samsung.com, 
	tudor.ambarus@linaro.org, semen.protsenko@linaro.org, saravanak@google.com, 
	willmcvicker@google.com, soc@kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, kernel-team@android.com, 
	linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andr=C3=A9

On Wed, 6 Dec 2023 at 12:30, Andr=C3=A9 Draszik <andre.draszik@linaro.org> =
wrote:
>

<cut>

> > +#define CLK_DOUT_HSI2_PCIE           118
> > +#define CLK_DOUT_HSI2_UFS_EMBD               119
> > +#define CLK_DOUT_IPP_BUS             107
>
> You're restarting at 107 here, but the numbers should continue at 120...

I've fixed this in v6.

Peter.
