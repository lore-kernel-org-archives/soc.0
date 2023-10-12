Return-Path: <SRS0=dFf3=F2=linaro.org=peter.griffin@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5E2DCDB46E
	for <soc@archiver.kernel.org>; Thu, 12 Oct 2023 10:45:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 85F22C433D9; Thu, 12 Oct 2023 10:45:49 +0000 (UTC)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8901FC433C7
	for <soc@kernel.org>; Thu, 12 Oct 2023 10:45:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8901FC433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-5a505762c9dso9736157b3.2
        for <soc@kernel.org>; Thu, 12 Oct 2023 03:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697107546; x=1697712346; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1Y1HcKX9gLg/2u91PTGxysXLbI09E4OA7x2vijjT4oo=;
        b=idpn1m/gZOCmyRvojmeFw5uWS0GdbrErcjJLA2KeV/OQinrEyjzz/iDw7KEmjma5Fz
         2Vtx7GbXaE5Ih5+0oAHEVVxEYm0YJXaVwz0Ao2cEQkyJlQWf6jKC3sRCxCkMdew0TPs+
         EZKu3ydqQs0oX0fpcin78ohKdN+WEBqUOYYgFaPlChD3YOOKnteT8iklT5WRa3NIxCwA
         Af01dTW6R29iI6BmD4AcbCs8wqE0hS3HeSk6p7EcSIJMO2CYsLg3Kj8Sfdx+o4J+IBTX
         H6L1D1070fZ1Kn/GRvr24csev77SCMiawQcyapn+8ufxr4ocFDJOxhYsvQppKt3Klg8J
         tkFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697107546; x=1697712346;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1Y1HcKX9gLg/2u91PTGxysXLbI09E4OA7x2vijjT4oo=;
        b=DeIwMWOdMWALLn3WQo42iwU/F9rOvST8sDQzwh0ZI3wTn5x/62s1WPsnH3+F6tftuo
         gZ2/CM6eHJ5zLg97xl7CnSeUh4JNJCdV402XrFEk7ikjmx7EdXyIU6ROsOrnUP9iCq7l
         RJFX6W6qJ5k0I0skmXBh3D9qtwmRVhAkp65iizQpeogcjUPPt/rVT2EJw4LnDQtE0bpV
         ouMGAsQ2W+hiwwWbMNOOos0eW72UqLQ5PLUsXw9t2h4H7D6G4c5jcmv0qUDiRK7kzbaO
         XznzTZJLgfZ1PjipbOGPJrZvNM5cpXzZGeUjazQJiyB+t9V/j3/H4k0OiowJrTXe/q4m
         GtrA==
X-Gm-Message-State: AOJu0Yw+2bkiGSRwHSNODsDdlKeJ4fGwE2gX2uxyBuZ5dxK8mghu2jYX
	YpvZkKiL2jRrlL0Z2P5OO4HNC1MLFuNq9UQ7S6EyrA==
X-Google-Smtp-Source: AGHT+IGB+FxE7ccc2MEU8WMKyKb6JfbaLjOX2/doWAHH3NmtLFyPGOAqUKNJex39lRrnodJof8jLL2wunY4kkN6We6s=
X-Received: by 2002:a0d:ee01:0:b0:59b:c6a4:15c7 with SMTP id
 x1-20020a0dee01000000b0059bc6a415c7mr21411976ywe.46.1697107546553; Thu, 12
 Oct 2023 03:45:46 -0700 (PDT)
MIME-Version: 1.0
References: <20231011184823.443959-1-peter.griffin@linaro.org>
 <20231011184823.443959-3-peter.griffin@linaro.org> <ZScYOUi7qhvGmMIF@google.com>
 <e4523fc3-e1dd-4791-b950-98dfc6dce1f5@linaro.org> <CADrjBPpntJMsxb6oGQ7zuX3f0dgE3oYFepL4OdxamBz=_or7kw@mail.gmail.com>
 <21742fbf-8484-42ab-aba1-379305091946@linaro.org>
In-Reply-To: <21742fbf-8484-42ab-aba1-379305091946@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Thu, 12 Oct 2023 11:45:35 +0100
Message-ID: <CADrjBPpF3Ta67QzUqyXD1YSFV_kFWqujCxPAjKbvRNhgXeMmOg@mail.gmail.com>
Subject: Re: [PATCH v3 02/20] dt-bindings: clock: Add Google gs101 clock
 management unit bindings
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: William McVicker <willmcvicker@google.com>, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com, 
	conor+dt@kernel.org, sboyd@kernel.org, tomasz.figa@gmail.com, 
	s.nawrocki@samsung.com, linus.walleij@linaro.org, wim@linux-watchdog.org, 
	linux@roeck-us.net, catalin.marinas@arm.com, will@kernel.org, arnd@arndb.de, 
	olof@lixom.net, gregkh@linuxfoundation.org, cw00.choi@samsung.com, 
	tudor.ambarus@linaro.org, andre.draszik@linaro.org, 
	semen.protsenko@linaro.org, saravanak@google.com, soc@kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org, 
	kernel-team@android.com, linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

On Thu, 12 Oct 2023 at 10:36, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 12/10/2023 10:56, Peter Griffin wrote:
> > Hi Krzysztof,
> >
> > On Thu, 12 Oct 2023 at 07:07, Krzysztof Kozlowski
> > <krzysztof.kozlowski@linaro.org> wrote:
> >>
> >> On 11/10/2023 23:48, William McVicker wrote:
> >>> On 10/11/2023, Peter Griffin wrote:
> >>>> Provide dt-schema documentation for Google gs101 SoC clock controller.
> >>>> Currently this adds support for cmu_top, cmu_misc and cmu_apm.
> >>>>
> >>>> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> >>>
> >>> Tested-by: Will McVicker <willmcvicker@google.com>
> >>
> >> And how do you perform testing of a binding?
> >
> > I guess if William is using my script to build and flash the kernel it actually
> > runs the DTC checks as part of the build process.
> >
> > See https://git.codelinaro.org/linaro/googlelt/pixelscripts/-/blob/clo/main/buildp21upstream.sh#L44
>
> So it is a build test? We do not consider building as a test procedure,
> otherwise I should add my and robots tested-by to many other patches.

Ok so I should only add the Tested-by on the .c patches?

> Shall I consider other Tested-by tags here also as build-tested only?

No. William indicated here
https://lore.kernel.org/linux-arm-kernel/ZScZu-QB2LmB4CSM@google.com/T/#mbd96a26b725d6c85eb4193de8cd70ff277bc728e
that he booted it on his Oriole device.

Peter.
