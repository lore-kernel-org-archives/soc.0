Return-Path: <SRS0=QtAb=PW=gmail.com=festevam@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B061C433EF
	for <soc@archiver.kernel.org>; Wed,  3 Nov 2021 17:51:24 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 0E9B661139; Wed,  3 Nov 2021 17:51:24 +0000 (UTC)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CFF4960EE9;
	Wed,  3 Nov 2021 17:51:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CFF4960EE9
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f52.google.com with SMTP id b3so5990262uam.1;
        Wed, 03 Nov 2021 10:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=y16TxmkBvfqZgNLIXU85g39fksG0Qn9oks7FAgvFiCM=;
        b=fPXyM8mzP3xvv8wh3rn4V3uaO87BNrn0AJ9Qk+6md27hPqHI7elIBnRFfZrMbkrB8z
         HMRAMWtnw0XtczVwAoKFJVJIdYOkvt8HQYEM8C6xTdZXiSzf4OZxmxoe6Y08fRhREPSJ
         XIWi2Lh6dvIz44V28gaJTn+LjOAiatp6weuHgHr8HN783Bom+vt60CdU1nql8hJzFwAf
         8xk0AzN3X2eOPziruIBW+zMsjC7zIG02FuAJFh5F++waTBxWkxxKZf6WCNIdprizOMbW
         Xm+0CZZTDVOgSmjSd7lFoDAmPZFRD0BUunnY1+vhJaIeWPGb9aoKk/6xNIoKE9mP9EBy
         QQOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=y16TxmkBvfqZgNLIXU85g39fksG0Qn9oks7FAgvFiCM=;
        b=oKdmkwi8RU5XmPcAeGc04ltFqJn8CWu1G9fyQAevc+G10mqJCMKHxr8mFW9X9l1tWE
         PbU4sB6rt3fbjbqhvnMbpl5cy+Qp6/TqTddj5nxhJXlhtfNIZ2hQmgAORLdnxzWZM2Ms
         l5SZmJql2xS7L13Ns1maAh/GSSOPQnPiINGMg73Y+jGaiSb126K/x4rJvZy68GX0H2CC
         9ArNRz218MGO7J9cYAV1Q/4Cq7Q5/MhR184Tsk1Gs/Dqayj2yxWab4sQzbt404Ls0gDl
         m/J/63GISdpYpfiGEQ+AqURF0abqXWHC6Jr2KOCRRq/dFpbiazERkyoNpe0dB3WGuCw1
         HCMw==
X-Gm-Message-State: AOAM533eIorFUaKr4Ku0bVR5Bb9aKpoWOTsqr7b8YhY4A6xvVrBbSI4F
	NkffA9cPtHdI+Ao+gqHDj4MhbMf3OdIr5JdtUSI=
X-Google-Smtp-Source: ABdhPJx8cB1VYKTTJlveYA1FJ28sZ0zZeouC+gUZUYrWW2QvfiO2tYkKYYUUJqVe1q+ewdOqhm9/EvWuL40E8vwi7uo=
X-Received: by 2002:ab0:6ca7:: with SMTP id j7mr39236673uaa.133.1635961882870;
 Wed, 03 Nov 2021 10:51:22 -0700 (PDT)
MIME-Version: 1.0
References: <20211102225701.98944-1-Mr.Bossman075@gmail.com>
 <20211102225701.98944-12-Mr.Bossman075@gmail.com> <CAOMZO5AxMXxDkNDqGJDhtepqSUxGRCWO+L=c67O==4fx66M7XQ@mail.gmail.com>
 <c1610093-95ae-68d3-57ae-93b1bc9715d7@gmail.com> <5ebe48f5-7b9c-be99-d50c-65a056084b96@benettiengineering.com>
In-Reply-To: <5ebe48f5-7b9c-be99-d50c-65a056084b96@benettiengineering.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 3 Nov 2021 14:51:12 -0300
Message-ID: <CAOMZO5DHCYaxzSASKq6Bk8ALkiQeVjPOHOyk-pKYepJFJk6oFQ@mail.gmail.com>
Subject: Re: [PATCH v2 11/13] mmc: sdhci-esdhc-imx: Add sdhc support for
 i.MXRT series
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
List-Id: <soc.lore.kernel.org>
Cc: Jesse Taube <mr.bossman075@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Sascha Hauer <kernel@pengutronix.de>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Dong Aisheng <aisheng.dong@nxp.com>, 
	Stefan Agner <stefan@agner.ch>, Linus Walleij <linus.walleij@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Olof Johansson <olof@lixom.net>, soc@kernel.org, 
	Russell King - ARM Linux <linux@armlinux.org.uk>, Abel Vesa <abel.vesa@nxp.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, Jiri Slaby <jirislaby@kernel.org>, 
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>, linux-clk <linux-clk@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, linux-mmc <linux-mmc@vger.kernel.org>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Giulio,

On Tue, Nov 2, 2021 at 8:30 PM Giulio Benetti
<giulio.benetti@benettiengineering.com> wrote:

> If we add every SoC we will end up having a long list for every device
> driver. At the moment it would be 7 parts:
> 1) imxrt1020
> 2) imxrt1024
> .
> .
> .
> 7) imxrt1170
>
> Is it ok anyway?

As this patch adds the support for imxrt1050, I would go with
"fsl,imxrt1050-usdhc" for now.
