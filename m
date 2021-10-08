Return-Path: <SRS0=WtJU=O4=gmail.com=matthias.bgg@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54F1CC433EF
	for <soc@archiver.kernel.org>; Fri,  8 Oct 2021 14:33:45 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 3288560F58; Fri,  8 Oct 2021 14:33:45 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 088F061038;
	Fri,  8 Oct 2021 14:33:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 088F061038
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id u18so30546394wrg.5;
        Fri, 08 Oct 2021 07:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=TShzTngLZi6o8lnvb+j8av9MVCWHAWUlT4LrbexAp60=;
        b=pmchaDdegR3myZdKHZV3r9+KFJhoet23YZP2QFSc+6jYCKT3uv7L6TBBAi6uWLmT5m
         XXKwRYEKBe8lA4O9pgTrItK1ChPJOsJzJE9Fo17lX6XSsYgo2qTYslmOcw1vKSz7ALoj
         p6ETP6Z+kTmh5ILTnqOVUPuAm0yvHqjSZxaFZHllo1L87bHlZGQNpi5lHX2Zr+I5DqgS
         /RsSS8/ghniGNVvYwacrxnIsEQG8Glh9YOd0JDZ+hSp+trU0gm26dfXUEITblhX5Fb7O
         lHkgiCCP+YuzzL9iXkF+TAjdvB1/fy59kkFBHvNAZrmRKJcK2Cp6r5kbUMj+JRYQ601Z
         m+Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=TShzTngLZi6o8lnvb+j8av9MVCWHAWUlT4LrbexAp60=;
        b=jTC3TngGKEg10AaocZZwVYRJo/9pqjfwoUQKs+TtSWyzoN+o30SG+VrkpU6RTENMAm
         g0saNwYwKWJNJG4LNds+oJ5pu+XBWj5hKzMagZXhaRv/zMV9crIalZm+klVEtMKPS6LQ
         1qdP2Yh4UdsUlUBiEzYgVcJTxAdKvuQoo+1STEvk42bCF+RLRsb2I+vr9ZQrs1xmeAeu
         sap6iKtm1w/0A5/+5EbcQYW8V5u0IXkBajb7O30u+3iFBoMY3rz8H2JuYnGE+Wji8Yi8
         cl0wW1/eunOI7b7qAiE65SvLJldaRebd1fqwMcO/xxWaNa55r6hfEDS6+j3NXNq1voy8
         eaTQ==
X-Gm-Message-State: AOAM531zJQSnYai8c56cPyDOiJo2kXPFTB2+zKlgQQOmaipDnh/RMXeb
	6y2kSh91L//UN9fPt/zv9ek=
X-Google-Smtp-Source: ABdhPJwAtIQy4fNzxj7d0iRIf29L54prs1Xgk5dkVhacrkjXhk4lwBP2+waVCVUbE0adQC7vmnygoA==
X-Received: by 2002:adf:bb88:: with SMTP id q8mr4512891wrg.390.1633703623613;
        Fri, 08 Oct 2021 07:33:43 -0700 (PDT)
Received: from [192.168.2.177] ([206.204.146.29])
        by smtp.gmail.com with ESMTPSA id y191sm13532166wmc.36.2021.10.08.07.33.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Oct 2021 07:33:43 -0700 (PDT)
Message-ID: <0623e9d8-8b79-d163-0204-745809b0d0ba@gmail.com>
Date: Fri, 8 Oct 2021 16:33:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.2
Subject: Re: [PATCH 1/2] dt-bindings: arm: Add MT6589 Fairphone 1
Content-Language: en-US
To: Luca Weiss <luca@z3ntu.xyz>, linux-mediatek@lists.infradead.org
List-Id: <soc.lore.kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, Arnd Bergmann <arnd@arndb.de>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Fabien Parent <fparent@baylibre.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Olof Johansson <olof@lixom.net>, Rob Herring <robh+dt@kernel.org>,
 Sean Wang <sean.wang@mediatek.com>, Seiya Wang <seiya.wang@mediatek.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, soc@kernel.org
References: <20211005202833.96526-1-luca@z3ntu.xyz>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20211005202833.96526-1-luca@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 05/10/2021 22:28, Luca Weiss wrote:
> Add the compatible for Fairphone 1 smartphone with MT6589 SoC.
> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---

This patch is now applied to v5.15-next/dts32

Thanks!

>   Documentation/devicetree/bindings/arm/mediatek.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
> index 80a05f6fee85..0fa55497b96f 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
> @@ -32,6 +32,7 @@ properties:
>             - const: mediatek,mt6580
>         - items:
>             - enum:
> +              - fairphone,fp1
>                 - mundoreader,bq-aquaris5
>             - const: mediatek,mt6589
>         - items:
> 
