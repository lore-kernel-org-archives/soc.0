Return-Path: <SRS0=ID/o=PO=gmail.com=joel.stan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 415F0C433F5
	for <soc@archiver.kernel.org>; Tue, 26 Oct 2021 21:03:36 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 15D9660230; Tue, 26 Oct 2021 21:03:36 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A82F60C4A;
	Tue, 26 Oct 2021 21:03:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4A82F60C4A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f51.google.com with SMTP id c9so67055qvm.5;
        Tue, 26 Oct 2021 14:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XG5lbTjVQqOyn0s7cG0no6APYPSE1g9UuIJyOQ6ldbQ=;
        b=L0Q6Q39KF4ld5D0VLg4Foh6S7OmTuL4NUJHDlWVu8adgjXhgE4sPJgxkeNiiYrl8H5
         KprWsqQ8R8PY9IgEbm6QTvlQwatPzn6ZFHRV2claSzj4DnHUp5pIjWH8guAKZqsTVv9d
         UtXb4AQ8yTRsTAkMdaq0hFNvQubso2XBdKzvc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XG5lbTjVQqOyn0s7cG0no6APYPSE1g9UuIJyOQ6ldbQ=;
        b=7J1TFFZpmtG453x+ExykrKOSCXRY7zxUZHxb2HaF12igMy/HuL8xzBokBoBD+zSEex
         0YVtHZq++3zvM6wL0v2h70WfLYwSU/pAGEyINJNxNN3fk10TOxHo1FwvK073vLgI1kg7
         roYDFvKQ/OzUH+ljwFwtVnu7lG60Rirm20it3aM4K+WE4xxa/dbc47eS0dG0lfX/6ENl
         9tG8pUoqwBt1bDjZl7xGuFUskKPsBDhz4pFy6PgSfj8OK9s9y2pv7BJTlX5BirsU24f6
         /4lH6hPkgBsDI1XbkGoTAHUrATQTvF4AatFrMB5FttLG0bTBCYc7HaLrdy7GXBZeFeDX
         EyvQ==
X-Gm-Message-State: AOAM532U9a9fdndDh0hCME6Evpj4nGL66EDeBYTwbx3f4XEfZuFYPdqi
	FhPXykvSB5KE4LwzPmsGqLjyic8yaPWoPxiHx84=
X-Google-Smtp-Source: ABdhPJyS+raPQ3RHzlakqcRijKe8IBgxi3FsZs0B+JL2VJIAV2O/RysAVQOh6SdhYJC6+oczNxVjX85+/VudRV6YotQ=
X-Received: by 2002:a0c:cdcd:: with SMTP id a13mr19072201qvn.27.1635282214282;
 Tue, 26 Oct 2021 14:03:34 -0700 (PDT)
MIME-Version: 1.0
References: <20211026200058.2183-1-aladyshev22@gmail.com>
In-Reply-To: <20211026200058.2183-1-aladyshev22@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 26 Oct 2021 21:03:22 +0000
Message-ID: <CACPK8Xd5eYpsFNw1jEjv3NaShgzE3zC_Ct29pJM34TfrqRTNtQ@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: aspeed: Add AMD DaytonaX BMC
To: Konstantin Aladyshev <aladyshev22@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: Supreeth Venkatesh <supreeth.venkatesh@amd.com>, Arnd Bergmann <arnd@arndb.de>, 
	Olof Johansson <olof@lixom.net>, SoC Team <soc@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Andrew Jeffery <andrew@aj.id.au>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	devicetree <devicetree@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-aspeed <linux-aspeed@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"

Hello Konstantin,

On Tue, 26 Oct 2021 at 20:01, Konstantin Aladyshev
<aladyshev22@gmail.com> wrote:
>
> Add initial version of device tree for the BMC in the AMD DaytonaX
> platform.
>
> AMD DaytonaX platform is a customer reference board (CRB) with an
> Aspeed ast2500 BMC manufactured by AMD.
>
> Signed-off-by: Konstantin Aladyshev <aladyshev22@gmail.com>

This looks good. I have one comment about the GPIOs below.

> +&gpio {
> +       status = "okay";
> +       gpio-line-names =
> +       /*A0-A7*/       "","","FAULT_LED","","","","","",
> +       /*B0-B7*/       "","","","","","","","",
> +       /*C0-C7*/       "CHASSIS_ID_BTN","","","","","","","",
> +       /*D0-D7*/       "","","ASSERT_BMC_READY","","","","","",
> +       /*E0-E7*/       "MON_P0_RST_BTN","ASSERT_RST_BTN","MON_P0_PWR_BTN","ASSERT_PWR_BTN","",
> +                       "MON_P0_PWR_GOOD","MON_PWROK","",

For systems that will run openbmc, we try to use naming conventions
from this document:

https://github.com/openbmc/docs/blob/master/designs/device-tree-gpio-naming.md

If a GPIO is missing from that doc I encourage you to add it.
