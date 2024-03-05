Return-Path: <SRS0=cyzq=KL=suse.com=mbrugger@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F85BC54E41
	for <soc@archiver.kernel.org>; Tue,  5 Mar 2024 09:04:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 03CAAC43390; Tue,  5 Mar 2024 09:04:13 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 13E6DC433C7
	for <soc@kernel.org>; Tue,  5 Mar 2024 09:04:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 13E6DC433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5656e5754ccso6826558a12.0
        for <soc@kernel.org>; Tue, 05 Mar 2024 01:04:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709629448; x=1710234248; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y/ZpAY9SjdJkjgbpr5m+II8eCPLwL25r42HQtzDFkz0=;
        b=CHjLclvkGZH2B7JeenSXLJ0baFLMvM+mmr6LOYnAmBf9VpJ7Immga9RkKAECos9+qe
         eHcdfJEz99xFX0xdx2pd1mLEpNj+/kG9a6lMx70UjO8sDxdp6rZHJI3xI0ANHpBDG7tE
         JLrBpmT/zfagd7oiRRXHjX5tR+p7ax1HAuuJa+H+3lYu1JZWVodd5XiATwwrd9EtjYgh
         5o7pXW2l4DlodLYwHu3FfL/QKoA72y7zSvk93ejXHPvynH2t9xSZ6WJQMJG+haIHoBBk
         tgvdWmtg22ZccCJbghnpiGzyRmGkWU99IPjXpkWG1WwCpw32uJDoHz8YfRpPEntIEnOq
         hVgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709629448; x=1710234248;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y/ZpAY9SjdJkjgbpr5m+II8eCPLwL25r42HQtzDFkz0=;
        b=sGNuQmMQrmjBlA3iAV3BY+90J5+0uHOj0RZiA4FXub1W8qHPkQRQHw/ZConcEkeCUr
         mCgP1xVW5MzVW7TyQebd1BQbLOhbq2f224QVyLYfvzPTNXnnaHr1ayz0hrP0CVvBOr8o
         jE7p4EQIb1Yk/in6hvhZ8a3wTDk4qTI27u3UwqgIkni5Bn7B30AAymxRWCIMUIBB1W6e
         bkHZo2IVql+NT+CCJctoi2hM75r5JGvxTvZy5DPPRsNsZ3khrE4ePblPGRDjnjEU0aAS
         CWZQnCkbGllgAAUYzTqBZGHVhRXQrdVaFKiykEA21PsmclPnZ7zWadsEO0STPqbSGwNV
         NEqg==
X-Gm-Message-State: AOJu0YxF2D5jHmW9REg6hL7ixetyg/cKNqsMt+MRRxO5+r5AvvM4DjLA
	vxCYCcESv7X/8y3ZJjyDhxK1Ub06gF0SRNWCn8r8lKG8sRp7oz/naBwYPbqshI4=
X-Google-Smtp-Source: AGHT+IGBTzAdHgWbMR5ajqv/Va0IvBKrXDXExsb+V5N47qO7Ob2OniKGGgB5FzRXn7BhY7dK7ygrZg==
X-Received: by 2002:aa7:d48f:0:b0:567:2cd:a6b7 with SMTP id b15-20020aa7d48f000000b0056702cda6b7mr5521280edr.42.1709629448225;
        Tue, 05 Mar 2024 01:04:08 -0800 (PST)
Received: from [192.168.2.177] ([207.188.161.188])
        by smtp.gmail.com with ESMTPSA id u17-20020a056402111100b0056729e902f7sm2853741edv.56.2024.03.05.01.04.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Mar 2024 01:04:07 -0800 (PST)
Message-ID: <274020ef-0885-4e66-9547-801609607796@suse.com>
Date: Tue, 5 Mar 2024 10:04:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: s32c: update MAINTAINERS entry
Content-Language: en-US, ca-ES, es-ES
To: Arnd Bergmann <arnd@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Chester Lin <chester62515@gmail.com>,
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
 NXP Linux Team <linux-imx@nxp.com>, NXP S32 Linux Team <s32@nxp.com>
References: <20240304204249.936140-1-arnd@kernel.org>
From: Matthias Brugger <mbrugger@suse.com>
Autocrypt: addr=mbrugger@suse.com; keydata=
 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
 PVrr2NoUqi/bxI8fFQJD1jVj8K0=
In-Reply-To: <20240304204249.936140-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 04/03/2024 21:41, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> As discussed on the mailing list, Chester is stepping down from being
> the primary maintainer for the s32c platform, and Ghennadi becomes an
> additional reviewer.
> 
> For the moment, there is no full maintainer for s32c, but Shawn is already
> listed as the overall maintainer for 32-bit freescale/nxp platforms
> (except layerscape and qoriq) and agreed to merge s32c patches as they
> come in and are reviewed by the remaining reviewers.
> 
> Adapt the entries in the maintainers file based on the discussion.
> 
> Link: https://lore.kernel.org/all/20240221120123.1118552-1-ghennadi.procopciuc@oss.nxp.com/
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Chester Lin <chester62515@gmail.com>
> Cc: Matthias Brugger <mbrugger@suse.com>
> Cc: Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
> Cc: NXP Linux Team <linux-imx@nxp.com>
> Cc: NXP S32 Linux Team <s32@nxp.com>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Matthias Brugger <mbrugger@suse.com>

> ---
> I would merge this into the soc tree if everyone is fine with this
> version. Let me know if you'd prefer any further adjustments.
> ---
>   MAINTAINERS | 18 +++++++-----------
>   1 file changed, 7 insertions(+), 11 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 209e6f45a0b6..87e9c8282742 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2542,13 +2542,14 @@ F:	drivers/*/*/*wpcm*
>   F:	drivers/*/*wpcm*
>   
>   ARM/NXP S32G ARCHITECTURE
> -M:	Chester Lin <chester62515@gmail.com>
> -R:	Andreas Färber <afaerber@suse.de>
> +R:	Chester Lin <chester62515@gmail.com>
>   R:	Matthias Brugger <mbrugger@suse.com>
> -R:	NXP S32 Linux Team <s32@nxp.com>
> +R:	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
> +L:	NXP S32 Linux Team <s32@nxp.com>
>   L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>   S:	Maintained
>   F:	arch/arm64/boot/dts/freescale/s32g*.dts*
> +F:	drivers/pinctrl/nxp/
>   
>   ARM/Orion SoC/Technologic Systems TS-78xx platform support
>   M:	Alexander Clouter <alex@digriz.org.uk>
> @@ -17260,9 +17261,12 @@ M:	Shawn Guo <shawnguo@kernel.org>
>   M:	Jacky Bai <ping.bai@nxp.com>
>   R:	Pengutronix Kernel Team <kernel@pengutronix.de>
>   L:	linux-gpio@vger.kernel.org
> +L:	NXP S32 Linux Team <s32@nxp.com>
>   S:	Maintained
>   F:	Documentation/devicetree/bindings/pinctrl/fsl,*
> +F:	Documentation/devicetree/bindings/pinctrl/nxp,s32*
>   F:	drivers/pinctrl/freescale/
> +F:	drivers/pinctrl/nxp/
>   
>   PIN CONTROLLER - INTEL
>   M:	Mika Westerberg <mika.westerberg@linux.intel.com>
> @@ -17316,14 +17320,6 @@ S:	Supported
>   F:	drivers/gpio/gpio-sama5d2-piobu.c
>   F:	drivers/pinctrl/pinctrl-at91*
>   
> -PIN CONTROLLER - NXP S32
> -M:	Chester Lin <clin@suse.com>
> -R:	NXP S32 Linux Team <s32@nxp.com>
> -L:	linux-gpio@vger.kernel.org
> -S:	Maintained
> -F:	Documentation/devicetree/bindings/pinctrl/nxp,s32*
> -F:	drivers/pinctrl/nxp/
> -
>   PIN CONTROLLER - QUALCOMM
>   M:	Bjorn Andersson <andersson@kernel.org>
>   L:	linux-arm-msm@vger.kernel.org
