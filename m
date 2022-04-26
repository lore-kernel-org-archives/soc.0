Return-Path: <SRS0=tRPn=VE=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26349C433EF
	for <soc@archiver.kernel.org>; Tue, 26 Apr 2022 07:22:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D2EBFC385AF; Tue, 26 Apr 2022 07:22:52 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1CA98C385A0
	for <soc@kernel.org>; Tue, 26 Apr 2022 07:22:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 1CA98C385A0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f52.google.com with SMTP id p18so16010605edr.7
        for <soc@kernel.org>; Tue, 26 Apr 2022 00:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=MKxnmTE3uOgxAO/+uZwxLwv2U0/Qh3mDlrdirHKM0/A=;
        b=H2gjdZBOC2dpNIMF+Q8CmNuGnW1EMJQqaDtejdVkfxPiVDP71nSmUPUMuYVusy33yh
         6W8SCytU7RaPPwdJ6mhjdk56k36sVzaVBnHWb4NASLG4SRhqKOMYTQeHEuR1IB3Bz7DD
         fSZ7adxHzuDnAKeDLjHb/C+rw/TuthcIJmHq/Qw4pjeGPCWm7epnFT8YBqZ3bCfB8CDS
         BAwENOVkg04Kd3/FCn4/A3gBgkmG3tfmaJgOCJXgBnS7XaGGtjXoB2tDj6UGBDMp6qxa
         V+qaFu6ffVxQr1/Cv9Y8rc4Gd2sYDPyEnjhh/M5+p2Eu1JXposGwiT9OSAqBCeeOTlsm
         1KUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=MKxnmTE3uOgxAO/+uZwxLwv2U0/Qh3mDlrdirHKM0/A=;
        b=LC8injIrdvBN/VSJkk/BDPPoyIT27SzXP5kPoIyt2KwQUXh33DPWtELqwXtztjHTQ0
         cuRBNbSYIvETfvbkm9UMEeyoO4R4kwbzkte/KwvwnJHhpexNAFU9nii9CLXEGZI9UtIW
         /oIETV0Xj/GCVaBaEPAi0vtVo/7fyjUv1gG6sEX8qBVforyJFHc8hJ02VicWogPYia40
         8Byye+BfoeL1ETtlr3sGhzdTpezbSN5l1+ZRvKAIzr3QBMyO1CsQaoJ4dCxc+wkX3LMe
         2B0Y2crq2NvMGRBIYltczTqhwxENipM1dYM3ALZ+cuatPjlTGtZ6vPnAorsfCdAsJ5iv
         M8/A==
X-Gm-Message-State: AOAM531rR05igtntom3gdD+SiN2FCpS78IymA4A9Q8UoHn1nuH7xH06G
	hBnUXZnkes60eidgiKgyP/wi0Q==
X-Google-Smtp-Source: ABdhPJzvu2Vd064kjxJq6VJYtqsPamQ6BFDr3D9T7sP1wZH04kUchD/daCDrNxQkvt9PXDOkYA3e4g==
X-Received: by 2002:a05:6402:2815:b0:420:c32e:ebe2 with SMTP id h21-20020a056402281500b00420c32eebe2mr22751734ede.1.1650957770522;
        Tue, 26 Apr 2022 00:22:50 -0700 (PDT)
Received: from [192.168.0.244] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id ak18-20020a170906889200b006f39a445b93sm1706351ejc.141.2022.04.26.00.22.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Apr 2022 00:22:50 -0700 (PDT)
Message-ID: <f2fe2b0c-1f57-9bd0-d03a-990c83648a65@linaro.org>
Date: Tue, 26 Apr 2022 09:22:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v5 10/11] arch: arm: boot: dts: Introduce HPE GXP Device
 tree
Content-Language: en-US
To: nick.hawkins@hpe.com, verdun@hpe.com, joel@jms.id.au, arnd@arndb.de,
 openbmc@lists.ozlabs.org
List-Id: <soc.lore.kernel.org>
Cc: Olof Johansson <olof@lixom.net>, soc@kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20220421192132.109954-1-nick.hawkins@hpe.com>
 <20220421192132.109954-11-nick.hawkins@hpe.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220421192132.109954-11-nick.hawkins@hpe.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21/04/2022 21:21, nick.hawkins@hpe.com wrote:
> From: Nick Hawkins <nick.hawkins@hpe.com>
> 
> The HPE SoC is new to linux. This patch
> creates the basic device tree layout with minimum required
> for linux to boot. This includes timer and watchdog
> support.
> 
> The dts file is empty at this point but will be
> updated in subsequent updates as board specific features
> are enabled.
> 
> Signed-off-by: Nick Hawkins <nick.hawkins@hpe.com>
> 
> ---
> v5:
> * Fixed commit message to show previous changes
> * Fixed typo ehci -> echi

One more thought, but I am pretty sure we talked about this already:
please fix your commit subject. git log --oneline.


Best regards,
Krzysztof
