Return-Path: <SRS0=ZqyG=CB=gmail.com=ychuang570808@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60246C7EE29
	for <soc@archiver.kernel.org>; Tue, 13 Jun 2023 11:03:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 30C2EC4339B; Tue, 13 Jun 2023 11:03:19 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3ABB2C433EF;
	Tue, 13 Jun 2023 11:03:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3ABB2C433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1b3f8179f51so514895ad.0;
        Tue, 13 Jun 2023 04:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686654197; x=1689246197;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9/V6eBeQnAmuvDoaAFDPt7SClZ1v7wsV/h5UJhyaPqU=;
        b=BWLUpzQWNs6DVuyX36vOIj88sUq+ThabI0PcNUhco5A6msRuOGGwEvhbxFMIzjNmOi
         RV5N9UpF2HsW7L6uu9TfhIfHZfLqMfBLnzXMvHtclte31xxIif1kLRXfhep7cf7E/KDt
         Rt06FQYTAM/Q3Hh2GErzY25OFBLcZ/H7Ob/KNGwhTxcZMN6N5SRGHh1MAfoLBcFeyCTD
         r5EZsk9vpPqp/r3N7Vw9ShgN8rrKAtakg8rumCEyDIvamkoIxWJSj6H/L+d7i5SzyJiw
         Pr7qJJdiytYrGqqWq+mKAXtoyg+Kyz8dUPgG8UaXuc3JlZ1PZRNTB3Bp9GcR4W6zRhoX
         J4/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686654197; x=1689246197;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9/V6eBeQnAmuvDoaAFDPt7SClZ1v7wsV/h5UJhyaPqU=;
        b=amIeqX4oPzyplIM7Ao9EtntS/gFJO68iXbQ8ehaohhvrWrPnWGw7cqfntSL6ZPN18S
         X3TZoMwpVUpy4xx5+fDH4rshvPFgP4OJB+pjJTLE3kL+OXL6D6UXuUfSb5QGNxUfeCpd
         AjuAeyBGBxlZ+XQynW70JxlCt/AZgxQOPOoajKn6zwUOJV2hx/16BkDpkqMw0q/ZHEPV
         1dhukueofsY7AYfzSoDxn6tSnAGkbdKQ3BQAIvvKOpBTrkCnAJMAUp+Tl/XwgLq+iAP0
         iQVlspE0cgkkVpLmK6We6SbdA6z6KBRRbTXdUM+Ej5uaeIrWuihrRH4+WMeB0KmWRS8P
         tyjQ==
X-Gm-Message-State: AC+VfDw7rTr+XVMplEaX1pEQN/jGknyUWzwmBFBrVejBdjhP8J5wcekk
	nPAAGbrPX9AVgBo/UJZgdXI=
X-Google-Smtp-Source: ACHHUZ5GM4WjEbyTgWCo/Km2adsaMHvYGz62PNvK5V5tCldsltLQQRbQSPoISoqOliZgSJGlM1zfkA==
X-Received: by 2002:a17:902:9888:b0:1b1:bf4c:868a with SMTP id s8-20020a170902988800b001b1bf4c868amr8012570plp.42.1686654197321;
        Tue, 13 Jun 2023 04:03:17 -0700 (PDT)
Received: from [172.19.1.47] (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id v3-20020a170902d68300b001b243a5a5e1sm3335009ply.298.2023.06.13.04.03.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jun 2023 04:03:16 -0700 (PDT)
Message-ID: <0e40cbe6-0e88-b300-3507-5fa92eadb46d@gmail.com>
Date: Tue, 13 Jun 2023 19:03:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v14 1/1] tty: serial: Add Nuvoton ma35d1 serial driver
 support
Content-Language: en-US
To: Greg KH <gregkh@linuxfoundation.org>
List-Id: <soc.lore.kernel.org>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, lee@kernel.org,
 mturquette@baylibre.com, sboyd@kernel.org, p.zabel@pengutronix.de,
 jirislaby@kernel.org, tmaimon77@gmail.com, catalin.marinas@arm.com,
 will@kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-serial@vger.kernel.org, arnd@arndb.de, soc@kernel.org,
 schung@nuvoton.com, mjchen@nuvoton.com, Jacky Huang <ychuang3@nuvoton.com>
References: <20230612025355.547871-1-ychuang570808@gmail.com>
 <20230612025355.547871-2-ychuang570808@gmail.com>
 <2023061325-distant-gaffe-8871@gregkh>
From: Jacky Huang <ychuang570808@gmail.com>
In-Reply-To: <2023061325-distant-gaffe-8871@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dear Greg,


On 2023/6/13 下午 06:29, Greg KH wrote:
> On Mon, Jun 12, 2023 at 02:53:55AM +0000, Jacky Huang wrote:
>> From: Jacky Huang <ychuang3@nuvoton.com>
>>
>> This adds UART and console driver for Nuvoton ma35d1 Soc.
>> It supports full-duplex communication, FIFO control, and
>> hardware flow control.
> You don't specify here what your tty device name is going to be, why?
>
> It's not written anywhere, is that intentional?
>
> Same for your tty major/minor, what numbers are you using that might
> also be in use by a different device in the system?
>
> thanks,
>
> greg k-h

I will add description about the tty name to the log.
In practical testing, we specified in the u-boot parameters
to use ttyNVT0 for the console, and it worked fine.

Best regards,
Jacky Huang
