Return-Path: <SRS0=qZpA=7E=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22A89C6FD19
	for <soc@archiver.kernel.org>; Sun, 12 Mar 2023 20:59:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 05ABBC433EF; Sun, 12 Mar 2023 20:59:27 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 81951C433D2
	for <soc@kernel.org>; Sun, 12 Mar 2023 20:59:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 81951C433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f49.google.com with SMTP id j11so41074590edq.4
        for <soc@kernel.org>; Sun, 12 Mar 2023 13:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678654764;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ojmHiospp0l2w82k9fYofqE/qnmF5HNMtDT4Ay91tEk=;
        b=CWdN0yO5/2LGAIiveuSyPFt0GHP9BZbWKjdusuqV4gMdxv72onNNlQAN8MViOab00/
         +zDoGTYao+pTtD6Bu1lGTmbIRHkatu4PrCUrVROcPd/7VTXlYU0TV9XqcXebKrthbx2L
         SFmQzUb7EbsErvQ8gLXD+fu7/R7VzUsoPLiKd0dk4XyEUk5EfFxpF9W+UfvAyON4Tjqr
         5YNcpjpEswefP8+HP5UpYv5Ff/UfjpdrOItjFiktoS79A/pkOCJcLiS8/cUKbFwubli1
         9YoyNJFgjJxWNBaHPqoIycdOYAT4Uw6HC9tqNsOzHWHq56YRQYRYUF4CxLxCjJXW8xpj
         UtEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678654764;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ojmHiospp0l2w82k9fYofqE/qnmF5HNMtDT4Ay91tEk=;
        b=cswD45enCBX9csOwUm2XroB6zoWXsHAWeWKV1ZVy5R0ZJUDe8weblS8ZHkvNy+BZGA
         jlbLpqPsanPfS4DlR4e/GmNAq7uJzh+PsbyEi2hFJj5GQE8SWhyEn1x5ToduoHbfDj2R
         WD77QVH8/oa63elpkAUT5pCyFpJNkHec1ZQPdomUWg0vySLghcvZG2FYxWP5NejpmlUF
         HD28KMGWsC/nal0lIju9XJsYelFfDcDjEJ9cnP+qsBT+pRVebYGOqv9kqvCW+xlgIG13
         OOXffzQiT9aqdMPf8eeTLrDI46SigIXDZvTluHZqHuNIqCRJMvyjtmU1jI0f8xtHMGmH
         bqKA==
X-Gm-Message-State: AO0yUKW8xYrccz7GTOOYAk0aCZwGaOeNJdJYMLLrq9kHAdbpWYcakPaZ
	phJMHKrlApZZq/cGksq8chpZmg==
X-Google-Smtp-Source: AK7set+kdX1DUZ3VExD9apqtNUWI6HQBytcpCuYbTvfr0ahW3vdKucREs/UQjFIenjiorzikl9UNGw==
X-Received: by 2002:a17:906:1d01:b0:923:1714:b3d0 with SMTP id n1-20020a1709061d0100b009231714b3d0mr4291673ejh.19.1678654763760;
        Sun, 12 Mar 2023 13:59:23 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:d9f6:3e61:beeb:295a? ([2a02:810d:15c0:828:d9f6:3e61:beeb:295a])
        by smtp.gmail.com with ESMTPSA id g7-20020a1709061c8700b008b980c3e013sm2613225ejh.179.2023.03.12.13.59.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Mar 2023 13:59:23 -0700 (PDT)
Message-ID: <572cdb2c-1b13-d412-d3cf-7d4138b297a1@linaro.org>
Date: Sun, 12 Mar 2023 21:59:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 1/2] dt-bindings: arm: fsl: add compatible string for
 Tolino Vision
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: Andreas Kemnade <andreas@kemnade.info>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, arnd@arndb.de, olof@lixom.net,
 soc@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com, marex@denx.de,
 max.krummenacher@toradex.com, leoyang.li@nxp.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20230312205236.2281466-1-andreas@kemnade.info>
 <20230312205236.2281466-2-andreas@kemnade.info>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230312205236.2281466-2-andreas@kemnade.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/03/2023 21:52, Andreas Kemnade wrote:
> This adds a compatible string for the Tolino Vision eBook reader.

Do not use "This commit/patch". but imperative mood. See:
https://elixir.bootlin.com/linux/v5.17.1/source/Documentation/process/submitting-patches.rst#L95

> 
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

