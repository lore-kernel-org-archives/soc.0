Return-Path: <SRS0=ZQjm=FJ=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B69CC4361A
	for <soc@archiver.kernel.org>; Sat,  5 Dec 2020 21:43:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id DB6332310B; Sat,  5 Dec 2020 21:43:07 +0000 (UTC)
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com [209.85.208.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8227B230FF
	for <soc@kernel.org>; Sat,  5 Dec 2020 21:43:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8227B230FF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linus.walleij@linaro.org
Received: by mail-lj1-f193.google.com with SMTP id s9so10692276ljo.11
        for <soc@kernel.org>; Sat, 05 Dec 2020 13:43:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=700HkyTVIFp9nZiWIVsyfYqFVm65sXEMC2ghItegDYE=;
        b=YafReqCUo5/xizSfSIS3eP6fIPD2UUW2x4UkHHsy1SSLo8OE8qcD9agG/wfCEVdrAG
         SxObFlizYVZ3nb6EqQyXyKNsVjQF6A/GwwsFLTbqirAR4miX3Em8ffTq7XUGZiIe5uT0
         uxqUeG/gaUj+pmjrQsHQrtxKVaeZHzld9tPg4ZGin61fb166k92rwaWcNR4o1rN1tnwV
         7hJj3ivRoqBOwgfqvdyGFgaNMIoFzKCXO2FgHx9F7hF28iGduKGjHT7llzihQF+/dF54
         T8D/ADXwaIOUnrxzXrz3RNTCbpux8yUVY+6aXwNRnEtMGuWBO0ZcoLRT1WZE5XacEm1L
         8c/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=700HkyTVIFp9nZiWIVsyfYqFVm65sXEMC2ghItegDYE=;
        b=E7WN6DVkCdmMPqOCnpGl0+39OvF+FiBZaRYTd8FKlp86EjThYEwbbAZWxqVu8RaXru
         AscumMU5hcZ1vEBb4SWnrDrXvhhWJoTdpGk5XSpL2BMzG2FvaRcAWCwgQwIM1oSWvzbG
         4mTa8mTS+m2VLkBQmNZLahaFvS8dTL+u9OnhoOn4F43EljI46s+lNUseyhK98ZDEbHB6
         M5q0MJ460TRDst1wnuzYODgfH5ejdhECiw6+ipBBV+hiJyRTqvJZGd/axDvjd4+D4md4
         tvUY++0eoGiZ1gzz8mvh3pHkiKfhBdn07KQCDOAXYT5jUWkf9nCutiWtxOapv7fMjdTI
         0kJA==
X-Gm-Message-State: AOAM530gGKYmXkuU7tOGUCDQmLjEIaTSz13MUOsk1oMpTbwGw0QR20pV
	ZmHgpEUutiiwNRjeh0pQUVvWvS5p1xE1zls3+F7R5g==
X-Google-Smtp-Source: ABdhPJxOBXULP7OBc7vXFcwbfQDybB9Vs66oJlYkEGsjHLd3VRw9w9OMx28IXZxfzQVww4oMJ5ir7VUoAimLdzmSMDU=
X-Received: by 2002:a2e:998e:: with SMTP id w14mr6262208lji.100.1607204585830;
 Sat, 05 Dec 2020 13:43:05 -0800 (PST)
MIME-Version: 1.0
References: <20201129110803.2461700-1-daniel@0x0f.com>
In-Reply-To: <20201129110803.2461700-1-daniel@0x0f.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 5 Dec 2020 22:42:54 +0100
Message-ID: <CACRpkdYEzFYw=CbBFCs9=DfarsCQKD0zA2WvE95nF8ehA_2i1g@mail.gmail.com>
Subject: Re: [PATCH v4 0/5] Add GPIO support for MStar/SigmaStar ARMv7
To: Daniel Palmer <daniel@0x0f.com>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rob Herring <robh@kernel.org>, Willy Tarreau <w@1wt.eu>
Content-Type: text/plain; charset="UTF-8"

On Sun, Nov 29, 2020 at 12:08 PM Daniel Palmer <daniel@0x0f.com> wrote:

> At the moment the MStar/SigmaStar support is only really
> capable of shell from an initramfs and not much else.
>
> Most of the interesting drivers are blocked on clock and pinctrl
> drivers and those are going to take me a little while to get cleaned
> up.
>
> Clock and pinctrl aren't needed for basic GPIO to work (all pins
> start off as GPIOs..) and it makes it possible to actually do something
> so this series adds everything that is needed for the main GPIO
> block in these chips.
>
> Changes since v3:
> - Remove unneeded "gpio-ranges-group-names" property from binding yaml.

OK finished!
Patches 1, 2 & 3 applied to the GPIO tree for v5.11.

Thanks for the good work!

Yours,
Linus Walleij
