Return-Path: <SRS0=Zbji=6C=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 120AAC636D6
	for <soc@archiver.kernel.org>; Mon,  6 Feb 2023 10:34:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C7602C4339B; Mon,  6 Feb 2023 10:34:42 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 48612C433D2
	for <soc@kernel.org>; Mon,  6 Feb 2023 10:34:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 48612C433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id q8so8295324wmo.5
        for <soc@kernel.org>; Mon, 06 Feb 2023 02:34:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7w5/j8A6TwxWgniH1DhNmNJ1hey2l2xPmhTfoCmqwnQ=;
        b=Umu+PxAs2lrKymRLs6IpTYlFho2kPDweUy7445WesXu0virZut4foPzNq2gJmDQbH5
         d6YIWEiLzdqpu+BuJ1rOks51IS8EMdbG305v1DxC6G81gJRC5ObT/TwaSblRlYR/1ICg
         1qmGfxIuSOwUsbbxbX1XR5amleBzOceuEQYXAC79U+E3Tbiy+U346TgseZmJl/n7xosa
         myYsg/6dVtNiQjVPpGha6BSIubMNlWZrwzGl5W5zMtPNwsKw+KT9RUjFeD1Ia9H92B1q
         37RkSzXkuVS+3ZuV44VyAXrfOUNId+DHwaIyhFpj3KB8huO2jCqXtUwMn9wyr6W3ZsdC
         WLqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7w5/j8A6TwxWgniH1DhNmNJ1hey2l2xPmhTfoCmqwnQ=;
        b=Xs0FVGGsMQOhKobFfHFNwipQVk6ZbNIs6R9xCHuKoMw8pDPbh6y1C5XnFT/KLawD2l
         Sa/LWKKleoDsnHLQmTVChZsmdVBttt4Tl384UBoGpg3CnwGhARwOtRdMD8EjTZHg/iKI
         HCnUrmjQk+mXEh9HeR6LxdoT0V7225+Bi41aWgZsfYtOLNJIsNftew1c59FUz+CIpe7I
         8QLyFdvaTQ5JZbfb1TeOYegNYnlmEKvznbQFE33Cj0+u+u8zm+LxFpmsg/QrE+fx8lz1
         hE9i++gT7GTXvBpWMrKnqT0Etogn48o/z3JmyXet1iEngsDt6SL5vmj2MiKWbM4AHDeS
         WOoQ==
X-Gm-Message-State: AO0yUKWgE8JVejDRwp2OyDND8gjxwpVbyV5Keqky4xQJV8mNgo74lgB7
	Rb+6WpncXoTI0i7EYts/2xqbkw==
X-Google-Smtp-Source: AK7set+4CdpmemgUQ7IjRMXwE8ZKkcoaPqPjwCcV7bWIVY3qhO5Q2gmMza28BCUAJjAFZvnH7exAHw==
X-Received: by 2002:a05:600c:3baa:b0:3dc:4318:d00d with SMTP id n42-20020a05600c3baa00b003dc4318d00dmr18747276wms.11.1675679679637;
        Mon, 06 Feb 2023 02:34:39 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id l6-20020a05600c4f0600b003dafbd859a6sm16713948wmq.43.2023.02.06.02.34.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Feb 2023 02:34:39 -0800 (PST)
Message-ID: <48effa0c-897b-fa55-4e83-e1688489f873@linaro.org>
Date: Mon, 6 Feb 2023 11:34:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] arm64: dts: Add support for Unisoc's UMS512
Content-Language: en-US
To: Chunyan Zhang <zhang.lyra@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: Chunyan Zhang <chunyan.zhang@unisoc.com>, Arnd Bergmann <arnd@arndb.de>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-kernel@lists.infradead.org, soc@kernel.org,
 devicetree@vger.kernel.org, Baolin Wang <baolin.wang@linux.alibaba.com>,
 Orson Zhai <orsonzhai@gmail.com>, LKML <linux-kernel@vger.kernel.org>
References: <20230118084025.2898404-1-chunyan.zhang@unisoc.com>
 <41fd5c2a-9fc5-8af8-b66e-45bb83b24179@linaro.org>
 <CAAfSe-stZ4cJw8UsFtozccVfzeR4=Wpo6+sqnfzj8McsfqrBgA@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAAfSe-stZ4cJw8UsFtozccVfzeR4=Wpo6+sqnfzj8McsfqrBgA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06/02/2023 10:28, Chunyan Zhang wrote:
> Hi Krzysztof,
> 
> Thanks for the review, and sorry for the late reply, I just came back
> from a long holiday.

You quoted below entire email, so I have no clue whether there is
relevant part or not. Trim your responses and do not top-post.

Best regards,
Krzysztof

