Return-Path: <SRS0=QEF6=24=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BD66FA3740
	for <soc@archiver.kernel.org>; Thu, 27 Oct 2022 13:28:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6A34BC433D6; Thu, 27 Oct 2022 13:28:53 +0000 (UTC)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5D2CAC433C1
	for <soc@kernel.org>; Thu, 27 Oct 2022 13:28:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5D2CAC433C1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-qk1-f171.google.com with SMTP id l9so833427qkk.11
        for <soc@kernel.org>; Thu, 27 Oct 2022 06:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B/X6pw5m37N9JyjzyTrby8bFniFs1zr3mi0NyZRLHRY=;
        b=VUZlWUr+Ag7obPUd8aKoGYR46l6+gd9TJVwD4BPjVuu8Y48fJisDoOc76cYEzwQNTl
         1jBohX+/PGHb+rSy2B7JSQqaMQ8e+QZ3G3mg2B4STb/B2sYVBbATbHmxj5NxEdJrp2I3
         VkakIi8hq9C8x9KhMLSbU17M44gzfsVElyf/8YuntlaRBXp3Os+E9n34xDX88lYwbc7m
         tyUb9yCkqsvk5TQoYqhT6wyXU+X/62+k7XYHVLjMsYEmHq4iVKzR1A5+GLbAs0yQa607
         NwXXHh16ZDRIu0KNU6BsaJ9VBn6ykg1KoDKgSclTfukNnO/IWlJ0QxnktvZbJHQuiNu5
         M68A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B/X6pw5m37N9JyjzyTrby8bFniFs1zr3mi0NyZRLHRY=;
        b=FQ0SymeOzmX2kURssVIF8S5JU+sGwM0AacHP5sRjUwpeapp7vt2TwW42qVvo1FAt9V
         bNGXRkWM19noJOvqBmpSComXQ0Qs3QMOc02eEyDSbMWT9M7QvTElEvGhP2FV8Y/XckbS
         uCZgrNMoNQhXaqFPK3uKxwtFutcAXrcI1mbXj2i5IQNVQVkZqx12Dk+5oWDrN1gL9CVX
         L6sNTZoXHwGAYnWlKjrRdq+KGWZAq1Pz5KbMLY5zw9dihwJ4f4KTFu6x36aF+C53aZOb
         06yUvo4s3arjVJ0jSpsNylvwhhKTfnexnp5H6zujisW9WtlPbZxeTKOno6z2pCIYy+mT
         4QcA==
X-Gm-Message-State: ACrzQf3oN+srm+sUWyxG8IyA/mtOQaft7Ivzezyo1mN9Ed62/hDAKDiV
	vl4QDLcQ3ZYEYf+7n+Dx6qVhBw==
X-Google-Smtp-Source: AMsMyM4FD1Ftv1brgcf6lLCigCjMsCV+VaUuuweHjMHn5GqvPHhAupNbLWB1+PScixkKz99fTFwjfw==
X-Received: by 2002:a05:620a:894:b0:6ef:759:5f9c with SMTP id b20-20020a05620a089400b006ef07595f9cmr27166942qka.499.1666877331347;
        Thu, 27 Oct 2022 06:28:51 -0700 (PDT)
Received: from [192.168.1.11] ([64.57.193.93])
        by smtp.gmail.com with ESMTPSA id t6-20020ac85306000000b00398df095cf5sm874242qtn.34.2022.10.27.06.28.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Oct 2022 06:28:50 -0700 (PDT)
Message-ID: <b0810bc1-cfd9-547a-6e6f-e1a180543429@linaro.org>
Date: Thu, 27 Oct 2022 09:28:49 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH 1/4] dt-bindings: arm: uniphier: Add Pro5 boards
Content-Language: en-US
To: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 Masami Hiramatsu <mhiramat@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20221027045157.23325-1-hayashi.kunihiko@socionext.com>
 <20221027045157.23325-2-hayashi.kunihiko@socionext.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221027045157.23325-2-hayashi.kunihiko@socionext.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27/10/2022 00:51, Kunihiko Hayashi wrote:
> Add compatible string for Pro5 EP-Core board and ProEX board support.
> 
> Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
> ---

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

