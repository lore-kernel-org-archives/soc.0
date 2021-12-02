Return-Path: <SRS0=IIZF=QT=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10DA4C433EF
	for <soc@archiver.kernel.org>; Thu,  2 Dec 2021 01:32:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E930CC53FCF; Thu,  2 Dec 2021 01:32:02 +0000 (UTC)
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C93A7C53FD0
	for <soc@kernel.org>; Thu,  2 Dec 2021 01:32:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C93A7C53FD0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ot1-f43.google.com with SMTP id x19-20020a9d7053000000b0055c8b39420bso37865297otj.1
        for <soc@kernel.org>; Wed, 01 Dec 2021 17:32:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eVbRuKvcYz8AuHjLMnmwWWcthb2yF6TQ0KJocuhiso8=;
        b=GrJrq18VwUkgj1pL7epo3ZZ6SnuAd05gDtoKKnKYDh+F6AbvfjS0qATlGPqZ6/ZVRc
         mAzJyJuFMgLLlAUyw/zGeGHyDcWBU4ILxwB1Go1Q1vsKXp1b7nXAUSqgKw1tvhGAt9f3
         skzgj4QTppkSffVCxJ814cm7m0sWH/4PP9Ek4cHZrE9lfj1Vpt0QZVyh2KMZrkToCSEu
         4wPfF6esot0G+kNWfZN87L9205PfEjJ8617b0KRuMWmwuqifVPxJzY4LBCUEDMG3Qyin
         /ZHjiuaRnhsfGm2nITYQc0A0R+OqJdOe/vhE7bB/fnjPgIl/8QV6/oJMM9xwl27adyAA
         OfFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eVbRuKvcYz8AuHjLMnmwWWcthb2yF6TQ0KJocuhiso8=;
        b=CiUTWVY17lEg+iZcuKuyCZ3TE3o5XkDMfzP5DJxAdvrWgcqA/6KMcy6fEWW65OgpbE
         Kchb47t0lDSOai9OFDctHURthQDLBy2i1J1xQet50k8gPdZOZ1MfpljoCkekGfUHuRDI
         r4Q0p6UxsyHw5SYrkmbLfdNUNhrqrMl8DqgSMxUwL6zccDdYF2QM/R12L8Y6rD2bkIs+
         QeND3h2XJ5V4X6HKQ8UGCMccxgQ2mYn0xOOMuodKIrY/WciKt6s7SVJz/gCnOp6DvcO4
         ZcML0LR66sVfKh27O3QqDWNBXGKpiCJYorBGKe81B8liOVLzZoPVCVde7uhdRFqXikUs
         cS/Q==
X-Gm-Message-State: AOAM532RaaTmrbpXD5Dq5ALpqScZ6SDUvnj75UU/SZMValOmmMf1gH6X
	CDi1kVAKDysemwiVV5btCrnNkp9WEZPX1UEIz2SObA==
X-Google-Smtp-Source: ABdhPJwyLdZ/F6szrsoT0MsoHuDbALu4MPwuISdCMt7O2AkJiofhGn6t9NOXmZkAcyUEGrTCiSAE7G6YB4B+QiEYdGA=
X-Received: by 2002:a9d:ed6:: with SMTP id 80mr9048514otj.35.1638408720916;
 Wed, 01 Dec 2021 17:32:00 -0800 (PST)
MIME-Version: 1.0
References: <20211125211443.1150135-1-Mr.Bossman075@gmail.com> <20211125211443.1150135-4-Mr.Bossman075@gmail.com>
In-Reply-To: <20211125211443.1150135-4-Mr.Bossman075@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 2 Dec 2021 02:31:49 +0100
Message-ID: <CACRpkdab25qv+NQj9oSxHX2W+dWNWMzWXJjg97Qmci23CM0RMw@mail.gmail.com>
Subject: Re: [PATCH v3 03/13] ARM: dts: imxrt1050-pinfunc: Add pinctrl binding header
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

> From: Jesse Taube <mr.bossman075@gmail.com>
>
> Add binding header for i.MXRT1050 pinctrl device tree.
>
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
> [Jesse: move pinfunc from dt-bindings to dts folder]

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Please apply this to the ARM SoC tree.

Yours,
Linus Walleij
