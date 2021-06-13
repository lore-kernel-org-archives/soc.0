Return-Path: <SRS0=BLIz=LH=gmail.com=f.fainelli@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1B0EC48BCF
	for <soc@archiver.kernel.org>; Sun, 13 Jun 2021 02:03:33 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 500FE61107; Sun, 13 Jun 2021 02:03:33 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 21E796101B;
	Sun, 13 Jun 2021 02:03:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 21E796101B
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=f.fainelli@gmail.com
Received: by mail-pj1-f46.google.com with SMTP id s17-20020a17090a8811b029016e89654f93so2849769pjn.1;
        Sat, 12 Jun 2021 19:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=GXniuSw9ZMF00jtVBbwWdNTHC0JQ2hlRGU6EisXwcVc=;
        b=XtYIKlxgbuwqIrJ/SFXLecxdONWGKycr4SZNgxgEOfoVsTwcZATs5qOSeWb0ICjbrW
         0oFCIPP9x1a0Z0vTLis+8ojoMy1z7UkikPWNNrnavkV44YdqvGOLwAA+bIswzRHP1cTd
         goMPk+JGyp/pI+ycSs5Nhf41ex50VxmQOdUGOFwm4EVJ/BKnZ2RsETtcXM17LUKS+6zq
         CPO//54zmzJqjFg6i7Ni1EX+EB4HmvB1+ZX341+aC1S2u6exaWa4HbIMbeQxUqJwagGH
         Bm1L5L5fFdAoYpcXIgX19X6j5nRWPV3ZNKgGhPf8ehCkzu6UD+cC11yPAgIkuF/UznSh
         0TDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=GXniuSw9ZMF00jtVBbwWdNTHC0JQ2hlRGU6EisXwcVc=;
        b=ls2AjfBKFDnv0Rg30X0WB4vJ+ptSWEOoi+TDaCodpjHumoxxZOFk7lE9mvqRP2dzRh
         JtriptkMi0uZPFOx1BFa/avx/ICWo2+31AM4E5GLLVwC/7e+NTd75KK/3zJ5ciK46rTw
         wvda7TRvVp2jMkNegB0giCkWZrLyOiNhYfey3yTOjDni/ZTu5tZbakZRKMeHus5WLO9m
         cH9srjKgGTEWneo8aI43dKhwUAGn0GF4VRT0dEQYAAGe1ATlGL5y1mxCDc0/0GXilHzI
         4nYfNuyobJHce1ta/ARn4Rj1yarAOzG48sAZiN4PN+WuRXTBO1Fz8HZNF1xm2aw6WXEN
         wSfA==
X-Gm-Message-State: AOAM530yEjAl0WX/Rig7VLo4a1e1pEmHZY/SBtIY31SI+zVU6/W4wdq8
	VXRN0jGSd4nYKPgQ00YHSzw=
X-Google-Smtp-Source: ABdhPJzZxqHRGgsczR/Ffu5hOfnCDw/t60KeaFg1sev/yKbBqB1gL39zuW+KBj84curnuugQKMeWKw==
X-Received: by 2002:a17:90a:b94c:: with SMTP id f12mr12110709pjw.32.1623549812731;
        Sat, 12 Jun 2021 19:03:32 -0700 (PDT)
Received: from [10.230.29.202] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id b23sm8444278pfi.34.2021.06.12.19.03.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 12 Jun 2021 19:03:31 -0700 (PDT)
Subject: Re: [PATCH v2 3/5] ARM: dts: NSP: Add common bindings for MX64/MX65
To: Matthew Hagan <mnhagan88@gmail.com>, Vladimir Oltean <olteanv@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: Florian Fainelli <f.fainelli@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, soc@kernel.org, Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 bcm-kernel-feedback-list@broadcom.com, Sam Ravnborg <sam@ravnborg.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Viresh Kumar <viresh.kumar@linaro.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20210610232727.1383117-1-mnhagan88@gmail.com>
 <20210610232727.1383117-4-mnhagan88@gmail.com>
 <20210611203031.fj3g32o7kgupgzjy@skbuf>
 <0f3e81be-e99a-41fe-6898-42c4d25b21be@gmail.com>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <670e1397-1b90-ca8d-c161-6a4c48d6bff4@gmail.com>
Date: Sat, 12 Jun 2021 19:03:29 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <0f3e81be-e99a-41fe-6898-42c4d25b21be@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit



On 6/12/2021 4:14 PM, Matthew Hagan wrote:
[snip]
>>> +	pwm-leds {
>>> +		compatible = "pwm-leds";
>>> +
>>> +		red {
>>> +			label = "red:led";
>>> +			pwms = <&pwm 1 50000>;
>>> +		};
>>> +
>>> +		green {
>>> +			label = "green:led";
>>> +			pwms = <&pwm 2 50000>;
>>> +		};
>>> +
>>> +		blue {
>>> +			label = "blue:led";
>>> +			pwms = <&pwm 3 50000>;
>>> +		};
>>> +	};

[snip]

>> What is the reason for overriding this to 2?
> 
> I can't provide an explanation other than that it only works at 2.
> 
> When set to 3 I get the following:
> 
> [    0.784051] OF: /pwm-leds/red: #pwm-cells = 3 found -1
> [    0.789201] of_pwm_get(): can't parse "pwms" property
> [    0.794295] leds_pwm pwm-leds: error -EINVAL: unable to request PWM for red:led
> [    0.801628] leds_pwm: probe of pwm-leds failed with error -22

Strange because with a #pwm-cells value of 3, of_pwm_xlate_with_flags()
would treat the flags as optional so the way you have put it looks
correct to me. I am not sure what the channel sub-nodes are supposed to
do, they do not appear to be documented properties or parsed by the PWM
core?

Is your Device Tree possibly corrupted here?
-- 
Florian
