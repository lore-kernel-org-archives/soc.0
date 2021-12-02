Return-Path: <SRS0=IIZF=QT=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06112C433EF
	for <soc@archiver.kernel.org>; Thu,  2 Dec 2021 01:31:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C21EAC00446; Thu,  2 Dec 2021 01:31:15 +0000 (UTC)
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C18B9C53FCD
	for <soc@kernel.org>; Thu,  2 Dec 2021 01:31:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C18B9C53FCD
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ot1-f50.google.com with SMTP id x43-20020a056830246b00b00570d09d34ebso37894132otr.2
        for <soc@kernel.org>; Wed, 01 Dec 2021 17:31:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=945C8FwdjlJfOzVlhpCF8zuWn7v4UFq1IxocPRUBqQ8=;
        b=JFAJUL9tZY0QdGu7L1QL+kV3PVnwwsUhZwZaH1jXVPBYYSHQ8c21YFx7WAGzAeNejS
         lUTNQw+jJ9+mk5C2NdJcGH3FDJ4wj/y7LYFpS7S68YC35IuO/pxhO7AAkzFbIEqL/t43
         tSgP1s16uFsjO6rBYXIKaWY5e3hiHLLXf7phQNMF7g1PyZYeOp2sIl3Q7oUOyxLg4YkM
         keipBpfYPh61GNreSuoaILjyu4vho5xHBydpsoY2ZmjVxXYT9nKQDsQI/UYMH/GQfQ/C
         Q0QnjWxjxHY8p2fKMA0KBGe78IYr09XQRcDnOApMv2bO6ENjFEtIOZCaXnzDX3r5E2s7
         Hk8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=945C8FwdjlJfOzVlhpCF8zuWn7v4UFq1IxocPRUBqQ8=;
        b=z/3q3DWEdsCCFwRd8MrYYhu61vHvIAeBP/cT7A8QnHYsNU0Zg57ZurNUyj0QEEMsAd
         0RqmlgWK9YEodh2BA1iA3B2VoMB9fV/MQVkIcuGrB3cJqMOHCrzqXC0Lp5dqw+qWlJwC
         81Q1XJcyC1g6qY0tRjpEkwBZ4KZsfZO9LvwSt1t0TnPyAFQbob1celwP2CoUg1OZ6ZHY
         72xPqg3pkbfLUwXQA+ZY7ZGWouwNqm59A2u/v94UIo+96VKp9iH/OKPpOT2Jrq8XMHGx
         ONLJRoBQknNobQjVM0puupKDwHhWtXueuZvse0KCxgLLgRA2AvcwtsAR9Tk2v+IYaln6
         Zsmw==
X-Gm-Message-State: AOAM530xQqkeI3AyW/RHMd8YreZnIbS6Vk1omxO4Z1T8m/rONvNlfuiU
	BWbZNMRGP2GNr1FGm1rgcpjCsTGEowb6N2IGAbf8RQ==
X-Google-Smtp-Source: ABdhPJynptUzdZ0deeCIJ/1/8Dd0Z3OuhIfbUUA5FzgOArxFCd4yyXkW1vAPE8tq+yRQ8JFHGxYe2+8Pk+7uruR1Uzg=
X-Received: by 2002:a9d:a42:: with SMTP id 60mr9321141otg.179.1638408673941;
 Wed, 01 Dec 2021 17:31:13 -0800 (PST)
MIME-Version: 1.0
References: <20211125211443.1150135-1-Mr.Bossman075@gmail.com> <20211125211443.1150135-5-Mr.Bossman075@gmail.com>
In-Reply-To: <20211125211443.1150135-5-Mr.Bossman075@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 2 Dec 2021 02:31:02 +0100
Message-ID: <CACRpkdb+W2o5Ca5jthau1yOK1n-1SNHUqCWwwjwu_S0bBuS26w@mail.gmail.com>
Subject: Re: [PATCH v3 04/13] pinctrl: freescale: Add i.MXRT1050 pinctrl
 driver support
To: Jesse Taube <mr.bossman075@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: linux-imx@nxp.com, mturquette@baylibre.com, sboyd@kernel.org, 
	robh+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, ulf.hansson@linaro.org, 
	aisheng.dong@nxp.com, stefan@agner.ch, gregkh@linuxfoundation.org, 
	arnd@arndb.de, olof@lixom.net, soc@kernel.org, linux@armlinux.org.uk, 
	abel.vesa@nxp.com, adrian.hunter@intel.com, jirislaby@kernel.org, 
	giulio.benetti@benettiengineering.com, nobuhiro1.iwamatsu@toshiba.co.jp, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mmc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 25, 2021 at 10:14 PM Jesse Taube <mr.bossman075@gmail.com> wrote:

> From: Giulio Benetti <giulio.benetti@benettiengineering.com>
>
> Add the pinctrl driver support for i.MXRT1050.
>
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>

Patch applied to the pinctrl tree.

Yours,
Linus Walleij
