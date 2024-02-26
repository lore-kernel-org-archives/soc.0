Return-Path: <SRS0=DLj2=KD=suse.com=mbrugger@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C64CC54E49
	for <soc@archiver.kernel.org>; Mon, 26 Feb 2024 09:55:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 58209C433F1; Mon, 26 Feb 2024 09:55:09 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2D472C433C7
	for <soc@kernel.org>; Mon, 26 Feb 2024 09:55:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2D472C433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-563c0f13cabso3600489a12.3
        for <soc@kernel.org>; Mon, 26 Feb 2024 01:55:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1708941304; x=1709546104; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2juX4gLnXQUeHTxZvWzHfEX9LSFfTmdZcdnOUqMmjdY=;
        b=gBAQTA1WeDB/uP2AIt37yFaMZrN1HguUohXuIcBFyv6mrB9rlHI35TvcS50OlGMD9x
         KkzYcvy3uJe6ZX32YC9L/OSEW8qQBvyEqgx5duhLyjLXvnyXo52WxUux6nGDBKmPr/gq
         pTAj0KWwpK+QzQdY1dMmsXiM8ldklbTWa1lrpVaCCtoFPo0WnbqkgLhJzLeh8+0TKH22
         ytabeozyVZ0qwcaIv4fNOdYHCaTAcUWfqHUyWTpxHV2jYYvFfUs+2e7GY3eZxy8gReur
         Thi6VCr8w1qbVFzXE/WtZFztGKCQRtc0HSZVRMAfH6Qd2ovShhgq8F6r3tUIUKtt8LN/
         a9+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708941304; x=1709546104;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2juX4gLnXQUeHTxZvWzHfEX9LSFfTmdZcdnOUqMmjdY=;
        b=WCGwUhci1Hb2o8MSFvzMp89A6wqDfbmeMrVGet0bLxQyH5uDlWOvtBVJK+AkEgEekz
         UX/itA5C4d7w6RSb9gSbSWhkxaiD49GOmnUVCALPqeJ4+8eWZCtQKvGeu0nF1NFdBtTO
         10xcI4BnANjcWHxr0x5/5PJ8gS+yUTBWbS+BviQCRYY5+VkjZTiyi2fQSkwiud7zJIXI
         OdofPa31w19K2/7X2jFu7o2G2RBBBsErnGeNIO3AH6ARUiclUfdxYVY/FsW7+A9kYJEW
         F876Kdk0lVHh6Wm/WcPJtH1sE6v0lYHM94KUCbkdB4RWHxs9z6kZa4T91LS9lCoOWF+4
         r4iw==
X-Forwarded-Encrypted: i=1; AJvYcCXbRacX9UYRd8957BQS9wdm1R50th/ItTJ/vUNZDZZsZGN+PgcgMXpTFtqsIQFCReSgD3llErISjCvhTePazg==
X-Gm-Message-State: AOJu0Yyj9wLf8FXpY2R8b6yCLO2ERPBFVxNQThY7nIBbylguMgh0lyuQ
	l3DuNlyYp7/RqJ1PzQs7Ruujr0Hv9BHeXXqrN7xOwHnc6XLr1cMvzzkBPp6citg=
X-Google-Smtp-Source: AGHT+IHRZlm0jIzXquAddOjtiYd2KhPjP0dCnz5wWTVllj0by/cbVMntfF/4lILr35r3gKrW4q3PHQ==
X-Received: by 2002:aa7:c318:0:b0:565:eb8:ed47 with SMTP id l24-20020aa7c318000000b005650eb8ed47mr3888419edq.35.1708941304432;
        Mon, 26 Feb 2024 01:55:04 -0800 (PST)
Received: from [192.168.2.177] ([207.188.161.188])
        by smtp.gmail.com with ESMTPSA id y25-20020a056402135900b0055fba4996d9sm2179841edw.71.2024.02.26.01.55.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Feb 2024 01:55:04 -0800 (PST)
Message-ID: <f988dffa-dd5c-48a5-9ebb-e13f9443989f@suse.com>
Date: Mon, 26 Feb 2024 10:55:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] MAINTAINERS: Add maintainer for NXP S32G boards
Content-Language: en-US, ca-ES, es-ES
To: Arnd Bergmann <arnd@arndb.de>, Chester Lin <chester62515@gmail.com>,
 Shawn Guo <shawnguo2@yeah.net>
List-Id: <soc.lore.kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
 Olof Johansson <olof@lixom.net>, krzysztof.kozlowski+dt@linaro.org,
 =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, soc@kernel.org,
 NXP S32 Linux Team <s32@nxp.com>,
 Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>,
 Shawn Guo <shawnguo@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 NXP Linux Team <linux-imx@nxp.com>
References: <20240221120123.1118552-2-ghennadi.procopciuc@oss.nxp.com>
 <f4465547-1fb1-4578-9a69-7d399e7661b3@linaro.org>
 <403e32c2-910e-4745-9ebe-fbf377c3fde8@linaro.org>
 <ad856766-8903-46c0-93af-24e101ad51dc@oss.nxp.com>
 <e538ded0-bd3a-4ca4-b2bd-8d20d8c8c3fe@linaro.org>
 <bcb79af4-56d9-4204-9503-cff996f1ba41@oss.nxp.com>
 <e6f6070e-8355-4a0b-a904-1a24970f249b@linaro.org>
 <e530d504-dfa3-4d39-b903-b2570bb8b014@suse.com>
 <c3e68c62-b81f-475b-9b15-c983c94aed8b@app.fastmail.com>
 <Zdiu8s5Cgz9s6dLP@dragon> <ZdmZ4JC0CsX2qs5C@linux-8mug>
 <57dce440-d24b-4638-9395-62dfb03ec002@app.fastmail.com>
From: Matthias Brugger <mbrugger@suse.com>
Autocrypt: addr=mbrugger@suse.com; keydata=
 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
 PVrr2NoUqi/bxI8fFQJD1jVj8K0=
In-Reply-To: <57dce440-d24b-4638-9395-62dfb03ec002@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 24/02/2024 12:42, Arnd Bergmann wrote:
[...]
>>> ARM/NXP S32G ARCHITECTURE
>>> M:      Chester Lin <chester62515@gmail.com>
>>> R:      Andreas Färber <afaerber@suse.de>
>>> R:      Matthias Brugger <mbrugger@suse.com>
>>> R:      NXP S32 Linux Team <s32@nxp.com>
>>> L:      linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>>> S:      Maintained
>>> F:      arch/arm64/boot/dts/freescale/s32g*.dts*
>>>
>>> However I'm fine with collecting and sending patches through IMX tree,
>>> if S32G folks help review them.
>>>
>>
>> This looks good to me as well.
> 
> Ok, in this case I would suggest we change this section to
> only have 'R:' entries and no 'M:' for the moment.
> 
> Between the four of you (Chester, Andreas, Matthias, Ghennadi),
> I think we can choose to keep everyone or drop those that are
> unlikely to actually review patches. Please let us know you
> would like to be included as a reviewer or not.
> 

Please include me as reviewer :)

Regards,
Matthias

