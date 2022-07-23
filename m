Return-Path: <SRS0=HzST=X4=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 534BBC433EF
	for <soc@archiver.kernel.org>; Sat, 23 Jul 2022 19:01:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3A40FC341CB; Sat, 23 Jul 2022 19:01:53 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 19139C341C0
	for <soc@kernel.org>; Sat, 23 Jul 2022 19:01:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 19139C341C0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id a13so8670071ljr.11
        for <soc@kernel.org>; Sat, 23 Jul 2022 12:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=5cZiAIwF42WuzzYH7769NdS95yeAGltP/YgWORq01O0=;
        b=X8moCnNI000cY4kj949JeEcLs/WDwlw2sQx0fpcGTLPdHwMTLiEUX9cwVb0AVEHJK7
         1Yoftr7xbW9WyPIPYZPr+4n1yzqhZxbJHsjLmNAEcu5jkHthpLvPE7SDl1YpdSmyH0vE
         73VRT35PTV/xDe0lxSKSwvuAr8+aW+ICDpqSw1bilb0gk3UUvrr0O9SPwD6dSsfEzBJm
         BjUxzdrcKYPQfFsDKYmvUIATsrGMot2yYI26ZeBXyilGfnDj81WtLek2ppLpzTgGH7yK
         51a2mrdj/9jlWI/gPgevfqrUJO+Z8WIiXm27I+pGiQ7CzBiDAr7XREklhRIeiwGRW3hv
         ALIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=5cZiAIwF42WuzzYH7769NdS95yeAGltP/YgWORq01O0=;
        b=qgY1Ded5h1DfUyVORs5AnOosqKeXGo+7D1OXvx9bGcGa28kVePscXmWKJbq9xLRbb0
         xuNEfinlvh6wByyeLqodLNXcm1UftVuFvWR03l7lEam9DLcLJGbM9uXhlZzQ8OEhpsEd
         RWKSVeHKNp5vDhBroQlDO1lsA+uOM510L8ljbc2mh6rAtnzBE5PQGYUIgtV4txogk13S
         DMnBwFDC9UCCfAEaB85cIeIGwfR5Ai/ptARLmJKU/68nG57ShR+p3MI6ydKKNBFsMWpv
         tUSxv+9PeFbAqyL23D/H1IedoWFguzLv9ZS0GLbScv+Shm6ErQC5hBBoY3xguH0E4syH
         lcZg==
X-Gm-Message-State: AJIora/uEUdqhDQhfUE+uanxmidlsdK4Z40rCBcxSBgAW6QD9f9sqvPE
	n55TKh6VfRwDvssFLdCYPHQSpA==
X-Google-Smtp-Source: AGRyM1vjQpBfuapdPZgbzVU9siQjY7xYEwbnErEnuIZaOWWeAfJ0aW3bsDJT4q7YVVzm+7j7SPe0Tg==
X-Received: by 2002:a2e:7a0f:0:b0:25d:eb65:fb67 with SMTP id v15-20020a2e7a0f000000b0025deb65fb67mr1744824ljc.250.1658602909893;
        Sat, 23 Jul 2022 12:01:49 -0700 (PDT)
Received: from [192.168.10.173] (93.81-167-86.customer.lyse.net. [81.167.86.93])
        by smtp.gmail.com with ESMTPSA id h20-20020a2ea494000000b0025d4599d738sm1792090lji.54.2022.07.23.12.01.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 23 Jul 2022 12:01:49 -0700 (PDT)
Message-ID: <29b97160-7b0c-ff13-bf22-cc408a2e96ac@linaro.org>
Date: Sat, 23 Jul 2022 21:01:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v6 1/5] dt-bindings: qcom: Document bindings for new
 msm8916-samsung-e2015 devices
Content-Language: en-US
To: "Lin, Meng-Bo" <linmengbo0689@protonmail.com>, devicetree@vger.kernel.org
List-Id: <soc.lore.kernel.org>
Cc: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 Stephen Boyd <sboyd@codeaurora.org>, Stephan Gerhold <stephan@gerhold.net>,
 Nikita Travkin <nikita@trvn.ru>, soc@kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20220723185424.203340-1-linmengbo0689@protonmail.com>
 <20220723185845.203622-1-linmengbo0689@protonmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220723185845.203622-1-linmengbo0689@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23/07/2022 21:00, Lin, Meng-Bo wrote:
> Document the new samsung,e5/e7/grandmax device tree bindings used in their
> device trees.
> 
> Signed-off-by: Lin, Meng-Bo <linmengbo0689@protonmail.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>

Again, this is not correct tag. You did not receive it like that. Please
paste it as you received it, without adding any changes, customizations,
addons or anything else.

Best regards,
Krzysztof
