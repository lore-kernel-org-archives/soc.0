Return-Path: <SRS0=IIZF=QT=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAEF5C433FE
	for <soc@archiver.kernel.org>; Thu,  2 Dec 2021 01:28:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A077DC00446; Thu,  2 Dec 2021 01:28:50 +0000 (UTC)
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9922CC53FCC
	for <soc@kernel.org>; Thu,  2 Dec 2021 01:28:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9922CC53FCC
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oi1-f174.google.com with SMTP id t23so52397765oiw.3
        for <soc@kernel.org>; Wed, 01 Dec 2021 17:28:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5gpy4sVMzHHpUlsImi5kl58Gd1L0IEwpwxD1YdQQvBQ=;
        b=PmllECeJTsKVQzyq3fs24scpkhBsQYtimCCEBzVdvfA1Vp9wzh8BEfZW4KAnmXv2VY
         T/o/CapcXTv2Q5kS4pEiq39mMfppHLCKrsrH6K2aqiWkXz9ln9yB8y/Hb/3hmroHDLjd
         sJO7VapIW0v8YX5L8y0iCmtalDl4R7tj9LZlFbPYLsvApLlKcuG74fm25mQWhTV9myXk
         TrKo7k1TWmd0ljc6nvEnXwompmZbt7kaSIQ1aHCUzVbbeXn7MHhX4U7MzhxnspWm1hc6
         Qn3l8m7qVwVKIPPn5ZimiS38UuR576O3Iigl14HOx6MIRhq1Hz8+1XZju1zBR+1cZyOO
         eldA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5gpy4sVMzHHpUlsImi5kl58Gd1L0IEwpwxD1YdQQvBQ=;
        b=cVIxJvGcB0lM1kQGYulCfqNERbpmsH4v3xi1t1UiT/gjAewINgUNgZxrjWCChhmxVc
         aCIzjmYF9HbLPo1e/PvbLQMC9gqkz2cYuua/ah3mU9Dvu04/DGBfFRqRY1WuYWvbb4ki
         FreXrcmIp9pi57HR2Fz/083NIkudC+HefrJWrde0XBpkHCX92jjJg7CQldERCYolbInv
         IuajkOVWsU4An+Hr2xKM5kEwLgeCELfhf05lEjb7J3flYOnNcBQeu4Tt7NmN+iq/wb12
         I+rKjiWvFMDThcGIAcJn+k28LMeGDyWkhyqCe6UmnK46nBdB7O3Z/Ua9P2Y2KmcURmXX
         f//A==
X-Gm-Message-State: AOAM530yf2h7bWXXGXy5ek8PEE7sDLUF6Toj86ajwo5MsRSpdKWSHB54
	F64yxGj0ukIagA5yZS20lZg2oMSnFBKu1750QrqrNg==
X-Google-Smtp-Source: ABdhPJxecnz1NO0fgLf1UE399iXCnEzQsG+UsmsEG6gIeEhXW9yYIQzCp0kbjcc193owkf4Og+b8awgaUPwSMZC0LNE=
X-Received: by 2002:a05:6808:60e:: with SMTP id y14mr1921269oih.162.1638408528758;
 Wed, 01 Dec 2021 17:28:48 -0800 (PST)
MIME-Version: 1.0
References: <20211125211443.1150135-1-Mr.Bossman075@gmail.com> <20211125211443.1150135-3-Mr.Bossman075@gmail.com>
In-Reply-To: <20211125211443.1150135-3-Mr.Bossman075@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 2 Dec 2021 02:28:36 +0100
Message-ID: <CACRpkdZ_o=L8t8wysy_wOaUydR-ptEkg07-mOjA32OWzEea8=A@mail.gmail.com>
Subject: Re: [PATCH v3 02/13] dt-bindings: pinctrl: add i.MXRT1050 pinctrl
 binding doc
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
> Add i.MXRT1050 pinctrl binding doc
>
> Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
> ---
> V1->V2:
> * Replace macros with values
> * Add tab for last pinctrl value

Patch applied to the pinctrl tree.

Yours,
Linus Walleij
