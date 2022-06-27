Return-Path: <SRS0=17+H=XC=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAC8EC433EF
	for <soc@archiver.kernel.org>; Mon, 27 Jun 2022 08:17:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 71289C341CB; Mon, 27 Jun 2022 08:17:27 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 969C8C341C8
	for <soc@kernel.org>; Mon, 27 Jun 2022 08:17:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 969C8C341C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f50.google.com with SMTP id o9so11787974edt.12
        for <soc@kernel.org>; Mon, 27 Jun 2022 01:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=bJe+EHscmpBI3l8sdzkx98qjGwntmBZw5/UI+r8ZqSI=;
        b=NSiQD4pcQ7h4Nb3yuNNthTQZjzy0AC9aizCXSr6X6WSSMjfNAo0JvxUzc2re/98uy8
         CTpKXFnQr3x+l8kFC0WQM0Wpt5lX/fDZn4W5Z7+9251QBlWCWX+AEmocG/wIaZOSB4I6
         uXntkNfAwjg9P+eZSPPJkPR3kz4lLNAqQZuE3csp8HLrs249gzEZD8dsUS2asvfyj76f
         wX5kcCOPj91+iJVd9nlidDg6nwaeakpIbqc6l/jC4pMoCrVvRPEElFjiy0ef6QwRysif
         YNZi1+Ne+F+Z4WyxWJaiKzFrausU+XK68VxsqW2bE1qQO0YJsGCcFCqV/4YL9WXIUo3C
         Qu6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=bJe+EHscmpBI3l8sdzkx98qjGwntmBZw5/UI+r8ZqSI=;
        b=hZu3tM477p1v7zjcZAAvBxzcwBOSdFtw7QTs1TOWFmz6+GS/Czr9e0iPJfk2HK5knF
         e/2PQSH6Ol2qZz0FY4Ih6M1hSe41Dq2kQr1BRI9B68krhkzlnt9CMt+gsdBlWPiAh0Lb
         /tyqSiwYocQcdgMcntCgUbOEqX9rmKyejM6zzwZdORRQcSCGH+hpusV/alQNax5+LhYg
         uTmONKh3yDeEpozkJGWxXiyixpykzha3QJawwyQv/Hwef9wb2YYWp1CLR5sj009oWHBr
         3dtzwLt09fSPHV03YSVdUSRxCb5I/JJirnxIskmtg/duCJ0rA8W2wcJQZcThrW4yBufi
         PvXA==
X-Gm-Message-State: AJIora/bss/A4cywMrOcFhvSSNL/zIE93mIQW/IuddQBQsefwQRpi4fY
	FUb0ifl8XeFSeo1HZzCLgKtzWg==
X-Google-Smtp-Source: AGRyM1uY/I+C8DSEIO+4P/vX0mBvSB1E3AuWL8dm46TteoTz/uhg5BxVd1obDTUaJQ8kUbO4cfZm8g==
X-Received: by 2002:a05:6402:1e93:b0:435:7f3f:407f with SMTP id f19-20020a0564021e9300b004357f3f407fmr15073343edf.173.1656317844990;
        Mon, 27 Jun 2022 01:17:24 -0700 (PDT)
Received: from [192.168.0.246] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id p6-20020a170906604600b006f3ef214de7sm4800441ejj.77.2022.06.27.01.17.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jun 2022 01:17:24 -0700 (PDT)
Message-ID: <cab6fd96-4b8e-42a3-4dce-db63656df92c@linaro.org>
Date: Mon, 27 Jun 2022 10:17:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3 01/40] dt-bindings: input: gpio-keys: enforce node
 names to match all properties
Content-Language: en-US
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-kernel@vger.kernel.org,
 Olof Johansson <olof@lixom.net>, devicetree@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh@kernel.org>, arm@kernel.org, linux-input@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>
References: <20220616005224.18391-1-krzysztof.kozlowski@linaro.org>
 <20220616005333.18491-1-krzysztof.kozlowski@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220616005333.18491-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16/06/2022 02:52, Krzysztof Kozlowski wrote:
> The gpio-keys DT schema matches all properties with a wide pattern and
> applies specific schema to children.  This has drawback - all regular
> properties are also matched and are silently ignored, even if they are
> not described in schema.  Basically this allows any non-object property
> to be present.
> 
> Enforce specific naming pattern for children (keys) to narrow the
> pattern thus do not match other properties.  This will require all
> children to be properly prefixed or suffixed (button, event, switch or
> key).
> 
> Removal of "if:" within patternProperties causes drop of one indentation
> level, but there are no other changes in the affected block.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
>  .../devicetree/bindings/input/gpio-keys.yaml  | 157 +++++++++---------
>  1 file changed, 77 insertions(+), 80 deletions(-)
> 

Dmitry,

Any comments from your side? Are you planning to pick up the dt-bindings
here (patch 1-3)?

Best regards,
Krzysztof
