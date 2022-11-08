Return-Path: <SRS0=1a0t=3I=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2484C4332F
	for <soc@archiver.kernel.org>; Tue,  8 Nov 2022 20:14:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9C9AAC433D6; Tue,  8 Nov 2022 20:14:40 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 61102C433C1
	for <soc@kernel.org>; Tue,  8 Nov 2022 20:14:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 61102C433C1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f51.google.com with SMTP id f27so41536844eje.1
        for <soc@kernel.org>; Tue, 08 Nov 2022 12:14:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=u17pHj0ChltDJ0D7lR/YzqX+TvSRsW0jbRS1U9lK73c=;
        b=Ekbtiq+u5vZ33TKYFeiyykEfG/k2WG03QNInCOKnhJHvL40cpVYDu+KouEa/FVWFX2
         FkYpe3Pvs73yUDEwDP9wI4zfCAN8+pT70TYsm8KvRt17pC7YBaYdD4XvILJuBXVrkPj+
         9QvcZPGMohVO2tb0IkqrHlcEbGB4Tc4l8EJWm4mXcXVRw+uwizwLsRYwrfh4CG58hpDo
         sFlpSxoNktbIrR79V196av1N53ABUaQA7ytfS4o+/p7RmZOMNsRWSZ438hD6V/ZNdj9d
         5Nrn6+uzNu9UhnL7sNxs5Pq2L3bKjKq7uRMoTu9Yp3RB8PK3zkBKSnTlm3wK/95pAM0y
         TnhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u17pHj0ChltDJ0D7lR/YzqX+TvSRsW0jbRS1U9lK73c=;
        b=JmlgKzZcsfoWNjJLTYHruSpX66QffNefyb6vL5lgETYnGgvEP99K38dl4sbB+DriDA
         eF51FpXTgHymQB5VVs0S4Mjn4OAVwCG5Q1i6adOpX8mjQDEhroKB+lUeKzx+0U4DXWC3
         FINZ+YX2L/OLVAZIxS0KTFYITnnfpDGyv02OaAmu1IVGBhg9ilk9cInrBP8tIgsOzcZP
         e9+11LuaByGLoFE9havo/7I0Q1r8cThvHbjQpwkWkvF9PYwSendwHT8mNqxdrlkMexA3
         jvzmwqEtLBwlCs5XMTrDs0gcHG+R3BAmag8mlc/Pd//6e+uyRTNA4AddYDFRuyYhaiQI
         gLHw==
X-Gm-Message-State: ACrzQf09Je6kmB/hebtH7wMTlyZqpo/oqoGSXOlPNAo3oh0YHPw2bYTf
	6OHQXqLRJULp4zeIUkTBaXYZi0bGQsVtVG5BxIQYZA==
X-Google-Smtp-Source: AMsMyM7tH4y/W66k6uVPP2QuiuNld4WkKliXIdH3vkHSuRWLqcfdhprHYp74pblMG6J8HHOj0SB3Ot7mm/0XVEOpwZY=
X-Received: by 2002:a17:906:4c4b:b0:7ad:a197:b58e with SMTP id
 d11-20020a1709064c4b00b007ada197b58emr55561181ejw.203.1667938477589; Tue, 08
 Nov 2022 12:14:37 -0800 (PST)
MIME-Version: 1.0
References: <20221108123755.207438-1-Jason@zx2c4.com>
In-Reply-To: <20221108123755.207438-1-Jason@zx2c4.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 8 Nov 2022 21:14:26 +0100
Message-ID: <CACRpkdaxO_1w-7JqpVCcf0rt_J8xjw5Wx=NdnPsDZJR6aKvJmQ@mail.gmail.com>
Subject: Re: [PATCH RESEND] ARM: ux500: do not directly dereference __iomem
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
List-Id: <soc.lore.kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, arnd@arndb.de, olof@lixom.net, 
	soc@kernel.org, linux@armlinux.org.uk, stable@vger.kernel.org, 
	kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 8, 2022 at 1:38 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:

> Sparse reports that calling add_device_randomness() on `uid` is a
> violation of address spaces. And indeed the next usage uses readl()
> properly, but that was left out when passing it toadd_device_
> randomness(). So instead copy the whole thing to the stack first.
>
> Fixes: 4040d10a3d44 ("ARM: ux500: add DB serial number to entropy pool")
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: stable@vger.kernel.org
> Link: https://lore.kernel.org/all/202210230819.loF90KDh-lkp@intel.com/
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>

Patch applied!
Sorry for taking so long!

Yours,
Linus Walleij
