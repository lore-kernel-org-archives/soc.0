Return-Path: <SRS0=JC+o=TL=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF7EAC433F5
	for <soc@archiver.kernel.org>; Mon, 28 Feb 2022 23:43:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 85CF9C340F7; Mon, 28 Feb 2022 23:43:30 +0000 (UTC)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C75A8C340F5
	for <soc@kernel.org>; Mon, 28 Feb 2022 23:43:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C75A8C340F5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f169.google.com with SMTP id f38so11974000ybi.3
        for <soc@kernel.org>; Mon, 28 Feb 2022 15:43:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Qv0zsMcKFZS0uEN+5UZdpCCNfqy5Tylio2s1vY2ryso=;
        b=ap5urwZneNBvZkhWi+/alykrLvq+JYqyG5CVt8WwKGtLHNLfvdGlkCi9jb2IB8Dbev
         MBDfUFmIVhBVZZbas/oLB3vPRnZPejc3kafHFSDs/G7H4Yj4XWQedGscnKmawKj9QX55
         /X7Jk+kO+yQYrIH8mst8QcYrJcns7dbxoluyOJQm/6lXSz5ROZU4Dwir6Q9PMF09VRsF
         v1D9R1V2FGi1y5W50xxGS/sHAgitGOSEZSB9bfZXn373UY+vy0mS5V4ixrPsaMulrpKB
         bOTyoKOAoaw/HBLLkgDMiWzc9WtHQfgGlK8LMXxnRpkt3c0D9CcIoifuZS1dZHhWFt52
         jv7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Qv0zsMcKFZS0uEN+5UZdpCCNfqy5Tylio2s1vY2ryso=;
        b=rUfTkhRtseitYPIEeRMyttjrqhLqu4OxctnHATvfTUogFYKkU8D96pB8Xutjw72C01
         l+e5JyESl3YN6OVQxov6SNwwijtOGW91AnyvBVD5WKz5V58S4mo2mcjUdd2uLYe+uulE
         RpLlJnrjr0DEUTY2ofUcOKtf1jCMWRUcZxvELJOVWLNw6yMVivo9d+wMH57M7JiyAM9Z
         y2fsT03HLI7Mf56KIvazTV0MTU/GuGuJMcQjjnpp1WXps+AKuFIGLHoM74unDZxSf/fI
         AgKtTZxu/249G3RZRO6V2NKMiAq7LMlqcYPxNc1OLA7rFJxv92bH9BKHyj1uFHGaNRs8
         86hQ==
X-Gm-Message-State: AOAM533uwi2ghGWYK5Ey6bWhlbK00sGkc9UM/1rLdNP93uA9uUQmq9w4
	so5ojK7E8omlTNAfB4HtPqM5AwjpiN0JDO3eeGMOng==
X-Google-Smtp-Source: ABdhPJy1LX+l2Mo/igXclj6eX4Kw6KzE1vcvAQRdRbdEaIC9clnEKE1E4s62KfDnNCE8OdnKYLa2bNj2oAdbjzW0rhA=
X-Received: by 2002:a25:9108:0:b0:61e:329:700 with SMTP id v8-20020a259108000000b0061e03290700mr21280699ybl.369.1646091807701;
 Mon, 28 Feb 2022 15:43:27 -0800 (PST)
MIME-Version: 1.0
References: <20220215163926.894-1-paweldembicki@gmail.com>
In-Reply-To: <20220215163926.894-1-paweldembicki@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 1 Mar 2022 00:43:16 +0100
Message-ID: <CACRpkda=ky29PiTjWimnNihLDHSTfYWk68qg5GcLqZTD76ba=g@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] ARM: dts: kirkwood: Add Ctera C-200 V1 board
To: Pawel Dembicki <paweldembicki@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, soc@kernel.org, 
	Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sam Ravnborg <sam@ravnborg.org>, Corentin Labbe <clabbe@baylibre.com>, 
	Oleksij Rempel <linux@rempel-privat.de>, Hao Fang <fanghao11@huawei.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 15, 2022 at 5:40 PM Pawel Dembicki <paweldembicki@gmail.com> wrote:

> +&i2c0 {
> +       status = "okay";
> +
> +       rtc@30 {
> +               compatible = "s35390a";
> +               reg = <0x30>;
> +       };
> +
> +       lm63@4c {
> +               compatible = "national,lm63";
> +               reg = <0x4c>;
> +       };

Think about adding chassis thermal zone for this sensor,

I suppose you don't have any active control of cooling (fan)?
This often sits on GPIO...

In that case just add a critical temperature so it can't burn
down the house.

See:
arch/arm/boot/dts/gemini-dlink-dns-313.dts
node thermal-zones {} for an example of how to do this
quick and easy. You need CONFIG_THERMAL and
CONFIG_THERMAL_HWMON for this to work.

Yours,
Linus Walleij
