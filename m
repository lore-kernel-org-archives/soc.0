Return-Path: <SRS0=h6K2=3D=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B490C4332F
	for <soc@archiver.kernel.org>; Thu,  3 Nov 2022 16:05:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2C3DAC433C1; Thu,  3 Nov 2022 16:05:44 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0C4A9C433D7
	for <soc@kernel.org>; Thu,  3 Nov 2022 16:05:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0C4A9C433D7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f46.google.com with SMTP id k2so6579107ejr.2
        for <soc@kernel.org>; Thu, 03 Nov 2022 09:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZjX82js1MEeHcR9vNScDckdgVeBb111bo+yliZ0LU2M=;
        b=x7j2H2hfFCfGg8qWiLy9NsZwLf25fTTjJjZvNjK6ZXSLzy4O7aajUYEFp12DO85h85
         R/3C5Nl2I4CyncUfO3qxnpxqRijqRjhmSvPILlqw9MbTEE4K8Tk3x3mZelotOS+D+pcH
         e50u/2dbr0Oq7C+z9LI0TaPpBY/X3n03kr6Tf+Vk3qA2M1FR0TTPWf0oDOXlLhPWXRhN
         C4MRYz5p5F6ZeJa8kz/j3XDoNIUDi81igpMBI4CTQBK+bTJOtmSa5uimBKlortNxF+vc
         B0yyysJlP7EOWdvkn7SLPT/JEeVTj6zIXpvWeEy7RarNBhwTVRTO8cR8XLEZ0eliknEu
         598g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZjX82js1MEeHcR9vNScDckdgVeBb111bo+yliZ0LU2M=;
        b=Kt3dBUGQGnkNmQkzB7ZRGcrApxviEK0p4woxEu8eqO+ptn9eLTkGL1nZB66sVBmePc
         gEdClwfExwbWoNmu4MrSBE3quyRQ9ZpvhEQBob/y85VbmmEMGh5qTguJkpsmWSRPI30O
         CST2Q2MZQjr25t8SdRh4dZK7eWIzvbAHYzdMJ3DTxYK4u4kyxf2x8TSImg/bur94Lt6J
         W00ot9RJfnF+ycwMKO5FR3aIox4NqvZ/IRTdDRJaaFbaSlDIsin0TNICLbII7CEdSuKR
         riToq/rFl10hr/Jcm74xw/MqiBEBPztD8qM27XhwGv8uZ7pN/vSjQO2oQOrSCD0zNTyb
         4nzA==
X-Gm-Message-State: ACrzQf2S7P8wRrOGi1tU0UEXJlTu37y62NeJJNhXHs5PtqwQJSPUZu+M
	kgZW9wM06dOQrjUtz7R8afhmmBUCHkhsH3C6w2o/fw==
X-Google-Smtp-Source: AMsMyM7umtXR9dZZBUzwJwdrFaiBTk5vMewRI+ViOLmUb1K+o7oAnalKkdPpAtcST34+nzychCbvz1OkY69yNaFoMZQ=
X-Received: by 2002:a17:906:dc8f:b0:7a5:8160:1995 with SMTP id
 cs15-20020a170906dc8f00b007a581601995mr30096358ejc.500.1667491541292; Thu, 03
 Nov 2022 09:05:41 -0700 (PDT)
MIME-Version: 1.0
References: <20221102171012.49150-1-kory.maincent@bootlin.com> <20221102171012.49150-4-kory.maincent@bootlin.com>
In-Reply-To: <20221102171012.49150-4-kory.maincent@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 3 Nov 2022 17:05:30 +0100
Message-ID: <CACRpkda7EFTe0TT4-hs_F3qTCwp25pgOAqhNSFyJgeNQ3=O7UQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] arm: configs: spear6xx: Enable PL110 display controller
To: =?UTF-8?Q?K=C3=B6ry_Maincent?= <kory.maincent@bootlin.com>
List-Id: <soc.lore.kernel.org>
Cc: viresh.kumar@linaro.org, Vipul Kumar Samar <vipulkumar.samar@st.com>, 
	Vipin Kumar <vipin.kumar@st.com>, Deepak Sikri <deepak.sikri@st.com>, 
	Bhavna Yadav <bhavna.yadav@st.com>, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, thomas.petazzoni@bootlin.com, 
	Viresh Kumar <vireshk@kernel.org>, Shiraz Hashim <shiraz.linux.kernel@gmail.com>, soc@kernel.org, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Russell King <linux@armlinux.org.uk>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Gregory CLEMENT <gregory.clement@bootlin.com>, 
	Sudeep Holla <sudeep.holla@arm.com>, Claudiu Beznea <claudiu.beznea@microchip.com>, 
	Alexandre Ghiti <alexandre.ghiti@canonical.com>, Rajeev Kumar <rajeev-dlh.kumar@st.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 2, 2022 at 6:10 PM K=C3=B6ry Maincent <kory.maincent@bootlin.co=
m> wrote:

> From: Kory Maincent <kory.maincent@bootlin.com>
>
> Enable the PL110 DRM driver, used by the spear600.
>
> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Thanks for using the DRM driver!

Yours,
Linus Walleij
