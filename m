Return-Path: <SRS0=HpCj=HR=gmail.com=joel.stan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CC22C4167B
	for <soc@archiver.kernel.org>; Wed,  6 Dec 2023 06:46:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5BF16C433C9; Wed,  6 Dec 2023 06:46:31 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CF284C433C8;
	Wed,  6 Dec 2023 06:46:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org CF284C433C8
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a1d6f4a0958so88801866b.1;
        Tue, 05 Dec 2023 22:46:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google; t=1701845188; x=1702449988; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7HVLCsTwM0AJQ7P3LEZ/Kcz/0E6qcEp8zHBIIWNc8vA=;
        b=CKwZbejH0XYV//3NzcmlSGVbBDYtAA2Pcyl9SJmvJULmz7SQ5G4AaHJgfXpe0E1YEY
         6XkuKbxRUqjCyFjPl0O0eLhTzCfkRsBBnhg+fXnd44bz/7nh0tikVlxUDlXBh/WoYtv6
         QpsX7iBpwgVjuTUCIdEU/nPF9hMi/ix5fHhQQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701845188; x=1702449988;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7HVLCsTwM0AJQ7P3LEZ/Kcz/0E6qcEp8zHBIIWNc8vA=;
        b=ZfWZWWKoghf7sJmc9yM4Lk6tE4i0bXuZST/H8l27L4F3NU/VUvywAHGRLFZa98zL1H
         l3La8M+KKoDLOS+ALcJmBbpWspOn6FI9UvMX3imFNe9TVhpUFVNclQoiss8MkTm/P1lZ
         jn7VdZghGg9SNvUX/PjsM/8JwCRooXzZ1/sL/gRTTArZcAHSwWNpF1rTvBS77WFcjMcr
         SiWmFNKa93+7gqxBULhxsuw6uZFwO366QxTd76BF4WV0DGIaJ85bF9qXQK0+1xgcahR/
         Tt8KwQQbB2Pj6WUYd4gG8HgZx3Zg3oOhsmiJcmG+kRsHnpZEgzyvLc3+M43EdlkdS8/D
         2u9Q==
X-Gm-Message-State: AOJu0YzUF0e6Akjclt7QYSAxSmgKYQrlHD0H6PJkOqwdbUlDWmRM8M+o
	cqwUY7s+pq4bBCVQBy4O/ttLZZPkLrgfBVn0wrY=
X-Google-Smtp-Source: AGHT+IHk5A7B0U4wO24pz2HCwBWIvrSswHBxiBDm7juowHDhQdsr4u3Yd57RZEy+FbH8wjd9qhmCMTkRudGz8aw8gBA=
X-Received: by 2002:a17:906:c292:b0:a1b:75f6:165c with SMTP id
 r18-20020a170906c29200b00a1b75f6165cmr2521102ejz.52.1701845187768; Tue, 05
 Dec 2023 22:46:27 -0800 (PST)
MIME-Version: 1.0
References: <20231202003908.3635695-1-renze@rnplus.nl>
In-Reply-To: <20231202003908.3635695-1-renze@rnplus.nl>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 6 Dec 2023 17:16:15 +1030
Message-ID: <CACPK8XfhK8eSjYvEd=7WshOh+Sj6vrERxwgAYGitVALw0pUf8w@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] ARM: dts: aspeed: asrock: Add ASRock X570D4U BMC
To: Renze Nicolai <renze@rnplus.nl>
List-Id: <soc.lore.kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-aspeed@lists.ozlabs.org, arnd@arndb.de, 
	olof@lixom.net, soc@kernel.org, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, andrew@aj.id.au
Content-Type: text/plain; charset="UTF-8"

On Sat, 2 Dec 2023 at 11:09, Renze Nicolai <renze@rnplus.nl> wrote:
>
> Hello,
>
> These patches add a device-tree (and a bindings update) for the
> Aspeed BMC on the ASRock X570D4U, so that it can be added as a
> supported OpenBMC platform.

Looks great!

Reviewed-by: Joel Stanley <joel@jms.id.au>

I've also added this to the openbmc tree, so no need to send the patches there..

>
> Changes since v2:
>   - Renamed leds to led-0 and led-1 to match Documentation/devicetree/bindings/leds/leds-gpio.yaml
>   - Added aliasses and labels for the i2c-mux on i2c bus 4
>   - Added the missing blank line between the ehci1 and uhci nodes
>
> Greetings,
> Renze Nicolai
>
> Renze Nicolai (2):
>   dt-bindings: arm: aspeed: add Asrock X570D4U board
>   ARM: dts: aspeed: asrock: Add ASRock X570D4U BMC
>
>  .../bindings/arm/aspeed/aspeed.yaml           |   1 +
>  arch/arm/boot/dts/aspeed/Makefile             |   1 +
>  .../dts/aspeed/aspeed-bmc-asrock-x570d4u.dts  | 377 ++++++++++++++++++
>  3 files changed, 379 insertions(+)
>  create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x570d4u.dts
>
> --
> 2.43.0
>
